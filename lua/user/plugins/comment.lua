local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  error("could not pcall Comment")
  return
end

comment.setup {
  mapings = false,
}
