local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  error("could not pcall impatient")
  return
end

impatient.enable_profile()

