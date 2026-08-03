#!/usr/bin/env python3
from pathlib import Path

path = Path("public/index.html")
text = path.read_text()

if "const uniquePayloads = [];" not in text:
    anchor = "      if (!payloads || !payloads.length) return;"
    assert anchor in text, "createMultipleTasks guard missing"
    insertion = '''      if (!payloads || !payloads.length) return;

      // Recurrence calculations can occasionally converge on the same adjusted
      // business day. Never send the same logical occurrence twice.
      const uniquePayloads = [];
      const seenOccurrences = new Set();
      payloads.forEach(payload => {
        const key = [
          String(payload.task_date || ""),
          String(payload.title || "").trim().toLowerCase().replace(/\\s+/g, " "),
          String(payload.assigned_to_id || ""),
          String(payload.task_time || ""),
          String(payload.notes || "").trim()
        ].join("|");
        if (seenOccurrences.has(key)) return;
        seenOccurrences.add(key);
        uniquePayloads.push(payload);
      });'''
    text = text.replace(anchor, insertion, 1)

old = '        const fetches = payloads.map(p =>'
if old in text:
    text = text.replace(old, '        const fetches = uniquePayloads.map(p =>', 1)
assert 'const fetches = uniquePayloads.map(p =>' in text, "unique payload map missing"

old = '''      taskModal.addEventListener("keydown", (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
          // Don't trigger on textarea (allow Enter for new lines there)
          if (e.target.tagName === "TEXTAREA") return;
          e.preventDefault();
          document.getElementById("task-save-btn").click();
        }
      });'''
new = '''      taskModal.addEventListener("keydown", (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
          // Don't trigger on textarea (allow Enter for new lines there)
          if (e.target.tagName === "TEXTAREA") return;
          const saveButton = document.getElementById("task-save-btn");
          if (taskSaveInFlight || saveButton?.disabled) return;
          e.preventDefault();
          saveButton?.click();
        }
      });'''
if old in text:
    text = text.replace(old, new, 1)
assert 'taskSaveInFlight || saveButton?.disabled' in text, "task Enter guard missing"

if "let taskSaveInFlight = false;" not in text:
    anchor = '''    function closeTaskModal() {
      document.getElementById("task-modal").classList.add("hidden");
    }'''
    assert anchor in text, "closeTaskModal anchor missing"
    text = text.replace(anchor, '    let taskSaveInFlight = false;\n\n' + anchor, 1)

if 'saveButton.setAttribute("aria-busy", "true")' not in text:
    anchor = '''      const basePayload = {
        title,
        notes,
        status,
        task_time: taskTime, // scheduled time for reminders
        assigned_to_id: assignedToId,
        assignee_ids: assigneeIds
      };'''
    assert anchor in text, "basePayload anchor missing"
    lock = anchor + '''

      if (taskSaveInFlight) return;
      const saveButton = document.getElementById("task-save-btn");
      const originalSaveLabel = saveButton?.textContent || "Save Task";
      taskSaveInFlight = true;
      if (saveButton) {
        saveButton.disabled = true;
        saveButton.setAttribute("aria-busy", "true");
        saveButton.textContent = "Saving…";
      }'''
    text = text.replace(anchor, lock, 1)

old = '            const allDates = [dateStr, ...extraDates];'
if old in text:
    text = text.replace(old, '            const allDates = [...new Set([dateStr, ...extraDates])];', 1)
assert 'const allDates = [...new Set([dateStr, ...extraDates])];' in text, "date dedupe missing"

old = '''      } catch (err) {
        console.error(err);
        showToast("Error saving task", true);
      }
    }




    async function onTaskDelete()'''
new = '''      } catch (err) {
        console.error(err);
        showToast("Error saving task", true);
      } finally {
        taskSaveInFlight = false;
        if (saveButton) {
          saveButton.disabled = false;
          saveButton.removeAttribute("aria-busy");
          saveButton.textContent = originalSaveLabel;
        }
      }
    }




    async function onTaskDelete()'''
if old in text:
    text = text.replace(old, new, 1)
assert 'saveButton.removeAttribute("aria-busy")' in text, "save finally guard missing"

path.write_text(text)
print("Patched", path)
