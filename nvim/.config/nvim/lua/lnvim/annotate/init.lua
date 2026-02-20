local M = {}

-- Import modules
M.storage = require("lnvim.annotate.storage")
M.ui = require("lnvim.annotate.ui")
M.marks = require("lnvim.annotate.marks")
M.config = require("lnvim.annotate.config")

-- Expose main functions
M.setup = M.config.setup
M.annotate_selection = M.marks.annotate_selection
M.delete_annotation_at_cursor = M.marks.delete_annotation_at_cursor
M.view_annotations = M.ui.view_annotations
M.clear_annotations = M.marks.clear_annotations
M.save_annotations = M.storage.save_annotations
M.load_annotations = M.storage.load_annotations

return M
