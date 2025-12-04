Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BC3D1D865
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8BB10E83B;
	Thu,  4 Dec 2025 05:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuVElrJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76D810E1B8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825517; x=1796361517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8l66wOwAm58rE+JN86BkiXTRXZH85evHgfcVN/13bq4=;
 b=PuVElrJKjHObxbiySIZFFXU1aN+TJ3qPOtk+AeoV+ZTk6lhEFm4Hpc56
 AhzIkRQEfUhs1h3PXIzIqbtu5QNKitfg62s9/lYK4NExIlLWewthKEzu2
 FhzKB68zWuZALIzviXaEH12bX3hs8vjCcXgASIr+EpJxLE+fvYwYKzn7z
 0aeCYlut/O1Io53h21gMXIYpKZS7ssYAUawi9BQ//q+9l9P9zVAh+l6Yy
 8IJfDpUpyyFmLIIrBiEpwAffsSWdKzH9oEOBWKgTIFCBetboxMWrLvCtJ
 xbzkfAl/5uOa/OlF+P3LAJ21cuDTx9sWqs/2gbdfIby6BQ/y3F+prvh4q A==;
X-CSE-ConnectionGUID: oPxwHsQ3RsKznm9BhqnXyg==
X-CSE-MsgGUID: Gdia3NbGRUaatIxNRF0DOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314597"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:18:36 -0800
X-CSE-ConnectionGUID: v15EfWutStKjHqnuSc9EDg==
X-CSE-MsgGUID: Qc8gChPuSd65BcsII/yx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199303583"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 03 Dec 2025 21:18:34 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t v3 1/4] tools/displaytop: Add Display Top - a
 terminal-based display pipeline monitor
Date: Thu,  4 Dec 2025 10:56:55 +0530
Message-Id: <20251204052658.232429-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204052658.232429-1-pranay.samala@intel.com>
References: <20251204052658.232429-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Adith Narein T <adith.narein.t@intel.com>

This patch introduces `displaytop`, a terminal-based tool designed for
monitoring and debugging the display pipeline in real time.
The initial feature focuses on providing detailed display configuration
information, including:

     - CRTCs
     - Connectors
     - Encoders
     - Planes
     - Framebuffers

These components are presented in an organized format using a terminal UI
built with `ncurses`, giving developers and validation engineers a fast and
accessible way to inspect the current state of the display system.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
Co-authored-by: Pranay Samala <pranay.samala@intel.com>
---
 tools/displaytop/README.md                    |  43 +
 tools/displaytop/include/data.h               |  17 +
 tools/displaytop/include/display.h            |  25 +
 tools/displaytop/include/node.h               | 106 +++
 tools/displaytop/include/populate.h           |  17 +
 tools/displaytop/include/utils.h              |  99 +++
 tools/displaytop/meson.build                  |  68 ++
 tools/displaytop/src/data.c                   |   9 +
 tools/displaytop/src/display.c                | 417 ++++++++++
 tools/displaytop/src/display_configuration.c  | 783 ++++++++++++++++++
 tools/displaytop/src/display_dump.c           | 162 ++++
 tools/displaytop/src/display_search_bar.c     | 246 ++++++
 tools/displaytop/src/display_summary.c        | 258 ++++++
 tools/displaytop/src/main.c                   |  40 +
 tools/displaytop/src/node.c                   | 107 +++
 tools/displaytop/src/populate.c               |  11 +
 .../displaytop/src/populate_display_config.c  | 211 +++++
 tools/displaytop/src/utils.c                  |  72 ++
 tools/displaytop/src/utils_cli.c              |  44 +
 tools/displaytop/src/utils_display.c          | 174 ++++
 tools/displaytop/src/utils_driver.c           | 118 +++
 tools/displaytop/src/utils_drm.c              | 242 ++++++
 tools/displaytop/src/utils_search.c           |  22 +
 tools/meson.build                             |   1 +
 24 files changed, 3292 insertions(+)
 create mode 100644 tools/displaytop/README.md
 create mode 100644 tools/displaytop/include/data.h
 create mode 100644 tools/displaytop/include/display.h
 create mode 100644 tools/displaytop/include/node.h
 create mode 100644 tools/displaytop/include/populate.h
 create mode 100644 tools/displaytop/include/utils.h
 create mode 100644 tools/displaytop/meson.build
 create mode 100644 tools/displaytop/src/data.c
 create mode 100644 tools/displaytop/src/display.c
 create mode 100644 tools/displaytop/src/display_configuration.c
 create mode 100644 tools/displaytop/src/display_dump.c
 create mode 100644 tools/displaytop/src/display_search_bar.c
 create mode 100644 tools/displaytop/src/display_summary.c
 create mode 100644 tools/displaytop/src/main.c
 create mode 100644 tools/displaytop/src/node.c
 create mode 100644 tools/displaytop/src/populate.c
 create mode 100644 tools/displaytop/src/populate_display_config.c
 create mode 100644 tools/displaytop/src/utils.c
 create mode 100644 tools/displaytop/src/utils_cli.c
 create mode 100644 tools/displaytop/src/utils_display.c
 create mode 100644 tools/displaytop/src/utils_driver.c
 create mode 100644 tools/displaytop/src/utils_drm.c
 create mode 100644 tools/displaytop/src/utils_search.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
new file mode 100644
index 000000000..ce0a3ca84
--- /dev/null
+++ b/tools/displaytop/README.md
@@ -0,0 +1,43 @@
+# **DisplayTop**
+
+A terminal-based tool for monitoring and debugging the display pipeline.
+
+## **Features**
+
+- Terminal UI using `ncurses`
+- Dump feature for all the menus
+- Real-time display Configuration
+
+---
+
+## **Quick Start**
+
+To run DisplayTop as part of the IGT GPU Tools:
+
+1. Build IGT as usual.
+2. Navigate to the build directory:
+
+   ```bash
+   cd build/tools/displaytop
+   ```
+3. Run the tool with root privileges:
+
+   ```bash
+   sudo ./displaytop
+   ```
+
+> **Note:** Running without `sudo` will disable certain features due to insufficient permissions.
+
+---
+
+Build igt-gpu-tools as normal and then go to `build/tools/displaytop` and run sudo `./displaytop`.
+Note: Running the tool without sudo will result in loss of some features being disabled.
+
+---
+
+## Logs & Dumps
+
+The log for the display top tool and the dumps initiated by the user are
+stored in the `/tmp` folder as `displaytop.log` and `/displaytop_dump` respectively.
+
+---
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
new file mode 100644
index 000000000..ca15dfdce
--- /dev/null
+++ b/tools/displaytop/include/data.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef DATA_H
+#define DATA_H
+
+#include "node.h"
+
+extern struct node *root; /* shared throughout the program */
+
+#define DUMP_DIR "/tmp/displaytop_dump"
+
+#define DRM_DIR "/dev/dri/"
+#define DRM_PRIMARY_PREFIX "card"
+#define DRM_RENDER_PREFIX "renderD"
+
+#endif
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
new file mode 100644
index 000000000..97f7561b8
--- /dev/null
+++ b/tools/displaytop/include/display.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef DISPLAY_H
+#define DISPLAY_H
+
+#include "node.h"
+#include "utils.h"
+
+void display_win(WINDOW * win, struct node *node);
+
+struct node *display_search_bar(struct node *head);
+void display_dump_menu(struct node *head);
+
+void display_crtc(WINDOW *pad, struct node *node, int *content_line);
+void display_plane(WINDOW *pad, struct node *node, int *content_line);
+void display_encoder(WINDOW *pad, struct node *node, int *content_line);
+void display_formats(WINDOW *pad, struct node *node, int *content_line);
+void display_connector(WINDOW *pad, struct node *node, int *content_line);
+void display_informats(WINDOW *pad, struct node *node, int *content_line);
+void display_framebuffer(WINDOW *pad, struct node *node, int *content_line);
+
+void display_summary(WINDOW *pad, struct node *node, int *content_line);
+
+#endif
diff --git a/tools/displaytop/include/node.h b/tools/displaytop/include/node.h
new file mode 100644
index 000000000..309a8b5b3
--- /dev/null
+++ b/tools/displaytop/include/node.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef NODE_H
+#define NODE_H
+
+#include <string.h>
+#include <stdlib.h>
+#include <ncurses.h>
+
+/**
+ * @struct node
+ * @brief Represents a node in a tree structure.
+ *
+ * This structure is used to represent a node in a tree, where each node can have a name,
+ * a display function, a parent node, and an array of child nodes.
+ *
+ * @var node::name
+ * A character array to store the name of the node. The name can be up to 49 characters long,
+ * with the 50th character reserved for the null terminator.
+ *
+ * @var node::display_function
+ * A pointer to a function that takes a WINDOW pointer and a variable number of arguments,
+ * and returns an integer. This function is used to display the node.
+ *
+ * @var node::parent
+ * A pointer to the parent node. If the node is the root, this will be NULL.
+ *
+ * @var node::children
+ * A pointer to an array of child nodes. If the node has no children, this will be NULL.
+ *
+ * @var node::children_size
+ * An integer representing the number of children the node has.
+ */
+struct node {
+	char name[50];
+	void (*display_function)(WINDOW *win, struct node *self, int *state);
+	struct node *parent;
+	struct node *children;
+	int children_size;
+};
+
+/**
+ * @brief Creates a new node with the given name, display function, and parent.
+ *
+ * This function allocates memory for a new node, initializes its name, display function,
+ * parent, and sets its children to NULL and children_size to 0.
+ *
+ * @param name The name of the node.
+ * @param display_function A pointer to the display function associated with the node.
+ * @param parent A pointer to the parent node.
+ * @return A pointer to the newly created node.
+ */
+struct node *create_node(const char *name,
+			 void (*display_function)(WINDOW *win, struct node *self, int *state),
+			 struct node *parent);
+
+/**
+ * @brief Adds a child node to the specified parent node.
+ *
+ * This function reallocates memory for the parent's children array to accommodate the new child,
+ * assigns the child to the next available position in the array, and increments the children_size.
+ *
+ * @param parent A pointer to the parent node.
+ * @param child A pointer to the child node to be added.
+ */
+void add_child(struct node *parent, struct node *child);
+
+/**
+ * @brief Frees the memory allocated for the tree recursively.
+ *
+ * This function recursively frees the memory allocated for the children of the given root node,
+ * then frees the memory allocated for the children array and the root node itself.
+ *
+ * @param root A pointer to the root node of the tree.
+ */
+void free_tree(struct node *root);
+
+/**
+ * @brief Prints the path from the given node.
+ *
+ * This function takes a pointer to a node structure and prints the path
+ * associated with that node. The exact format and details of the path
+ * are dependent on the implementation of the node structure and the
+ * printPath function.
+ *
+ * @param node A pointer to the node whose path is to be printed.
+ */
+void print_path(struct node *node);
+
+/**
+ * @brief Gets the path from the given node.
+ *
+ * This function takes a pointer to a node structure and returns the path
+ * associated with that node. The exact format and details of the path
+ * are dependent on the implementation of the node structure and the
+ * getPath function.
+ *
+ * @param node A pointer to the node whose path is to be returned.
+ * @return A string representing the path of the node.
+ */
+char *get_path(struct node *node);
+
+void count_nodes(struct node *node, int *count);
+
+#endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
new file mode 100644
index 000000000..9fb45a9ec
--- /dev/null
+++ b/tools/displaytop/include/populate.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef POPULATE_H
+#define POPULATE_H
+
+#include "node.h"
+#include "data.h"
+#include "utils.h"
+#include "utils.h"
+#include "display.h"
+
+void populate_data(void);
+
+void initialize_display_config(void);
+
+#endif
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
new file mode 100644
index 000000000..645ffc298
--- /dev/null
+++ b/tools/displaytop/include/utils.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: MIT */
+/* Copyright © 2025 Intel Corporation */
+
+#ifndef UTILS_H
+#define UTILS_H
+#include <time.h>
+#include <math.h>
+#include <string.h>
+
+#include <error.h>
+#include <errno.h>
+
+#include <fcntl.h>
+#include <ctype.h>
+#include <limits.h>
+#include <libgen.h>
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+#include <dirent.h>
+#include <unistd.h>
+#include <ncurses.h>
+#include <sys/wait.h>
+
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+
+#include <xf86drm.h>
+#include <drm/drm.h>
+#include <xf86drmMode.h>
+#include <drm/drm_mode.h>
+#include <drm/i915_drm.h>
+#include <drm/drm_fourcc.h>
+
+#include "node.h"
+#include "data.h"
+#include "display.h"
+
+extern int drm_fd;
+
+#ifndef DT_PRINTF
+#define DT_PRINTF(format_idx, first_arg) __attribute__((format(printf, format_idx, first_arg)))
+#endif
+
+/* utils_cli.c */
+void handle_cli_args(int argc, char *argv[]);
+
+/* utils_driver.c*/
+void check_and_load_driver(void);
+
+/* utils_display.c */
+void set_string(char *dest, const char *src, size_t size);
+int check_size_change(WINDOW *win, int *height, int *width);
+
+void single_file_dump(struct node *node, const char *file_path, bool single);
+void search_nodes(struct node *root, const char *search_input, struct node *results);
+
+void print_bold_text(WINDOW *win, int line, int col, const char *text, ...)
+	DT_PRINTF(4, 5);
+
+void print_dim_text(WINDOW *win, int line, int col, const char *text, ...)
+	DT_PRINTF(4, 5);
+
+void print_red_text(WINDOW *win, int line, int col, const char *text, ...)
+	DT_PRINTF(4, 5);
+
+void print_green_text(WINDOW *win, int line, int col, const char *text, ...)
+	DT_PRINTF(4, 5);
+
+void draw_header(WINDOW *win, int win_width, const char *title, const char *helper);
+void render_progress_bar(WINDOW *win, int current, int total);
+
+void print_wrapped_text(WINDOW *pad, int *line, int start, int size, const char *text,
+			bool enclose_with_pipe);
+
+/* utils.c*/
+void ensure_dump_directory(void);
+void strip_whitespace(char *str);
+char *read_file(const char *filename);
+
+char *get_file_path(const char *filename);
+
+/* utils_drm.c */
+char *find_drm_device(bool primary);
+void open_primary_drm_device(void);
+void close_primary_drm_device(void);
+
+const char *get_drm_object_type_name(uint32_t object_type);
+const char *get_format_str(uint32_t format);
+const char *get_basic_modifier_str(uint64_t modifier);
+const char *get_connector_type_name(uint32_t connector_type);
+const char *get_encoder_type_name(uint32_t encoder_type);
+
+#endif
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
new file mode 100644
index 000000000..e974db4d7
--- /dev/null
+++ b/tools/displaytop/meson.build
@@ -0,0 +1,68 @@
+# Meson build definition for DisplayTop tool
+
+# Compiler flags
+cflags = [
+  '-Wall', '-Wextra',
+  '-Iinclude', '-I/usr/include/libdrm', '-I/usr/local/include',
+  '-DMESON_SOURCE_ROOT="' + meson.source_root() + '"'
+]
+
+# Include directories
+inc_dirs = include_directories(
+  'include',
+  '/usr/include/libdrm',
+  '/usr/local/include'
+)
+
+libdrm_dep = dependency('libdrm', required: true)
+ncurses_dep = dependency('ncurses', required: false)
+menu_dep    = dependency('menu', required: false)
+form_dep    = dependency('form', required: false)
+panel_dep   = dependency('panel', required: false)
+
+have_displaytop = ncurses_dep.found() and menu_dep.found() and form_dep.found() and panel_dep.found()
+
+if have_displaytop
+  message('All dependencies found. Building displaytop.')
+
+  deps = [
+    libdrm_dep,
+    ncurses_dep,
+    menu_dep,
+    form_dep,
+    panel_dep,
+    lib_igt,
+    cairo,
+  ]
+  # Source files
+  source = files(
+    'src/data.c',
+    'src/display.c',
+    'src/display_configuration.c',
+    'src/display_dump.c',
+    'src/display_search_bar.c',
+    'src/display_summary.c',
+    'src/main.c',
+    'src/node.c',
+    'src/populate.c',
+    'src/populate_display_config.c',
+    'src/utils.c',
+    'src/utils_cli.c',
+    'src/utils_display.c',
+    'src/utils_driver.c',
+    'src/utils_drm.c',
+    'src/utils_search.c',
+  )
+
+   executable(
+     'displaytop',
+     source,
+     install: false,
+     c_args: cflags,
+     include_directories: inc_dirs,
+     dependencies: deps,
+     )
+
+else
+  message('Skipping displaytop: missing required optional dependencies.')
+endif
diff --git a/tools/displaytop/src/data.c b/tools/displaytop/src/data.c
new file mode 100644
index 000000000..49fa96f60
--- /dev/null
+++ b/tools/displaytop/src/data.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "data.h"
+#include "display.h"
+
+/* This file holds all the global variables that are being used in the tool */
+
+struct node *root;
diff --git a/tools/displaytop/src/display.c b/tools/displaytop/src/display.c
new file mode 100644
index 000000000..e703fb8bc
--- /dev/null
+++ b/tools/displaytop/src/display.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "display.h"
+#include "data.h"
+#include "utils.h"
+#include "igt_core.h"
+
+static int display_exit_menu(void)
+{
+	int height = 8, width = 40;
+	int starty = (LINES - height) / 2;
+	int startx = (COLS - width) / 2;
+	int ch;
+	const char *message = "Are you sure you want to quit?";
+
+	WINDOW *overlay = newwin(LINES, COLS, 0, 0);
+	WINDOW *confirm_win = newwin(height, width, starty, startx);
+
+	wbkgd(overlay, COLOR_PAIR(0));
+	wclear(overlay);
+	wrefresh(overlay);
+
+	wbkgd(confirm_win, COLOR_PAIR(2));
+	box(confirm_win, 0, 0);
+
+	mvwprintw(confirm_win, 2, (width - strlen(message)) / 2, "%s", message);
+
+	wattron(confirm_win, A_REVERSE);
+	mvwprintw(confirm_win, 4, width / 2 - 5, "[Y]es");
+	mvwprintw(confirm_win, 4, width / 2 + 2, "[N]o");
+	wattroff(confirm_win, A_REVERSE);
+
+	wrefresh(confirm_win);
+
+	while ((ch = wgetch(confirm_win))) {
+		if (ch == 'y' || ch == 'Y') {
+			delwin(confirm_win);
+			delwin(overlay);
+			return 1;
+		} else if (ch == 'n' || ch == 'N' || ch == 27) {
+			delwin(confirm_win);
+			delwin(overlay);
+			return 0;
+		}
+	}
+
+	delwin(confirm_win);
+	delwin(overlay);
+	return 0;
+}
+
+static void display_help_menu(void)
+{
+	int row = 2;
+	const char *title = " Help ";
+	WINDOW *help_win = newwin(LINES, COLS, 0, 0);
+
+	wbkgd(help_win, COLOR_PAIR(6));
+	wclear(help_win);
+	box(help_win, 0, 0);
+
+	mvwprintw(help_win, 0, (COLS - strlen(title)) / 2, "%s", title);
+
+	print_bold_text(help_win, row++, 4, "Key Bindings:");
+	row++;
+	print_bold_text(help_win, row, 6, "[Q]");
+	mvwprintw(help_win, row++, 18, "- Quit the application with a confirmation prompt.");
+	print_bold_text(help_win, row, 6, "[H]");
+	mvwprintw(help_win, row++, 18, "- Open the help menu to view key bindings and descriptions.");
+	print_bold_text(help_win, row, 6, "[UP/DOWN]");
+	mvwprintw(help_win, row++, 18, "- Navigate through menu items or scroll content.");
+	print_bold_text(help_win, row, 6, "[TAB]");
+	mvwprintw(help_win, row++, 18, "- Toggle focus between the menu and display content.");
+	print_bold_text(help_win, row, 6, "[ENTER]");
+	mvwprintw(help_win, row++, 18, "- Select a menu item or confirm an action.");
+	print_bold_text(help_win, row, 6, "[ESC]");
+	mvwprintw(help_win, row++, 18, "- Go back, cancel an action, or exit the application.");
+	print_bold_text(help_win, row, 6, "[S]");
+	mvwprintw(help_win, row++, 18, "- Search for specific items in the menu.");
+	print_bold_text(help_win, row, 6, "[P]");
+	mvwprintw(help_win, row++, 18, "- Save the current page's content to a file.");
+	print_bold_text(help_win, row, 6, "[D]");
+	mvwprintw(help_win, row++, 18, "- Save all nested content starting from the current menu.");
+	print_bold_text(help_win, row, 6, "[R]");
+	mvwprintw(help_win, row++, 18, "- Refresh the display to show recent updates.");
+
+	row++;
+	mvwprintw(help_win, row++, 4, "Press any key to return...");
+
+	wrefresh(help_win);
+	wgetch(help_win);
+
+	delwin(help_win);
+}
+
+void display_win(WINDOW *win, struct node *node)
+{
+	struct node *head = node;
+
+	int is_running;
+	int highlighted_index = 0;
+
+	bool focus_on_menu = true;
+	bool refresh = true;
+
+	int win_height, win_width;
+
+	int content_height;
+	int content_y_start;
+
+	int mpx;
+	int menu_pad_pos;
+	int menu_pad_width;
+	int menu_pad_height;
+	WINDOW *menu_pad = NULL;
+
+	int dpx;
+	int display_pad_pos;
+	int display_pad_width;
+	int display_pad_height;
+	WINDOW *display_pad = NULL;
+
+	const char *path = get_path(head);
+	const char *status_text = "[TAB] Switch Focus [S] Search [ESC] Back [R] Refresh [H] Help";
+
+	int count, ch;
+
+	for (;;) {
+		wclear(win);
+		box(win, 0, 0);
+		wbkgd(win, COLOR_PAIR(2));
+		getmaxyx(win, win_height, win_width);
+
+		if (!head->display_function && head->children_size == 0) {
+			mvwprintw(win, 4, 2, "It's so Empty at %s :(", head->name);
+			mvwprintw(win, 8, 2, "Press 'e' to go back.");
+			wrefresh(win);
+		}
+
+		is_running = 1;
+		igt_info("Displaying %s\n", head->name);
+
+		while (is_running) {
+			/* Handle resize or explicit refresh */
+			if (check_size_change(win, &win_height, &win_width) == 1 || refresh) {
+				igt_info("Window size changed. Refreshing display.\n");
+				refresh = false;
+
+				content_height = win_height - 6;
+				content_y_start = 4;
+
+				mpx = 1;
+				menu_pad_pos = 0;
+				menu_pad_height = head->children_size > content_height ?
+						head->children_size + 5 : content_height;
+				menu_pad_width = (int)((win_width - 3) * 0.3);
+
+				dpx = menu_pad_width + 2;
+				display_pad_pos = 0;
+				display_pad_height = 1000;
+				display_pad_width = win_width - 3 - menu_pad_width;
+
+				if (menu_pad) {
+					delwin(menu_pad);
+					menu_pad = NULL;
+				}
+
+				menu_pad = newpad(menu_pad_height, menu_pad_width);
+				prefresh(menu_pad, menu_pad_pos, 0, content_y_start, 1,
+					 content_height + content_y_start - 1, menu_pad_width + 1);
+
+				/* If there is a display function, set up and call it */
+				if (!head->display_function)
+					goto draw_after_display_setup;
+
+				if (display_pad) {
+					delwin(display_pad);
+					display_pad = NULL;
+				}
+
+				count = display_pad_height;
+				display_pad = newpad(display_pad_height, display_pad_width);
+
+				head->display_function(display_pad, head, &count);
+
+				/* Preserve current behavior for count == 0 */
+				if (count == 0) {
+					igt_info("Exiting %s\n", head->name);
+					if (head && head->parent) {
+						head = head->parent;
+						focus_on_menu = true;
+						highlighted_index = 0;
+						display_pad_pos = 0;
+						is_running = 0;
+					} else {
+						return;
+					}
+					/* Go to outer loop's cleanup/rebuild */
+					continue;
+				}
+
+				if (count < display_pad_height)
+					display_pad_height = count + 5;
+
+				prefresh(display_pad, display_pad_pos, 0, content_y_start,
+					 dpx, content_height + content_y_start - 1,
+					 2 + menu_pad_width + display_pad_width);
+			}
+
+draw_after_display_setup:
+			wclear(win);
+			box(win, 0, 0);
+			path = get_path(head);
+			draw_header(win, win_width, path, status_text);
+			mvwvline(win, 3, menu_pad_width + 1, ACS_VLINE, win_height - 4);
+			wrefresh(win);
+
+			/* Display pad indicators and contents if present */
+			if (head->display_function) {
+				if (display_pad_pos > 0)
+					print_bold_text(win, 3, menu_pad_width + 2, "...");
+				else
+					mvwprintw(win, 3, menu_pad_width + 2, "   ");
+
+				if (display_pad_pos < display_pad_height - content_height)
+					print_bold_text(win, content_height + content_y_start,
+							menu_pad_width + 2, "...");
+				else
+					mvwprintw(win, content_height + content_y_start,
+						  menu_pad_width + 2, "   ");
+
+				print_dim_text(win, 3, win_width - 15, "%d lines",
+					       display_pad_height);
+
+				prefresh(display_pad, display_pad_pos, 0, content_y_start, dpx,
+					 content_height + content_y_start - 1,
+					 2 + menu_pad_width + display_pad_width);
+			}
+
+			/* Focus indicator */
+			if (focus_on_menu) {
+				print_bold_text(win, 3, win_width - 5, "   ");
+				wattron(win, A_REVERSE);
+				print_bold_text(win, 3, menu_pad_width - 3, "***");
+				wattroff(win, A_REVERSE);
+			} else {
+				print_bold_text(win, 3, menu_pad_width - 3, "   ");
+				wattron(win, A_REVERSE);
+				print_bold_text(win, 3, win_width - 5, "***");
+				wattroff(win, A_REVERSE);
+			}
+
+			/* Menu rendering */
+			if (head->children_size > 0) {
+				if (!head->display_function)
+					focus_on_menu = true;
+				print_dim_text(win, 3, menu_pad_width - 15, "%d Menus",
+					       head->children_size);
+				for (int i = 0; i < head->children_size; ++i) {
+					if (highlighted_index == i && focus_on_menu)
+						wattron(menu_pad, A_REVERSE);
+					mvwprintw(menu_pad, i, 1, "%d. %s", i + 1,
+						  head->children[i].name);
+					wattroff(menu_pad, A_REVERSE);
+				}
+			}
+
+			if (highlighted_index == head->children_size && focus_on_menu)
+				wattron(menu_pad, A_REVERSE);
+
+			if (head->parent)
+				print_dim_text(menu_pad, head->children_size, 1, "Go Back");
+			else
+				print_dim_text(menu_pad, head->children_size, 1, "Exit");
+
+			wattroff(menu_pad, A_REVERSE);
+
+			prefresh(menu_pad, menu_pad_pos, 0, content_y_start, mpx,
+				 content_height + content_y_start - 1, menu_pad_width + 1);
+
+			/* Input handling */
+			ch = wgetch(win);
+			switch (ch) {
+			case KEY_UP:
+				if (!focus_on_menu) {
+					if (display_pad_pos > 0)
+						display_pad_pos--;
+					break;
+				}
+
+				if (highlighted_index == 0) {
+					highlighted_index = head->children_size;
+					menu_pad_pos = menu_pad_height - content_height;
+					break;
+				}
+
+				highlighted_index--;
+				if (highlighted_index > menu_pad_height - content_height)
+					menu_pad_pos = menu_pad_height - content_height;
+				else
+					menu_pad_pos--;
+
+				break;
+			case KEY_DOWN:
+				if (!focus_on_menu) {
+					if (display_pad_pos < display_pad_height - content_height)
+						display_pad_pos++;
+					break;
+				}
+
+				if (highlighted_index == head->children_size) {
+					highlighted_index = 0;
+					menu_pad_pos = 0;
+					break;
+				}
+
+				highlighted_index++;
+				if (highlighted_index > menu_pad_height - content_height)
+					menu_pad_pos = menu_pad_height - content_height;
+				else
+					menu_pad_pos++;
+				break;
+			case 's':
+			case 'S':
+				igt_info("Searching %s\n", head->name);
+				head = display_search_bar(head);
+				refresh = true;
+				break;
+			case 'p':
+			case 'P':
+				single_file_dump(head, DUMP_DIR, true);
+				refresh = true;
+				break;
+			case 'd':
+			case 'D':
+				display_dump_menu(head);
+				refresh = true;
+				break;
+			case 'h':
+			case 'H':
+				display_help_menu();
+				refresh = true;
+				break;
+			case 'q':
+			case 'Q':
+				if (display_exit_menu()) {
+					igt_info("Exiting DisplayTop\n");
+					return;
+				}
+				refresh = true;
+				break;
+			case 27:
+				igt_info("Exiting %s\n", head->name);
+				if (head && head->parent) {
+					head = head->parent;
+					focus_on_menu = true;
+					highlighted_index = 0;
+					display_pad_pos = 0;
+					is_running = 0;
+				} else if (display_exit_menu()) {
+					igt_info("Exiting DisplayTop\n");
+					return;
+				}
+				refresh = true;
+				break;
+			case 'r':
+			case 'R':
+				igt_info("Refreshing %s\n", head->name);
+				refresh = true;
+				break;
+			case '\n':
+				if (!focus_on_menu || !head)
+					break;
+
+				if (highlighted_index >= 0 &&
+				    highlighted_index < head->children_size) {
+					head = &head->children[highlighted_index];
+					highlighted_index = 0;
+					display_pad_pos = 0;
+					is_running = 0;
+					refresh = true;
+					break;
+				}
+
+				if (highlighted_index == head->children_size) {
+					if (head && head->parent) {
+						head = head->parent;
+						focus_on_menu = true;
+						highlighted_index = 0;
+						display_pad_pos = 0;
+						is_running = 0;
+					} else if (display_exit_menu()) {
+						igt_info("Exiting DisplayTop\n");
+						return;
+					}
+					refresh = true;
+				}
+				break;
+			case '\t':
+				focus_on_menu = !focus_on_menu;
+				break;
+			}
+		}
+
+		refresh = true;
+		if (display_pad) {
+			delwin(display_pad);
+			display_pad = NULL;
+		}
+
+		if (menu_pad) {
+			delwin(menu_pad);
+			menu_pad = NULL;
+		}
+	}
+}
diff --git a/tools/displaytop/src/display_configuration.c b/tools/displaytop/src/display_configuration.c
new file mode 100644
index 000000000..cd75ce4be
--- /dev/null
+++ b/tools/displaytop/src/display_configuration.c
@@ -0,0 +1,783 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "display.h"
+#include "utils.h"
+#include "igt_core.h"
+
+void display_crtc(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModeRes *resources = NULL;
+	drmModeObjectProperties *props = NULL;
+	drmModePlaneRes *plane_resources = NULL;
+	drmModeCrtc *crtc = NULL;
+	int crtc_index = -1;
+	char *endptr;
+
+	if (drm_fd < 0) {
+		print_red_text(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	resources = drmModeGetResources(drm_fd);
+	if (!resources) {
+		print_red_text(pad, line++, 1, "Failed to get DRM resources\n");
+		goto err;
+	}
+
+	crtc_index = strtol(node->name + 4, &endptr, 10);
+	if (*endptr != '\0' || crtc_index < 0 || crtc_index >= resources->count_crtcs) {
+		print_red_text(pad, line++, 1, "Invalid CRTC name: %s\n", node->name);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	crtc = drmModeGetCrtc(drm_fd, resources->crtcs[crtc_index]);
+	if (!crtc) {
+		print_red_text(pad, line++, 1, "Failed to get CRTC %d\n", crtc_index);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "CRTC ID: %d", crtc->crtc_id);
+	mvwprintw(pad, line++, 1, "Framebuffer ID: %d", crtc->buffer_id);
+	mvwprintw(pad, line++, 1, "Position(X, Y): (%d, %d)", crtc->x, crtc->y);
+	mvwprintw(pad, line++, 1, "Mode: ");
+	if (crtc->mode_valid)
+		print_green_text(pad, -1, -1, "VALID");
+	else
+		print_red_text(pad, -1, -1, "INVALID");
+
+	if (crtc->mode_valid) {
+		drmModeModeInfo *mode = &crtc->mode;
+
+		mvwprintw(pad, line++, 3, "Name: %s", mode->name);
+		mvwprintw(pad, line++, 3, "Resolution: %dx%d", mode->hdisplay, mode->vdisplay);
+		mvwprintw(pad, line++, 3, "Refresh Rate: %.2f Hz",
+			  mode->clock / (float)(mode->htotal * mode->vtotal));
+		mvwprintw(pad, line++, 3, "Type: 0x%x", mode->type);
+		mvwprintw(pad, line++, 3, "Flags: 0x%x", mode->flags);
+	}
+
+	mvwprintw(pad, line++, 1, "Gamma size: %u", crtc->gamma_size);
+
+	props = drmModeObjectGetProperties(drm_fd, crtc->crtc_id, DRM_MODE_OBJECT_CRTC);
+	if (!props) {
+		print_red_text(pad, line++, 1, "Failed to get properties for CRTC %u\n",
+			       crtc->crtc_id);
+		drmModeFreeCrtc(crtc);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	if (!plane_resources) {
+		print_red_text(pad, line++, 3, "Failed to get plane resources");
+		return;
+	}
+
+	line++;
+	mvwprintw(pad, line++, 1, "Possible Planes for CRTC %d:", crtc->crtc_id);
+	line++;
+
+	wattron(pad, A_DIM);
+	for (size_t i = 0; i < plane_resources->count_planes; i++) {
+		drmModePlane *plane = drmModeGetPlane(drm_fd, plane_resources->planes[i]);
+
+		if (plane) {
+			if (plane->possible_crtcs & (1 << crtc_index)) {
+				mvwprintw(pad, line++, 3, "Plane %ld: ID %d, %s",
+					  i, plane->plane_id,
+					  plane->crtc_id ? "Active" : "Inactive");
+			}
+			drmModeFreePlane(plane);
+		} else {
+			print_red_text(pad, line++, 3, "Plane %ld: Failed to get plane", i);
+		}
+	}
+	wattroff(pad, A_DIM);
+	drmModeFreePlaneResources(plane_resources);
+
+	line++;
+	mvwprintw(pad, line++, 1, "Properties for CRTC %u:", crtc->crtc_id);
+	line++;
+
+	wattron(pad, A_DIM);
+	for (uint32_t i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+
+		if (prop) {
+			uint64_t value = props->prop_values[i];
+			int remaining_width = getmaxx(pad) - getcurx(pad);
+			char value_str[256] = {0};
+
+			const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ?
+						    " immutable" : "";
+			const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ?
+						 " atomic" : " ";
+
+			if (prop->flags & DRM_MODE_PROP_BLOB) {
+				snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+			} else if (prop->flags & DRM_MODE_PROP_ENUM) {
+				snprintf(value_str, sizeof(value_str), "enum (");
+				for (int j = 0; j < prop->count_enums; j++) {
+					if (j > 0)
+						snprintf(value_str + strlen(value_str),
+							 sizeof(value_str) - strlen(value_str),
+							 ", ");
+					snprintf(value_str + strlen(value_str),
+						 sizeof(value_str) - strlen(value_str),
+						 "%s", prop->enums[j].name);
+				}
+				snprintf(value_str + strlen(value_str),
+					 sizeof(value_str) - strlen(value_str),
+					 ") = %s", prop->enums[value].name);
+			} else if (prop->flags & DRM_MODE_PROP_RANGE) {
+				snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+					 prop->values[0], prop->values[1], value);
+			} else if (prop->flags & DRM_MODE_PROP_OBJECT) {
+				snprintf(value_str, sizeof(value_str), "object %s = %lu",
+					 get_drm_object_type_name(prop->values[0]), value);
+			} else {
+				snprintf(value_str, sizeof(value_str), "%lu", value);
+			}
+
+			wattroff(pad, A_DIM);
+			mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+			wattron(pad, A_DIM);
+			wprintw(pad, "%s%s: ", immutability, atomicity);
+
+			if ((int)strlen(value_str) > remaining_width) {
+				char truncated_value[remaining_width + 1];
+
+				snprintf(truncated_value, remaining_width, "%s", value_str);
+				truncated_value[remaining_width] = '\0';
+				wprintw(pad, "%s", truncated_value);
+				mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+			} else {
+				wprintw(pad, "%s", value_str);
+			}
+
+			drmModeFreeProperty(prop);
+		}
+	}
+	wattroff(pad, A_DIM);
+
+	drmModeFreeObjectProperties(props);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	drmModeFreeCrtc(crtc);
+	drmModeFreeResources(resources);
+	return;
+
+err:
+	wrefresh(pad);
+	wgetch(pad);
+}
+
+void display_connector(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModeRes *resources = NULL;
+	drmModeConnector *connector = NULL;
+	int connector_index = -1;
+	char *endptr;
+
+	if (drm_fd < 0) {
+		print_red_text(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	resources = drmModeGetResources(drm_fd);
+	if (!resources) {
+		print_red_text(pad, line++, 1, "Failed to get DRM resources\n");
+		goto err;
+	}
+
+	connector_index = strtol(node->name + 9, &endptr, 10);
+
+	if (*endptr != '\0' || connector_index < 0 ||
+	    connector_index >= resources->count_connectors) {
+		mvwprintw(pad, line++, 1, "Invalid Connector name: %s\n", node->name);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	connector = drmModeGetConnector(drm_fd, resources->connectors[connector_index]);
+	if (!connector) {
+		mvwprintw(pad, line++, 1, "Failed to get Connector %d\n", connector_index);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Connector ID: %d", connector->connector_id);
+	mvwprintw(pad, line++, 1, "No. of Encoders: %d", connector->count_encoders);
+	mvwprintw(pad, line++, 1, "Encoder ID: %d", connector->encoder_id);
+
+	line++;
+	mvwprintw(pad, line++, 1, "Possible Encoders: ");
+	for (int i = 0; i < connector->count_encoders; i++)
+		mvwprintw(pad, line++, 3, "Encoder %d: %d", i, connector->encoders[i]);
+
+	line++;
+	mvwprintw(pad, line++, 1, "Connection: ");
+	if (connector->connection == DRM_MODE_CONNECTED)
+		print_green_text(pad, -1, -1, "Connected");
+	else
+		print_red_text(pad, -1, -1, "Disconnected");
+
+	line++;
+	mvwprintw(pad, line++, 1, "Connector Type: %s",
+		  get_connector_type_name(connector->connector_type));
+	mvwprintw(pad, line++, 1, "Connector Type ID: %d", connector->connector_type_id);
+
+	mvwprintw(pad, line++, 1, "Subpixel Order: %d", connector->subpixel);
+	mvwprintw(pad, line++, 1, "MM Height: %d", connector->mmHeight);
+	mvwprintw(pad, line++, 1, "MM Width: %d", connector->mmWidth);
+
+	mvwprintw(pad, line++, 1, "Modes: %d", connector->count_modes);
+	wattron(pad, A_DIM);
+
+	line++;
+	for (int i = 0; i < connector->count_modes; i++)
+
+		if (connector->modes && i < connector->count_modes) {
+			const drmModeModeInfo *mode = &connector->modes[i];
+
+			const char *preferred = (mode->type & DRM_MODE_TYPE_PREFERRED) ?
+						 " preferred" : "";
+			const char *driver = (mode->type & DRM_MODE_TYPE_DRIVER) ? " driver" : "";
+			const char *phsync = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? " phsync" :
+					      " nhsync";
+			const char *pvsync = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? " pvsync" :
+					      " nvsync";
+			const char *interlace = (mode->flags & DRM_MODE_FLAG_INTERLACE) ?
+						 " interlace" : "";
+
+			double ratio = (double)mode->hdisplay / mode->vdisplay;
+			double refresh_rate = 0.0;
+			const char *aspect_ratio = NULL;
+
+			if (mode->vrefresh > 0)
+				refresh_rate = mode->vrefresh;
+			else if (mode->clock > 0 && mode->vtotal > 0)
+				refresh_rate = (double)(mode->clock * 1000) /
+						(mode->htotal * mode->vtotal);
+
+			if (fabs(ratio - 16.0 / 9.0) < 0.01)
+				aspect_ratio = " 16:9";
+			else if (fabs(ratio - 4.0 / 3.0) < 0.01)
+				aspect_ratio = " 4:3";
+			else
+				aspect_ratio = "";
+
+			mvwprintw(pad, line++, 2, "%ux%u @%.2f%s%s%s%s%s%s",
+				  mode->hdisplay, mode->vdisplay, refresh_rate,
+				  driver, preferred, phsync, pvsync, interlace, aspect_ratio);
+		}
+
+	wattroff(pad, A_DIM);
+
+	mvwprintw(pad, line++, 1, "No. of Properties: %d", connector->count_props);
+
+	wattron(pad, A_DIM);
+	for (int i = 0; i < connector->count_props; i++) {
+		drmModePropertyPtr prop = drmModeGetProperty(drm_fd, connector->props[i]);
+
+		if (prop) {
+			char value_str[256] = {0};
+			uint64_t value = connector->prop_values[i];
+			int remaining_width = getmaxx(pad) - getcurx(pad);
+			const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ?
+						 " atomic" : " ";
+			const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ?
+						    " immutable" : "";
+
+			if (prop->flags & DRM_MODE_PROP_BLOB) {
+				snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+			} else if (prop->flags & DRM_MODE_PROP_ENUM) {
+				snprintf(value_str, sizeof(value_str), "enum (");
+				for (int j = 0; j < prop->count_enums; j++) {
+					if (j > 0)
+						snprintf(value_str + strlen(value_str),
+							 sizeof(value_str) - strlen(value_str),
+							 ", ");
+					snprintf(value_str + strlen(value_str),
+						 sizeof(value_str) - strlen(value_str),
+						 "%s", prop->enums[j].name);
+				}
+				snprintf(value_str + strlen(value_str),
+					 sizeof(value_str) - strlen(value_str),
+					 ") = %s", prop->enums[value].name);
+			} else if (prop->flags & DRM_MODE_PROP_RANGE) {
+				snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+					 prop->values[0], prop->values[1], value);
+			} else if (prop->flags & DRM_MODE_PROP_OBJECT) {
+				snprintf(value_str, sizeof(value_str), "object %s = %lu",
+					 get_drm_object_type_name(prop->values[0]), value);
+			} else {
+				snprintf(value_str, sizeof(value_str), "%lu", value);
+			}
+
+			wattroff(pad, A_DIM);
+			mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+			wattron(pad, A_DIM);
+			wprintw(pad, "%s%s: ", immutability, atomicity);
+
+			if ((int)strlen(value_str) > remaining_width) {
+				char truncated_value[remaining_width + 1];
+
+				snprintf(truncated_value, remaining_width, "%s", value_str);
+				truncated_value[remaining_width] = '\0';
+				wprintw(pad, "%s", truncated_value);
+				mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+			} else {
+				wprintw(pad, "%s", value_str);
+			}
+
+			drmModeFreeProperty(prop);
+		}
+	}
+	wattroff(pad, A_DIM);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	drmModeFreeConnector(connector);
+	drmModeFreeResources(resources);
+	return;
+
+err:
+	wrefresh(pad);
+	wgetch(pad);
+}
+
+void display_encoder(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModeRes *resources = NULL;
+	drmModeEncoder *encoder = NULL;
+	int encoder_id = -1;
+	char *endptr;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	resources = drmModeGetResources(drm_fd);
+	if (!resources) {
+		mvwprintw(pad, line++, 1, "Failed to get DRM resources\n");
+		goto err;
+	}
+
+	encoder_id = strtol(node->name + 7, &endptr, 10);
+	if (*endptr != '\0' || encoder_id < 0 || encoder_id >= resources->count_encoders) {
+		mvwprintw(pad, line++, 1, "Invalid Encoder name: %s\n", node->name);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	encoder = drmModeGetEncoder(drm_fd, resources->encoders[encoder_id]);
+	if (!encoder) {
+		mvwprintw(pad, line++, 1, "Failed to get Encoder %d\n", encoder_id);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	line++;
+	mvwprintw(pad, line++, 1, "Encoder Type: ");
+	if (encoder->encoder_type == DRM_MODE_ENCODER_NONE)
+		print_red_text(pad, -1, -1, "NONE");
+	else
+		print_bold_text(pad, -1, -1, "%s", get_encoder_type_name(encoder->encoder_type));
+	line++;
+
+	mvwprintw(pad, line++, 1, "Encoder ID: %d", encoder->encoder_id);
+	mvwprintw(pad, line++, 1, "CRTC ID: %d", encoder->crtc_id);
+	mvwprintw(pad, line++, 1, "Possible CRTCs: %d", encoder->possible_crtcs);
+	mvwprintw(pad, line++, 1, "Possible Clones: %d", encoder->possible_clones);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	drmModeFreeEncoder(encoder);
+	drmModeFreeResources(resources);
+	return;
+
+err:
+	wrefresh(pad);
+	wgetch(pad);
+}
+
+void display_framebuffer(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModeRes *resources = NULL;
+	drmModeFB *fb = NULL;
+	int framebuffer_id = -1;
+	char *endptr;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	resources = drmModeGetResources(drm_fd);
+	if (!resources) {
+		mvwprintw(pad, line++, 1, "Failed to get DRM resources\n");
+		goto err;
+	}
+
+	framebuffer_id = strtol(node->name + 11, &endptr, 10);
+	if (*endptr != '\0' || framebuffer_id < 0 || framebuffer_id >= resources->count_fbs) {
+		mvwprintw(pad, line++, 1, "Invalid Framebuffer name: %s\n", node->name);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	fb = drmModeGetFB(drm_fd, resources->fbs[framebuffer_id]);
+	if (!fb) {
+		mvwprintw(pad, line++, 1, "Failed to get Framebuffer %d\n", framebuffer_id);
+		drmModeFreeResources(resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Framebuffer ID: %d", fb->fb_id);
+	mvwprintw(pad, line++, 1, "Width: %d", fb->width);
+	mvwprintw(pad, line++, 1, "Height: %d", fb->height);
+	mvwprintw(pad, line++, 1, "Pitch: %d", fb->pitch);
+	mvwprintw(pad, line++, 1, "BPP: %d", fb->bpp);
+	mvwprintw(pad, line++, 1, "Depth: %d", fb->depth);
+	mvwprintw(pad, line++, 1, "Handle: %d", fb->handle);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	drmModeFreeFB(fb);
+	drmModeFreeResources(resources);
+	return;
+
+err:
+	wrefresh(pad);
+	wgetch(pad);
+}
+
+void display_plane(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModePlaneRes *plane_resources = NULL;
+	drmModePlane *plane = NULL;
+	int plane_index = -1;
+	char *endptr;
+	drmModeObjectProperties *props = NULL;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	if (!plane_resources) {
+		mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+		goto err;
+	}
+
+	plane_index = strtol(node->name + 5, &endptr, 10);
+	if (*endptr != '\0' || plane_index < 0 ||
+	    plane_index >= (int)plane_resources->count_planes) {
+		mvwprintw(pad, line++, 1, "Invalid Plane name: %s\n", node->name);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+	if (!plane) {
+		mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Plane Index: %d", plane_index);
+	mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+	mvwprintw(pad, line++, 1, "CRTC ID: %d", plane->crtc_id);
+	mvwprintw(pad, line++, 1, "Framebuffer ID: %d", plane->fb_id);
+	mvwprintw(pad, line++, 1, "Possible CRTCs: %d", plane->possible_crtcs);
+	mvwprintw(pad, line++, 1, "Gamma size: %u", plane->gamma_size);
+	mvwprintw(pad, line++, 1, "CRTC Position: (%d, %d)", plane->crtc_x, plane->crtc_y);
+
+	mvwprintw(pad, line++, 1, "Possible CRTC IDs: ");
+	for (int i = 0; i < 32; i++) {
+		if (plane->possible_crtcs & (1 << i))
+			mvwprintw(pad, line++, 3, "CRTC %d", i);
+	}
+	line++;
+
+	mvwprintw(pad, line++, 1, "Number of formats: %u", plane->count_formats);
+	line++;
+
+	props = drmModeObjectGetProperties(drm_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
+	if (!props) {
+		mvwprintw(pad, line++, 1, "Failed to get properties for Plane %u\n",
+			  plane->plane_id);
+		drmModeFreePlane(plane);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Properties for Plane %u:", plane->plane_id);
+	line++;
+
+	for (uint32_t i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+
+		if (prop) {
+			char value_str[256] = {0};
+			uint64_t value = props->prop_values[i];
+			int remaining_width = getmaxx(pad) - getcurx(pad);
+			const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ?
+						    " immutable" : "";
+			const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ?
+						 " atomic" : " ";
+
+			if (prop->flags & DRM_MODE_PROP_BLOB) {
+				snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+			} else if (prop->flags & DRM_MODE_PROP_ENUM) {
+				snprintf(value_str, sizeof(value_str), "enum (");
+				for (int j = 0; j < prop->count_enums; j++) {
+					if (j > 0)
+						snprintf(value_str + strlen(value_str),
+							 sizeof(value_str) - strlen(value_str),
+							 ", ");
+					snprintf(value_str + strlen(value_str),
+						 sizeof(value_str) - strlen(value_str),
+						 "%s", prop->enums[j].name);
+				}
+				snprintf(value_str + strlen(value_str),
+					 sizeof(value_str) - strlen(value_str), ") = %s",
+					 prop->enums[value].name);
+			} else if (prop->flags & DRM_MODE_PROP_RANGE) {
+				snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+					 prop->values[0], prop->values[1], value);
+			} else if (prop->flags & DRM_MODE_PROP_OBJECT) {
+				snprintf(value_str, sizeof(value_str), "object %s = %lu",
+					 get_drm_object_type_name(prop->values[0]), value);
+			} else {
+				snprintf(value_str, sizeof(value_str), "%lu", value);
+			}
+
+			wattroff(pad, A_DIM);
+			mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+			wattron(pad, A_DIM);
+			wprintw(pad, "%s%s: ", immutability, atomicity);
+
+			if ((int)strlen(value_str) > remaining_width) {
+				char truncated_value[remaining_width + 1];
+
+				snprintf(truncated_value, remaining_width, "%s", value_str);
+				truncated_value[remaining_width] = '\0';
+				wprintw(pad, "%s", truncated_value);
+				mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+			} else {
+				wprintw(pad, "%s", value_str);
+			}
+
+			drmModeFreeProperty(prop);
+		}
+	}
+
+	drmModeFreeObjectProperties(props);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	drmModeFreePlane(plane);
+	drmModeFreePlaneResources(plane_resources);
+	return;
+
+err:
+	wrefresh(pad);
+	wgetch(pad);
+}
+
+void display_informats(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModePlaneRes *plane_resources = NULL;
+	drmModePlane *plane = NULL;
+	drmModeObjectProperties *props = NULL;
+	int plane_index = -1;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	if (!plane_resources) {
+		mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+		goto err;
+	}
+
+	if (strncmp(node->name, "IN_FORMATS", 10) == 0) {
+		char *endptr;
+
+		plane_index = strtol(node->name + 10, &endptr, 10);
+		if (*endptr != '\0' || plane_index < 0 ||
+		    plane_index >= (int)plane_resources->count_planes) {
+			mvwprintw(pad, line++, 1, "Invalid Plane Index: %s\n", node->name);
+			drmModeFreePlaneResources(plane_resources);
+			goto err;
+		}
+	} else {
+		mvwprintw(pad, line++, 1, "Invalid format for node->name: %s\n", node->name);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+	if (!plane) {
+		mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Plane Index: %d", plane_index);
+	mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+
+	props = drmModeObjectGetProperties(drm_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
+	if (!props) {
+		mvwprintw(pad, line++, 1, "Failed to get properties for Plane %u\n",
+			  plane->plane_id);
+		drmModeFreePlane(plane);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "IN_FORMATS for Plane %u:", plane->plane_id);
+	line++;
+
+	for (uint32_t i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+
+		if (prop) {
+			uint64_t value = props->prop_values[i];
+
+			if (prop->flags & DRM_MODE_PROP_BLOB && strcmp(prop->name,
+								       "IN_FORMATS") == 0) {
+				drmModePropertyBlobRes *blob = drmModeGetPropertyBlob(drm_fd,
+										      value);
+				struct drm_format_modifier_blob *data = NULL;
+				uint32_t *fmts = NULL;
+				struct drm_format_modifier *mods = NULL;
+
+				if (!blob) {
+					igt_info("Failed to allocate and retrieve blob pointer.");
+					return;
+				}
+
+				data = blob->data;
+
+			fmts = (uint32_t *)((char *)data + data->formats_offset);
+			mods = (struct drm_format_modifier *)((char *)data +
+							      data->modifiers_offset);
+
+			for (uint32_t j = 0; j < data->count_modifiers; j++) {
+				mvwprintw(pad, line++, 1, "Modifier %u: %s", j,
+					  get_basic_modifier_str(mods[j].modifier));
+				mvwprintw(pad, line++, 3, "Formats: ");
+				wattron(pad, A_DIM);
+				for (uint32_t k = 0; k < data->count_formats; k++) {
+					if (mods[j].formats & (1ULL << k))
+						mvwprintw(pad, line++, 5, "%s (0x%08x)",
+							  get_format_str(fmts[k]), fmts[k]);
+				}
+				wattroff(pad, A_DIM);
+			}
+			drmModeFreePropertyBlob(blob);
+			}
+		}
+	}
+	drmModeFreeObjectProperties(props);
+	drmModeFreePlane(plane);
+	drmModeFreePlaneResources(plane_resources);
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	return;
+
+err:
+	wrefresh(pad);
+}
+
+void display_formats(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	drmModePlaneRes *plane_resources = NULL;
+	drmModePlane *plane = NULL;
+	int plane_index = -1;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+		goto err;
+	}
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	if (!plane_resources) {
+		mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+		goto err;
+	}
+
+	if (strncmp(node->name, "FORMATS", 7) == 0) {
+		char *endptr;
+
+		plane_index = strtol(node->name + 7, &endptr, 10);
+		if (*endptr != '\0' || plane_index < 0 ||
+		    plane_index >= (int)plane_resources->count_planes) {
+			mvwprintw(pad, line++, 1, "Invalid Plane Index: %s\n", node->name);
+			drmModeFreePlaneResources(plane_resources);
+			goto err;
+		}
+	} else {
+		mvwprintw(pad, line++, 1, "Invalid format for node->name: %s\n", node->name);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+	if (!plane) {
+		mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+		drmModeFreePlaneResources(plane_resources);
+		goto err;
+	}
+
+	mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+
+	line++;
+	mvwprintw(pad, line++, 1, "No. of Plane formats %u:", plane->count_formats);
+	line++;
+
+	if (plane->count_formats > 0) {
+		wattron(pad, A_DIM);
+		for (uint32_t i = 0; i < plane->count_formats; i++)
+			mvwprintw(pad, line++, 3, "%s (0x%08x)",
+				  get_format_str(plane->formats[i]),
+				  plane->formats[i]);
+		line++;
+		wattroff(pad, A_DIM);
+	}
+
+	drmModeFreePlane(plane);
+	drmModeFreePlaneResources(plane_resources);
+
+	mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+	*content_line = line;
+	return;
+
+err:
+	wrefresh(pad);
+}
diff --git a/tools/displaytop/src/display_dump.c b/tools/displaytop/src/display_dump.c
new file mode 100644
index 000000000..4c286cd8e
--- /dev/null
+++ b/tools/displaytop/src/display_dump.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "node.h"
+#include "utils.h"
+#include "igt_core.h"
+
+void single_file_dump(struct node *node, const char *file_path, bool single)
+{
+	time_t now;
+	struct tm *t;
+	char dump_file_path[512];
+	FILE *file;
+	const int pad_height = 1000;
+	const int pad_width = 200;
+	WINDOW *virtual_win;
+	int line = 0;
+	char buffer[pad_width + 1];
+
+	igt_assert_f(node && node->name[0] != '\0' && node->display_function,
+		     "Invalid node provided for dumping\n");
+
+	now = time(NULL);
+	t = localtime(&now);
+
+	if (single) {
+		snprintf(dump_file_path, sizeof(dump_file_path), "%s/%s_%04d-%02d-%02d-%02d.%02d.%02d.txt",
+			 file_path, node->name, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+			 t->tm_hour, t->tm_min, t->tm_sec);
+	} else {
+		snprintf(dump_file_path, sizeof(dump_file_path), "%s/%s.txt",
+			 file_path, node->name);
+	}
+
+	file = fopen(dump_file_path, "w");
+	igt_require_f(file, "Failed to open file: %s\n", dump_file_path);
+	chmod(dump_file_path, 0777);
+
+	virtual_win = newwin(pad_height, pad_width, 0, 0);
+	igt_require_f(virtual_win, "Failed to create virtual window\n");
+
+	node->display_function(virtual_win, node, &line);
+
+	fprintf(file, "Dump Time: %04d-%02d-%02d %02d:%02d:%02d\n\n",
+		t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+		t->tm_hour, t->tm_min, t->tm_sec);
+
+	for (int y = 0; y < line; ++y) {
+		wmove(virtual_win, y, 0);
+		winnstr(virtual_win, buffer, pad_width);
+		buffer[pad_width] = '\0';
+		fprintf(file, "%s\n", buffer);
+	}
+
+	igt_info("Dumped node '%s' to %s\n", node->name, dump_file_path);
+
+	delwin(virtual_win);
+	fclose(file);
+}
+
+static void recursive_dump_with_progress(struct node *node, const char *parent_dir,
+					 int *current_count, int total_count, WINDOW *progress_win)
+{
+	char node_dir[512];
+	bool has_children;
+	time_t now;
+	struct tm *t;
+
+	if (!node)
+		return;
+
+	has_children = (node->children_size > 0);
+
+	if (has_children) {
+		now = time(NULL);
+		t = localtime(&now);
+
+		snprintf(node_dir, sizeof(node_dir), "%s/%s(%04d-%02d-%02d-%02d.%02d.%02d)",
+			 parent_dir, node->name, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+			 t->tm_hour, t->tm_min, t->tm_sec);
+
+		igt_require_f(!(mkdir(node_dir, 0777) == -1 && errno != EEXIST),
+			      "Error creating directory %s: %s\n", node_dir, strerror(errno));
+		(*current_count)++;
+	} else {
+		snprintf(node_dir, sizeof(node_dir), "%s", parent_dir);
+	}
+
+	if (node->display_function) {
+		single_file_dump(node, node_dir, false);
+		(*current_count)++;
+	}
+
+	render_progress_bar(progress_win, *current_count, total_count);
+
+	for (int i = 0; i < node->children_size; ++i)
+		recursive_dump_with_progress(&node->children[i], node_dir,
+					     current_count, total_count, progress_win);
+}
+
+void display_dump_menu(struct node *head)
+{
+	int total_nodes;
+	int win_height, win_width;
+	WINDOW *win;
+	int line;
+	int input;
+	int current_count;
+
+	igt_assert_f(head, "Head node is NULL, cannot dump.\n");
+
+	total_nodes = 0;
+	count_nodes(head, &total_nodes);
+
+	if (total_nodes == 0) {
+		igt_info("No nodes found to dump.\n");
+		return;
+	}
+
+	getmaxyx(stdscr, win_height, win_width);
+
+	win = newwin(win_height, win_width, 0, 0);
+	wbkgd(win, COLOR_PAIR(6));
+	box(win, 0, 0);
+
+	draw_header(win, win_width, "DUMP MENU", "Press ESC to exit");
+
+	line = 4;
+	wattron(win, A_BOLD);
+	mvwprintw(win, line++, 2, "You are about to dump %d nodes into files.", total_nodes);
+	line++;
+	mvwprintw(win, line++, 2, "Dumping menus under the path: %s", head->name);
+	line++;
+	wattroff(win, A_BOLD);
+	mvwprintw(win, line++, 2, "Proceed with dump? (y to confirm, ESC to cancel)");
+	wrefresh(win);
+
+	input = wgetch(win);
+	if (input != 'y' && input != 'Y') {
+		delwin(win);
+		return;
+	}
+
+	igt_info("Starting dump from node: %s\n", head->name);
+
+	igt_require_f(!(mkdir(DUMP_DIR, 0777) == -1 && errno != EEXIST),
+		      "Failed to create dump directory: %s\n", strerror(errno));
+
+	line++;
+	mvwprintw(win, line++, 2, "Progress:");
+	wrefresh(win);
+
+	current_count = 0;
+	recursive_dump_with_progress(head, DUMP_DIR, &current_count, total_nodes, win);
+
+	mvwprintw(win, line + 2, 2, "Dumping is over. Press any key to go back.");
+	wrefresh(win);
+	getch();
+
+	delwin(win);
+	endwin();
+}
diff --git a/tools/displaytop/src/display_search_bar.c b/tools/displaytop/src/display_search_bar.c
new file mode 100644
index 000000000..5957eb6de
--- /dev/null
+++ b/tools/displaytop/src/display_search_bar.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include <form.h>
+
+#include "display.h"
+#include "utils.h"
+#include "igt_core.h"
+
+/**
+ * @brief Constructs a search path from a given node to the head node.
+ *
+ * This function constructs a search path string from the given node to the head node.
+ * The path is constructed by traversing from the given node up to the head node,
+ * appending each node's name to the path string, separated by " > ".
+ *
+ * @param node Pointer to the starting node.
+ * @param head Pointer to the head node until which path is required.
+ * @return A dynamically allocated string representing the search path.
+ *         The caller is responsible for freeing the allocated memory.
+ *         Returns NULL if either node or head is NULL.
+ */
+static char *construct_search_path(struct node *node, struct node *head)
+{
+	char buffer[1024];
+	char temp[1024];
+	char *path;
+	struct node *current;
+
+	if (!node || !head)
+		return NULL;
+
+	buffer[0] = '\0';
+	path = NULL;
+	current = node;
+
+	while (current && strcmp(current->name, head->name) != 0) {
+		igt_assert_f(snprintf(temp, sizeof(temp), "%s%s%s", current->name,
+				      buffer[0] ? " > " : "", buffer) < (int)sizeof(temp),
+			     "Path string truncated: %s%s%s\n", current->name,
+			     buffer[0] ? " > " : "", buffer);
+	       snprintf(buffer, sizeof(buffer), "%s", temp);
+	       buffer[sizeof(buffer) - 1] = '\0';
+	       current = current->parent;
+	}
+
+	path = (char *)malloc(strlen(buffer) + 1);
+	if (path)
+		snprintf(path, strlen(buffer) + 1, "%s", buffer);
+
+	return path;
+}
+
+/**
+ * @brief Displays the children of a given node in a new window.
+ *
+ * This function displays the children of a given node in a new window.
+ * The user can navigate through the children using the arrow keys and select a
+ * child by pressing Enter.
+ * The function returns the selected child node.
+ *
+ * @param node Pointer to the node whose children are to be displayed.
+ * @param head Pointer to the head node (current location in DisplayTop).
+ * @return Pointer to the selected child node.
+ *         Returns NULL if either node or node->children is NULL.
+ */
+static struct node *display_children(struct node *node, struct node *head)
+{
+	int rows, cols;
+	int line;
+	int pad_pos;
+	int highlighted_index;
+	int ch;
+	WINDOW *pad;
+
+	if (!node || !node->children)
+		return NULL;
+
+	getmaxyx(stdscr, rows, cols);
+
+	line = 0;
+	pad_pos = 0;
+	highlighted_index = 0;
+	pad = newpad(100, cols - 2);
+
+	if (!pad)
+		return NULL;
+
+	wbkgd(pad, COLOR_PAIR(6));
+
+	if (node->children_size > 0) {
+		line++;
+
+		for (int i = 0; i < node->children_size; ++i) {
+			if (highlighted_index == i)
+				wattron(pad, A_REVERSE);
+
+			mvwprintw(pad, line + i, 1, "%d. %s - %s", i + 1, node->children[i].name,
+				  construct_search_path(&node->children[i], head));
+			wattroff(pad, A_REVERSE);
+		}
+		prefresh(pad, pad_pos, 0, 8, 1, rows - 2, cols - 2);
+	}
+
+	while ((ch = getch()) != 27) {
+		if (pad_pos > 0)
+			mvwprintw(pad, 0, cols - 5, "...");
+		else
+			mvwprintw(pad, 0, cols - 5, "   ");
+
+		if (pad_pos < node->children_size - (rows - 8))
+			mvwprintw(pad, rows - 1, cols - 5, "...");
+		else
+			mvwprintw(pad, rows - 1, cols - 5, "   ");
+
+		switch (ch) {
+		case KEY_UP:
+			if (highlighted_index > 0) {
+				highlighted_index--;
+				pad_pos = (highlighted_index < pad_pos) ? highlighted_index :
+						pad_pos;
+			}
+			break;
+		case KEY_DOWN:
+			if (highlighted_index < node->children_size - 1) {
+				highlighted_index++;
+				pad_pos = (highlighted_index >= pad_pos + rows - 8) ?
+					   highlighted_index - rows + 8 : pad_pos;
+			}
+			break;
+		case '\n':
+			delwin(pad);
+			return &node->children[highlighted_index];
+		default:
+			break;
+		}
+
+		for (int i = 0; i < node->children_size; ++i) {
+			if (highlighted_index == i)
+				wattron(pad, A_REVERSE);
+
+			mvwprintw(pad, line + i, 1, "%d. %s - %s", i + 1, node->children[i].name,
+				  construct_search_path(&node->children[i], head));
+			wattroff(pad, A_REVERSE);
+		}
+		prefresh(pad, pad_pos, 0, 8, 1, rows - 2, cols - 2);
+	}
+
+	delwin(pad);
+	return head;
+}
+
+struct node *display_search_bar(struct node *head)
+{
+	int rows, cols;
+	WINDOW *win;
+	FIELD * fields[2];
+	FORM *form;
+	char input_buffer[256];
+	int ch, pos;
+	struct node *results;
+	struct node *result;
+
+	memset(input_buffer, 0, sizeof(input_buffer));
+	pos = 0;
+
+	getmaxyx(stdscr, rows, cols);
+	win = newwin(rows, cols, 0, 0);
+	wbkgd(win, COLOR_PAIR(6));
+	keypad(win, TRUE);
+	box(win, 0, 0);
+
+	print_bold_text(win, 1, 1, "Search Menu");
+	mvwprintw(win, 1, (cols - strlen("Searching under: %s")) / 2, "Searching under: %s",
+		  head->name);
+	mvwprintw(win, 1, cols - strlen("Press 'Esc' to exit ") - 1, "Press 'Esc' to exit");
+	mvwhline(win, 2, 1, 0, cols - 2);
+	mvwhline(win, 6, 1, 0, cols - 2);
+
+	fields[0] = new_field(1, cols - 4, 1, 1, 0, 0);
+	fields[1] = NULL;
+
+	set_field_back(fields[0], A_UNDERLINE);
+	field_opts_off(fields[0], O_AUTOSKIP);
+
+	form = new_form(fields);
+	set_form_win(form, win);
+	set_form_sub(form, derwin(win, 3, cols - 2, 3, 1));
+
+	wbkgd(form_sub(form), COLOR_PAIR(7));
+	box(form_sub(form), 0, 0);
+	post_form(form);
+	wrefresh(win);
+
+	while ((ch = getch()) != 27) {
+		switch (ch) {
+		case KEY_BACKSPACE:
+		case 127:
+		case 8:
+			if (pos > 0) {
+				pos--;
+				input_buffer[pos] = '\0';
+				form_driver(form, REQ_DEL_PREV);
+			}
+			break;
+		case '\n':
+			if (pos > 0) {
+				results = create_node("Search Results", NULL, NULL);
+				search_nodes(head, input_buffer, results);
+				if (results->children_size != 0) {
+					unpost_form(form);
+					print_bold_text(win, 7, 2, "%d hits",
+							results->children_size);
+					wrefresh(win);
+					result = display_children(results, head);
+					free_form(form);
+					free_field(fields[0]);
+					delwin(win);
+					endwin();
+					return result;
+				}
+				print_bold_text(win, 7, 2, "No results found");
+			}
+			break;
+		default:
+			if (pos < (int)(sizeof(input_buffer) - 1)) {
+				input_buffer[pos++] = ch;
+				input_buffer[pos] = '\0';
+				form_driver(form, ch);
+			}
+			break;
+		}
+		wrefresh(win);
+	}
+
+	unpost_form(form);
+	wrefresh(win);
+
+	getch();
+	free_form(form);
+	free_field(fields[0]);
+	delwin(win);
+	endwin();
+
+	return head;
+}
diff --git a/tools/displaytop/src/display_summary.c b/tools/displaytop/src/display_summary.c
new file mode 100644
index 000000000..68c1b6965
--- /dev/null
+++ b/tools/displaytop/src/display_summary.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "display.h"
+#include "utils.h"
+
+#define MAX_WIDTH getmaxx(pad)
+#define MAX_ENCODERS_PER_ROW ((MAX_WIDTH - 11) / 8)
+
+static void display_encoders(WINDOW *pad, drmModeRes *resources, int *line)
+{
+	int col_width = 6;
+	int max_per_row = MAX_ENCODERS_PER_ROW;
+	int start, end, i;
+	drmModeEncoder *encoder;
+
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, (*line)++, 1, "Encoders - %d", resources->count_encoders);
+	wattroff(pad, A_BOLD);
+
+	for (start = 0; start < resources->count_encoders; start += max_per_row) {
+		end = (start + max_per_row < resources->count_encoders) ?
+		       (start + max_per_row) : resources->count_encoders;
+
+		mvwprintw(pad, (*line)++, 2, "Encoder ID |");
+		for (i = start; i < end; i++) {
+			encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+			if (encoder) {
+				mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)),
+					  "%*d", col_width, encoder->encoder_id);
+				wprintw(pad, "|");
+				drmModeFreeEncoder(encoder);
+			} else {
+				mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)),
+					  "%*s", col_width, "N/A");
+				wprintw(pad, "|");
+			}
+		}
+
+		mvwprintw(pad, (*line)++, 2, "Type       |");
+		for (i = start; i < end; i++) {
+			encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+			if (encoder) {
+				mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)),
+					  "%*s", col_width,
+					  get_encoder_type_name(encoder->encoder_type));
+				wprintw(pad, "|");
+				drmModeFreeEncoder(encoder);
+			} else {
+				mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)),
+					  "%*s", col_width, "N/A");
+				wprintw(pad, "|");
+			}
+		}
+
+		mvwprintw(pad, (*line)++, 2, "CRTC ID    |");
+		for (i = start; i < end; i++) {
+			encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+			if (encoder) {
+				if (encoder->crtc_id != 0) {
+					wattron(pad, A_BOLD | COLOR_PAIR(2));
+					mvwprintw(pad, (*line) - 1,
+						  14 + ((i - start) * (col_width + 1)), "%*d",
+						  col_width, encoder->crtc_id);
+					wattroff(pad, A_BOLD | COLOR_PAIR(2));
+					wprintw(pad, "|");
+				} else {
+					mvwprintw(pad, (*line) - 1,
+						  14 + ((i - start) * (col_width + 1)), "%*d",
+						  col_width, encoder->crtc_id);
+					wprintw(pad, "|");
+				}
+				drmModeFreeEncoder(encoder);
+			} else {
+				mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)),
+					  "%*s", col_width, "N/A");
+				wprintw(pad, "|");
+			}
+		}
+		(*line) += 1;
+	}
+}
+
+void display_summary(WINDOW *pad, struct node *node, int *content_line)
+{
+	int line = 0;
+	int col_width;
+	drmModeRes *resources = NULL;
+	drmModeCrtc *crtc = NULL;
+	drmVersionPtr version = NULL;
+	uint64_t value;
+	drmDevicePtr devices[8];
+	int device_count;
+
+	wclear(pad);
+
+	print_bold_text(pad, line++, 1, "%s Summary", node->name);
+	line++;
+
+	print_dim_text(pad, line++, 1, "Fetching details for card: %s", find_drm_device(true));
+	line++;
+
+	if (drm_fd < 0) {
+		mvwprintw(pad, line++, 2, "Failed to open DRM Device!\n");
+		goto error;
+	}
+
+	resources = drmModeGetResources(drm_fd);
+
+	if (!resources) {
+		mvwprintw(pad, line++, 2, "Failed to get DRM resources\n");
+		goto error;
+	}
+
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, line++, 1, "CRTCs - %d", resources->count_crtcs);
+	wattroff(pad, A_BOLD);
+
+	col_width = 10;
+	mvwprintw(pad, line++, 2, "CRTC ID   |");
+	for (int i = 0; i < resources->count_crtcs; i++) {
+		crtc = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
+
+		if (crtc) {
+			if (crtc->mode_valid) {
+				wattron(pad, A_BOLD | COLOR_PAIR(2));
+				mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d",
+					  col_width, crtc->crtc_id);
+				wattroff(pad, A_BOLD | COLOR_PAIR(2));
+				wprintw(pad, "|");
+			} else {
+				wattron(pad, A_BOLD | COLOR_PAIR(3));
+				mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d",
+					  col_width, crtc->crtc_id);
+				wattroff(pad, A_BOLD | COLOR_PAIR(3));
+				wprintw(pad, "|");
+			}
+			drmModeFreeCrtc(crtc);
+		} else {
+			mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|",
+				  col_width, "N/A");
+		}
+	}
+	line++;
+
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, line++, 1, "Connectors - %d", resources->count_connectors);
+	wattroff(pad, A_BOLD);
+
+	col_width = 10;
+	mvwprintw(pad, line++, 2, "Connectors|");
+	for (int i = 0; i < resources->count_connectors; i++) {
+		drmModeConnector *connector = drmModeGetConnector(drm_fd, resources->connectors[i]);
+
+		if (connector) {
+			if (connector->connection == DRM_MODE_CONNECTED) {
+				wattron(pad, A_BOLD | COLOR_PAIR(2));
+				mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d",
+					  col_width, connector->connector_id);
+				wattroff(pad, A_BOLD | COLOR_PAIR(2));
+				wprintw(pad, "|");
+			} else {
+				wattron(pad, A_BOLD | COLOR_PAIR(3));
+				mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d",
+					  col_width, connector->connector_id);
+				wattroff(pad, A_BOLD | COLOR_PAIR(3));
+				wprintw(pad, "|");
+			}
+			drmModeFreeConnector(connector);
+		} else {
+			mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|",
+				  col_width, "N/A");
+		}
+	}
+
+	mvwprintw(pad, line++, 2, "Type      |");
+	for (int i = 0; i < resources->count_connectors; i++) {
+		drmModeConnector *connector = drmModeGetConnector(drm_fd, resources->connectors[i]);
+
+		if (connector) {
+			const char *type_name = get_connector_type_name(connector->connector_type);
+
+			mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width,
+				  type_name);
+			drmModeFreeConnector(connector);
+		} else {
+			mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width,
+				  "N/A");
+		}
+	}
+	line++;
+
+	display_encoders(pad, resources, &line);
+
+	version = drmGetVersion(drm_fd);
+	if (version) {
+		wattron(pad, A_BOLD);
+		mvwprintw(pad, line++, 1, "DRM Driver: %s", version->name);
+		wattroff(pad, A_BOLD);
+		drmFreeVersion(version);
+	} else {
+		mvwprintw(pad, line++, 2, "Failed to get DRM version");
+	}
+
+	drmGetCap(drm_fd, DRM_CAP_TIMESTAMP_MONOTONIC, &value);
+	mvwprintw(pad, line++, 2, "DRM_CAP_TIMESTAMP_MONOTONIC: %lu", value);
+
+	drmGetCap(drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &value);
+	mvwprintw(pad, line++, 2, "DRM_CAP_CRTC_IN_VBLANK_EVENT: %lu", value);
+
+	drmGetCap(drm_fd, DRM_CAP_ASYNC_PAGE_FLIP, &value);
+	mvwprintw(pad, line++, 2, "DRM_CAP_ASYNC_PAGE_FLIP: %lu", value);
+
+	drmGetCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, &value);
+	mvwprintw(pad, line++, 2, "DRM_CLIENT_CAP_ATOMIC: %lu", value);
+
+	drmGetCap(drm_fd, DRM_CAP_ADDFB2_MODIFIERS, &value);
+	mvwprintw(pad, line++, 2, "DRM_CAP_ADDFB2_MODIFIERS: %lu", value);
+	line++;
+
+	device_count = drmGetDevices2(0, devices, 8);
+	if (device_count < 0) {
+		mvwprintw(pad, line++, 2, "Failed to get DRM devices");
+	} else {
+		for (int i = 0; i < device_count; i++) {
+			if (devices[i]->available_nodes & (1 << DRM_NODE_PRIMARY)) {
+				char available_nodes[256] = "";
+
+				wattron(pad, A_BOLD);
+				mvwprintw(pad, line++, 1, "Device: PCI %04x:%04x",
+					  devices[i]->deviceinfo.pci->vendor_id,
+					  devices[i]->deviceinfo.pci->device_id);
+				wattroff(pad, A_BOLD);
+
+				if (devices[i]->available_nodes & (1 << DRM_NODE_PRIMARY))
+					strcat(available_nodes, "primary, ");
+				if (devices[i]->available_nodes & (1 << DRM_NODE_RENDER))
+					strcat(available_nodes, "render, ");
+				if (strlen(available_nodes) > 0)
+					available_nodes[strlen(available_nodes) - 2] = '\0';
+				mvwprintw(pad, line++, 2, "Available nodes: %s", available_nodes);
+			}
+		}
+		drmFreeDevices(devices, device_count);
+	}
+
+	drmModeFreeResources(resources);
+
+	*content_line = line;
+	return;
+
+error:
+	if (resources)
+		drmModeFreeResources(resources);
+
+	wrefresh(pad);
+	*content_line = line;
+}
diff --git a/tools/displaytop/src/main.c b/tools/displaytop/src/main.c
new file mode 100644
index 000000000..252f7a102
--- /dev/null
+++ b/tools/displaytop/src/main.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include <ncurses.h>
+#include <menu.h>
+#include "node.h"
+#include "data.h"
+#include "display.h"
+#include "populate.h"
+#include "utils.h"
+
+int main(int argc, char *argv[])
+{
+	handle_cli_args(argc, argv);
+
+	initscr();
+	cbreak();
+	noecho();
+	start_color();
+	set_escdelay(0);
+	keypad(stdscr, TRUE);
+
+	init_pair(1, COLOR_WHITE, COLOR_BLACK);
+	init_pair(2, COLOR_GREEN, COLOR_BLACK);
+	init_pair(3, COLOR_RED, COLOR_BLACK);
+	init_pair(4, COLOR_BLACK, COLOR_GREEN);
+	init_pair(5, COLOR_BLACK, COLOR_RED);
+	init_pair(6, COLOR_BLUE, COLOR_BLACK);
+	init_pair(7, COLOR_BLACK, COLOR_BLUE);
+
+	check_and_load_driver();
+	open_primary_drm_device();
+	populate_data();
+	display_win(stdscr, root);
+
+	endwin();
+	close_primary_drm_device();
+
+	return 0;
+}
diff --git a/tools/displaytop/src/node.c b/tools/displaytop/src/node.c
new file mode 100644
index 000000000..511dd9db8
--- /dev/null
+++ b/tools/displaytop/src/node.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "node.h"
+
+struct node *create_node(const char *name,
+			 void (*display_function)(WINDOW *, struct node *, int *),
+			 struct node *parent)
+{
+	struct node *new_node = (struct node *)malloc(sizeof(struct node));
+
+	snprintf(new_node->name, sizeof(new_node->name), "%s", name);
+	new_node->name[sizeof(new_node->name) - 1] = '\0';
+	new_node->display_function = display_function;
+	new_node->parent = parent;
+	new_node->children = NULL;
+	new_node->children_size = 0;
+	return new_node;
+}
+
+void add_child(struct node *parent, struct node *child)
+{
+	parent->children = (struct node *)realloc(parent->children,
+				sizeof(struct node) * (parent->children_size + 1));
+	parent->children[parent->children_size] = *child;
+	parent->children_size++;
+}
+
+void free_tree(struct node *root)
+{
+	int i;
+
+	if (!root)
+		return;
+
+	for (i = 0; i < root->children_size; i++)
+		free_tree(&root->children[i]);
+	free(root->children);
+	free(root);
+}
+
+void print_path(struct node *node)
+{
+	if (node->parent) {
+		print_path(node->parent);
+		printw(" > %s", node->name);
+	} else {
+		printw("%s", node->name);
+	}
+}
+
+char *get_path(struct node *node)
+{
+	size_t path_size;
+	struct node *current;
+	char *path;
+	char *new_path;
+
+	if (!node)
+		return NULL;
+
+	path_size = 1;
+	current = node;
+	while (current) {
+		path_size += strlen(current->name) + 3;
+		current = current->parent;
+	}
+
+	path = (char *)malloc(path_size);
+	if (!path)
+		return NULL;
+	path[0] = '\0';
+
+	current = node;
+	while (current) {
+		new_path = (char *)malloc(strlen(current->name) + strlen(path) + 4);
+		if (!new_path) {
+			free(path);
+			return NULL;
+		}
+
+		if (path[0] == '\0')
+			snprintf(new_path, strlen(current->name) + 1, "%s", current->name);
+		else
+			snprintf(new_path, strlen(current->name) + strlen(path) + 4, "%s > %s",
+				 current->name, path);
+
+		free(path);
+		path = new_path;
+		current = current->parent;
+	}
+
+	return path;
+}
+
+void count_nodes(struct node *node, int *count)
+{
+	int i;
+
+	if (!node)
+		return;
+
+	(*count)++;
+
+	for (i = 0; i < node->children_size; i++)
+		count_nodes(&node->children[i], count);
+}
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
new file mode 100644
index 000000000..0d88ddbdc
--- /dev/null
+++ b/tools/displaytop/src/populate.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "data.h"
+#include "populate.h"
+
+void populate_data(void)
+{
+	root = create_node("Display Top", display_summary, NULL);
+	initialize_display_config();
+}
diff --git a/tools/displaytop/src/populate_display_config.c b/tools/displaytop/src/populate_display_config.c
new file mode 100644
index 000000000..854e0dcd4
--- /dev/null
+++ b/tools/displaytop/src/populate_display_config.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "populate.h"
+#include "igt_core.h"
+
+int create_crtc_nodes(drmModeRes *resources, struct node *parent_node, int filter);
+static int create_connector_nodes(drmModeRes *resources, struct node *parent_node, int filter);
+static int create_encoder_nodes(drmModeRes *resources, struct node *parent_node, int filter);
+static int create_framebuffer_nodes(drmModeRes *resources, struct node *parent_node, int filter);
+static int create_plane_nodes(struct node *parent_node, int filter);
+
+int create_crtc_nodes(drmModeRes *resources, struct node *parent_node, int filter)
+{
+	int crtc_count;
+	int i;
+	char crtc_name[10];
+	struct node *crtc_node;
+	drmModeCrtc *crtc;
+
+	crtc_count = resources->count_crtcs;
+	igt_info("Creating CRTC nodes\n");
+
+	for (i = 0; i < crtc_count; ++i) {
+		if (filter != -1 && i != filter)
+			continue;
+
+		snprintf(crtc_name, sizeof(crtc_name), "CRTC%d", i % 100);
+		crtc_node = create_node(crtc_name, display_crtc, parent_node);
+
+		crtc = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
+		igt_assert_f(crtc, "Failed to get a CRTC %d\n", i % 100);
+
+		create_plane_nodes(crtc_node, i);
+		create_encoder_nodes(resources, crtc_node, i);
+		create_connector_nodes(resources, crtc_node, i);
+
+		add_child(parent_node, crtc_node);
+
+		drmModeFreeCrtc(crtc);
+	}
+
+	return crtc_count;
+}
+
+int create_connector_nodes(drmModeRes *resources, struct node *parent_node, int filter)
+{
+	int connector_count;
+	int i;
+	char connector_name[15];
+	struct node *connector_node;
+
+	connector_count = resources->count_connectors;
+	igt_info("Creating Connector nodes\n");
+
+	for (i = 0; i < connector_count; ++i) {
+		if (filter != -1 && i != filter)
+			continue;
+
+		snprintf(connector_name, sizeof(connector_name), "Connector%d", i % 100);
+		connector_node = create_node(connector_name, display_connector, parent_node);
+		add_child(parent_node, connector_node);
+	}
+
+	return connector_count;
+}
+
+int create_encoder_nodes(drmModeRes *resources, struct node *parent_node, int filter)
+{
+	int encoder_count;
+	int i;
+	char encoder_name[15];
+	struct node *encoder_node;
+
+	encoder_count = resources->count_encoders;
+	igt_info("Creating Encoder nodes\n");
+
+	for (i = 0; i < encoder_count; ++i) {
+		if (filter != -1 && i != filter)
+			continue;
+
+		snprintf(encoder_name, sizeof(encoder_name), "Encoder%d", i % 100);
+		encoder_node = create_node(encoder_name, display_encoder, parent_node);
+		add_child(parent_node, encoder_node);
+	}
+
+	return encoder_count;
+}
+
+int create_framebuffer_nodes(drmModeRes *resources, struct node *parent_node, int filter)
+{
+	int framebuffer_count;
+	int i;
+	char framebuffer_name[15];
+	struct node *framebuffer_node;
+
+	framebuffer_count = resources->count_fbs;
+	igt_info("Creating Framebuffer nodes for %d framebuffers\n", framebuffer_count);
+
+	for (i = 0; i < framebuffer_count; ++i) {
+		if (filter != -1 && i != filter)
+			continue;
+
+		snprintf(framebuffer_name, sizeof(framebuffer_name), "Framebuffer%d", i % 100);
+		framebuffer_node = create_node(framebuffer_name, display_framebuffer, parent_node);
+		add_child(parent_node, framebuffer_node);
+	}
+
+	return framebuffer_count;
+}
+
+int create_plane_nodes(struct node *parent_node, int filter)
+{
+	drmModePlaneRes *plane_resources;
+	int plane_count;
+	int i;
+	drmModePlane *plane;
+	char plane_name[10];
+	char in_formats_name[15];
+	char out_formats_name[15];
+	struct node *plane_node;
+	struct node *in_formats_node;
+	struct node *out_formats_node;
+
+	plane_resources = drmModeGetPlaneResources(drm_fd);
+	igt_require_f(plane_resources, "Failed to get DRM plane resources\n");
+
+	plane_count = plane_resources->count_planes;
+	igt_info("Creating Plane nodes\n");
+
+	for (i = 0; i < plane_count; ++i) {
+		plane = drmModeGetPlane(drm_fd, plane_resources->planes[i]);
+		igt_assert_f(plane, "Failed to get plane %d\n", i % 100);
+
+		if (filter != -1 && !(plane->possible_crtcs & (1 << filter))) {
+			drmModeFreePlane(plane);
+			continue;
+		}
+
+		snprintf(plane_name, sizeof(plane_name), "Plane%d", i % 100);
+		plane_node = create_node(plane_name, display_plane, parent_node);
+
+		snprintf(in_formats_name, sizeof(in_formats_name), "IN_FORMATS%d", i % 100);
+		in_formats_node = create_node(in_formats_name, display_informats, plane_node);
+		add_child(plane_node, in_formats_node);
+
+		snprintf(out_formats_name, sizeof(out_formats_name), "FORMATS%d", i % 100);
+		out_formats_node = create_node(out_formats_name, display_formats, plane_node);
+		add_child(plane_node, out_formats_node);
+
+		add_child(parent_node, plane_node);
+		drmModeFreePlane(plane);
+	}
+
+	drmModeFreePlaneResources(plane_resources);
+	return plane_count;
+}
+
+void initialize_display_config(void)
+{
+	struct node *display_config;
+	struct node *crtc_nodes;
+	struct node *plane_nodes;
+	struct node *connector_nodes;
+	struct node *encoder_nodes;
+	struct node *framebuffer_nodes;
+	drmModeRes *resources;
+
+	igt_info("Initializing Display Configuration\n");
+
+	display_config = create_node("Display Configuration", NULL, root);
+	igt_assert_f(display_config, "Failed to create Display Configuration node\n");
+
+	igt_require_f(drm_fd >= 0, "Failed to open primary DRM device\n");
+
+	resources = drmModeGetResources(drm_fd);
+	igt_require_f(resources, "Failed to get resources\n");
+
+	/* Create CRTC nodes */
+	crtc_nodes = create_node("CRTCs", NULL, display_config);
+	igt_assert_f(crtc_nodes, "Failed to create CRTC nodes\n");
+	create_crtc_nodes(resources, crtc_nodes, -1);
+	add_child(display_config, crtc_nodes);
+
+	/* Create Plane nodes */
+	plane_nodes = create_node("Planes", NULL, display_config);
+	igt_assert_f(plane_nodes, "Failed to create Plane nodes\n");
+	create_plane_nodes(plane_nodes, -1);
+	add_child(display_config, plane_nodes);
+
+	/* Create Connector nodes */
+	connector_nodes = create_node("Connectors", NULL, display_config);
+	igt_assert_f(connector_nodes, "Failed to create Connector nodes\n");
+	create_connector_nodes(resources, connector_nodes, -1);
+	add_child(display_config, connector_nodes);
+
+	/* Create Encoder nodes */
+	encoder_nodes = create_node("Encoders", NULL, display_config);
+	igt_assert_f(encoder_nodes, "Failed to create Encoder nodes\n");
+	create_encoder_nodes(resources, encoder_nodes, -1);
+	add_child(display_config, encoder_nodes);
+
+	/* Initialize Framebuffers */
+	framebuffer_nodes = create_node("Framebuffers", NULL, display_config);
+	igt_assert_f(framebuffer_nodes, "Failed to create Framebuffer nodes\n");
+	create_framebuffer_nodes(resources, framebuffer_nodes, -1);
+	add_child(display_config, framebuffer_nodes);
+
+	add_child(root, display_config);
+	drmModeFreeResources(resources);
+}
diff --git a/tools/displaytop/src/utils.c b/tools/displaytop/src/utils.c
new file mode 100644
index 000000000..8893ae4b9
--- /dev/null
+++ b/tools/displaytop/src/utils.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+#include "igt_core.h"
+
+char *read_file(const char *filename)
+{
+	FILE *file;
+	long length;
+	char *data;
+
+	file = fopen(filename, "rb");
+	igt_assert_f(file, "Failed to open file: %s\n", filename);
+
+	fseek(file, 0, SEEK_END);
+	length = ftell(file);
+	fseek(file, 0, SEEK_SET);
+
+	data = (char *)malloc(length + 1);
+	if (data) {
+		fread(data, 1, length, file);
+		data[length] = '\0';
+	}
+
+	fclose(file);
+	return data;
+}
+
+void strip_whitespace(char *str)
+{
+	char *start;
+	char *end;
+
+	start = str;
+
+	while (isspace((unsigned char)*start))
+		start++;
+
+	if (*start == 0) {
+		*str = 0;
+		return;
+	}
+
+	end = start + strlen(start) - 1;
+	while (end > start && isspace((unsigned char)*end))
+		end--;
+
+	*(end + 1) = 0;
+
+	if (start != str)
+		memmove(str, start, end - start + 2);
+}
+
+void ensure_dump_directory(void)
+{
+	struct stat st;
+	int stat_result;
+	int mkdir_result;
+
+	stat_result = stat(DUMP_DIR, &st);
+	if (stat_result == 0 && S_ISDIR(st.st_mode)) {
+		igt_info("Directory %s already exists.\n", DUMP_DIR);
+		return;
+	}
+
+	mkdir_result = mkdir(DUMP_DIR, 0755);
+	if (mkdir_result == 0)
+		igt_info("Directory %s created successfully.\n", DUMP_DIR);
+	else
+		igt_info("mkdir failed: %s\n", strerror(errno));
+}
diff --git a/tools/displaytop/src/utils_cli.c b/tools/displaytop/src/utils_cli.c
new file mode 100644
index 000000000..86410b8c9
--- /dev/null
+++ b/tools/displaytop/src/utils_cli.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+
+static void print_help(void)
+{
+	printf("Usage: sudo ./displaytop\n");
+
+	printf("for help: ./displaytop [OPTIONS]\n\n");
+	printf("Options:\n");
+	printf("  --help      Show this help message and exit\n");
+	printf("  --version   Show version information\n");
+	printf("for more help read the documentation at the /docs folder.\n");
+
+	printf("ALL YOU NEED TO DO IS RUN THE TOOL WITH SUDO PERMISSION.\n");
+
+	printf("> Note:\n");
+	printf("> - Running DisplayTop without `sudo` may result in some menu options not being visible.\n");
+	printf("> - If the respective JSON files for MMIO and DPCD registers are not present, the corresponding menus will not be available.\n");
+	printf("> - The Ftrace menu will not be able to provide register name information without the aforementioned JSON files.\n");
+}
+
+static void print_version(void)
+{
+	printf("DisplayTop v1.0.0\n");
+}
+
+void handle_cli_args(int argc, char *argv[])
+{
+	if (argc > 1) {
+		if (strcmp(argv[1], "--help") == 0) {
+			print_help();
+			exit(0);
+		} else if (strcmp(argv[1], "--version") == 0) {
+			print_version();
+			exit(0);
+		} else {
+			printf("Unknown option: %s\n", argv[1]);
+			printf("Use --help for usage information.\n");
+			exit(1);
+		}
+	}
+}
diff --git a/tools/displaytop/src/utils_display.c b/tools/displaytop/src/utils_display.c
new file mode 100644
index 000000000..0ca833edc
--- /dev/null
+++ b/tools/displaytop/src/utils_display.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+
+void draw_header(WINDOW *win, int win_width, const char *title, const char *helper)
+{
+	werase(win);
+	box(win, 0, 0);
+
+	wattron(win, A_BOLD);
+	mvwprintw(win, 1, 2, "%s", title);
+	mvwprintw(win, 1, win_width - strlen(helper) - 2, "%s", helper);
+	wattroff(win, A_BOLD);
+
+	mvwhline(win, 2, 1, ACS_HLINE, win_width - 2);
+	wrefresh(win);
+}
+
+void render_progress_bar(WINDOW *win, int current, int total)
+{
+	float progress;
+	int bar_start_y, bar_start_x, bar_width, filled, percent, i;
+
+	if (total == 0)
+		return;
+
+	progress = (float)current / total;
+	if (progress > 1.0f)
+		progress = 1.0f;
+
+	bar_start_y = 10;
+	bar_start_x = 2;
+	bar_width = getmaxx(win) - 14;
+	if (bar_width < 1)
+		return;
+
+	filled = (int)(progress * bar_width + 0.5f);
+
+	wattron(win, A_BOLD);
+	mvwprintw(win, bar_start_y, bar_start_x, "[");
+	wattroff(win, A_BOLD);
+
+	for (i = 0; i < bar_width; ++i) {
+		if (i < filled) {
+			wattron(win, COLOR_PAIR(7));
+			waddch(win, ' ');
+			wattroff(win, COLOR_PAIR(7));
+		} else {
+			wattron(win, COLOR_PAIR(2));
+			waddch(win, ' ');
+			wattroff(win, COLOR_PAIR(2));
+		}
+	}
+
+	wattron(win, A_BOLD);
+	waddch(win, ']');
+	percent = (int)(progress * 100.0f + 0.5f);
+	mvwprintw(win, bar_start_y, bar_start_x + bar_width + 2, "%3d%%", percent);
+	wattroff(win, A_BOLD);
+
+	wrefresh(win);
+}
+
+void print_bold_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+	va_list args;
+
+	va_start(args, text);
+
+	wattron(win, A_BOLD);
+	wmove(win, line, col);
+	vw_printw(win, text, args);
+	wattroff(win, A_BOLD);
+
+	va_end(args);
+}
+
+void print_dim_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+	va_list args;
+
+	va_start(args, text);
+
+	wattron(win, A_DIM);
+	wmove(win, line, col);
+	vw_printw(win, text, args);
+	wattroff(win, A_DIM);
+
+	va_end(args);
+}
+
+void print_red_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+	va_list args;
+
+	va_start(args, text);
+
+	wattron(win, COLOR_PAIR(3));
+	wmove(win, line, col);
+	vw_printw(win, text, args);
+	wattroff(win, COLOR_PAIR(3));
+
+	va_end(args);
+}
+
+void print_green_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+	va_list args;
+
+	va_start(args, text);
+
+	wattron(win, COLOR_PAIR(2));
+	wmove(win, line, col);
+	vw_printw(win, text, args);
+	wattroff(win, COLOR_PAIR(2));
+
+	va_end(args);
+}
+
+void set_string(char *dest, const char *src, size_t size)
+{
+	snprintf(dest, size, "%s", src);
+	dest[size - 1] = '\0';
+}
+
+int check_size_change(WINDOW *win, int *height, int *width)
+{
+	int new_height, new_width;
+
+	getmaxyx(win, new_height, new_width);
+	move(1, 25);
+	if (new_height != *height || new_width != *width) {
+		*height = new_height;
+		*width = new_width;
+		return 1;
+	}
+	return 0;
+}
+
+void print_wrapped_text(WINDOW *pad, int *line, int start, int size,
+			const char *text, bool enclose_with_pipe)
+{
+	const char *ptr;
+	int len, adjust_len;
+
+	if (!text || !pad || !line || size <= 0)
+		return;
+
+	ptr = text;
+
+	while (*ptr) {
+		len = ((int)strlen(ptr) > size) ? size - 1 : (int)strlen(ptr);
+
+		/* To ensure truncation doesn't break any words */
+		if (len < (int)strlen(ptr) && ptr[len] != ' ' && ptr[len - 1] != ' ') {
+			adjust_len = len;
+			while (adjust_len > 0 && ptr[adjust_len] != ' ')
+				adjust_len--;
+
+			if (adjust_len > 0)
+				len = adjust_len;
+		}
+
+		if (enclose_with_pipe)
+			mvwprintw(pad, (*line)++, start, "| %-*.*s |", size, len, ptr);
+		else
+			mvwprintw(pad, (*line)++, start, "%-*.*s", size, len, ptr);
+
+		ptr += len;
+		while (*ptr == ' ')
+			ptr++;
+	}
+}
diff --git a/tools/displaytop/src/utils_driver.c b/tools/displaytop/src/utils_driver.c
new file mode 100644
index 000000000..382bfc121
--- /dev/null
+++ b/tools/displaytop/src/utils_driver.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+#include "igt_core.h"
+#include "igt_kmod.h"
+#include "drmtest.h"
+
+static void show_driver_menu(void)
+{
+	int key;
+	int rows, cols;
+	WINDOW *win;
+	static const char * const options[] = {"Load i915", "Load xe", "Exit"};
+	int total_options = ARRAY_SIZE(options);
+	int highlighted_index = 0;
+	int i;
+	int x_pos;
+	const char *driver;
+
+	getmaxyx(stdscr, rows, cols);
+
+	win = newwin(rows, cols, 0, 0);
+	if (!win) {
+		igt_warn("Failed to create driver loading window\n");
+		return;
+	}
+
+	if (!has_colors() || !COLOR_PAIR(2)) {
+		igt_warn("Colors not initialized properly\n");
+		delwin(win);
+		return;
+	}
+
+	cbreak();
+	keypad(win, TRUE);
+	refresh();
+
+	wbkgd(win, COLOR_PAIR(2));
+	box(win, 0, 0);
+
+	while (1) {
+		werase(win);
+		box(win, 0, 0);
+		mvwprintw(win, 2, (cols - 30) / 2, "Display Top - Select a Driver to Load");
+
+		for (i = 0; i < total_options; i++) {
+			x_pos = (cols - strlen(options[i])) / 2;
+			if (x_pos < 0)
+				x_pos = 0;
+
+			if (i == highlighted_index)
+				wattron(win, A_REVERSE);
+
+			mvwprintw(win, rows / 2 + i, x_pos, "%s", options[i]);
+			wattroff(win, A_REVERSE);
+		}
+
+		mvwprintw(win, rows - 2, 2, "[UP/DOWN] Navigate [ENTER] Select [ESC] Exit");
+		wrefresh(win);
+
+		key = wgetch(win);
+
+		switch (key) {
+		case KEY_UP:
+			highlighted_index = (highlighted_index == 0) ? total_options - 1 :
+						highlighted_index - 1;
+			break;
+		case KEY_DOWN:
+			highlighted_index = (highlighted_index == total_options - 1) ? 0 :
+						highlighted_index + 1;
+			break;
+		case '\n':
+			if (highlighted_index == 0 || highlighted_index == 1) {
+				int ret;
+
+				driver = (highlighted_index == 0) ? "i915" : "xe";
+				werase(win);
+				box(win, 0, 0);
+				mvwprintw(win, rows / 2, (cols - 30) / 2, "Loading driver: %s...",
+					  driver);
+				wrefresh(win);
+
+				ret = igt_intel_driver_load(NULL, driver);
+
+				werase(win);
+				box(win, 0, 0);
+				if (ret == 0) {
+					mvwprintw(win, rows / 2, (cols - 30) / 2,
+						  "Driver %s loaded successfully.", driver);
+				} else {
+					mvwprintw(win, rows / 2, (cols - 30) / 2,
+						  "Failed to load driver %s.", driver);
+				}
+				mvwprintw(win, rows - 2, 2, "Press any key to continue...");
+				wrefresh(win);
+				wgetch(win);
+			}
+			delwin(win);
+			return;
+		case 27:
+			delwin(win);
+			return;
+		default:
+			break;
+		}
+	}
+}
+
+void check_and_load_driver(void)
+{
+	if (igt_kmod_is_loaded("i915"))
+		igt_info("i915 driver is already loaded.");
+	else if (igt_kmod_is_loaded("xe"))
+		igt_info("xe driver is already loaded.");
+	else
+		show_driver_menu();
+}
diff --git a/tools/displaytop/src/utils_drm.c b/tools/displaytop/src/utils_drm.c
new file mode 100644
index 000000000..0a1c5adbe
--- /dev/null
+++ b/tools/displaytop/src/utils_drm.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "igt_fb.h"
+
+int drm_fd = -1;
+#define MODE_INFO_STRING_LEN 128
+
+/**
+ * @brief Finds a DRM (Direct Rendering Manager) device path based on the specified type.
+ *
+ * This function searches the /dev/dri directory for a DRM device file that matches
+ * the specified type (primary or render). It returns the full path to the first matching
+ * device file found.
+ *
+ * @param primary A boolean indicating the type of DRM device to search for:
+ *                - true: Search for a primary DRM device (prefix "card*").
+ *                - false: Search for a render DRM device (prefix "renderD*").
+ *
+ * @return A dynamically allocated string containing the full path to the DRM device,
+ *         or NULL if no matching device is found or an error occurs. The caller is
+ *         responsible for freeing the returned string.
+ *
+ * @note Logs an error message if the /dev/dri directory cannot be opened, memory
+ *       allocation fails, or no matching device is found.
+ */
+char *find_drm_device(bool primary)
+{
+	DIR *drm_dir;
+	const char *prefix;
+	char *device_path;
+	struct dirent *entry;
+
+	drm_dir = opendir(DRM_DIR);
+	igt_assert_f(drm_dir, "Failed to open /dev/dri directory\n");
+
+	prefix = primary ? DRM_PRIMARY_PREFIX : DRM_RENDER_PREFIX;
+	device_path = NULL;
+
+	while ((entry = readdir(drm_dir)) != NULL) {
+		if (strncmp(entry->d_name, prefix, strlen(prefix)) == 0) {
+			size_t path_len = strlen(DRM_DIR) + strlen(entry->d_name) + 1;
+
+			device_path = malloc(path_len);
+			igt_require_f(device_path, "Failed to allocate memory for device path\n");
+			snprintf(device_path, path_len, "%s%s", DRM_DIR, entry->d_name);
+			break;
+		}
+	}
+
+	closedir(drm_dir);
+
+	igt_require_f(device_path, "No DRM %s devices found in %s\n",
+		      primary ? "primary (card*)" : "render (renderD*)", DRM_DIR);
+
+	return device_path;
+}
+
+/**
+ * @brief Opens the primary DRM (Direct Rendering Manager) device and configures it.
+ *
+ * This function locates and opens the primary DRM device, ensuring it is accessible
+ * for rendering operations. It also attempts to drop DRM master privileges if held
+ * and sets the client capability for universal planes.
+ *
+ * @note The function logs messages at different levels (error, warning, info) to
+ *       indicate the success or failure of various operations.
+ *
+ * Steps performed:
+ * 1. Finds the DRM device path using `find_drm_device`.
+ * 2. Opens the DRM device with read/write permissions and the close-on-exec flag.
+ * 3. Logs an error if the device cannot be opened.
+ * 4. Attempts to drop DRM master privileges using `drmDropMaster` and logs the result.
+ * 5. Sets the client capability for universal planes using `drmSetClientCap`.
+ *
+ * @warning Ensure that the `find_drm_device` function is implemented correctly for
+ * this function to work as expected.
+ *
+ * @see drmDropMaster, drmSetClientCap
+ */
+void open_primary_drm_device(void)
+{
+	char *device_path = find_drm_device(true);
+
+	drm_fd = open(device_path, O_RDWR | O_CLOEXEC);
+
+	igt_require_f(drm_fd >= 0, "Failed to open DRM device\n");
+
+	if (drmDropMaster(drm_fd) < 0)
+		igt_warn("Master already being held by something else!\n");
+	else
+		igt_info("Dropped DRM master successfully\n");
+
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+}
+
+/**
+ * @brief Closes the primary DRM (Direct Rendering Manager) device.
+ *
+ * This function checks if the DRM device file descriptor (`drm_fd`) is valid
+ * (greater than or equal to 0). If valid, it closes the file descriptor,
+ * resets it to -1, and logs a message indicating that the DRM device has been
+ * successfully closed.
+ *
+ * @note Ensure that `drm_fd` is properly initialized before calling this
+ * function. Closing an already closed or invalid file descriptor may lead to
+ * undefined behavior.
+ */
+void close_primary_drm_device(void)
+{
+	if (drm_fd >= 0) {
+		close(drm_fd);
+		drm_fd = -1;
+		igt_info("Closed DRM device\n");
+	}
+}
+
+const char *get_drm_object_type_name(uint32_t object_type)
+{
+	switch (object_type) {
+	case DRM_MODE_OBJECT_CRTC:
+		return "CRTC";
+	case DRM_MODE_OBJECT_CONNECTOR:
+		return "Connector";
+	case DRM_MODE_OBJECT_ENCODER:
+		return "Encoder";
+	case DRM_MODE_OBJECT_PLANE:
+		return "Plane";
+	case DRM_MODE_OBJECT_PROPERTY:
+		return "Property";
+	case DRM_MODE_OBJECT_FB:
+		return "Framebuffer";
+	default:
+		return "Unknown";
+	}
+}
+
+const char *get_connector_type_name(uint32_t connector_type)
+{
+	return kmstest_connector_type_str(connector_type);
+}
+
+const char *get_encoder_type_name(uint32_t encoder_type)
+{
+	return kmstest_encoder_type_str(encoder_type);
+}
+
+const char *get_format_str(uint32_t format)
+{
+	return igt_format_str(format);
+}
+
+const char *get_basic_modifier_str(uint64_t modifier)
+{
+	switch (modifier) {
+	case I915_FORMAT_MOD_X_TILED:
+		return "I915_FORMAT_MOD_X_TILED";
+	case I915_FORMAT_MOD_Y_TILED:
+		return "I915_FORMAT_MOD_Y_TILED";
+	case I915_FORMAT_MOD_Yf_TILED:
+		return "I915_FORMAT_MOD_Yf_TILED";
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+		return "I915_FORMAT_MOD_Y_TILED_CCS";
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
+		return "I915_FORMAT_MOD_Yf_TILED_CCS";
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+		return "I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS";
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+		return "I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS";
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+		return "I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC";
+	case I915_FORMAT_MOD_4_TILED:
+		return "I915_FORMAT_MOD_4_TILED";
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+		return "I915_FORMAT_MOD_4_TILED_DG2_RC_CCS";
+	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
+		return "I915_FORMAT_MOD_4_TILED_DG2_MC_CCS";
+	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+		return "I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC";
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
+		return "I915_FORMAT_MOD_4_TILED_MTL_RC_CCS";
+	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
+		return "I915_FORMAT_MOD_4_TILED_MTL_MC_CCS";
+	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+		return "I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC";
+	case DRM_FORMAT_MOD_INVALID:
+		return "DRM_FORMAT_MOD_INVALID";
+	case DRM_FORMAT_MOD_LINEAR:
+		return "DRM_FORMAT_MOD_LINEAR";
+	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
+		return "DRM_FORMAT_MOD_SAMSUNG_64_32_TILE";
+	case DRM_FORMAT_MOD_SAMSUNG_16_16_TILE:
+		return "DRM_FORMAT_MOD_SAMSUNG_16_16_TILE";
+	case DRM_FORMAT_MOD_QCOM_COMPRESSED:
+		return "DRM_FORMAT_MOD_QCOM_COMPRESSED";
+	case DRM_FORMAT_MOD_QCOM_TILED3:
+		return "DRM_FORMAT_MOD_QCOM_TILED3";
+	case DRM_FORMAT_MOD_QCOM_TILED2:
+		return "DRM_FORMAT_MOD_QCOM_TILED2";
+	case DRM_FORMAT_MOD_VIVANTE_TILED:
+		return "DRM_FORMAT_MOD_VIVANTE_TILED";
+	case DRM_FORMAT_MOD_VIVANTE_SUPER_TILED:
+		return "DRM_FORMAT_MOD_VIVANTE_SUPER_TILED";
+	case DRM_FORMAT_MOD_VIVANTE_SPLIT_TILED:
+		return "DRM_FORMAT_MOD_VIVANTE_SPLIT_TILED";
+	case DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED:
+		return "DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED";
+	case DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED:
+		return "DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_ONE_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_ONE_GOB";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_TWO_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_TWO_GOB";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_FOUR_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_FOUR_GOB";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_EIGHT_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_EIGHT_GOB";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_SIXTEEN_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_SIXTEEN_GOB";
+	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_THIRTYTWO_GOB:
+		return "DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK_THIRTYTWO_GOB";
+	case DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED:
+		return "DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED";
+	case DRM_FORMAT_MOD_BROADCOM_SAND32:
+		return "DRM_FORMAT_MOD_BROADCOM_SAND32";
+	case DRM_FORMAT_MOD_BROADCOM_SAND64:
+		return "DRM_FORMAT_MOD_BROADCOM_SAND64";
+	case DRM_FORMAT_MOD_BROADCOM_SAND128:
+		return "DRM_FORMAT_MOD_BROADCOM_SAND128";
+	case DRM_FORMAT_MOD_BROADCOM_SAND256:
+		return "DRM_FORMAT_MOD_BROADCOM_SAND256";
+	case DRM_FORMAT_MOD_BROADCOM_UIF:
+		return "DRM_FORMAT_MOD_BROADCOM_UIF";
+	case DRM_FORMAT_MOD_ALLWINNER_TILED:
+		return "DRM_FORMAT_MOD_ALLWINNER_TILED";
+	default:
+		return "unknown";
+	}
+}
diff --git a/tools/displaytop/src/utils_search.c b/tools/displaytop/src/utils_search.c
new file mode 100644
index 000000000..fdeca12e5
--- /dev/null
+++ b/tools/displaytop/src/utils_search.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "node.h"
+#include "utils.h"
+
+void search_nodes(struct node *node, const char *search_input, struct node *results)
+{
+	if (!node)
+		return;
+
+	if (strstr(node->name, search_input)) {
+		add_child(results, node);
+		return;
+	}
+
+	for (int i = 0; i < node->children_size; i++)
+		search_nodes(&node->children[i], search_input, results);
+}
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..78706febf 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -123,3 +123,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('displaytop')
-- 
2.34.1

