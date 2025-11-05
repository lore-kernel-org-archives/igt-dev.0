Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D3CCFA07
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 06:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA110E177;
	Wed,  5 Nov 2025 06:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3KAEVoa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55410E177
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 06:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762322460; x=1793858460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpKB4V6BZMGlgmJoznYwiRPb/yVz4tuw1pMYK9+7GOg=;
 b=M3KAEVoarDgsluMCe5dSFWx9z8SRhrDN3O27fmrN8eYeJwS1TixrNUq3
 vUw2QmCpmSsqSlcrKXKSmJphoMEDPVsNIKIilLx5JObdopBkq3ta61Q7F
 J6a8F6qv+IIlAwWCgtJYYxH5JAweShAkprfTP9s3HGn+JVk+cFFJdKE7B
 FxmkAIEi4GIH2Yp/sIXU3ZqROdQ05xn6NuL0y4aD11rfSwwyVbvg3LsGv
 sIRMtwFmPtXAAHqcu08EMDCQ63c7C1yj9tYlFaMorMiUHTi8ehkBWlnI7
 9GzUHbHhzx2Yn0RJhgsNN8urjzhR4q5wVyP9wHqnPkkPDi2pJCmVrh7+D Q==;
X-CSE-ConnectionGUID: Z7tn2CnsQBarL2FhScQhFg==
X-CSE-MsgGUID: O5PmX0pRTUCrAzkxoOZcDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89891826"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="89891826"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 22:00:59 -0800
X-CSE-ConnectionGUID: 5W8OszktRrS9Wzu1jHuQvw==
X-CSE-MsgGUID: pYGTuPpWTouKRitGhhUDJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186652040"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 22:00:57 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t v2 2/4] tools/displaytop: Add Display debugfs entry for
 display top
Date: Wed,  5 Nov 2025 11:39:12 +0530
Message-Id: <20251105060914.673664-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251105060914.673664-1-pranay.samala@intel.com>
References: <20251105060914.673664-1-pranay.samala@intel.com>
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

This patch adds support for reading the Display debugfs entry to fetch
display pipeline information used in the Display Top tool.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
Co-authored-by: Pranay Samala <pranay.samala@intel.com>
---
 tools/displaytop/README.md                    |   1 +
 tools/displaytop/include/data.h               |   2 +
 tools/displaytop/include/display.h            |   2 +
 tools/displaytop/include/populate.h           |   1 +
 tools/displaytop/include/utils.h              |   2 +
 tools/displaytop/meson.build                  |   7 +
 tools/displaytop/src/display_debugfs.c        | 124 ++++++++++++++++++
 tools/displaytop/src/populate.c               |   1 +
 .../displaytop/src/populate_display_debugfs.c |  96 ++++++++++++++
 tools/displaytop/src/utils_driver.c           |  16 +++
 10 files changed, 252 insertions(+)
 create mode 100644 tools/displaytop/src/display_debugfs.c
 create mode 100644 tools/displaytop/src/populate_display_debugfs.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index 299445a0e..34bab6772 100644
--- a/tools/displaytop/README.md
+++ b/tools/displaytop/README.md
@@ -7,6 +7,7 @@ A terminal-based tool for monitoring and debugging the display pipeline.
 - Terminal UI using `ncurses`
 - Dump feature for all the menus
 - Real-time display Configuration
+- view Live Display Debugfs in a terminal ui
 
 ---
 
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
index d2698ecae..1c3e1094c 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -35,4 +35,6 @@ extern struct Node *root; /* shared throughout the program */
 #define DRM_PRIMARY_PREFIX "card"
 #define DRM_RENDER_PREFIX "renderD"
 
+#define DEBUGFS_DRI_PATH "/sys/kernel/debug/dri"
+
 #endif
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index ee07694a4..bcf1bc0ae 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -44,4 +44,6 @@ void display_framebuffer(WINDOW *pad, struct Node *node, int *content_line);
 
 void display_summary(WINDOW *pad, struct Node *node, int *content_line);
 
+void display_debugfs_file(WINDOW *pad, struct Node *node, int *content_line);
+
 #endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index b4056d084..340fb7679 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -34,5 +34,6 @@
 void populate_data(void);
 
 void initialize_display_config(void);
+void initialize_display_debugfs(void);
 
 #endif
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index 3f5a1f620..8f771d7b4 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -122,4 +122,6 @@ const char *get_basic_modifier_str(uint64_t modifier);
 const char *get_connector_type_name(uint32_t connector_type);
 const char *get_encoder_type_name(uint32_t encoder_type);
 
+char *find_debugfs_dir(int drm_fd);
+
 #endif
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index 082386198..a56f966f7 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -38,6 +38,11 @@ if have_displaytop
     menu_dep,
     form_dep,
     panel_dep,
+    igt_deps,
+    lib_igt_perf,
+    lib_igt_drm_clients,
+    lib_igt_drm_fdinfo,
+    lib_igt_profiling,
   ]
   # Source files
   source = files(
@@ -58,6 +63,8 @@ if have_displaytop
     'src/utils_driver.c',
     'src/utils_drm.c',
     'src/utils_search.c',
+    'src/populate_display_debugfs.c',
+    'src/display_debugfs.c',
   )
 
   if meson.is_subproject()
diff --git a/tools/displaytop/src/display_debugfs.c b/tools/displaytop/src/display_debugfs.c
new file mode 100644
index 000000000..9a36416d8
--- /dev/null
+++ b/tools/displaytop/src/display_debugfs.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: MIT
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
+#include <stdio.h>
+#include <stdlib.h>
+#include "igt.h"
+
+/**
+ * /docs
+ * build_full_path - Constructs the full filesystem path for a given node in the debugfs tree.
+ * @node:       Pointer to the Node structure for which the path is to be built.
+ * @full_path:  Buffer to store the resulting full path as a null-terminated string.
+ * @size:       Size of the @full_path buffer.
+ *
+ * This function traverses the parent hierarchy of the given node, collecting
+ * each node's name (excluding a trailing '*' if present), and constructs the
+ * relative path from the root node named "Display Debugfs" down to the given node.
+ * The resulting path is prefixed with the debugfs directory path (as returned by
+ * find_debugfs_dir()) and stored in @full_path.
+ *
+ * The function ensures that the constructed path does not exceed the provided buffer size.
+ */
+static void build_full_path(struct Node *node, char *full_path, size_t size)
+{
+	int i;
+	int depth = 0;
+	char segments[20][256];
+	char relative_path[1024] = {0};
+
+	while (node && node->parent && strcmp(node->name, "Display Debugfs") != 0) {
+		char *name = node->name;
+		size_t name_len = strlen(name);
+
+		if (name_len > 0 && name[name_len - 1] == '*')
+			snprintf(segments[depth], sizeof(segments[depth]), "%.*s",
+				 (int)(name_len - 1), name);
+		else
+			snprintf(segments[depth], sizeof(segments[depth]), "%s", name);
+
+		depth++;
+		node = node->parent;
+	}
+
+	for (i = depth - 1; i >= 0; i--) {
+		strncat(relative_path, "/", sizeof(relative_path) - strlen(relative_path) - 1);
+		strncat(relative_path, segments[i],
+			sizeof(relative_path) - strlen(relative_path) - 1);
+	}
+
+	snprintf(full_path, size, "%s%s", find_debugfs_dir(drm_fd), relative_path);
+}
+
+void display_debugfs_file(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	int max_x = getmaxx(pad) - 4;
+	int start, break_point;
+
+	FILE *file;
+	char temp[1024];
+	char buffer[1024];
+	char full_file_path[1024] = {0};
+
+	build_full_path(node, full_file_path, sizeof(full_file_path));
+
+	file = fopen(full_file_path, "r");
+	if (!file) {
+		print_red_text(pad, line++, 1, "Error opening file: %s", full_file_path);
+		*content_line = line;
+		return;
+	}
+
+	while (fgets(buffer, sizeof(buffer), file)) {
+		buffer[strcspn(buffer, "\n")] = '\0';
+
+		start = 0;
+		while (start < (int)strlen(buffer)) {
+			break_point = start + max_x;
+			if (break_point < (int)strlen(buffer)) {
+				while (break_point > start && !isspace(buffer[break_point]))
+					break_point--;
+				if (break_point == start)
+					break_point = start + max_x;
+			} else {
+				break_point = strlen(buffer);
+			}
+
+			strncpy(temp, buffer + start, break_point - start);
+			temp[break_point - start] = '\0';
+
+			mvwprintw(pad, line++, 2, "%s", temp);
+			start = (buffer[break_point] == ' ') ? break_point + 1 : break_point;
+		}
+	}
+
+	line++;
+	mvwprintw(pad, line++, 2, "-----------------EOF-------------------");
+
+	*content_line = line;
+	fclose(file);
+}
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
index 7109249f9..7963523d5 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -29,4 +29,5 @@ void populate_data(void)
 {
 	root = create_node("Display Top", display_summary, NULL);
 	initialize_display_config();
+	initialize_display_debugfs();
 }
diff --git a/tools/displaytop/src/populate_display_debugfs.c b/tools/displaytop/src/populate_display_debugfs.c
new file mode 100644
index 000000000..fc0ed8a83
--- /dev/null
+++ b/tools/displaytop/src/populate_display_debugfs.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
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
+#include "utils.h"
+#include <stdlib.h>
+#include <stdio.h>
+#include "igt.h"
+
+static void populate_debugfs_recursive(struct Node *parent, const char *currentPath)
+{
+	DIR *dir;
+	struct dirent *entry;
+	char full_path[1024];
+	char dir_name_with_asterisk[1024];
+	struct stat pathStat;
+	struct Node *fileNode;
+	struct Node *dirNode;
+
+	dir = opendir(currentPath);
+	if (!dir) {
+		log_message(LOG_ERROR, "Failed to open directory: %s", currentPath);
+		return;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		snprintf(full_path, sizeof(full_path), "%s/%s", currentPath, entry->d_name);
+
+		if (stat(full_path, &pathStat) == -1) {
+			log_message(LOG_WARNING, "Could not stat path: %s", full_path);
+			continue;
+		}
+
+		if (S_ISREG(pathStat.st_mode)) {
+			fileNode = create_node(entry->d_name, display_debugfs_file, parent);
+			add_child(parent, fileNode);
+		} else if (S_ISDIR(pathStat.st_mode)) {
+			snprintf(dir_name_with_asterisk, sizeof(dir_name_with_asterisk), "%s*",
+				 entry->d_name);
+			dirNode = create_node(dir_name_with_asterisk, NULL, parent);
+			populate_debugfs_recursive(dirNode, full_path);
+			add_child(parent, dirNode);
+		}
+	}
+
+	closedir(dir);
+}
+
+static void populate_debugfs(struct Node *parent)
+{
+	char *selected_path = find_debugfs_dir(drm_fd);
+
+	if (!selected_path)
+		return;
+
+	populate_debugfs_recursive(parent, selected_path);
+	free(selected_path);
+}
+
+void initialize_display_debugfs(void)
+{
+	struct Node *display_debugfs;
+
+	display_debugfs = create_node("Display Debugfs", NULL, root);
+	populate_debugfs(display_debugfs);
+
+	if (display_debugfs->children_size == 0) {
+		free(display_debugfs);
+		return;
+	}
+	add_child(root, display_debugfs);
+}
diff --git a/tools/displaytop/src/utils_driver.c b/tools/displaytop/src/utils_driver.c
index 53fdbec19..1df23f6db 100644
--- a/tools/displaytop/src/utils_driver.c
+++ b/tools/displaytop/src/utils_driver.c
@@ -23,6 +23,7 @@
  */
 
 #include "utils.h"
+#include "igt_debugfs.h"
 
 static int is_driver_loaded(const char *driver)
 {
@@ -168,3 +169,18 @@ void check_and_load_driver(void)
 	else
 		show_driver_menu();
 }
+
+char *find_debugfs_dir(int fd)
+{
+	char *path = malloc(PATH_MAX);
+
+	if (!path)
+		return 0;
+
+	if (!igt_debugfs_path(fd, path, PATH_MAX)) {
+		free(path);
+		return 0;
+	}
+
+	return path;
+}
-- 
2.34.1

