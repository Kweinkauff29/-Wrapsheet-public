#!/usr/bin/env python3
from pathlib import Path

path = Path("public/index.html")
text = path.read_text()

old = '''    async function createMultipleTasks(payloads, loaderMessage) {
      if (!payloads || !payloads.length) return;

      showActionLoader(
'''
new = '''    async function createMultipleTasks(payloads, loaderMessage) {
      if (!payloads || !payloads.length) return;

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
      });

      showActionLoader(
'''
assert old in text, "createMultipleTasks start anchor missing"
text = text.replace(old, new, 1)

old = '''        const fetches = payloads.map(p =>
          fetch(API_BASE + "/daily-tasks", {
'''
new = '''        const fetches = uniquePayloads.map(p =>
          fetch(API_BASE + "/daily-tasks", {
'''
assert old in text, "createMultipleTasks map anchor missing"
text = text.replace(old, new, 1)

old = '''      taskModal.addEventListener("keydown", (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
          // Don't trigger on textarea (allow Enter for new lines there)
          if (e.target.tagName === "TEXTAREA") return;
          e.preventDefault();
          document.getElementById("task-save-btn").click();
        }
      });
'''
new = '''      taskModal.addEventListener("keydown", (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
          // Don't trigger on textarea (allow Enter for new lines there)
          if (e.target.tagName === "TEXTAREA") return;
          const saveButton = document.getElementById("task-save-btn");
          if (taskSaveInFlight || saveButton?.disabled) return;
          e.preventDefault();
          saveButton?.click();
        }
      });
'''
assert old in text, "task Enter handler anchor missing"
text = text.replace(old, new, 1)

old = '''    function closeTaskModal() {
      document.getElementById("task-modal").classList.add("hidden");
    }

    async function onTaskSave() {
'''
new = '''    let taskSaveInFlight = false;

    function closeTaskModal() {
      document.getElementById("task-modal").classList.add("hidden");
    }

    async function onTaskSave() {
'''
assert old in text, "closeTaskModal anchor missing"
text = text.replace(old, new, 1)

old = '''      const basePayload = {
        title,
        notes,
        status,
        task_time: taskTime, // scheduled time for reminders
        assigned_to_id: assignedToId,
        assignee_ids: assigneeIds
      };

      try {
'''
new = '''      const basePayload = {
        title,
        notes,
        status,
        task_time: taskTime, // scheduled time for reminders
        assigned_to_id: assignedToId,
        assignee_ids: assigneeIds
      };

      if (taskSaveInFlight) return;
      const saveButton = document.getElementById("task-save-btn");
      const originalSaveLabel = saveButton?.textContent || "Save Task";
      taskSaveInFlight = true;
      if (saveButton) {
        saveButton.disabled = true;
        saveButton.setAttribute("aria-busy", "true");
        saveButton.textContent = "Saving…";
      }

      try {
'''
assert old in text, "basePayload/try anchor missing"
text = text.replace(old, new, 1)

old = '''            const allDates = [dateStr, ...extraDates];

            const payloads = allDates.map(d => ({
'''
new = '''            const allDates = [...new Set([dateStr, ...extraDates])];

            const payloads = allDates.map(d => ({
'''
assert old in text, "allDates anchor missing"
text = text.replace(old, new, 1)

old = '''      } catch (err) {
        console.error(err);
        showToast("Error saving task", true);
      }
    }
'''
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
'''
assert old in text, "onTaskSave catch anchor missing"
text = text.replace(old, new, 1)

path.write_text(text)
print("Patched", path)
