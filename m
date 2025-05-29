Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CDBC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A031810E739;
	Thu, 29 May 2025 14:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYa3KkOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338C510E734
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528742; x=1780064742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EpKLV6ZtPAiEEokAcsGmZ/SpkDBEl/h6U86BO7pJr8s=;
 b=kYa3KkOt32tXX3rNzQZemdxKXVXDTxzzCjG4m76oRKdq0pjiAOxc8H+H
 mm/u4+zvgevdpjRa3XKxuQVlyo4GvIv3XN4yPFqikW/RvBWq0aGEfogHQ
 Bq06E9fH/E9v8QP3OqV3yMEiCzNY4N2iscLShcv75cB9DfFcqqE6nCYAS
 Hf8jOgTRV0keduFatWAZ+LqvR+L4UKgYu0k0hUGtjsPNQddv6CJutP6CO
 KGE76HKbbglKOZGylTTOWrjDzo790RbwVWtoRAJNEGqhf5xueUZjJU9B/
 MOdobedcSYgyfMxbN+wSGfN45e4cahlNjP3mZgbGx8SEFwF35Dsc0Hplz g==;
X-CSE-ConnectionGUID: gJyBKtilQouqP6XrVJ5zJA==
X-CSE-MsgGUID: cuyUEKhcTcCZJjGDeoZFrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50477204"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50477204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:25:42 -0700
X-CSE-ConnectionGUID: jyouyBaTTGm6n892kiaclg==
X-CSE-MsgGUID: VQaytiuiTFCpfeF9ZuH1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="166753085"
Received: from unknown (HELO adith-NUC7i7BNH.iind.intel.com) ([10.227.91.1])
 by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 07:25:37 -0700
From: Adith Narein T <adith.narein.t@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, adithnarein1305@gmail.com,
 uma.shankar@intel.com, kamil.konieczny@intel.com, arun.r.murthy@intel.com,
 jani.saarinen@intel.com, ville.syrjala@intel.com, karthik.b.s@intel.com,
 pranay.samala@intel.com, suresh.kumar.kurmi@intel.com,
 Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t 1/4] tools/displaytop: Add Display Top - a
 terminal-based display pipeline monitor
Date: Thu, 29 May 2025 19:53:40 +0530
Message-ID: <20250529142401.2474-2-adith.narein.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529142401.2474-1-adith.narein.t@intel.com>
References: <20250529142401.2474-1-adith.narein.t@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
---
 tools/displaytop/README.md                    |  77 ++
 tools/displaytop/include/data.h               |  37 +
 tools/displaytop/include/display.h            |  46 +
 tools/displaytop/include/log.h                |  45 +
 tools/displaytop/include/node.h               | 126 +++
 tools/displaytop/include/populate.h           |  37 +
 tools/displaytop/include/utils.h              | 115 +++
 tools/displaytop/meson.build                  | 100 ++
 tools/displaytop/src/data.c                   |  29 +
 tools/displaytop/src/display.c                | 480 ++++++++++
 tools/displaytop/src/display_configuration.c  | 877 ++++++++++++++++++
 tools/displaytop/src/display_dump.c           | 215 +++++
 tools/displaytop/src/display_search_bar.c     | 281 ++++++
 tools/displaytop/src/display_summary.c        | 308 ++++++
 tools/displaytop/src/log.c                    |  84 ++
 tools/displaytop/src/main.c                   |  63 ++
 tools/displaytop/src/node.c                   | 140 +++
 tools/displaytop/src/populate.c               |  32 +
 .../displaytop/src/populate_display_config.c  | 295 ++++++
 tools/displaytop/src/utils.c                  | 102 ++
 tools/displaytop/src/utils_cli.c              |  70 ++
 tools/displaytop/src/utils_display.c          | 195 ++++
 tools/displaytop/src/utils_driver.c           | 189 ++++
 tools/displaytop/src/utils_drm.c              | 585 ++++++++++++
 tools/displaytop/src/utils_search.c           |  49 +
 tools/meson.build                             |   1 +
 26 files changed, 4578 insertions(+)
 create mode 100644 tools/displaytop/README.md
 create mode 100644 tools/displaytop/include/data.h
 create mode 100644 tools/displaytop/include/display.h
 create mode 100644 tools/displaytop/include/log.h
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
 create mode 100644 tools/displaytop/src/log.c
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
index 000000000..7349f0760
--- /dev/null
+++ b/tools/displaytop/README.md
@@ -0,0 +1,77 @@
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
+## **Building as a Standalone Project**
+
+DisplayTop can also be built independently of the full IGT suite.
+
+### Steps:
+
+1. In the displaytop directory, open `meson.build` and **uncomment** the following block at the top:
+
+   ```meson
+   # This block must be UNCOMMENTED when building DisplayTop as a standalone project
+   project('displaytop', 'c',
+     version: '1.0',
+     default_options: ['warning_level=2', 'c_std=c11']
+   )
+   cc = meson.get_compiler('c')
+   ```
+
+2. Build the project:
+
+   ```bash
+   meson build
+   ninja -C build
+   ```
+
+3. Run the tool:
+
+   ```bash
+   sudo ./build/displaytop
+   ```
+
+> **Important:** If you're building DisplayTop **as part of IGT**, **comment out** the block above in `meson.build`.
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
\ No newline at end of file
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
new file mode 100644
index 000000000..0bc1b51d4
--- /dev/null
+++ b/tools/displaytop/include/data.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef DATA_H
+#define DATA_H
+
+#include "node.h"
+
+extern Node *root; /* shared throughout the program */
+
+#define DUMP_DIR "/tmp/displaytop_dump"
+
+#define DRM_DIR "/dev/dri/"
+#define DRM_PRIMARY_PREFIX "card"
+#define DRM_RENDER_PREFIX "renderD"
+
+#endif
\ No newline at end of file
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
new file mode 100644
index 000000000..db77ef785
--- /dev/null
+++ b/tools/displaytop/include/display.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef DISPLAY_H
+#define DISPLAY_H
+
+#include "log.h"
+#include "node.h"
+#include "utils.h"
+
+void display_win(WINDOW *win, Node *node);
+
+Node *display_search_bar(Node *head);
+void display_dump_menu(Node *head);
+
+void display_crtc(WINDOW *pad, Node *node, int *content_line);
+void display_plane(WINDOW *pad, Node *node, int *content_line);
+void display_encoder(WINDOW *pad, Node *node, int *content_line);
+void display_formats(WINDOW *pad, Node *node, int *content_line);
+void display_connector(WINDOW *pad, Node *node, int *content_line);
+void display_informats(WINDOW *pad, Node *node, int *content_line);
+void display_framebuffer(WINDOW *pad, Node *node, int *content_line);
+
+void display_summary(WINDOW *pad, Node *node, int *content_line);
+
+#endif
\ No newline at end of file
diff --git a/tools/displaytop/include/log.h b/tools/displaytop/include/log.h
new file mode 100644
index 000000000..bfc37e543
--- /dev/null
+++ b/tools/displaytop/include/log.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef LOG_H
+#define LOG_H
+
+#include <stdio.h>
+#include <stdarg.h>
+#include <time.h>
+
+#define LOG_FILE "/tmp/displaytop.log"
+
+typedef enum
+{
+    LOG_INFO,
+    LOG_WARNING,
+    LOG_ERROR
+} LogLevel;
+
+void init_log_system(void);
+void close_log_system(void);
+
+void log_message(int level, const char *format, ...) __attribute__((format(gnu_printf, 2, 3)));
+
+#endif
diff --git a/tools/displaytop/include/node.h b/tools/displaytop/include/node.h
new file mode 100644
index 000000000..e0ab2c5cd
--- /dev/null
+++ b/tools/displaytop/include/node.h
@@ -0,0 +1,126 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef NODE_H
+#define NODE_H
+
+#include <string.h>
+#include <stdlib.h>
+#include <ncurses.h>
+
+/**
+ * @struct Node
+ * @brief Represents a node in a tree structure.
+ *
+ * This structure is used to represent a node in a tree, where each node can have a name,
+ * a display function, a parent node, and an array of child nodes.
+ *
+ * @var Node::name
+ * A character array to store the name of the node. The name can be up to 49 characters long,
+ * with the 50th character reserved for the null terminator.
+ *
+ * @var Node::display_function
+ * A pointer to a function that takes a WINDOW pointer and a variable number of arguments,
+ * and returns an integer. This function is used to display the node.
+ *
+ * @var Node::parent
+ * A pointer to the parent node. If the node is the root, this will be NULL.
+ *
+ * @var Node::children
+ * A pointer to an array of child nodes. If the node has no children, this will be NULL.
+ *
+ * @var Node::children_size
+ * An integer representing the number of children the node has.
+ */
+typedef struct Node
+{
+    char name[50];
+    void (*display_function)(WINDOW *, struct Node *, int *);
+    struct Node *parent;
+    struct Node *children;
+    int children_size;
+} Node;
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
+Node *create_node(const char *name, void (*display_function)(WINDOW *, Node *, int *), Node *parent);
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
+void add_child(Node *parent, Node *child);
+
+/**
+ * @brief Frees the memory allocated for the tree recursively.
+ *
+ * This function recursively frees the memory allocated for the children of the given root node,
+ * then frees the memory allocated for the children array and the root node itself.
+ *
+ * @param root A pointer to the root node of the tree.
+ */
+void free_tree(Node *root);
+
+/**
+ * @brief Prints the path from the given node.
+ *
+ * This function takes a pointer to a Node structure and prints the path
+ * associated with that node. The exact format and details of the path
+ * are dependent on the implementation of the Node structure and the
+ * printPath function.
+ *
+ * @param node A pointer to the Node whose path is to be printed.
+ */
+void print_path(Node *node);
+
+/**
+ * @brief Gets the path from the given node.
+ *
+ * This function takes a pointer to a Node structure and returns the path
+ * associated with that node. The exact format and details of the path
+ * are dependent on the implementation of the Node structure and the
+ * getPath function.
+ *
+ * @param node A pointer to the Node whose path is to be returned.
+ * @return A string representing the path of the node.
+ */
+char *get_path(Node *node);
+
+void count_nodes(Node *node, int *count);
+
+
+#endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
new file mode 100644
index 000000000..5a5241355
--- /dev/null
+++ b/tools/displaytop/include/populate.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
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
\ No newline at end of file
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
new file mode 100644
index 000000000..eef5df5f3
--- /dev/null
+++ b/tools/displaytop/include/utils.h
@@ -0,0 +1,115 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
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
+#include "log.h"
+#include "node.h"
+#include "data.h"
+#include "display.h"
+
+extern int drm_fd;
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
+void single_file_dump(Node *node, const char *filePath, bool single);
+void search_nodes(Node *root, const char *searchInput, Node *results);
+
+void print_bold_text(WINDOW *win, int line, int col, const char *text, ...)
+    __attribute__((format(printf, 4, 5)));
+
+void print_dim_text(WINDOW *win, int line, int col, const char *text, ...)
+    __attribute__((format(printf, 4, 5)));
+
+void print_red_text(WINDOW *win, int line, int col, const char *text, ...)
+    __attribute__((format(printf, 4, 5)));
+
+void print_green_text(WINDOW *win, int line, int col, const char *text, ...)
+    __attribute__((format(printf, 4, 5)));
+
+void draw_header(WINDOW *win, int winWidth, const char *title, const char *helper);
+void render_progress_bar(WINDOW *win, int current, int total);
+
+void print_wrapped_text(WINDOW *pad, int *line, int start, int size, const char *text, bool enclose_with_pipe);
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
\ No newline at end of file
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
new file mode 100644
index 000000000..2d8c9d418
--- /dev/null
+++ b/tools/displaytop/meson.build
@@ -0,0 +1,100 @@
+# Meson build definition for DisplayTop tool
+
+# This block of code must be UNCOMMENTED when building displaytop as a standalone project
+# project('displaytop', 'c',
+#   version: '1.0',
+#   default_options: ['warning_level=2', 'c_std=c11']
+# )
+# cc = meson.get_compiler('c')
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
+  ]
+  # Source files
+  source = files(
+    'src/data.c',
+    'src/display.c',
+    'src/display_configuration.c',
+    'src/display_dump.c',
+    'src/display_search_bar.c',
+    'src/display_summary.c',
+    'src/log.c',
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
+  if meson.is_subproject()
+    # SUBPROJECT MODE
+    # This block is used when the project is included as a subproject
+    # inside a larger Meson-based project (via subproject('displaytop'))
+
+    # Define a static library
+    displaytop_lib = static_library(
+      'displaytop', source,
+      c_args: cflags,
+      include_directories: inc_dirs,
+      dependencies: deps,
+    )
+
+    # Declare the dependency so parent projects can link to this
+    displaytop_dep = declare_dependency(
+      link_with: displaytop_lib,
+      include_directories: inc_dirs,
+      dependencies: deps,
+    )
+
+  else
+    # STANDALONE MODE
+    # This block builds and installs the executable when run independently.
+    # If you’re including this as a subproject in another Meson build,
+    # COMMENT OUT the `project()` line at the top and this `else` block.
+
+    executable(
+      'displaytop', source,
+      install: true,
+      c_args: cflags,
+      include_directories: inc_dirs,
+      dependencies: deps,
+    )
+  endif
+
+else
+  message('Skipping displaytop: missing required optional dependencies.')
+endif
\ No newline at end of file
diff --git a/tools/displaytop/src/data.c b/tools/displaytop/src/data.c
new file mode 100644
index 000000000..3aed6292b
--- /dev/null
+++ b/tools/displaytop/src/data.c
@@ -0,0 +1,29 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "data.h"
+#include "display.h"
+
+/* This file holds all the global variables that are being used in the tool */
+
+Node *root;
\ No newline at end of file
diff --git a/tools/displaytop/src/display.c b/tools/displaytop/src/display.c
new file mode 100644
index 000000000..e826f6611
--- /dev/null
+++ b/tools/displaytop/src/display.c
@@ -0,0 +1,480 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+#include "data.h"
+#include "utils.h"
+
+static int display_exit_menu(void)
+{
+    int height = 8, width = 40;
+    int starty = (LINES - height) / 2;
+    int startx = (COLS - width) / 2;
+    int ch;
+    const char *message = "Are you sure you want to quit?";
+
+    WINDOW *overlay = newwin(LINES, COLS, 0, 0);
+    WINDOW *confirm_win = newwin(height, width, starty, startx);
+
+    wbkgd(overlay, COLOR_PAIR(0));
+    wclear(overlay);
+    wrefresh(overlay);
+
+    wbkgd(confirm_win, COLOR_PAIR(2));
+    box(confirm_win, 0, 0);
+
+    mvwprintw(confirm_win, 2, (width - strlen(message)) / 2, "%s", message);
+
+    wattron(confirm_win, A_REVERSE);
+    mvwprintw(confirm_win, 4, width / 2 - 5, "[Y]es");
+    mvwprintw(confirm_win, 4, width / 2 + 2, "[N]o");
+    wattroff(confirm_win, A_REVERSE);
+
+    wrefresh(confirm_win);
+
+    while ((ch = wgetch(confirm_win)))
+    {
+        if (ch == 'y' || ch == 'Y')
+        {
+            delwin(confirm_win);
+            delwin(overlay);
+            return 1;
+        }
+        else if (ch == 'n' || ch == 'N' || ch == 27)
+        {
+            delwin(confirm_win);
+            delwin(overlay);
+            return 0;
+        }
+    }
+
+    delwin(confirm_win);
+    delwin(overlay);
+    return 0;
+}
+
+static void display_help_menu(void)
+{
+    int row = 2;
+    const char *title = " Help ";
+    WINDOW *help_win = newwin(LINES, COLS, 0, 0);
+    wbkgd(help_win, COLOR_PAIR(6));
+    wclear(help_win);
+    box(help_win, 0, 0);
+
+    mvwprintw(help_win, 0, (COLS - strlen(title)) / 2, "%s", title);
+
+    print_bold_text(help_win, row++, 4, "Key Bindings:");
+    row++;
+    print_bold_text(help_win, row, 6, "[Q]");
+    mvwprintw(help_win, row++, 18, "- Quit the application with a confirmation prompt.");
+    print_bold_text(help_win, row, 6, "[H]");
+    mvwprintw(help_win, row++, 18, "- Open the help menu to view key bindings and descriptions.");
+    print_bold_text(help_win, row, 6, "[UP/DOWN]");
+    mvwprintw(help_win, row++, 18, "- Navigate through menu items or scroll content.");
+    print_bold_text(help_win, row, 6, "[TAB]");
+    mvwprintw(help_win, row++, 18, "- Toggle focus between the menu and display content.");
+    print_bold_text(help_win, row, 6, "[ENTER]");
+    mvwprintw(help_win, row++, 18, "- Select a menu item or confirm an action.");
+    print_bold_text(help_win, row, 6, "[ESC]");
+    mvwprintw(help_win, row++, 18, "- Go back, cancel an action, or exit the application.");
+    print_bold_text(help_win, row, 6, "[S]");
+    mvwprintw(help_win, row++, 18, "- Search for specific items in the menu.");
+    print_bold_text(help_win, row, 6, "[P]");
+    mvwprintw(help_win, row++, 18, "- Save the current page's content to a file.");
+    print_bold_text(help_win, row, 6, "[D]");
+    mvwprintw(help_win, row++, 18, "- Save all nested content starting from the current menu.");
+    print_bold_text(help_win, row, 6, "[R]");
+    mvwprintw(help_win, row++, 18, "- Refresh the display to show recent updates.");
+
+    row++;
+    mvwprintw(help_win, row++, 4, "Press any key to return...");
+
+    wrefresh(help_win);
+    wgetch(help_win);
+
+    delwin(help_win);
+}
+
+void display_win(WINDOW *win, Node *node)
+{
+    Node *head = node;
+
+    int is_running;
+    int highlighted_index = 0;
+
+    bool focus_on_menu = true;
+    bool refresh = true;
+
+    int win_height, win_width;
+
+    int content_height;
+    int content_y_start;
+
+    int mpx;
+    int menu_pad_pos;
+    int menu_pad_width;
+    int menu_pad_height;
+    WINDOW *menu_pad = NULL;
+
+    int dpx;
+    int display_pad_pos;
+    int display_pad_width;
+    int display_pad_height;
+    WINDOW *display_pad = NULL;
+
+    const char *path = get_path(head);
+    const char *status_text = "[TAB] Switch Focus [S] Search [ESC] Back [R] Refresh [H] Help";
+
+    int count;
+
+    int ch;
+
+    while (1)
+    {
+        wclear(win);
+        box(win, 0, 0);
+        wbkgd(win, COLOR_PAIR(2));
+        getmaxyx(win, win_height, win_width);
+
+        if (head->display_function == NULL && head->children_size == 0)
+        {
+            mvwprintw(win, 4, 2, "It's so Empty at %s :(", head->name);
+            mvwprintw(win, 8, 2, "Press 'e' to go back.");
+            wrefresh(win);
+        }
+
+        is_running = 1;
+
+        log_message(LOG_INFO, "Displaying %s", head->name);
+
+        while (is_running)
+        {
+            if (check_size_change(win, &win_height, &win_width) == 1 || refresh)
+            {
+                log_message(LOG_INFO, "Window size changed. Refreshing display.");
+                refresh = false;
+
+                content_height = win_height - 6;
+                content_y_start = 4;
+
+                mpx = 1;
+                menu_pad_pos = 0;
+                menu_pad_height = head->children_size > content_height ? head->children_size + 5 : content_height;
+                menu_pad_width = (int)((win_width - 3) * 0.3);
+
+                dpx = menu_pad_width + 2;
+                display_pad_pos = 0;
+                display_pad_height = 1000;
+                display_pad_width = win_width - 3 - menu_pad_width;
+
+                if (menu_pad != NULL)
+                {
+                    delwin(menu_pad);
+                    menu_pad = NULL;
+                }
+
+                menu_pad = newpad(menu_pad_height, menu_pad_width);
+                prefresh(menu_pad, menu_pad_pos, 0, content_y_start, 1, content_height + content_y_start - 1, menu_pad_width + 1);
+
+                if (head->display_function != NULL)
+                {
+                    if (display_pad != NULL)
+                    {
+                        delwin(display_pad);
+                        display_pad = NULL;
+                    }
+
+                    count = display_pad_height;
+                    display_pad = newpad(display_pad_height, display_pad_width);
+
+                    head->display_function(display_pad, head, &count);
+
+                    if (count == 0)
+                    {
+                        log_message(LOG_INFO, "Exiting %s", head->name);
+                        if (head != NULL && head->parent != NULL)
+                        {
+                            head = head->parent;
+                            focus_on_menu = true;
+                            highlighted_index = 0;
+                            display_pad_pos = 0;
+                            is_running = 0;
+                        }
+                        else
+                        {
+                            return;
+                        }
+                        continue;
+                    }
+
+                    if (count < display_pad_height)
+                        display_pad_height = count + 5;
+
+                    prefresh(display_pad, display_pad_pos, 0, content_y_start, dpx, content_height + content_y_start - 1, 2 + menu_pad_width + display_pad_width);
+                }
+
+                wclear(win);
+                box(win, 0, 0);
+
+                path = get_path(head);
+
+                draw_header(win, win_width, path, status_text);
+
+                mvwvline(win, 3, menu_pad_width + 1, ACS_VLINE, win_height - 4);
+                wrefresh(win);
+            }
+
+            if (head->display_function != NULL)
+            {
+                if (display_pad_pos > 0)
+                    print_bold_text(win, 3, menu_pad_width + 2, "...");
+                else
+                    mvwprintw(win, 3, menu_pad_width + 2, "   ");
+
+                if (display_pad_pos < display_pad_height - content_height)
+                    print_bold_text(win, content_height + content_y_start, menu_pad_width + 2, "...");
+                else
+                    mvwprintw(win, content_height + content_y_start, menu_pad_width + 2, "   ");
+
+                print_dim_text(win, 3, win_width - 15, "%d lines", display_pad_height);
+                prefresh(display_pad, display_pad_pos, 0, content_y_start, dpx, content_height + content_y_start - 1, 2 + menu_pad_width + display_pad_width);
+            }
+
+            if (focus_on_menu)
+            {
+                print_bold_text(win, 3, win_width - 5, "   ");
+                wattron(win, A_REVERSE);
+                print_bold_text(win, 3, menu_pad_width - 3, "***");
+                wattroff(win, A_REVERSE);
+            }
+            else
+            {
+                print_bold_text(win, 3, menu_pad_width - 3, "   ");
+                wattron(win, A_REVERSE);
+                print_bold_text(win, 3, win_width - 5, "***");
+                wattroff(win, A_REVERSE);
+            }
+
+            if (head->children_size > 0)
+            {
+                if (head->display_function == NULL)
+                    focus_on_menu = true;
+                print_dim_text(win, 3, menu_pad_width - 15, "%d Menus", head->children_size);
+                for (int i = 0; i < head->children_size; ++i)
+                {
+                    if (highlighted_index == i && focus_on_menu)
+                        wattron(menu_pad, A_REVERSE);
+                    mvwprintw(menu_pad, i, 1, "%d. %s", i + 1, head->children[i].name);
+                    wattroff(menu_pad, A_REVERSE);
+                }
+            }
+
+            if (highlighted_index == head->children_size && focus_on_menu)
+                wattron(menu_pad, A_REVERSE);
+
+            if (head->parent != NULL)
+                print_dim_text(menu_pad, head->children_size, 1, "Go Back");
+            else
+                print_dim_text(menu_pad, head->children_size, 1, "Exit");
+
+            wattroff(menu_pad, A_REVERSE);
+
+            prefresh(menu_pad, menu_pad_pos, 0, content_y_start, mpx, content_height + content_y_start - 1, menu_pad_width + 1);
+
+            ch = wgetch(win);
+            switch (ch)
+            {
+            case KEY_UP:
+                if (!focus_on_menu && display_pad_pos > 0)
+                    display_pad_pos--;
+
+                else if (focus_on_menu)
+                {
+                    if (highlighted_index == 0)
+                    {
+                        highlighted_index = head->children_size;
+                        menu_pad_pos = menu_pad_height - content_height;
+                    }
+                    else
+                    {
+                        highlighted_index--;
+
+                        if (highlighted_index > menu_pad_height - content_height)
+                        {
+                            menu_pad_pos = menu_pad_height - content_height;
+                        }
+                        else
+                        {
+                            menu_pad_pos--;
+                        }
+                    }
+                }
+                break;
+
+            case KEY_DOWN:
+                if (!focus_on_menu && display_pad_pos < display_pad_height - content_height)
+                    display_pad_pos++;
+
+                else if (focus_on_menu)
+                {
+                    if (highlighted_index == head->children_size)
+                    {
+                        highlighted_index = 0;
+                        menu_pad_pos = 0;
+                    }
+                    else
+                    {
+                        highlighted_index++;
+
+                        if (highlighted_index > menu_pad_height - content_height)
+                        {
+                            menu_pad_pos = menu_pad_height - content_height;
+                        }
+                        else
+                        {
+                            menu_pad_pos++;
+                        }
+                    }
+                }
+                break;
+
+            case 's':
+            case 'S':
+                log_message(LOG_INFO, "Searching %s", head->name);
+                head = display_search_bar(head);
+                refresh = true;
+                break;
+
+            case 'p':
+            case 'P':
+                single_file_dump(head, DUMP_DIR, true);
+                refresh = true;
+                break;
+
+            case 'd':
+            case 'D':
+                display_dump_menu(head);
+                refresh = true;
+                break;
+
+            case 'h':
+            case 'H':
+                display_help_menu();
+                refresh = true;
+                break;
+
+            case 'q':
+            case 'Q':
+                if (display_exit_menu())
+                {
+                    log_message(LOG_INFO, "Exiting DisplayTop");
+                    return;
+                }
+                else
+                {
+                    refresh = true;
+                }
+                break;
+
+            case 27:
+                log_message(LOG_INFO, "Exiting %s", head->name);
+                if (head != NULL && head->parent != NULL)
+                {
+                    head = head->parent;
+                    focus_on_menu = true;
+                    highlighted_index = 0;
+                    display_pad_pos = 0;
+                    is_running = 0;
+                }
+                else if (display_exit_menu())
+                {
+                    log_message(LOG_INFO, "Exiting DisplayTop");
+                    return;
+                }
+                else
+                {
+                    refresh = true;
+                }
+                break;
+
+            case 'r':
+            case 'R':
+                log_message(LOG_INFO, "Refreshing %s", head->name);
+                refresh = true;
+                break;
+
+            case '\n':
+                if (focus_on_menu && head != NULL)
+                {
+                    if (highlighted_index >= 0 && highlighted_index < head->children_size)
+                    {
+                        head = &head->children[highlighted_index];
+                        highlighted_index = 0;
+                        display_pad_pos = 0;
+                        is_running = 0;
+                        refresh = true;
+                    }
+                    else if (highlighted_index == head->children_size)
+                    {
+                        if (head != NULL && head->parent != NULL)
+                        {
+                            head = head->parent;
+                            focus_on_menu = true;
+                            highlighted_index = 0;
+                            display_pad_pos = 0;
+                            is_running = 0;
+                        }
+                        else if (display_exit_menu())
+                        {
+                            log_message(LOG_INFO, "Exiting DisplayTop");
+                            return;
+                        }
+                        else
+                        {
+                            refresh = true;
+                        }
+                    }
+                }
+                break;
+
+            case '\t':
+                focus_on_menu = !focus_on_menu;
+                break;
+            }
+        }
+
+        refresh = true;
+
+        if (display_pad != NULL)
+        {
+            delwin(display_pad);
+            display_pad = NULL;
+        }
+        if (menu_pad != NULL)
+        {
+            delwin(menu_pad);
+            menu_pad = NULL;
+        }
+    }
+}
diff --git a/tools/displaytop/src/display_configuration.c b/tools/displaytop/src/display_configuration.c
new file mode 100644
index 000000000..8f366d7df
--- /dev/null
+++ b/tools/displaytop/src/display_configuration.c
@@ -0,0 +1,877 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+#include "utils.h"
+
+void display_crtc(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModeRes *resources = NULL;
+    drmModeObjectProperties *props = NULL;
+    drmModePlaneRes *plane_resources = NULL;
+    drmModeCrtc *crtc = NULL;
+    int crtc_index = -1;
+    char *endptr;
+
+    if (drm_fd < 0)
+    {
+        print_red_text(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+    if (!resources)
+    {
+        print_red_text(pad, line++, 1, "Failed to get DRM resources\n");
+        goto err;
+    }
+
+    crtc_index = strtol(node->name + 4, &endptr, 10);
+    if (*endptr != '\0' || crtc_index < 0 || crtc_index >= resources->count_crtcs)
+    {
+        print_red_text(pad, line++, 1, "Invalid CRTC name: %s\n", node->name);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    crtc = drmModeGetCrtc(drm_fd, resources->crtcs[crtc_index]);
+    if (!crtc)
+    {
+        print_red_text(pad, line++, 1, "Failed to get CRTC %d\n", crtc_index);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "CRTC ID: %d", crtc->crtc_id);
+    mvwprintw(pad, line++, 1, "Framebuffer ID: %d", crtc->buffer_id);
+    mvwprintw(pad, line++, 1, "Position(X, Y): (%d, %d)", crtc->x, crtc->y);
+    mvwprintw(pad, line++, 1, "Mode: ");
+    if (crtc->mode_valid)
+        print_green_text(pad, -1, -1, "VALID");
+    else
+        print_red_text(pad, -1, -1, "INVALID");
+
+    if (crtc->mode_valid)
+    {
+        drmModeModeInfo *mode = &crtc->mode;
+        mvwprintw(pad, line++, 3, "Name: %s", mode->name);
+        mvwprintw(pad, line++, 3, "Resolution: %dx%d", mode->hdisplay, mode->vdisplay);
+        mvwprintw(pad, line++, 3, "Refresh Rate: %.2f Hz", mode->clock / (float)(mode->htotal * mode->vtotal));
+        mvwprintw(pad, line++, 3, "Type: 0x%x", mode->type);
+        mvwprintw(pad, line++, 3, "Flags: 0x%x", mode->flags);
+    }
+
+    mvwprintw(pad, line++, 1, "Gamma size: %u", crtc->gamma_size);
+
+    props = drmModeObjectGetProperties(drm_fd, crtc->crtc_id, DRM_MODE_OBJECT_CRTC);
+    if (!props)
+    {
+        print_red_text(pad, line++, 1, "Failed to get properties for CRTC %u\n", crtc->crtc_id);
+        drmModeFreeCrtc(crtc);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    plane_resources = drmModeGetPlaneResources(drm_fd);
+    if (!plane_resources)
+    {
+        print_red_text(pad, line++, 3, "Failed to get plane resources");
+        return;
+    }
+
+    line++;
+    mvwprintw(pad, line++, 1, "Possible Planes for CRTC %d:", crtc->crtc_id);
+    line++;
+
+    wattron(pad, A_DIM);
+    for (size_t i = 0; i < plane_resources->count_planes; i++)
+    {
+        drmModePlane *plane = drmModeGetPlane(drm_fd, plane_resources->planes[i]);
+        if (plane)
+        {
+            if (plane->possible_crtcs & (1 << crtc_index))
+            {
+                mvwprintw(pad, line++, 3, "Plane %ld: ID %d, %s",
+                          i, plane->plane_id, plane->crtc_id ? "Active" : "Inactive");
+            }
+            drmModeFreePlane(plane);
+        }
+        else
+        {
+            print_red_text(pad, line++, 3, "Plane %ld: Failed to get plane", i);
+        }
+    }
+    wattroff(pad, A_DIM);
+    drmModeFreePlaneResources(plane_resources);
+
+    line++;
+    mvwprintw(pad, line++, 1, "Properties for CRTC %u:", crtc->crtc_id);
+    line++;
+
+    wattron(pad, A_DIM);
+    for (uint32_t i = 0; i < props->count_props; i++)
+    {
+        drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+        if (prop)
+        {
+            uint64_t value = props->prop_values[i];
+            int remaining_width = getmaxx(pad) - getcurx(pad);
+            char value_str[256] = {0};
+
+            const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ? " immutable" : "";
+            const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ? " atomic" : " ";
+
+            if (prop->flags & DRM_MODE_PROP_BLOB)
+            {
+                snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_ENUM)
+            {
+                snprintf(value_str, sizeof(value_str), "enum (");
+                for (int j = 0; j < prop->count_enums; j++)
+                {
+                    if (j > 0)
+                    {
+                        snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ", ");
+                    }
+                    snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), "%s", prop->enums[j].name);
+                }
+                snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ") = %s", prop->enums[value].name);
+            }
+            else if (prop->flags & DRM_MODE_PROP_RANGE)
+            {
+                snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+                         prop->values[0], prop->values[1], value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_OBJECT)
+            {
+                snprintf(value_str, sizeof(value_str), "object %s = %lu",
+                         get_drm_object_type_name(prop->values[0]), value);
+            }
+            else
+            {
+                snprintf(value_str, sizeof(value_str), "%lu", value);
+            }
+
+            wattroff(pad, A_DIM);
+            mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+            wattron(pad, A_DIM);
+            wprintw(pad, "%s%s: ", immutability, atomicity);
+
+            if ((int)strlen(value_str) > remaining_width)
+            {
+                char truncated_value[remaining_width + 1];
+                strncpy(truncated_value, value_str, remaining_width);
+                truncated_value[remaining_width] = '\0';
+                wprintw(pad, "%s", truncated_value);
+                mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+            }
+            else
+            {
+                wprintw(pad, "%s", value_str);
+            }
+
+            drmModeFreeProperty(prop);
+        }
+    }
+    wattroff(pad, A_DIM);
+
+    drmModeFreeObjectProperties(props);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    drmModeFreeCrtc(crtc);
+    drmModeFreeResources(resources);
+    return;
+
+err:
+    wrefresh(pad);
+    wgetch(pad);
+    return;
+}
+
+void display_connector(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModeRes *resources = NULL;
+    drmModeConnector *connector = NULL;
+    int connector_index = -1;
+    char *endptr;
+
+    if (drm_fd < 0)
+    {
+        print_red_text(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+    if (!resources)
+    {
+        print_red_text(pad, line++, 1, "Failed to get DRM resources\n");
+        goto err;
+    }
+
+    connector_index = strtol(node->name + 9, &endptr, 10);
+
+    if (*endptr != '\0' || connector_index < 0 || connector_index >= resources->count_connectors)
+    {
+        mvwprintw(pad, line++, 1, "Invalid Connector name: %s\n", node->name);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    connector = drmModeGetConnector(drm_fd, resources->connectors[connector_index]);
+    if (!connector)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Connector %d\n", connector_index);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Connector ID: %d", connector->connector_id);
+    mvwprintw(pad, line++, 1, "No. of Encoders: %d", connector->count_encoders);
+    mvwprintw(pad, line++, 1, "Encoder ID: %d", connector->encoder_id);
+
+    line++;
+    mvwprintw(pad, line++, 1, "Possible Encoders: ");
+    for (int i = 0; i < connector->count_encoders; i++)
+    {
+        mvwprintw(pad, line++, 3, "Encoder %d: %d", i, connector->encoders[i]);
+    }
+
+    line++;
+    mvwprintw(pad, line++, 1, "Connection: ");
+    if (connector->connection == DRM_MODE_CONNECTED)
+        print_green_text(pad, -1, -1, "Connected");
+    else
+        print_red_text(pad, -1, -1, "Disconnected");
+
+    line++;
+    mvwprintw(pad, line++, 1, "Connector Type: %s", get_connector_type_name(connector->connector_type));
+    mvwprintw(pad, line++, 1, "Connector Type ID: %d", connector->connector_type_id);
+
+    mvwprintw(pad, line++, 1, "Subpixel Order: %d", connector->subpixel);
+    mvwprintw(pad, line++, 1, "MM Height: %d", connector->mmHeight);
+    mvwprintw(pad, line++, 1, "MM Width: %d", connector->mmWidth);
+
+    mvwprintw(pad, line++, 1, "Modes: %d", connector->count_modes);
+    wattron(pad, A_DIM);
+
+    line++;
+    for (int i = 0; i < connector->count_modes; i++)
+
+        if (connector->modes && i < connector->count_modes)
+        {
+            const drmModeModeInfo *mode = &connector->modes[i];
+
+            const char *preferred = (mode->type & DRM_MODE_TYPE_PREFERRED) ? " preferred" : "";
+            const char *driver = (mode->type & DRM_MODE_TYPE_DRIVER) ? " driver" : "";
+            const char *phsync = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? " phsync" : " nhsync";
+            const char *pvsync = (mode->flags & DRM_MODE_FLAG_PVSYNC) ? " pvsync" : " nvsync";
+            const char *interlace = (mode->flags & DRM_MODE_FLAG_INTERLACE) ? " interlace" : "";
+
+            double ratio = (double)mode->hdisplay / mode->vdisplay;
+            double refresh_rate = 0.0;
+            const char *aspect_ratio = NULL;
+
+            if (mode->vrefresh > 0)
+            {
+                refresh_rate = mode->vrefresh;
+            }
+            else if (mode->clock > 0 && mode->vtotal > 0)
+            {
+                refresh_rate = (double)(mode->clock * 1000) / (mode->htotal * mode->vtotal);
+            }
+
+            if (fabs(ratio - 16.0 / 9.0) < 0.01)
+            {
+                aspect_ratio = " 16:9";
+            }
+            else if (fabs(ratio - 4.0 / 3.0) < 0.01)
+            {
+                aspect_ratio = " 4:3";
+            }
+            else
+            {
+                aspect_ratio = "";
+            }
+
+            mvwprintw(pad, line++, 2,
+                      "%ux%u @%.2f%s%s%s%s%s%s",
+                      mode->hdisplay, mode->vdisplay, refresh_rate,
+                      driver, preferred, phsync, pvsync, interlace, aspect_ratio);
+        }
+
+    wattroff(pad, A_DIM);
+
+    mvwprintw(pad, line++, 1, "No. of Properties: %d", connector->count_props);
+
+    wattron(pad, A_DIM);
+    for (int i = 0; i < connector->count_props; i++)
+    {
+        drmModePropertyPtr prop = drmModeGetProperty(drm_fd, connector->props[i]);
+        if (prop)
+        {
+            char value_str[256] = {0};
+            uint64_t value = connector->prop_values[i];
+            int remaining_width = getmaxx(pad) - getcurx(pad);
+            const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ? " atomic" : " ";
+            const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ? " immutable" : "";
+
+            if (prop->flags & DRM_MODE_PROP_BLOB)
+            {
+                snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_ENUM)
+            {
+
+                snprintf(value_str, sizeof(value_str), "enum (");
+                for (int j = 0; j < prop->count_enums; j++)
+                {
+                    if (j > 0)
+                    {
+                        snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ", ");
+                    }
+                    snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), "%s", prop->enums[j].name);
+                }
+                snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ") = %s", prop->enums[value].name);
+            }
+            else if (prop->flags & DRM_MODE_PROP_RANGE)
+            {
+                snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+                         prop->values[0], prop->values[1], value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_OBJECT)
+            {
+                snprintf(value_str, sizeof(value_str), "object %s = %lu",
+                         get_drm_object_type_name(prop->values[0]), value);
+            }
+            else
+            {
+                snprintf(value_str, sizeof(value_str), "%lu", value);
+            }
+
+            wattroff(pad, A_DIM);
+            mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+            wattron(pad, A_DIM);
+            wprintw(pad, "%s%s: ", immutability, atomicity);
+
+            if ((int)strlen(value_str) > remaining_width)
+            {
+                char truncated_value[remaining_width + 1];
+                strncpy(truncated_value, value_str, remaining_width);
+                truncated_value[remaining_width] = '\0';
+                wprintw(pad, "%s", truncated_value);
+                mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+            }
+            else
+            {
+                wprintw(pad, "%s", value_str);
+            }
+
+            drmModeFreeProperty(prop);
+        }
+    }
+    wattroff(pad, A_DIM);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    drmModeFreeConnector(connector);
+    drmModeFreeResources(resources);
+    return;
+
+err:
+    wrefresh(pad);
+    wgetch(pad);
+    return;
+}
+
+void display_encoder(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModeRes *resources = NULL;
+    drmModeEncoder *encoder = NULL;
+    int encoder_id = -1;
+    char *endptr;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+    if (!resources)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get DRM resources\n");
+        goto err;
+    }
+
+    encoder_id = strtol(node->name + 7, &endptr, 10);
+    if (*endptr != '\0' || encoder_id < 0 || encoder_id >= resources->count_encoders)
+    {
+        mvwprintw(pad, line++, 1, "Invalid Encoder name: %s\n", node->name);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    encoder = drmModeGetEncoder(drm_fd, resources->encoders[encoder_id]);
+    if (!encoder)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Encoder %d\n", encoder_id);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    line++;
+    mvwprintw(pad, line++, 1, "Encoder Type: ");
+    if (encoder->encoder_type == DRM_MODE_ENCODER_NONE)
+        print_red_text(pad, -1, -1, "NONE");
+    else
+        print_bold_text(pad, -1, -1, "%s", get_encoder_type_name(encoder->encoder_type));
+    line++;
+
+    mvwprintw(pad, line++, 1, "Encoder ID: %d", encoder->encoder_id);
+    mvwprintw(pad, line++, 1, "CRTC ID: %d", encoder->crtc_id);
+    mvwprintw(pad, line++, 1, "Possible CRTCs: %d", encoder->possible_crtcs);
+    mvwprintw(pad, line++, 1, "Possible Clones: %d", encoder->possible_clones);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    drmModeFreeEncoder(encoder);
+    drmModeFreeResources(resources);
+    return;
+
+err:
+    wrefresh(pad);
+    wgetch(pad);
+    return;
+}
+
+void display_framebuffer(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModeRes *resources = NULL;
+    drmModeFB *fb = NULL;
+    int framebuffer_id = -1;
+    char *endptr;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+    if (!resources)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get DRM resources\n");
+        goto err;
+    }
+
+    framebuffer_id = strtol(node->name + 11, &endptr, 10);
+    if (*endptr != '\0' || framebuffer_id < 0 || framebuffer_id >= resources->count_fbs)
+    {
+        mvwprintw(pad, line++, 1, "Invalid Framebuffer name: %s\n", node->name);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    fb = drmModeGetFB(drm_fd, resources->fbs[framebuffer_id]);
+    if (!fb)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Framebuffer %d\n", framebuffer_id);
+        drmModeFreeResources(resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Framebuffer ID: %d", fb->fb_id);
+    mvwprintw(pad, line++, 1, "Width: %d", fb->width);
+    mvwprintw(pad, line++, 1, "Height: %d", fb->height);
+    mvwprintw(pad, line++, 1, "Pitch: %d", fb->pitch);
+    mvwprintw(pad, line++, 1, "BPP: %d", fb->bpp);
+    mvwprintw(pad, line++, 1, "Depth: %d", fb->depth);
+    mvwprintw(pad, line++, 1, "Handle: %d", fb->handle);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    drmModeFreeFB(fb);
+    drmModeFreeResources(resources);
+    return;
+
+err:
+    wrefresh(pad);
+    wgetch(pad);
+    return;
+}
+
+void display_plane(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModePlaneRes *plane_resources = NULL;
+    drmModePlane *plane = NULL;
+    int plane_index = -1;
+    char *endptr;
+    drmModeObjectProperties *props = NULL;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    plane_resources = drmModeGetPlaneResources(drm_fd);
+    if (!plane_resources)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+        goto err;
+    }
+
+    plane_index = strtol(node->name + 5, &endptr, 10);
+    if (*endptr != '\0' || plane_index < 0 || plane_index >= (int)plane_resources->count_planes)
+    {
+        mvwprintw(pad, line++, 1, "Invalid Plane name: %s\n", node->name);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+    if (!plane)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Plane Index: %d", plane_index);
+    mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+    mvwprintw(pad, line++, 1, "CRTC ID: %d", plane->crtc_id);
+    mvwprintw(pad, line++, 1, "Framebuffer ID: %d", plane->fb_id);
+    mvwprintw(pad, line++, 1, "Possible CRTCs: %d", plane->possible_crtcs);
+    mvwprintw(pad, line++, 1, "Gamma size: %u", plane->gamma_size);
+    mvwprintw(pad, line++, 1, "CRTC Position: (%d, %d)", plane->crtc_x, plane->crtc_y);
+
+    mvwprintw(pad, line++, 1, "Possible CRTC IDs: ");
+    for (int i = 0; i < 32; i++)
+    {
+        if (plane->possible_crtcs & (1 << i))
+        {
+            mvwprintw(pad, line++, 3, "CRTC %d", i);
+        }
+    }
+    line++;
+
+    mvwprintw(pad, line++, 1, "Number of formats: %u", plane->count_formats);
+    line++;
+
+    props = drmModeObjectGetProperties(drm_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
+    if (!props)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get properties for Plane %u\n", plane->plane_id);
+        drmModeFreePlane(plane);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Properties for Plane %u:", plane->plane_id);
+    line++;
+
+    for (uint32_t i = 0; i < props->count_props; i++)
+    {
+        drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+        if (prop)
+        {
+            char value_str[256] = {0};
+            uint64_t value = props->prop_values[i];
+            int remaining_width = getmaxx(pad) - getcurx(pad);
+            const char *immutability = (prop->flags & DRM_MODE_PROP_IMMUTABLE) ? " immutable" : "";
+            const char *atomicity = (prop->flags & DRM_MODE_PROP_ATOMIC) ? " atomic" : " ";
+
+            if (prop->flags & DRM_MODE_PROP_BLOB)
+            {
+                snprintf(value_str, sizeof(value_str), "blob = %lu", value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_ENUM)
+            {
+                snprintf(value_str, sizeof(value_str), "enum (");
+                for (int j = 0; j < prop->count_enums; j++)
+                {
+                    if (j > 0)
+                    {
+                        snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ", ");
+                    }
+                    snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), "%s", prop->enums[j].name);
+                }
+                snprintf(value_str + strlen(value_str), sizeof(value_str) - strlen(value_str), ") = %s", prop->enums[value].name);
+            }
+            else if (prop->flags & DRM_MODE_PROP_RANGE)
+            {
+                snprintf(value_str, sizeof(value_str), "range [%lu, %lu] = %lu",
+                         prop->values[0], prop->values[1], value);
+            }
+            else if (prop->flags & DRM_MODE_PROP_OBJECT)
+            {
+                snprintf(value_str, sizeof(value_str), "object %s = %lu",
+                         get_drm_object_type_name(prop->values[0]), value);
+            }
+            else
+            {
+                snprintf(value_str, sizeof(value_str), "%lu", value);
+            }
+
+            wattroff(pad, A_DIM);
+            mvwprintw(pad, line++, 2, "%d. %s", i, prop->name);
+            wattron(pad, A_DIM);
+            wprintw(pad, "%s%s: ", immutability, atomicity);
+
+            if ((int)strlen(value_str) > remaining_width)
+            {
+                char truncated_value[remaining_width + 1];
+                strncpy(truncated_value, value_str, remaining_width);
+                truncated_value[remaining_width] = '\0';
+                wprintw(pad, "%s", truncated_value);
+                mvwprintw(pad, line++, 2, "%s", value_str + remaining_width);
+            }
+            else
+            {
+                wprintw(pad, "%s", value_str);
+            }
+
+            drmModeFreeProperty(prop);
+        }
+    }
+
+    drmModeFreeObjectProperties(props);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    drmModeFreePlane(plane);
+    drmModeFreePlaneResources(plane_resources);
+    return;
+
+err:
+    wrefresh(pad);
+    wgetch(pad);
+    return;
+}
+
+void display_informats(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModePlaneRes *plane_resources = NULL;
+    drmModePlane *plane = NULL;
+    drmModeObjectProperties *props = NULL;
+    int plane_index = -1;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    plane_resources = drmModeGetPlaneResources(drm_fd);
+    if (!plane_resources)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+        goto err;
+    }
+
+    if (strncmp(node->name, "IN_FORMATS", 10) == 0)
+    {
+        char *endptr;
+        plane_index = strtol(node->name + 10, &endptr, 10);
+        if (*endptr != '\0' || plane_index < 0 || plane_index >= (int)plane_resources->count_planes)
+        {
+            mvwprintw(pad, line++, 1, "Invalid Plane Index: %s\n", node->name);
+            drmModeFreePlaneResources(plane_resources);
+            goto err;
+        }
+    }
+    else
+    {
+        mvwprintw(pad, line++, 1, "Invalid format for node->name: %s\n", node->name);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+    if (!plane)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Plane Index: %d", plane_index);
+    mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+
+    props = drmModeObjectGetProperties(drm_fd, plane->plane_id, DRM_MODE_OBJECT_PLANE);
+    if (!props)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get properties for Plane %u\n", plane->plane_id);
+        drmModeFreePlane(plane);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "IN_FORMATS for Plane %u:", plane->plane_id);
+    line++;
+
+    for (uint32_t i = 0; i < props->count_props; i++)
+    {
+        drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+        if (prop)
+        {
+            uint64_t value = props->prop_values[i];
+
+            if (prop->flags & DRM_MODE_PROP_BLOB && strcmp(prop->name, "IN_FORMATS") == 0)
+            {
+                drmModePropertyBlobRes *blob = drmModeGetPropertyBlob(drm_fd, value);
+                struct drm_format_modifier_blob *data = NULL;
+                uint32_t *fmts = NULL;
+                struct drm_format_modifier *mods = NULL;
+
+                if (!blob)
+                {
+                    log_message(LOG_ERROR, "drmModeGetPropertyBlob");
+                    return;
+                }
+
+                data = blob->data;
+
+                fmts = (uint32_t *)((char *)data + data->formats_offset);
+                mods = (struct drm_format_modifier *)((char *)data + data->modifiers_offset);
+
+                for (uint32_t j = 0; j < data->count_modifiers; j++)
+                {
+                    mvwprintw(pad, line++, 1, "Modifier %u: %s", j, get_basic_modifier_str(mods[j].modifier));
+                    mvwprintw(pad, line++, 3, "Formats: ");
+                    wattron(pad, A_DIM);
+                    for (uint32_t k = 0; k < data->count_formats; k++)
+                    {
+                        if (mods[j].formats & (1ULL << k))
+                        {
+                            mvwprintw(pad, line++, 5, "%s (0x%08x)", get_format_str(fmts[k]), fmts[k]);
+                        }
+                    }
+                    wattroff(pad, A_DIM);
+                }
+
+                drmModeFreePropertyBlob(blob);
+            }
+        }
+    }
+    drmModeFreeObjectProperties(props);
+    drmModeFreePlane(plane);
+    drmModeFreePlaneResources(plane_resources);
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    return;
+
+err:
+    wrefresh(pad);
+    return;
+}
+
+void display_formats(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    drmModePlaneRes *plane_resources = NULL;
+        drmModePlane *plane = NULL;
+    int plane_index = -1;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 1, "Failed to open DRM Device!\n");
+        goto err;
+    }
+
+    plane_resources = drmModeGetPlaneResources(drm_fd);
+    if (!plane_resources)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get DRM plane resources\n");
+        goto err;
+    }
+
+    if (strncmp(node->name, "FORMATS", 7) == 0)
+    {
+        char *endptr;
+        plane_index = strtol(node->name + 7, &endptr, 10);
+        if (*endptr != '\0' || plane_index < 0 || plane_index >= (int)plane_resources->count_planes)
+        {
+            mvwprintw(pad, line++, 1, "Invalid Plane Index: %s\n", node->name);
+            drmModeFreePlaneResources(plane_resources);
+            goto err;
+        }
+    }
+    else
+    {
+        mvwprintw(pad, line++, 1, "Invalid format for node->name: %s\n", node->name);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    plane = drmModeGetPlane(drm_fd, plane_resources->planes[plane_index]);
+    if (!plane)
+    {
+        mvwprintw(pad, line++, 1, "Failed to get Plane %d\n", plane_index);
+        drmModeFreePlaneResources(plane_resources);
+        goto err;
+    }
+
+    mvwprintw(pad, line++, 1, "Plane ID: %d", plane->plane_id);
+
+    line++;
+    mvwprintw(pad, line++, 1, "No. of Plane formats %u:", plane->count_formats);
+    line++;
+
+    if (plane->count_formats > 0)
+    {
+        wattron(pad, A_DIM);
+        for (uint32_t i = 0; i < plane->count_formats; i++)
+        {
+            mvwprintw(pad, line++, 3, "%s (0x%08x)", get_format_str(plane->formats[i]), plane->formats[i]);
+        }
+        line++;
+        wattroff(pad, A_DIM);
+    }
+
+    drmModeFreePlane(plane);
+    drmModeFreePlaneResources(plane_resources);
+
+    mvwprintw(pad, ++line, 1, "Press 'e' to go back.");
+
+    *content_line = line;
+    return;
+
+err:
+    wrefresh(pad);
+    return;
+}
diff --git a/tools/displaytop/src/display_dump.c b/tools/displaytop/src/display_dump.c
new file mode 100644
index 000000000..f7ff84dbc
--- /dev/null
+++ b/tools/displaytop/src/display_dump.c
@@ -0,0 +1,215 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "node.h"
+#include "utils.h"
+
+void single_file_dump(Node *node, const char *filePath, bool single)
+{
+    time_t now;
+    struct tm *t;
+    char dump_file_path[512];
+    FILE *file;
+    const int padHeight = 1000;
+    const int padWidth = 200;
+    WINDOW *virtualWin;
+    int line = 0;
+    char buffer[padWidth + 1];
+
+    if (!node || node->name[0] == '\0' || !node->display_function)
+    {
+        log_message(LOG_ERROR, "Invalid node provided for dumping");
+        return;
+    }
+
+    now = time(NULL);
+    t = localtime(&now);
+
+    if (single)
+    {
+        snprintf(dump_file_path, sizeof(dump_file_path), "%s/%s_%04d-%02d-%02d-%02d.%02d.%02d.txt",
+                 filePath, node->name, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+                 t->tm_hour, t->tm_min, t->tm_sec);
+    }
+    else
+    {
+        snprintf(dump_file_path, sizeof(dump_file_path), "%s/%s.txt", filePath, node->name);
+    }
+
+    file = fopen(dump_file_path, "w");
+    if (!file)
+    {
+        log_message(LOG_ERROR, "Failed to open file: %s", dump_file_path);
+        return;
+    }
+    chmod(dump_file_path, 0777);
+
+    virtualWin = newwin(padHeight, padWidth, 0, 0);
+    if (!virtualWin)
+    {
+        log_message(LOG_ERROR, "Failed to create virtual window");
+        fclose(file);
+        return;
+    }
+
+    node->display_function(virtualWin, node, &line);
+
+    fprintf(file, "Dump Time: %04d-%02d-%02d %02d:%02d:%02d\n\n",
+            t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+            t->tm_hour, t->tm_min, t->tm_sec);
+
+    for (int y = 0; y < line; ++y)
+    {
+        wmove(virtualWin, y, 0);
+        winnstr(virtualWin, buffer, padWidth);
+        buffer[padWidth] = '\0';
+        fprintf(file, "%s\n", buffer);
+    }
+
+    log_message(LOG_INFO, "Dumped node '%s' to %s", node->name, dump_file_path);
+
+    delwin(virtualWin);
+    fclose(file);
+}
+
+static void recursive_dump_with_progress(Node *node, const char *parentDir,
+                                         int *current_count, int total_count, WINDOW *progress_win)
+{
+    char nodeDir[512];
+    bool hasChildren;
+    time_t now;
+    struct tm *t;
+
+    if (!node)
+        return;
+
+    hasChildren = (node->children_size > 0);
+
+    if (hasChildren)
+    {
+        now = time(NULL);
+        t = localtime(&now);
+
+        snprintf(nodeDir, sizeof(nodeDir), "%s/%s(%04d-%02d-%02d-%02d.%02d.%02d)",
+                 parentDir, node->name, t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
+                 t->tm_hour, t->tm_min, t->tm_sec);
+
+        if (mkdir(nodeDir, 0777) == -1 && errno != EEXIST)
+        {
+            log_message(LOG_ERROR, "Error creating directory %s: %s", nodeDir, strerror(errno));
+            return;
+        }
+        (*current_count)++;
+    }
+    else
+    {
+        snprintf(nodeDir, sizeof(nodeDir), "%s", parentDir);
+    }
+
+    if (node->display_function)
+    {
+        single_file_dump(node, nodeDir, false);
+        (*current_count)++;
+    }
+
+    render_progress_bar(progress_win, *current_count, total_count);
+
+    for (int i = 0; i < node->children_size; ++i)
+    {
+        recursive_dump_with_progress(&node->children[i], nodeDir,
+                                     current_count, total_count, progress_win);
+    }
+}
+
+void display_dump_menu(Node *head)
+{
+    int total_nodes;
+    int winHeight, winWidth;
+    WINDOW *win;
+    int line;
+    int input;
+    int current_count;
+
+    if (!head)
+    {
+        log_message(LOG_ERROR, "Head node is NULL, cannot dump.");
+        return;
+    }
+
+    total_nodes = 0;
+    count_nodes(head, &total_nodes);
+
+    if (total_nodes == 0)
+    {
+        log_message(LOG_INFO, "No nodes found to dump.");
+        return;
+    }
+
+    getmaxyx(stdscr, winHeight, winWidth);
+
+    win = newwin(winHeight, winWidth, 0, 0);
+    wbkgd(win, COLOR_PAIR(6));
+    box(win, 0, 0);
+
+    draw_header(win, winWidth, "DUMP MENU", "Press ESC to exit");
+
+    line = 4;
+    wattron(win, A_BOLD);
+    mvwprintw(win, line++, 2, "You are about to dump %d nodes into files.", total_nodes);
+    line++;
+    mvwprintw(win, line++, 2, "Dumping menus under the path: %s", head->name);
+    line++;
+    wattroff(win, A_BOLD);
+    mvwprintw(win, line++, 2, "Proceed with dump? (y to confirm, ESC to cancel)");
+    wrefresh(win);
+
+    input = wgetch(win);
+    if (input != 'y' && input != 'Y')
+    {
+        delwin(win);
+        return;
+    }
+
+    log_message(LOG_INFO, "Starting dump from node: %s", head->name);
+
+    if (mkdir(DUMP_DIR, 0777) == -1 && errno != EEXIST)
+    {
+        log_message(LOG_ERROR, "Failed to create dump directory: %s", strerror(errno));
+        delwin(win);
+        return;
+    }
+
+    line++;
+    mvwprintw(win, line++, 2, "Progress:");
+    wrefresh(win);
+
+    current_count = 0;
+    recursive_dump_with_progress(head, DUMP_DIR, &current_count, total_nodes, win);
+
+    mvwprintw(win, line + 2, 2, "Dumping is over. Press any key to go back.");
+    wrefresh(win);
+    getch();
+
+    delwin(win);
+    endwin();
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/display_search_bar.c b/tools/displaytop/src/display_search_bar.c
new file mode 100644
index 000000000..aa30b772b
--- /dev/null
+++ b/tools/displaytop/src/display_search_bar.c
@@ -0,0 +1,281 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <form.h>
+
+#include "display.h"
+#include "utils.h"
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
+static char *construct_search_path(Node *node, Node *head)
+{
+    char buffer[1024];
+    char temp[1024];
+    char *path;
+    Node *current;
+
+    if (node == NULL || head == NULL)
+        return NULL;
+
+    buffer[0] = '\0';
+    path = NULL;
+    current = node;
+
+    while (current && strcmp(current->name, head->name) != 0)
+    {
+        if (snprintf(temp, sizeof(temp), "%s%s%s", current->name, buffer[0] ? " > " : "", buffer) >= (int)sizeof(temp))
+        {
+            log_message(LOG_ERROR, "Path string truncated: %s%s%s", current->name, buffer[0] ? " > " : "", buffer);
+            return NULL;
+        }
+        strncpy(buffer, temp, sizeof(buffer) - 1);
+        buffer[sizeof(buffer) - 1] = '\0';
+
+        current = current->parent;
+    }
+
+    path = (char *)malloc(strlen(buffer) + 1);
+    if (path)
+    {
+        strcpy(path, buffer);
+    }
+
+    return path;
+}
+
+/**
+ * @brief Displays the children of a given node in a new window.
+ *
+ * This function displays the children of a given node in a new window.
+ * The user can navigate through the children using the arrow keys and select a child by pressing Enter.
+ * The function returns the selected child node.
+ *
+ * @param node Pointer to the node whose children are to be displayed.
+ * @param head Pointer to the head node (current location in DisplayTop).
+ * @return Pointer to the selected child node.
+ *         Returns NULL if either node or node->children is NULL.
+ */
+static Node *display_children(Node *node, Node *head)
+{
+    int rows, cols;
+    int line;
+    int pad_pos;
+    int highlighted_index;
+    int ch;
+    WINDOW *pad;
+
+    if (node == NULL || node->children == NULL)
+        return NULL;
+
+    getmaxyx(stdscr, rows, cols);
+
+    line = 0;
+    pad_pos = 0;
+    highlighted_index = 0;
+    pad = newpad(100, cols - 2);
+
+    if (pad == NULL)
+        return NULL;
+
+    wbkgd(pad, COLOR_PAIR(6));
+
+    if (node->children_size > 0)
+    {
+        line++;
+
+        for (int i = 0; i < node->children_size; ++i)
+        {
+            if (highlighted_index == i)
+                wattron(pad, A_REVERSE);
+
+            mvwprintw(pad, line + i, 1, "%d. %s - %s", i + 1, node->children[i].name, construct_search_path(&node->children[i], head));
+            wattroff(pad, A_REVERSE);
+        }
+        prefresh(pad, pad_pos, 0, 8, 1, rows - 2, cols - 2);
+    }
+
+    while ((ch = getch()) != 27)
+    {
+        if (pad_pos > 0)
+            mvwprintw(pad, 0, cols - 5, "...");
+        else
+            mvwprintw(pad, 0, cols - 5, "   ");
+
+        if (pad_pos < node->children_size - (rows - 8))
+            mvwprintw(pad, rows - 1, cols - 5, "...");
+        else
+            mvwprintw(pad, rows - 1, cols - 5, "   ");
+
+        switch (ch)
+        {
+        case KEY_UP:
+            if (highlighted_index > 0)
+            {
+                highlighted_index--;
+                pad_pos = (highlighted_index < pad_pos) ? highlighted_index : pad_pos;
+            }
+            break;
+        case KEY_DOWN:
+            if (highlighted_index < node->children_size - 1)
+            {
+                highlighted_index++;
+                pad_pos = (highlighted_index >= pad_pos + rows - 8) ? highlighted_index - rows + 8 : pad_pos;
+            }
+            break;
+        case '\n':
+            delwin(pad);
+            return &node->children[highlighted_index];
+        default:
+            break;
+        }
+
+        for (int i = 0; i < node->children_size; ++i)
+        {
+            if (highlighted_index == i)
+                wattron(pad, A_REVERSE);
+
+            mvwprintw(pad, line + i, 1, "%d. %s - %s", i + 1, node->children[i].name, construct_search_path(&node->children[i], head));
+            wattroff(pad, A_REVERSE);
+        }
+
+        prefresh(pad, pad_pos, 0, 8, 1, rows - 2, cols - 2);
+    }
+
+    delwin(pad);
+    return head;
+}
+
+Node *display_search_bar(Node *head)
+{
+    int rows, cols;
+    WINDOW *win;
+    FIELD *fields[2];
+    FORM *form;
+    char input_buffer[256];
+    int ch, pos;
+    Node *results;
+    Node *result;
+
+    memset(input_buffer, 0, sizeof(input_buffer));
+    pos = 0;
+
+    getmaxyx(stdscr, rows, cols);
+    win = newwin(rows, cols, 0, 0);
+    wbkgd(win, COLOR_PAIR(6));
+    keypad(win, TRUE);
+    box(win, 0, 0);
+
+    print_bold_text(win, 1, 1, "Search Menu");
+    mvwprintw(win, 1, (cols - strlen("Searching under: %s")) / 2, "Searching under: %s", head->name);
+    mvwprintw(win, 1, cols - strlen("Press 'Esc' to exit ") - 1, "Press 'Esc' to exit");
+    mvwhline(win, 2, 1, 0, cols - 2);
+    mvwhline(win, 6, 1, 0, cols - 2);
+
+    fields[0] = new_field(1, cols - 4, 1, 1, 0, 0);
+    fields[1] = NULL;
+
+    set_field_back(fields[0], A_UNDERLINE);
+    field_opts_off(fields[0], O_AUTOSKIP);
+
+    form = new_form(fields);
+    set_form_win(form, win);
+    set_form_sub(form, derwin(win, 3, cols - 2, 3, 1));
+
+    wbkgd(form_sub(form), COLOR_PAIR(7));
+    box(form_sub(form), 0, 0);
+    post_form(form);
+    wrefresh(win);
+
+    while ((ch = getch()) != 27)
+    {
+        switch (ch)
+        {
+        case KEY_BACKSPACE:
+        case 127:
+        case 8:
+            if (pos > 0)
+            {
+                pos--;
+                input_buffer[pos] = '\0';
+                form_driver(form, REQ_DEL_PREV);
+            }
+            break;
+        case '\n':
+            if (pos > 0)
+            {
+                results = create_node("Search Results", NULL, NULL);
+                search_nodes(head, input_buffer, results);
+
+                if (results->children_size != 0)
+                {
+                    unpost_form(form);
+                    print_bold_text(win, 7, 2, "%d hits", results->children_size);
+                    wrefresh(win);
+                    result = display_children(results, head);
+                    free_form(form);
+                    free_field(fields[0]);
+                    delwin(win);
+                    endwin();
+                    return result;
+                }
+                else
+                {
+                    print_bold_text(win, 7, 2, "No results found");
+                }
+            }
+            break;
+        default:
+            if (pos < (int)(sizeof(input_buffer) - 1))
+            {
+                input_buffer[pos++] = ch;
+                input_buffer[pos] = '\0';
+                form_driver(form, ch);
+            }
+            break;
+        }
+        wrefresh(win);
+    }
+
+    unpost_form(form);
+    wrefresh(win);
+
+    getch();
+    free_form(form);
+    free_field(fields[0]);
+    delwin(win);
+    endwin();
+
+    return head;
+}
diff --git a/tools/displaytop/src/display_summary.c b/tools/displaytop/src/display_summary.c
new file mode 100644
index 000000000..a22ed097c
--- /dev/null
+++ b/tools/displaytop/src/display_summary.c
@@ -0,0 +1,308 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+#include "utils.h"
+
+#define MAX_WIDTH getmaxx(pad)
+#define MAX_ENCODERS_PER_ROW ((MAX_WIDTH - 11) / 8)
+
+static void display_encoders(WINDOW *pad, drmModeRes *resources,int *line)
+{
+    int col_width = 6;
+    int max_per_row = MAX_ENCODERS_PER_ROW;
+    int start, end, i;
+    drmModeEncoder *encoder;
+
+    wattron(pad, A_BOLD);
+    mvwprintw(pad, (*line)++, 1, "Encoders - %d", resources->count_encoders);
+    wattroff(pad, A_BOLD);
+
+    for (start = 0; start < resources->count_encoders; start += max_per_row)
+    {
+        end = (start + max_per_row < resources->count_encoders) ? (start + max_per_row) : resources->count_encoders;
+
+        mvwprintw(pad, (*line)++, 2, "Encoder ID |");
+        for (i = start; i < end; i++)
+        {
+            encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+            if (encoder)
+            {
+                mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*d", col_width, encoder->encoder_id);
+                wprintw(pad, "|");
+                drmModeFreeEncoder(encoder);
+            }
+            else
+            {
+                mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*s", col_width, "N/A");
+                wprintw(pad, "|");
+            }
+        }
+
+        mvwprintw(pad, (*line)++, 2, "Type       |");
+        for (i = start; i < end; i++)
+        {
+            encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+            if (encoder)
+            {
+                mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*s", col_width, get_encoder_type_name(encoder->encoder_type));
+                wprintw(pad, "|");
+                drmModeFreeEncoder(encoder);
+            }
+            else
+            {
+                mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*s", col_width, "N/A");
+                wprintw(pad, "|");
+            }
+        }
+
+        mvwprintw(pad, (*line)++, 2, "CRTC ID    |");
+        for (i = start; i < end; i++)
+        {
+            encoder = drmModeGetEncoder(drm_fd, resources->encoders[i]);
+            if (encoder)
+            {
+                if (encoder->crtc_id != 0)
+                {
+                    wattron(pad, A_BOLD | COLOR_PAIR(2));
+                    mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*d", col_width, encoder->crtc_id);
+                    wattroff(pad, A_BOLD | COLOR_PAIR(2));
+                    wprintw(pad, "|");
+                }
+                else
+                {
+                    mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*d", col_width, encoder->crtc_id);
+                    wprintw(pad, "|");
+                }
+                drmModeFreeEncoder(encoder);
+            }
+            else
+            {
+                mvwprintw(pad, (*line) - 1, 14 + ((i - start) * (col_width + 1)), "%*s", col_width, "N/A");
+                wprintw(pad, "|");
+            }
+        }
+
+        (*line) += 1;
+    }
+}
+
+void display_summary(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    int col_width;
+    drmModeRes *resources = NULL;
+    drmModeCrtc *crtc = NULL;
+    drmVersionPtr version = NULL;
+    uint64_t value;
+    drmDevicePtr devices[8];
+    int device_count;
+
+    wclear(pad);
+
+    print_bold_text(pad, line++, 1, "%s Summary", node->name);
+    line++;
+
+    print_dim_text(pad, line++, 1, "Fetching details for card: %s", find_drm_device(true));
+    line++;
+
+    if (drm_fd < 0)
+    {
+        mvwprintw(pad, line++, 2, "Failed to open DRM Device!\n");
+        goto error;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+
+    if (!resources)
+    {
+        mvwprintw(pad, line++, 2, "Failed to get DRM resources\n");
+        goto error;
+    }
+
+    wattron(pad, A_BOLD);
+    mvwprintw(pad, line++, 1, "CRTCs - %d", resources->count_crtcs);
+    wattroff(pad, A_BOLD);
+
+    col_width = 10;
+    mvwprintw(pad, line++, 2, "CRTC ID   |");
+    for (int i = 0; i < resources->count_crtcs; i++)
+    {
+        crtc = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
+
+        if (crtc)
+        {
+            if (crtc->mode_valid)
+            {
+                wattron(pad, A_BOLD | COLOR_PAIR(2));
+                mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d", col_width, crtc->crtc_id);
+                wattroff(pad, A_BOLD | COLOR_PAIR(2));
+                wprintw(pad, "|");
+            }
+            else
+            {
+                wattron(pad, A_BOLD | COLOR_PAIR(3));
+                mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d", col_width, crtc->crtc_id);
+                wattroff(pad, A_BOLD | COLOR_PAIR(3));
+                wprintw(pad, "|");
+            }
+            drmModeFreeCrtc(crtc);
+        }
+        else
+        {
+            mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width, "N/A");
+        }
+    }
+    line++;
+
+    wattron(pad, A_BOLD);
+    mvwprintw(pad, line++, 1, "Connectors - %d", resources->count_connectors);
+    wattroff(pad, A_BOLD);
+
+    col_width = 10;
+    mvwprintw(pad, line++, 2, "Connectors|");
+    for (int i = 0; i < resources->count_connectors; i++)
+    {
+        drmModeConnector *connector = drmModeGetConnector(drm_fd, resources->connectors[i]);
+        if (connector)
+        {
+            if (connector->connection == DRM_MODE_CONNECTED)
+            {
+                wattron(pad, A_BOLD | COLOR_PAIR(2));
+                mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d", col_width, connector->connector_id);
+                wattroff(pad, A_BOLD | COLOR_PAIR(2));
+                wprintw(pad, "|");
+            }
+            else
+            {
+                wattron(pad, A_BOLD | COLOR_PAIR(3));
+                mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*d", col_width, connector->connector_id);
+                wattroff(pad, A_BOLD | COLOR_PAIR(3));
+                wprintw(pad, "|");
+            }
+            drmModeFreeConnector(connector);
+        }
+        else
+        {
+            mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width, "N/A");
+        }
+    }
+
+    mvwprintw(pad, line++, 2, "Type      |");
+    for (int i = 0; i < resources->count_connectors; i++)
+    {
+        drmModeConnector *connector = drmModeGetConnector(drm_fd, resources->connectors[i]);
+        if (connector)
+        {
+            const char *type_name = get_connector_type_name(connector->connector_type);
+            mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width, type_name);
+            drmModeFreeConnector(connector);
+        }
+        else
+        {
+            mvwprintw(pad, line - 1, 13 + (i * (col_width + 1)), "%*s|", col_width, "N/A");
+        }
+    }
+    line++;
+
+    display_encoders(pad, resources, &line);
+
+    version = drmGetVersion(drm_fd);
+    if (version)
+    {
+        wattron(pad, A_BOLD);
+        mvwprintw(pad, line++, 1, "DRM Driver: %s", version->name);
+        wattroff(pad, A_BOLD);
+        drmFreeVersion(version);
+    }
+    else
+    {
+        mvwprintw(pad, line++, 2, "Failed to get DRM version");
+    }
+
+    drmGetCap(drm_fd, DRM_CAP_TIMESTAMP_MONOTONIC, &value);
+    mvwprintw(pad, line++, 2, "DRM_CAP_TIMESTAMP_MONOTONIC: %lu", value);
+
+    drmGetCap(drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &value);
+    mvwprintw(pad, line++, 2, "DRM_CAP_CRTC_IN_VBLANK_EVENT: %lu", value);
+
+    drmGetCap(drm_fd, DRM_CAP_ASYNC_PAGE_FLIP, &value);
+    mvwprintw(pad, line++, 2, "DRM_CAP_ASYNC_PAGE_FLIP: %lu", value);
+
+    drmGetCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, &value);
+    mvwprintw(pad, line++, 2, "DRM_CLIENT_CAP_ATOMIC: %lu", value);
+
+    drmGetCap(drm_fd, DRM_CAP_ADDFB2_MODIFIERS, &value);
+    mvwprintw(pad, line++, 2, "DRM_CAP_ADDFB2_MODIFIERS: %lu", value);
+    line++;
+
+    device_count = drmGetDevices2(0, devices, 8);
+    if (device_count < 0)
+    {
+        mvwprintw(pad, line++, 2, "Failed to get DRM devices");
+    }
+    else
+    {
+        for (int i = 0; i < device_count; i++)
+        {
+            if (devices[i]->available_nodes & (1 << DRM_NODE_PRIMARY))
+            {
+                char available_nodes[256] = "";
+
+                wattron(pad, A_BOLD);
+                mvwprintw(pad, line++, 1, "Device: PCI %04x:%04x", devices[i]->deviceinfo.pci->vendor_id, devices[i]->deviceinfo.pci->device_id);
+                wattroff(pad, A_BOLD);
+
+                if (devices[i]->available_nodes & (1 << DRM_NODE_PRIMARY))
+                {
+                    strcat(available_nodes, "primary, ");
+                }
+                if (devices[i]->available_nodes & (1 << DRM_NODE_RENDER))
+                {
+                    strcat(available_nodes, "render, ");
+                }
+                if (strlen(available_nodes) > 0)
+                {
+                    available_nodes[strlen(available_nodes) - 2] = '\0';
+                }
+                mvwprintw(pad, line++, 2, "Available nodes: %s", available_nodes);
+            }
+        }
+        drmFreeDevices(devices, device_count);
+    }
+
+    drmModeFreeResources(resources);
+
+    *content_line = line;
+    return;
+
+error:
+    if (resources)
+    {
+        drmModeFreeResources(resources);
+    }
+
+    wrefresh(pad);
+    *content_line = line;
+    return;
+}
diff --git a/tools/displaytop/src/log.c b/tools/displaytop/src/log.c
new file mode 100644
index 000000000..6d38fee07
--- /dev/null
+++ b/tools/displaytop/src/log.c
@@ -0,0 +1,84 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "log.h"
+
+static FILE *log_file = NULL;
+
+void init_log_system(void)
+{
+    log_file = fopen(LOG_FILE, "a");
+    if (!log_file)
+    {
+        fprintf(stderr, "Failed to open log file: %s\n", LOG_FILE);
+    }
+}
+
+void log_message(int level, const char *format, ...)
+{
+    time_t now;
+    struct tm *t;
+    char time_str[20];
+    const char *level_str;
+    va_list args;
+
+    if (!log_file)
+        return;
+
+    now = time(NULL);
+    t = localtime(&now);
+    strftime(time_str, sizeof(time_str), "%Y-%m-%d %H:%M:%S", t);
+
+    switch (level)
+    {
+    case LOG_INFO:
+        level_str = "INFO";
+        break;
+    case LOG_WARNING:
+        level_str = "WARNING";
+        break;
+    case LOG_ERROR:
+        level_str = "ERROR";
+        break;
+    default:
+        level_str = "UNKNOWN";
+        break;
+    }
+
+    va_start(args, format);
+    fprintf(log_file, "[%s] [%s] ", time_str, level_str);
+    vfprintf(log_file, format, args);
+    fprintf(log_file, "\n");
+    va_end(args);
+
+    fflush(log_file);
+}
+
+void close_log_system(void)
+{
+    if (log_file)
+    {
+        fclose(log_file);
+        log_file = NULL;
+    }
+}
diff --git a/tools/displaytop/src/main.c b/tools/displaytop/src/main.c
new file mode 100644
index 000000000..32b273e70
--- /dev/null
+++ b/tools/displaytop/src/main.c
@@ -0,0 +1,63 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
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
+    handle_cli_args(argc, argv);
+
+    init_log_system();
+
+    initscr();
+    cbreak();
+    noecho();
+    start_color();
+    set_escdelay(0);
+    keypad(stdscr, TRUE);
+
+    init_pair(1, COLOR_WHITE, COLOR_BLACK);
+    init_pair(2, COLOR_GREEN, COLOR_BLACK);
+    init_pair(3, COLOR_RED, COLOR_BLACK);
+    init_pair(4, COLOR_BLACK, COLOR_GREEN);
+    init_pair(5, COLOR_BLACK, COLOR_RED);
+    init_pair(6, COLOR_BLUE, COLOR_BLACK);
+    init_pair(7, COLOR_BLACK, COLOR_BLUE);
+
+    check_and_load_driver();
+    open_primary_drm_device();
+    populate_data();
+    display_win(stdscr, root);
+
+    endwin();
+    close_primary_drm_device();
+    close_log_system();
+
+    return 0;
+}
diff --git a/tools/displaytop/src/node.c b/tools/displaytop/src/node.c
new file mode 100644
index 000000000..4f1ca33a1
--- /dev/null
+++ b/tools/displaytop/src/node.c
@@ -0,0 +1,140 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "node.h"
+
+Node* create_node(const char* name, void (*display_function)(WINDOW*, Node*, int*), Node* parent)
+{
+    Node *new_node = (Node *)malloc(sizeof(Node));
+    strncpy(new_node->name, name, sizeof(new_node->name) - 1);
+    new_node->name[sizeof(new_node->name) - 1] = '\0';
+    new_node->display_function = display_function;
+    new_node->parent = parent;
+    new_node->children = NULL;
+    new_node->children_size = 0;
+    return new_node;
+}
+
+void add_child(Node *parent, Node *child)
+{
+    parent->children = (Node *)realloc(parent->children, sizeof(Node) * (parent->children_size + 1));
+    parent->children[parent->children_size] = *child;
+    parent->children_size++;
+}
+
+void free_tree(Node *root)
+{
+    int i;
+
+    if (!root)
+        return;
+
+    for (i = 0; i < root->children_size; i++)
+    {
+        free_tree(&root->children[i]);
+    }
+    free(root->children);
+    free(root);
+}
+
+void print_path(Node *node)
+{
+    if (node->parent)
+    {
+        print_path(node->parent);
+        printw(" > %s", node->name);
+    }
+    else
+    {
+        printw("%s", node->name);
+    }
+}
+
+char *get_path(Node *node)
+{
+    size_t path_size;
+    Node *current;
+    char *path;
+    char *new_path;
+
+    if (!node)
+    {
+        return NULL;
+    }
+
+    path_size = 1;
+    current = node;
+    while (current)
+    {
+        path_size += strlen(current->name) + 3;
+        current = current->parent;
+    }
+
+    path = (char *)malloc(path_size);
+    if (!path)
+    {
+        return NULL;
+    }
+    path[0] = '\0';
+
+    current = node;
+    while (current)
+    {
+        new_path = (char *)malloc(strlen(current->name) + strlen(path) + 4);
+        if (!new_path)
+        {
+            free(path);
+            return NULL;
+        }
+
+        if (path[0] == '\0')
+        {
+            snprintf(new_path, strlen(current->name) + 1, "%s", current->name);
+        }
+        else
+        {
+            snprintf(new_path, strlen(current->name) + strlen(path) + 4, "%s > %s", current->name, path);
+        }
+
+        free(path);
+        path = new_path;
+        current = current->parent;
+    }
+
+    return path;
+}
+
+void count_nodes(Node *node, int *count)
+{
+    int i;
+
+    if (node == NULL)
+        return;
+
+    (*count)++;
+
+    for (i = 0; i < node->children_size; i++)
+    {
+        count_nodes(&node->children[i], count);
+    }
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
new file mode 100644
index 000000000..0872b0b43
--- /dev/null
+++ b/tools/displaytop/src/populate.c
@@ -0,0 +1,32 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "data.h"
+#include "populate.h"
+
+void populate_data(void)
+{
+    root = create_node("Display Top", display_summary, NULL);
+
+    initialize_display_config();
+}
diff --git a/tools/displaytop/src/populate_display_config.c b/tools/displaytop/src/populate_display_config.c
new file mode 100644
index 000000000..a44efaf9e
--- /dev/null
+++ b/tools/displaytop/src/populate_display_config.c
@@ -0,0 +1,295 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "populate.h"
+
+int create_crtc_nodes(drmModeRes *resources, Node *parent_node, int filter);
+int create_connector_nodes(drmModeRes *resources, Node *parent_node, int filter);
+int create_encoder_nodes(drmModeRes *resources, Node *parent_node, int filter);
+int create_framebuffer_nodes(drmModeRes *resources, Node *parent_node, int filter);
+int create_plane_nodes(Node *parent_node, int filter);
+
+int create_crtc_nodes(drmModeRes *resources, Node *parent_node, int filter)
+{
+    int crtc_count;
+    int i;
+    char crtc_name[10];
+    Node *crtc_node;
+    drmModeCrtc *crtc;
+
+    crtc_count = resources->count_crtcs;
+    log_message(LOG_INFO, "Creating CRTC nodes");
+
+    for (i = 0; i < crtc_count; ++i)
+    {
+        if (filter != -1 && i != filter)
+        {
+            continue;
+        }
+
+        snprintf(crtc_name, sizeof(crtc_name), "CRTC%d", i % 100);
+        crtc_node = create_node(crtc_name, display_crtc, parent_node);
+
+        crtc = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
+        if (!crtc)
+        {
+            log_message(LOG_ERROR, "drmModeGetCrtc failed for CRTC %d", i % 100);
+            drmModeFreeResources(resources);
+            return 0;
+        }
+
+        create_plane_nodes(crtc_node, i);
+        create_encoder_nodes(resources, crtc_node, i);
+        create_connector_nodes(resources, crtc_node, i);
+
+        add_child(parent_node, crtc_node);
+
+        drmModeFreeCrtc(crtc);
+    }
+
+    return crtc_count;
+}
+
+int create_connector_nodes(drmModeRes *resources, Node *parent_node, int filter)
+{
+    int connector_count;
+    int i;
+    char connector_name[15];
+    Node *connector_node;
+
+    connector_count = resources->count_connectors;
+    log_message(LOG_INFO, "Creating Connector nodes");
+
+    for (i = 0; i < connector_count; ++i)
+    {
+        if (filter != -1 && i != filter)
+        {
+            continue;
+        }
+
+        snprintf(connector_name, sizeof(connector_name), "Connector%d", i % 100);
+        connector_node = create_node(connector_name, display_connector, parent_node);
+        add_child(parent_node, connector_node);
+    }
+
+    return connector_count;
+}
+
+int create_encoder_nodes(drmModeRes *resources, Node *parent_node, int filter)
+{
+    int encoder_count;
+    int i;
+    char encoder_name[15];
+    Node *encoder_node;
+
+    encoder_count = resources->count_encoders;
+    log_message(LOG_INFO, "Creating Encoder nodes");
+
+    for (i = 0; i < encoder_count; ++i)
+    {
+        if (filter != -1 && i != filter)
+        {
+            continue;
+        }
+
+        snprintf(encoder_name, sizeof(encoder_name), "Encoder%d", i % 100);
+        encoder_node = create_node(encoder_name, display_encoder, parent_node);
+        add_child(parent_node, encoder_node);
+    }
+
+    return encoder_count;
+}
+
+int create_framebuffer_nodes(drmModeRes *resources, Node *parent_node, int filter)
+{
+    int framebuffer_count;
+    int i;
+    char framebuffer_name[15];
+    Node *framebuffer_node;
+
+    framebuffer_count = resources->count_fbs;
+    log_message(LOG_INFO, "Creating Framebuffer nodes for %d framebuffers", framebuffer_count);
+
+    for (i = 0; i < framebuffer_count; ++i)
+    {
+        if (filter != -1 && i != filter)
+        {
+            continue;
+        }
+
+        snprintf(framebuffer_name, sizeof(framebuffer_name), "Framebuffer%d", i % 100);
+        framebuffer_node = create_node(framebuffer_name, display_framebuffer, parent_node);
+        add_child(parent_node, framebuffer_node);
+    }
+
+    return framebuffer_count;
+}
+
+int create_plane_nodes(Node *parent_node, int filter)
+{
+    drmModePlaneRes *plane_resources;
+    int plane_count;
+    int i;
+    drmModePlane *plane;
+    char plane_name[10];
+    char in_formats_name[15];
+    char out_formats_name[15];
+    Node *plane_node;
+    Node *in_formats_node;
+    Node *out_formats_node;
+
+    plane_resources = drmModeGetPlaneResources(drm_fd);
+    if (!plane_resources)
+    {
+        log_message(LOG_ERROR, "drmModeGetPlaneResources failed");
+        return 0;
+    }
+
+    plane_count = plane_resources->count_planes;
+    log_message(LOG_INFO, "Creating Plane nodes");
+
+    for (i = 0; i < plane_count; ++i)
+    {
+        plane = drmModeGetPlane(drm_fd, plane_resources->planes[i]);
+        if (!plane)
+        {
+            log_message(LOG_ERROR, "drmModeGetPlane failed for Plane %d", i % 100);
+            drmModeFreePlaneResources(plane_resources);
+            return 0;
+        }
+
+        if (filter != -1 && !(plane->possible_crtcs & (1 << filter)))
+        {
+            drmModeFreePlane(plane);
+            continue;
+        }
+
+        snprintf(plane_name, sizeof(plane_name), "Plane%d", i % 100);
+        plane_node = create_node(plane_name, display_plane, parent_node);
+
+        snprintf(in_formats_name, sizeof(in_formats_name), "IN_FORMATS%d", i % 100);
+        in_formats_node = create_node(in_formats_name, display_informats, plane_node);
+        add_child(plane_node, in_formats_node);
+
+        snprintf(out_formats_name, sizeof(out_formats_name), "FORMATS%d", i % 100);
+        out_formats_node = create_node(out_formats_name, display_formats, plane_node);
+        add_child(plane_node, out_formats_node);
+
+        add_child(parent_node, plane_node);
+        drmModeFreePlane(plane);
+    }
+
+    drmModeFreePlaneResources(plane_resources);
+    return plane_count;
+}
+
+void initialize_display_config(void)
+{
+    Node *display_config;
+    Node *crtc_nodes;
+    Node *plane_nodes;
+    Node *connector_nodes;
+    Node *encoder_nodes;
+    Node *framebuffer_nodes;
+    drmModeRes *resources;
+
+    log_message(LOG_INFO, "Initializing Display Configuration");
+
+    display_config = create_node("Display Configuration", NULL, root);
+    if (!display_config)
+    {
+        log_message(LOG_ERROR, "Failed to create Display Configuration node");
+        return;
+    }
+
+    if (drm_fd < 0)
+    {
+        log_message(LOG_ERROR, "Failed to open primary DRM device");
+        return;
+    }
+
+    resources = drmModeGetResources(drm_fd);
+    if (!resources)
+    {
+        log_message(LOG_ERROR, "drmModeGetResources failed");
+        return;
+    }
+
+    /* Create CRTC nodes */
+    crtc_nodes = create_node("CRTCs", NULL, display_config);
+    if (!crtc_nodes)
+    {
+        log_message(LOG_ERROR, "Failed to create CRTC nodes");
+        drmModeFreeResources(resources);
+        return;
+    }
+    create_crtc_nodes(resources, crtc_nodes, -1);
+    add_child(display_config, crtc_nodes);
+
+    /* Create Plane nodes */
+    plane_nodes = create_node("Planes", NULL, display_config);
+    if (!plane_nodes)
+    {
+        log_message(LOG_ERROR, "Failed to create Plane nodes");
+        drmModeFreeResources(resources);
+        return;
+    }
+    create_plane_nodes(plane_nodes, -1);
+    add_child(display_config, plane_nodes);
+
+    /* Create Connector nodes */
+    connector_nodes = create_node("Connectors", NULL, display_config);
+    if (!connector_nodes)
+    {
+        log_message(LOG_ERROR, "Failed to create Connector nodes");
+        drmModeFreeResources(resources);
+        return;
+    }
+    create_connector_nodes(resources, connector_nodes, -1);
+    add_child(display_config, connector_nodes);
+
+    /* Create Encoder nodes */
+    encoder_nodes = create_node("Encoders", NULL, display_config);
+    if (!encoder_nodes)
+    {
+        log_message(LOG_ERROR, "Failed to create Encoder nodes");
+        drmModeFreeResources(resources);
+        return;
+    }
+    create_encoder_nodes(resources, encoder_nodes, -1);
+    add_child(display_config, encoder_nodes);
+
+    /* Initialize Framebuffers */
+    framebuffer_nodes = create_node("Framebuffers", NULL, display_config);
+    if (!framebuffer_nodes)
+    {
+        log_message(LOG_ERROR, "Failed to create Framebuffer nodes");
+        drmModeFreeResources(resources);
+        return;
+    }
+    create_framebuffer_nodes(resources, framebuffer_nodes, -1);
+    add_child(display_config, framebuffer_nodes);
+
+    add_child(root, display_config);
+    drmModeFreeResources(resources);
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/utils.c b/tools/displaytop/src/utils.c
new file mode 100644
index 000000000..ec8c8a649
--- /dev/null
+++ b/tools/displaytop/src/utils.c
@@ -0,0 +1,102 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+
+char *read_file(const char *filename)
+{
+    FILE *file;
+    long length;
+    char *data;
+
+    file = fopen(filename, "rb");
+    if (!file)
+    {
+        log_message(LOG_ERROR, "File opening failed");
+        return NULL;
+    }
+
+    fseek(file, 0, SEEK_END);
+    length = ftell(file);
+    fseek(file, 0, SEEK_SET);
+
+    data = (char *)malloc(length + 1);
+    if (data)
+    {
+        fread(data, 1, length, file);
+        data[length] = '\0';
+    }
+
+    fclose(file);
+    return data;
+}
+
+void strip_whitespace(char *str)
+{
+    char *start;
+    char *end;
+
+    start = str;
+
+    while (isspace((unsigned char)*start))
+        start++;
+
+    if (*start == 0)
+    {
+        *str = 0;
+        return;
+    }
+
+    end = start + strlen(start) - 1;
+    while (end > start && isspace((unsigned char)*end))
+        end--;
+
+    *(end + 1) = 0;
+
+    if (start != str)
+        memmove(str, start, end - start + 2);
+}
+
+void ensure_dump_directory(void)
+{
+    struct stat st;
+    int stat_result;
+    int mkdir_result;
+
+    stat_result = stat(DUMP_DIR, &st);
+    if (stat_result == 0 && S_ISDIR(st.st_mode))
+    {
+        log_message(LOG_INFO, "Directory %s already exists.\n", DUMP_DIR);
+        return;
+    }
+
+    mkdir_result = mkdir(DUMP_DIR, 0755);
+    if (mkdir_result == 0)
+    {
+        log_message(LOG_INFO, "Directory %s created successfully.\n", DUMP_DIR);
+    }
+    else
+    {
+        log_message(LOG_ERROR, "mkdir failed: %s\n", strerror(errno));
+    }
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/utils_cli.c b/tools/displaytop/src/utils_cli.c
new file mode 100644
index 000000000..348169b4d
--- /dev/null
+++ b/tools/displaytop/src/utils_cli.c
@@ -0,0 +1,70 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+
+static void print_help(void)
+{
+    printf("Usage: sudo ./displaytop \n\n");
+
+    printf("for help: ./displaytop [OPTIONS]\n\n");
+    printf("Options:\n");
+    printf("  --help      Show this help message and exit\n");
+    printf("  --version   Show version information\n");
+    printf(" for more help read the documentation at the /docs folder. \n\n");
+
+    printf("ALL YOU NEED TO DO IS RUN THE TOOL WITH SUDO PERMISSION.\n\n");
+
+    printf("> Note:\n");
+    printf("> - Running DisplayTop without `sudo` may result in some menu options not being visible.\n");
+    printf("> - If the respective JSON files for MMIO and DPCD registers are not present, the corresponding menus will not be available.\n");
+    printf("> - The Ftrace menu will not be able to provide register name information without the aforementioned JSON files.\n\n");
+}
+
+static void print_version(void)
+{
+    printf("DisplayTop v1.0.0\n");
+}
+
+void handle_cli_args(int argc, char *argv[])
+{
+    if (argc > 1)
+    {
+        if (strcmp(argv[1], "--help") == 0)
+        {
+            print_help();
+            exit(0);
+        }
+        else if (strcmp(argv[1], "--version") == 0)
+        {
+            print_version();
+            exit(0);
+        }
+        else
+        {
+            printf("Unknown option: %s\n", argv[1]);
+            printf("Use --help for usage information.\n");
+            exit(1);
+        }
+    }
+}
diff --git a/tools/displaytop/src/utils_display.c b/tools/displaytop/src/utils_display.c
new file mode 100644
index 000000000..a1c9ad983
--- /dev/null
+++ b/tools/displaytop/src/utils_display.c
@@ -0,0 +1,195 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+
+void draw_header(WINDOW *win, int winWidth, const char *title, const char *helper)
+{
+    werase(win);
+    box(win, 0, 0);
+
+    wattron(win, A_BOLD);
+    mvwprintw(win, 1, 2, "%s", title);
+    mvwprintw(win, 1, winWidth - strlen(helper) - 2, "%s", helper);
+    wattroff(win, A_BOLD);
+
+    mvwhline(win, 2, 1, ACS_HLINE, winWidth - 2);
+    wrefresh(win);
+}
+
+void render_progress_bar(WINDOW *win, int current, int total)
+{
+    float progress;
+    int bar_start_y, bar_start_x, bar_width, filled, percent, i;
+
+    if (total == 0)
+        return;
+
+    progress = (float)current / total;
+    if (progress > 1.0f)
+        progress = 1.0f;
+
+    bar_start_y = 10;
+    bar_start_x = 2;
+    bar_width = getmaxx(win) - 14;
+    if (bar_width < 1)
+        return;
+
+    filled = (int)(progress * bar_width + 0.5f);
+
+    wattron(win, A_BOLD);
+    mvwprintw(win, bar_start_y, bar_start_x, "[");
+    wattroff(win, A_BOLD);
+
+    for (i = 0; i < bar_width; ++i)
+    {
+        if (i < filled)
+        {
+            wattron(win, COLOR_PAIR(7));
+            waddch(win, ' ');
+            wattroff(win, COLOR_PAIR(7));
+        }
+        else
+        {
+            wattron(win, COLOR_PAIR(2));
+            waddch(win, ' ');
+            wattroff(win, COLOR_PAIR(2));
+        }
+    }
+
+    wattron(win, A_BOLD);
+    waddch(win, ']');
+    percent = (int)(progress * 100.0f + 0.5f);
+    mvwprintw(win, bar_start_y, bar_start_x + bar_width + 2, "%3d%%", percent);
+    wattroff(win, A_BOLD);
+
+    wrefresh(win);
+}
+
+void print_bold_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+    va_list args;
+    va_start(args, text);
+
+    wattron(win, A_BOLD);
+    wmove(win, line, col);
+    vw_printw(win, text, args);
+    wattroff(win, A_BOLD);
+
+    va_end(args);
+}
+
+void print_dim_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+    va_list args;
+    va_start(args, text);
+
+    wattron(win, A_DIM);
+    wmove(win, line, col);
+    vw_printw(win, text, args);
+    wattroff(win, A_DIM);
+
+    va_end(args);
+}
+
+void print_red_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+    va_list args;
+    va_start(args, text);
+
+    wattron(win, COLOR_PAIR(3));
+    wmove(win, line, col);
+    vw_printw(win, text, args);
+    wattroff(win, COLOR_PAIR(3));
+
+    va_end(args);
+}
+
+void print_green_text(WINDOW *win, int line, int col, const char *text, ...)
+{
+    va_list args;
+    va_start(args, text);
+
+    wattron(win, COLOR_PAIR(2));
+    wmove(win, line, col);
+    vw_printw(win, text, args);
+    wattroff(win, COLOR_PAIR(2));
+
+    va_end(args);
+}
+
+void set_string(char *dest, const char *src, size_t size)
+{
+    strncpy(dest, src, size - 1);
+    dest[size - 1] = '\0';
+}
+
+int check_size_change(WINDOW *win, int *height, int *width)
+{
+    int new_height, new_width;
+    getmaxyx(win, new_height, new_width);
+    move(1, 25);
+    if (new_height != *height || new_width != *width)
+    {
+        *height = new_height;
+        *width = new_width;
+        return 1;
+    }
+    return 0;
+}
+
+void print_wrapped_text(WINDOW *pad, int *line, int start, int size, const char *text, bool enclose_with_pipe)
+{
+    const char *ptr;
+    int len, adjust_len;
+
+    if (!text || !pad || !line || size <= 0)
+        return;
+
+    ptr = text;
+
+    while (*ptr)
+    {
+        len = ((int)strlen(ptr) > size) ? size - 1 : (int)strlen(ptr);
+
+        /* To ensure truncation doesn't break any words */
+        if (len < (int)strlen(ptr) && ptr[len] != ' ' && ptr[len - 1] != ' ')
+        {
+            adjust_len = len;
+            while (adjust_len > 0 && ptr[adjust_len] != ' ')
+                adjust_len--;
+
+            if (adjust_len > 0)
+                len = adjust_len;
+        }
+
+        if (enclose_with_pipe)
+            mvwprintw(pad, (*line)++, start, "| %-*.*s |", size, len, ptr);
+        else
+            mvwprintw(pad, (*line)++, start, "%-*.*s", size, len, ptr);
+
+        ptr += len;
+        while (*ptr == ' ')
+            ptr++;
+    }
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/utils_driver.c b/tools/displaytop/src/utils_driver.c
new file mode 100644
index 000000000..7b24d2f41
--- /dev/null
+++ b/tools/displaytop/src/utils_driver.c
@@ -0,0 +1,189 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+
+static int is_driver_loaded(const char *driver)
+{
+    FILE *fp;
+    char buffer[1024];
+    int found = 0;
+
+    if (!driver)
+    {
+        log_message(LOG_ERROR, "Driver name is NULL.");
+        return 0;
+    }
+
+    fp = fopen("/proc/modules", "r");
+    if (!fp)
+    {
+        perror("Error opening /proc/modules");
+        return 0;
+    }
+
+    while (fgets(buffer, sizeof(buffer), fp))
+    {
+        if (strncmp(buffer, driver, strlen(driver)) == 0 && buffer[strlen(driver)] == ' ')
+        {
+            found = 1;
+            break;
+        }
+    }
+
+    fclose(fp);
+    return found;
+}
+
+static void load_driver(const char *driver)
+{
+    pid_t pid;
+
+    pid = fork();
+    if (pid == 0)
+    {
+        execlp("sudo", "sudo", "modprobe", driver, NULL);
+        exit(EXIT_FAILURE);
+    }
+    else if (pid < 0)
+    {
+        perror("Failed to fork process for modprobe");
+    }
+    else
+    {
+        wait(NULL);
+    }
+}
+
+static void show_driver_menu(void)
+{
+    int key;
+    int rows, cols;
+    WINDOW *win;
+    const char *options[] = {"Load i915", "Load xe", "Exit"};
+    int total_options = sizeof(options) / sizeof(options[0]);
+    int highlighted_index = 0;
+    int i;
+    int x_pos;
+    const char *driver;
+
+    getmaxyx(stdscr, rows, cols);
+
+    win = newwin(rows, cols, 0, 0);
+    if (!win)
+    {
+        log_message(LOG_ERROR, "Failed to create driver loading window.");
+        return;
+    }
+
+    if (!has_colors() || !COLOR_PAIR(2))
+    {
+        log_message(LOG_ERROR, "Colors not initialized properly.");
+        delwin(win);
+        return;
+    }
+
+    cbreak();
+    keypad(win, TRUE);
+    refresh();
+
+    wbkgd(win, COLOR_PAIR(2));
+    box(win, 0, 0);
+
+    while (1)
+    {
+        werase(win);
+        box(win, 0, 0);
+        mvwprintw(win, 2, (cols - 30) / 2, "Display Top - Select a Driver to Load");
+
+        for (i = 0; i < total_options; i++)
+        {
+            x_pos = (cols - strlen(options[i])) / 2;
+            if (x_pos < 0)
+                x_pos = 0;
+
+            if (i == highlighted_index)
+                wattron(win, A_REVERSE);
+
+            mvwprintw(win, rows / 2 + i, x_pos, "%s", options[i]);
+            wattroff(win, A_REVERSE);
+        }
+
+        mvwprintw(win, rows - 2, 2, "[UP/DOWN] Navigate [ENTER] Select [ESC] Exit");
+        wrefresh(win);
+
+        key = wgetch(win);
+
+        switch (key)
+        {
+        case KEY_UP:
+            highlighted_index = (highlighted_index == 0) ? total_options - 1 : highlighted_index - 1;
+            break;
+        case KEY_DOWN:
+            highlighted_index = (highlighted_index == total_options - 1) ? 0 : highlighted_index + 1;
+            break;
+        case '\n':
+            if (highlighted_index == 0 || highlighted_index == 1)
+            {
+                driver = (highlighted_index == 0) ? "i915" : "xe";
+                werase(win);
+                box(win, 0, 0);
+                mvwprintw(win, rows / 2, (cols - 30) / 2, "Loading driver: %s...", driver);
+                wrefresh(win);
+
+                load_driver(driver);
+
+                werase(win);
+                box(win, 0, 0);
+                mvwprintw(win, rows / 2, (cols - 30) / 2, "Driver %s loaded successfully.", driver);
+                mvwprintw(win, rows - 2, 2, "Press any key to continue...");
+                wrefresh(win);
+
+                wgetch(win);
+            }
+            delwin(win);
+            return;
+        case 27:
+            delwin(win);
+            return;
+        default:
+            break;
+        }
+    }
+}
+
+void check_and_load_driver(void)
+{
+    if (is_driver_loaded("i915"))
+    {
+        log_message(LOG_INFO, "i915 driver is already loaded.");
+    }
+    else if (is_driver_loaded("xe"))
+    {
+        log_message(LOG_INFO, "xe driver is already loaded.");
+    }
+    else
+    {
+        show_driver_menu();
+    }
+}
diff --git a/tools/displaytop/src/utils_drm.c b/tools/displaytop/src/utils_drm.c
new file mode 100644
index 000000000..fe5d8bc68
--- /dev/null
+++ b/tools/displaytop/src/utils_drm.c
@@ -0,0 +1,585 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
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
+	if (!drm_dir)
+	{
+		log_message(LOG_ERROR, "Failed to open /dev/dri directory");
+		return NULL;
+	}
+
+	prefix = primary ? DRM_PRIMARY_PREFIX : DRM_RENDER_PREFIX;
+	device_path = NULL;
+
+	while ((entry = readdir(drm_dir)) != NULL)
+	{
+		if (strncmp(entry->d_name, prefix, strlen(prefix)) == 0)
+		{
+			size_t path_len = strlen(DRM_DIR) + strlen(entry->d_name) + 1;
+			device_path = malloc(path_len);
+			if (!device_path)
+			{
+				log_message(LOG_ERROR, "Failed to allocate memory for device path");
+				break;
+			}
+			snprintf(device_path, path_len, "%s%s", DRM_DIR, entry->d_name);
+			break;
+		}
+	}
+
+	closedir(drm_dir);
+
+	if (!device_path)
+		log_message(LOG_ERROR, "No DRM %s devices found in %s", primary ? "primary (card*)" : "render (renderD*)", DRM_DIR);
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
+ * @warning Ensure that the `find_drm_device` function and `log_message` utility
+ *          are implemented correctly for this function to work as expected.
+ *
+ * @see drmDropMaster, drmSetClientCap
+ */
+void open_primary_drm_device(void)
+{
+	char *device_path = find_drm_device(true);
+	drm_fd = open(device_path, O_RDWR | O_CLOEXEC);
+
+	if (drm_fd < 0)
+		log_message(LOG_ERROR, "Failed to open DRM device");
+
+	if (drmDropMaster(drm_fd) < 0)
+		log_message(LOG_WARNING, "Master already being held by something else!");
+	else
+		log_message(LOG_INFO, "Dropped DRM master successfully");
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
+	if (drm_fd >= 0)
+	{
+		close(drm_fd);
+		drm_fd = -1;
+		log_message(LOG_INFO, "Closed DRM device");
+	}
+}
+
+const char *get_drm_object_type_name(uint32_t object_type)
+{
+	switch (object_type)
+	{
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
+	switch (connector_type)
+	{
+	case DRM_MODE_CONNECTOR_VGA:
+		return "VGA";
+	case DRM_MODE_CONNECTOR_DVII:
+		return "DVI-I";
+	case DRM_MODE_CONNECTOR_DVID:
+		return "DVI-D";
+	case DRM_MODE_CONNECTOR_DVIA:
+		return "DVI-A";
+	case DRM_MODE_CONNECTOR_Composite:
+		return "Composite";
+	case DRM_MODE_CONNECTOR_SVIDEO:
+		return "S-Video";
+	case DRM_MODE_CONNECTOR_LVDS:
+		return "LVDS";
+	case DRM_MODE_CONNECTOR_Component:
+		return "Component";
+	case DRM_MODE_CONNECTOR_9PinDIN:
+		return "9-pin DIN";
+	case DRM_MODE_CONNECTOR_DisplayPort:
+		return "DP";
+	case DRM_MODE_CONNECTOR_HDMIA:
+		return "HDMI-A";
+	case DRM_MODE_CONNECTOR_HDMIB:
+		return "HDMI-B";
+	case DRM_MODE_CONNECTOR_TV:
+		return "TV";
+	case DRM_MODE_CONNECTOR_eDP:
+		return "eDP";
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+		return "Virtual";
+	case DRM_MODE_CONNECTOR_DSI:
+		return "DSI";
+	case DRM_MODE_CONNECTOR_DPI:
+		return "DPI";
+	default:
+		return "Unknown";
+	}
+}
+
+const char *get_encoder_type_name(uint32_t encoder_type)
+{
+	switch (encoder_type)
+	{
+	case DRM_MODE_ENCODER_NONE:
+		return "None";
+	case DRM_MODE_ENCODER_DAC:
+		return "DAC";
+	case DRM_MODE_ENCODER_TMDS:
+		return "TMDS";
+	case DRM_MODE_ENCODER_LVDS:
+		return "LVDS";
+	case DRM_MODE_ENCODER_TVDAC:
+		return "TVDAC";
+	case DRM_MODE_ENCODER_VIRTUAL:
+		return "Virtual";
+	case DRM_MODE_ENCODER_DSI:
+		return "DSI";
+	case DRM_MODE_ENCODER_DPMST:
+		return "DPMST";
+	default:
+		return "Unknown";
+	}
+}
+
+const char *get_format_str(uint32_t format)
+{
+	switch (format)
+	{
+	case DRM_FORMAT_INVALID:
+		return "INVALID";
+	case DRM_FORMAT_C1:
+		return "C1";
+	case DRM_FORMAT_C2:
+		return "C2";
+	case DRM_FORMAT_C4:
+		return "C4";
+	case DRM_FORMAT_C8:
+		return "C8";
+	case DRM_FORMAT_D1:
+		return "D1";
+	case DRM_FORMAT_D2:
+		return "D2";
+	case DRM_FORMAT_D4:
+		return "D4";
+	case DRM_FORMAT_D8:
+		return "D8";
+	case DRM_FORMAT_R1:
+		return "R1";
+	case DRM_FORMAT_R2:
+		return "R2";
+	case DRM_FORMAT_R4:
+		return "R4";
+	case DRM_FORMAT_R8:
+		return "R8";
+	case DRM_FORMAT_R10:
+		return "R10";
+	case DRM_FORMAT_R12:
+		return "R12";
+	case DRM_FORMAT_R16:
+		return "R16";
+	case DRM_FORMAT_RG88:
+		return "RG88";
+	case DRM_FORMAT_GR88:
+		return "GR88";
+	case DRM_FORMAT_RG1616:
+		return "RG1616";
+	case DRM_FORMAT_GR1616:
+		return "GR1616";
+	case DRM_FORMAT_RGB332:
+		return "RGB332";
+	case DRM_FORMAT_BGR233:
+		return "BGR233";
+	case DRM_FORMAT_XRGB4444:
+		return "XRGB4444";
+	case DRM_FORMAT_XBGR4444:
+		return "XBGR4444";
+	case DRM_FORMAT_RGBX4444:
+		return "RGBX4444";
+	case DRM_FORMAT_BGRX4444:
+		return "BGRX4444";
+	case DRM_FORMAT_ARGB4444:
+		return "ARGB4444";
+	case DRM_FORMAT_ABGR4444:
+		return "ABGR4444";
+	case DRM_FORMAT_RGBA4444:
+		return "RGBA4444";
+	case DRM_FORMAT_BGRA4444:
+		return "BGRA4444";
+	case DRM_FORMAT_XRGB1555:
+		return "XRGB1555";
+	case DRM_FORMAT_XBGR1555:
+		return "XBGR1555";
+	case DRM_FORMAT_RGBX5551:
+		return "RGBX5551";
+	case DRM_FORMAT_BGRX5551:
+		return "BGRX5551";
+	case DRM_FORMAT_ARGB1555:
+		return "ARGB1555";
+	case DRM_FORMAT_ABGR1555:
+		return "ABGR1555";
+	case DRM_FORMAT_RGBA5551:
+		return "RGBA5551";
+	case DRM_FORMAT_BGRA5551:
+		return "BGRA5551";
+	case DRM_FORMAT_RGB565:
+		return "RGB565";
+	case DRM_FORMAT_BGR565:
+		return "BGR565";
+	case DRM_FORMAT_RGB888:
+		return "RGB888";
+	case DRM_FORMAT_BGR888:
+		return "BGR888";
+	case DRM_FORMAT_XRGB8888:
+		return "XRGB8888";
+	case DRM_FORMAT_XBGR8888:
+		return "XBGR8888";
+	case DRM_FORMAT_RGBX8888:
+		return "RGBX8888";
+	case DRM_FORMAT_BGRX8888:
+		return "BGRX8888";
+	case DRM_FORMAT_ARGB8888:
+		return "ARGB8888";
+	case DRM_FORMAT_ABGR8888:
+		return "ABGR8888";
+	case DRM_FORMAT_RGBA8888:
+		return "RGBA8888";
+	case DRM_FORMAT_BGRA8888:
+		return "BGRA8888";
+	case DRM_FORMAT_XRGB2101010:
+		return "XRGB2101010";
+	case DRM_FORMAT_XBGR2101010:
+		return "XBGR2101010";
+	case DRM_FORMAT_RGBX1010102:
+		return "RGBX1010102";
+	case DRM_FORMAT_BGRX1010102:
+		return "BGRX1010102";
+	case DRM_FORMAT_ARGB2101010:
+		return "ARGB2101010";
+	case DRM_FORMAT_ABGR2101010:
+		return "ABGR2101010";
+	case DRM_FORMAT_RGBA1010102:
+		return "RGBA1010102";
+	case DRM_FORMAT_BGRA1010102:
+		return "BGRA1010102";
+	case DRM_FORMAT_XRGB16161616:
+		return "XRGB16161616";
+	case DRM_FORMAT_XBGR16161616:
+		return "XBGR16161616";
+	case DRM_FORMAT_ARGB16161616:
+		return "ARGB16161616";
+	case DRM_FORMAT_ABGR16161616:
+		return "ABGR16161616";
+	case DRM_FORMAT_XRGB16161616F:
+		return "XRGB16161616F";
+	case DRM_FORMAT_XBGR16161616F:
+		return "XBGR16161616F";
+	case DRM_FORMAT_ARGB16161616F:
+		return "ARGB16161616F";
+	case DRM_FORMAT_ABGR16161616F:
+		return "ABGR16161616F";
+	case DRM_FORMAT_AXBXGXRX106106106106:
+		return "AXBXGXRX106106106106";
+	case DRM_FORMAT_YUYV:
+		return "YUYV";
+	case DRM_FORMAT_YVYU:
+		return "YVYU";
+	case DRM_FORMAT_UYVY:
+		return "UYVY";
+	case DRM_FORMAT_VYUY:
+		return "VYUY";
+	case DRM_FORMAT_AYUV:
+		return "AYUV";
+	case DRM_FORMAT_AVUY8888:
+		return "AVUY8888";
+	case DRM_FORMAT_XYUV8888:
+		return "XYUV8888";
+	case DRM_FORMAT_XVUY8888:
+		return "XVUY8888";
+	case DRM_FORMAT_VUY888:
+		return "VUY888";
+	case DRM_FORMAT_VUY101010:
+		return "VUY101010";
+	case DRM_FORMAT_Y210:
+		return "Y210";
+	case DRM_FORMAT_Y212:
+		return "Y212";
+	case DRM_FORMAT_Y216:
+		return "Y216";
+	case DRM_FORMAT_Y410:
+		return "Y410";
+	case DRM_FORMAT_Y412:
+		return "Y412";
+	case DRM_FORMAT_Y416:
+		return "Y416";
+	case DRM_FORMAT_XVYU2101010:
+		return "XVYU2101010";
+	case DRM_FORMAT_XVYU12_16161616:
+		return "XVYU12_16161616";
+	case DRM_FORMAT_XVYU16161616:
+		return "XVYU16161616";
+	case DRM_FORMAT_Y0L0:
+		return "Y0L0";
+	case DRM_FORMAT_X0L0:
+		return "X0L0";
+	case DRM_FORMAT_Y0L2:
+		return "Y0L2";
+	case DRM_FORMAT_X0L2:
+		return "X0L2";
+	case DRM_FORMAT_YUV420_8BIT:
+		return "YUV420_8BIT";
+	case DRM_FORMAT_YUV420_10BIT:
+		return "YUV420_10BIT";
+	case DRM_FORMAT_XRGB8888_A8:
+		return "XRGB8888_A8";
+	case DRM_FORMAT_XBGR8888_A8:
+		return "XBGR8888_A8";
+	case DRM_FORMAT_RGBX8888_A8:
+		return "RGBX8888_A8";
+	case DRM_FORMAT_BGRX8888_A8:
+		return "BGRX8888_A8";
+	case DRM_FORMAT_RGB888_A8:
+		return "RGB888_A8";
+	case DRM_FORMAT_BGR888_A8:
+		return "BGR888_A8";
+	case DRM_FORMAT_RGB565_A8:
+		return "RGB565_A8";
+	case DRM_FORMAT_BGR565_A8:
+		return "BGR565_A8";
+	case DRM_FORMAT_NV12:
+		return "NV12";
+	case DRM_FORMAT_NV21:
+		return "NV21";
+	case DRM_FORMAT_NV16:
+		return "NV16";
+	case DRM_FORMAT_NV61:
+		return "NV61";
+	case DRM_FORMAT_NV24:
+		return "NV24";
+	case DRM_FORMAT_NV42:
+		return "NV42";
+	case DRM_FORMAT_NV15:
+		return "NV15";
+	case DRM_FORMAT_NV20:
+		return "NV20";
+	case DRM_FORMAT_NV30:
+		return "NV30";
+	case DRM_FORMAT_P210:
+		return "P210";
+	case DRM_FORMAT_P010:
+		return "P010";
+	case DRM_FORMAT_P012:
+		return "P012";
+	case DRM_FORMAT_P016:
+		return "P016";
+	case DRM_FORMAT_P030:
+		return "P030";
+	case DRM_FORMAT_Q410:
+		return "Q410";
+	case DRM_FORMAT_Q401:
+		return "Q401";
+	case DRM_FORMAT_YUV410:
+		return "YUV410";
+	case DRM_FORMAT_YVU410:
+		return "YVU410";
+	case DRM_FORMAT_YUV411:
+		return "YUV411";
+	case DRM_FORMAT_YVU411:
+		return "YVU411";
+	case DRM_FORMAT_YUV420:
+		return "YUV420";
+	case DRM_FORMAT_YVU420:
+		return "YVU420";
+	case DRM_FORMAT_YUV422:
+		return "YUV422";
+	case DRM_FORMAT_YVU422:
+		return "YVU422";
+	case DRM_FORMAT_YUV444:
+		return "YUV444";
+	case DRM_FORMAT_YVU444:
+		return "YVU444";
+	default:
+		return "unknown";
+	}
+}
+
+const char *get_basic_modifier_str(uint64_t modifier)
+{
+	switch (modifier)
+	{
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
index 000000000..449347b51
--- /dev/null
+++ b/tools/displaytop/src/utils_search.c
@@ -0,0 +1,49 @@
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "node.h"
+#include "utils.h"
+
+void search_nodes(Node *node, const char *searchInput, Node *results)
+{
+    if (node == NULL)
+    {
+        return;
+    }
+
+    if (strstr(node->name, searchInput) != NULL)
+    {
+        add_child(results, node);
+        return;
+    }
+
+    for (int i = 0; i < node->children_size; i++)
+    {
+        search_nodes(&node->children[i], searchInput, results);
+    }
+
+    return;
+}
\ No newline at end of file
diff --git a/tools/meson.build b/tools/meson.build
index f091af380..a5b02550d 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -121,3 +121,4 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+subdir('displaytop')
-- 
2.43.0

