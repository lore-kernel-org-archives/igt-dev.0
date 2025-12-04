Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF4D1D866
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE7510E843;
	Thu,  4 Dec 2025 05:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qm7BlWCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CA610E843
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825520; x=1796361520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uFoFS3uQ0wk4lkcTOBsKaThXKsEoXMz9Q7jBgxUxfs0=;
 b=Qm7BlWCepjVtkqQ7Ayf9V3zpjwQaVfdLydn6WkTu0bZLDPy0yikWt6AC
 oFt94BE/YPKjBg//nlBBLLnHVrO73nKZfrqrfkyMgMFb9CYATbWrqOa4o
 25/F7IuTpmQFrrowl3yUbjNJIxVrv1xeNnevvZzU0POHSHfIcdXm+A0Cg
 zrakN/2eIZwfqyz17B3tXWNQxeCjqp1sp6vcBPYQiP7nZLqoswft7JqV4
 qpDPVgX52ErbsRRVTaK80gqImLZwgmmN8C0WIjAzE6QdcQr9Ed/2os/b9
 b8EtK+PCOEVpdB++UO51UkUp6suWmF1La8k6hgA2sxWLoazsjDC6s4CCJ w==;
X-CSE-ConnectionGUID: +GVEEw7xQWyU/AU1EWHt+A==
X-CSE-MsgGUID: iBIhhx57QD2UlR7PznMG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314598"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:18:39 -0800
X-CSE-ConnectionGUID: VbLwSLs1S1e56gblMA5/lQ==
X-CSE-MsgGUID: LqZCSiKcR8GvGrKCBohsyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199303587"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 03 Dec 2025 21:18:38 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t v3 2/4] tools/displaytop: Add Display debugfs entry for
 display top
Date: Thu,  4 Dec 2025 10:56:56 +0530
Message-Id: <20251204052658.232429-3-pranay.samala@intel.com>
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

This patch adds support for reading the Display debugfs entry to fetch
display pipeline information used in the Display Top tool.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
Co-authored-by: Pranay Samala <pranay.samala@intel.com>
---
 tools/displaytop/README.md                    |   1 +
 tools/displaytop/include/data.h               |   1 +
 tools/displaytop/include/display.h            |   1 +
 tools/displaytop/include/populate.h           |   1 +
 tools/displaytop/include/utils.h              |   1 +
 tools/displaytop/meson.build                  |   7 ++
 tools/displaytop/src/display_debugfs.c        | 103 ++++++++++++++++++
 tools/displaytop/src/populate.c               |   1 +
 .../displaytop/src/populate_display_debugfs.c |  72 ++++++++++++
 tools/displaytop/src/utils_driver.c           |  16 +++
 10 files changed, 204 insertions(+)
 create mode 100644 tools/displaytop/src/display_debugfs.c
 create mode 100644 tools/displaytop/src/populate_display_debugfs.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index ce0a3ca84..044d0ea59 100644
--- a/tools/displaytop/README.md
+++ b/tools/displaytop/README.md
@@ -7,6 +7,7 @@ A terminal-based tool for monitoring and debugging the display pipeline.
 - Terminal UI using `ncurses`
 - Dump feature for all the menus
 - Real-time display Configuration
+- view Live Display Debugfs in a terminal ui
 
 ---
 
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
index ca15dfdce..fb68ac2d0 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -13,5 +13,6 @@ extern struct node *root; /* shared throughout the program */
 #define DRM_DIR "/dev/dri/"
 #define DRM_PRIMARY_PREFIX "card"
 #define DRM_RENDER_PREFIX "renderD"
+#define DEBUGFS_DRI_PATH "/sys/kernel/debug/dri"
 
 #endif
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index 97f7561b8..8ca1e2e1d 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -21,5 +21,6 @@ void display_informats(WINDOW *pad, struct node *node, int *content_line);
 void display_framebuffer(WINDOW *pad, struct node *node, int *content_line);
 
 void display_summary(WINDOW *pad, struct node *node, int *content_line);
+void display_debugfs_file(WINDOW *pad, struct node *node, int *content_line);
 
 #endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index 9fb45a9ec..7678d3206 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -13,5 +13,6 @@
 void populate_data(void);
 
 void initialize_display_config(void);
+void initialize_display_debugfs(void);
 
 #endif
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index 645ffc298..6d38d1c5d 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -95,5 +95,6 @@ const char *get_format_str(uint32_t format);
 const char *get_basic_modifier_str(uint64_t modifier);
 const char *get_connector_type_name(uint32_t connector_type);
 const char *get_encoder_type_name(uint32_t encoder_type);
+char *find_debugfs_dir(int drm_fd);
 
 #endif
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index e974db4d7..34003b0dd 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -33,6 +33,11 @@ if have_displaytop
     panel_dep,
     lib_igt,
     cairo,
+    igt_deps,
+    lib_igt_perf,
+    lib_igt_drm_clients,
+    lib_igt_drm_fdinfo,
+    lib_igt_profiling,
   ]
   # Source files
   source = files(
@@ -52,6 +57,8 @@ if have_displaytop
     'src/utils_driver.c',
     'src/utils_drm.c',
     'src/utils_search.c',
+    'src/populate_display_debugfs.c',
+    'src/display_debugfs.c',
   )
 
    executable(
diff --git a/tools/displaytop/src/display_debugfs.c b/tools/displaytop/src/display_debugfs.c
new file mode 100644
index 000000000..182df7e11
--- /dev/null
+++ b/tools/displaytop/src/display_debugfs.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
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
+ * @node:       Pointer to the node structure for which the path is to be built.
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
+static void build_full_path(struct node *node, char *full_path, size_t size)
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
+void display_debugfs_file(WINDOW *pad, struct node *node, int *content_line)
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
+			snprintf(temp, break_point - start, "%s", buffer + start);
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
index 0d88ddbdc..808017e15 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -8,4 +8,5 @@ void populate_data(void)
 {
 	root = create_node("Display Top", display_summary, NULL);
 	initialize_display_config();
+	initialize_display_debugfs();
 }
diff --git a/tools/displaytop/src/populate_display_debugfs.c b/tools/displaytop/src/populate_display_debugfs.c
new file mode 100644
index 000000000..91b40e83d
--- /dev/null
+++ b/tools/displaytop/src/populate_display_debugfs.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "populate.h"
+#include "utils.h"
+#include <stdlib.h>
+#include <stdio.h>
+#include "igt.h"
+
+static void populate_debugfs_recursive(struct node *parent, const char *currentpath)
+{
+	DIR *dir;
+	struct dirent *entry;
+	char full_path[1024];
+	char dir_name_with_asterisk[1024];
+	struct stat pathStat;
+	struct node *filenode;
+	struct node *dirnode;
+
+	dir = opendir(currentpath);
+	igt_require_f(dir, "Failed to open directory: %s", currentpath);
+
+	while ((entry = readdir(dir)) != NULL) {
+		if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		snprintf(full_path, sizeof(full_path), "%s/%s", currentpath, entry->d_name);
+
+		if (stat(full_path, &pathStat) == -1) {
+			igt_warn("Could not stat path: %s", full_path);
+			continue;
+		}
+
+		if (S_ISREG(pathStat.st_mode)) {
+			filenode = create_node(entry->d_name, display_debugfs_file, parent);
+			add_child(parent, filenode);
+		} else if (S_ISDIR(pathStat.st_mode)) {
+			snprintf(dir_name_with_asterisk, sizeof(dir_name_with_asterisk), "%s*",
+				 entry->d_name);
+			dirnode = create_node(dir_name_with_asterisk, NULL, parent);
+			populate_debugfs_recursive(dirnode, full_path);
+			add_child(parent, dirnode);
+		}
+	}
+
+	closedir(dir);
+}
+
+static void populate_debugfs(struct node *parent)
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
+	struct node *display_debugfs;
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
index 382bfc121..3e2855fa0 100644
--- a/tools/displaytop/src/utils_driver.c
+++ b/tools/displaytop/src/utils_driver.c
@@ -5,6 +5,7 @@
 #include "igt_core.h"
 #include "igt_kmod.h"
 #include "drmtest.h"
+#include "igt_debugfs.h"
 
 static void show_driver_menu(void)
 {
@@ -116,3 +117,18 @@ void check_and_load_driver(void)
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

