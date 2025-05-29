Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A9C5B549
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9C510E737;
	Thu, 29 May 2025 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEHqRl7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FF510E73E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528755; x=1780064755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFVCAzlw9i7XKzSL1O2luYjyxaH4oKFTjJBsOYSNhUY=;
 b=NEHqRl7WRCVo4Xfb1CYcpwJtecFGqC4Y9J0USfUAqy7/uKp9sTIDgVsi
 9Vj1DeByzIEqUfELn3DtcFgErwwoDQmMRSWti6t4UFBKqgX1bznspEk6f
 z/ORt/zMNhfzbgc6dTx5ZLKs7zNIGgEfY9adEKGny+lnVCVtSdsVmiERp
 DbZ8C775nMdc1Pn/c4+4qFwvzW27xSMHRGPX41n+O/yd2OlZao05b0hTs
 AaxKd/R38lR2SlrmB2+wcqA1OasmaYv3Qm5uU9n5njmywfxq1r1Aflm+W
 Pa2n6ViaWDNI9qnb1evt+HeXaJOXC1SvRSBiHJq4fShaSNCVK4jW7efAg Q==;
X-CSE-ConnectionGUID: wrGbRnh6Q9S0I9UZxDpEkw==
X-CSE-MsgGUID: /9aUEXkASFG3gYwnYbokZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50477232"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50477232"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:25:54 -0700
X-CSE-ConnectionGUID: Tp8gq45HRaeJ4v4RBuy5UQ==
X-CSE-MsgGUID: nCLsC/z7T6i7LvnG2eghuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="166753090"
Received: from unknown (HELO adith-NUC7i7BNH.iind.intel.com) ([10.227.91.1])
 by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 07:25:50 -0700
From: Adith Narein T <adith.narein.t@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, adithnarein1305@gmail.com,
 uma.shankar@intel.com, kamil.konieczny@intel.com, arun.r.murthy@intel.com,
 jani.saarinen@intel.com, ville.syrjala@intel.com, karthik.b.s@intel.com,
 pranay.samala@intel.com, suresh.kumar.kurmi@intel.com,
 Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t 2/4] tools/displaytop: Add Display debugfs entry for
 display top
Date: Thu, 29 May 2025 19:53:41 +0530
Message-ID: <20250529142401.2474-3-adith.narein.t@intel.com>
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

This patch adds support for reading, displaying & dumping of display-related
debugfs entries within the DisplayTop tool. Users can now browse and dump
relevant i915 debugfs entries related to the display pipeline, enabling
easier real-time inspection and analysis of driver-level state.

Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
---
 tools/displaytop/README.md                    |   1 +
 tools/displaytop/include/data.h               |   2 +
 tools/displaytop/include/display.h            |   2 +
 tools/displaytop/include/populate.h           |   1 +
 tools/displaytop/include/utils.h              |   2 +
 tools/displaytop/meson.build                  |   2 +
 tools/displaytop/src/display_debugfs.c        | 133 ++++++++++++++++++
 tools/displaytop/src/populate.c               |   1 +
 .../displaytop/src/populate_display_debugfs.c |  99 +++++++++++++
 tools/displaytop/src/utils_driver.c           |  54 +++++++
 10 files changed, 297 insertions(+)
 create mode 100644 tools/displaytop/src/display_debugfs.c
 create mode 100644 tools/displaytop/src/populate_display_debugfs.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index 7349f0760..3e123ee04 100644
--- a/tools/displaytop/README.md
+++ b/tools/displaytop/README.md
@@ -7,6 +7,7 @@ A terminal-based tool for monitoring and debugging the display pipeline.
 - Terminal UI using `ncurses`
 - Dump feature for all the menus
 - Real-time display Configuration
+- view Live Display Debugfs in a terminal ui
 
 ---
 
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
index 0bc1b51d4..a6a6275f7 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -34,4 +34,6 @@ extern Node *root; /* shared throughout the program */
 #define DRM_PRIMARY_PREFIX "card"
 #define DRM_RENDER_PREFIX "renderD"
 
+#define DEBUGFS_DRI_PATH "/sys/kernel/debug/dri"
+
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index db77ef785..dc9e9b4d2 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -43,4 +43,6 @@ void display_framebuffer(WINDOW *pad, Node *node, int *content_line);
 
 void display_summary(WINDOW *pad, Node *node, int *content_line);
 
+void display_debugfs_file(WINDOW *pad, Node *node, int *content_line);
+
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index 5a5241355..fee62bbb1 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -33,5 +33,6 @@
 void populate_data(void);
 
 void initialize_display_config(void);
+void initialize_display_debugfs(void);
 
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index eef5df5f3..17af75b8c 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -112,4 +112,6 @@ const char *get_basic_modifier_str(uint64_t modifier);
 const char *get_connector_type_name(uint32_t connector_type);
 const char *get_encoder_type_name(uint32_t encoder_type);
 
+char *find_debugfs_dir(void);
+
 #endif
\ No newline at end of file
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index 2d8c9d418..1f51a3cf2 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -58,6 +58,8 @@ if have_displaytop
     'src/utils_driver.c',
     'src/utils_drm.c',
     'src/utils_search.c',
+    'src/populate_display_debugfs.c',
+    'src/display_debugfs.c',
   )
 
   if meson.is_subproject()
diff --git a/tools/displaytop/src/display_debugfs.c b/tools/displaytop/src/display_debugfs.c
new file mode 100644
index 000000000..9b7467e8a
--- /dev/null
+++ b/tools/displaytop/src/display_debugfs.c
@@ -0,0 +1,133 @@
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
+static void build_full_path(Node *node, char *full_path, size_t size)
+{
+    int i;
+    int depth = 0;
+    char segments[20][256];
+    char relative_path[1024] = {0};
+
+    node = node;
+    while (node && node->parent && strcmp(node->name, "Display Debugfs") != 0)
+    {
+        char *name = node->name;
+        size_t name_len = strlen(name);
+
+        if (name_len > 0 && name[name_len - 1] == '*')
+        {
+            snprintf(segments[depth], sizeof(segments[depth]), "%.*s", (int)(name_len - 1), name);
+        }
+        else
+        {
+            snprintf(segments[depth], sizeof(segments[depth]), "%s", name);
+        }
+
+        depth++;
+        node = node->parent;
+    }
+
+    for (i = depth - 1; i >= 0; i--)
+    {
+        strncat(relative_path, "/", sizeof(relative_path) - strlen(relative_path) - 1);
+        strncat(relative_path, segments[i], sizeof(relative_path) - strlen(relative_path) - 1);
+    }
+
+    snprintf(full_path, size, "%s%s", find_debugfs_dir(), relative_path);
+}
+
+void display_debugfs_file(WINDOW *pad, Node *node, int *content_line)
+{
+    int line = 0;
+    int max_x = getmaxx(pad) - 4;
+    int start, break_point;
+
+    FILE *file;
+    char temp[1024];
+    char buffer[1024];
+    char full_file_path[1024] = {0};
+
+    build_full_path(node, full_file_path, sizeof(full_file_path));
+
+    file = fopen(full_file_path, "r");
+    if (!file)
+    {
+        print_red_text(pad, line++, 1, "Error opening file: %s", full_file_path);
+        *content_line = line;
+        return;
+    }
+
+    while (fgets(buffer, sizeof(buffer), file))
+    {
+        buffer[strcspn(buffer, "\n")] = '\0';
+
+        start = 0;
+        while (start < (int)strlen(buffer))
+        {
+            break_point = start + max_x;
+            if (break_point < (int)strlen(buffer))
+            {
+                while (break_point > start && !isspace(buffer[break_point]))
+                    break_point--;
+
+                if (break_point == start)
+                    break_point = start + max_x;
+            }
+            else
+            {
+                break_point = strlen(buffer);
+            }
+
+            strncpy(temp, buffer + start, break_point - start);
+            temp[break_point - start] = '\0';
+
+            mvwprintw(pad, line++, 2, "%s", temp);
+
+            start = (buffer[break_point] == ' ') ? break_point + 1 : break_point;
+        }
+    }
+
+    line++;
+    mvwprintw(pad, line++, 2, "-----------------EOF-------------------");
+
+    *content_line = line;
+    fclose(file);
+}
\ No newline at end of file
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
index 0872b0b43..fe8cd215c 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -29,4 +29,5 @@ void populate_data(void)
     root = create_node("Display Top", display_summary, NULL);
 
     initialize_display_config();
+    initialize_display_debugfs();
 }
diff --git a/tools/displaytop/src/populate_display_debugfs.c b/tools/displaytop/src/populate_display_debugfs.c
new file mode 100644
index 000000000..494414764
--- /dev/null
+++ b/tools/displaytop/src/populate_display_debugfs.c
@@ -0,0 +1,99 @@
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
+
+static void populate_debugfs_recursive(Node *parent, const char *currentPath)
+{
+    DIR *dir;
+    struct dirent *entry;
+    char full_path[1024];
+    char dir_name_with_asterisk[1024];
+    struct stat pathStat;
+    Node *fileNode;
+    Node *dirNode;
+
+    dir = opendir(currentPath);
+    if (!dir)
+    {
+        log_message(LOG_ERROR, "Failed to open directory: %s", currentPath);
+        return;
+    }
+
+    while ((entry = readdir(dir)) != NULL)
+    {
+        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
+            continue;
+
+        snprintf(full_path, sizeof(full_path), "%s/%s", currentPath, entry->d_name);
+
+        if (stat(full_path, &pathStat) == -1)
+        {
+            log_message(LOG_WARNING, "Could not stat path: %s", full_path);
+            continue;
+        }
+
+        if (S_ISREG(pathStat.st_mode))
+        {
+            fileNode = create_node(entry->d_name, display_debugfs_file, parent);
+            add_child(parent, fileNode);
+        }
+        else if (S_ISDIR(pathStat.st_mode))
+        {
+            snprintf(dir_name_with_asterisk, sizeof(dir_name_with_asterisk), "%s*", entry->d_name);
+
+            dirNode = create_node(dir_name_with_asterisk, NULL, parent);
+            populate_debugfs_recursive(dirNode, full_path);
+            add_child(parent, dirNode);
+        }
+    }
+
+    closedir(dir);
+}
+
+static void populate_debugfs(Node *parent)
+{
+    char *selected_path = find_debugfs_dir();
+    if (!selected_path)
+        return;
+
+    populate_debugfs_recursive(parent, selected_path);
+    free(selected_path);
+}
+
+void initialize_display_debugfs(void)
+{
+    Node *display_debugfs;
+
+    display_debugfs = create_node("Display Debugfs", NULL, root);
+    populate_debugfs(display_debugfs);
+
+    if (display_debugfs->children_size == 0)
+    {
+        free(display_debugfs);
+        return;
+    }
+
+    add_child(root, display_debugfs);
+}
diff --git a/tools/displaytop/src/utils_driver.c b/tools/displaytop/src/utils_driver.c
index 7b24d2f41..b09e2abba 100644
--- a/tools/displaytop/src/utils_driver.c
+++ b/tools/displaytop/src/utils_driver.c
@@ -187,3 +187,57 @@ void check_and_load_driver(void)
         show_driver_menu();
     }
 }
+
+char *find_debugfs_dir(void)
+{
+    DIR *dir;
+    struct dirent *entry;
+    char *selected_path = NULL;
+
+    dir = opendir(DEBUGFS_DRI_PATH);
+    if (!dir)
+    {
+        log_message(LOG_ERROR, "Failed to open debugfs dri directory");
+        return NULL;
+    }
+
+    while ((entry = readdir(dir)) != NULL)
+    {
+        if (strncmp(entry->d_name, "0000:", 5) == 0)
+        {
+            selected_path = malloc(512);
+            if (!selected_path)
+            {
+                log_message(LOG_ERROR, "Memory allocation failed");
+                closedir(dir);
+                return NULL;
+            }
+
+            snprintf(selected_path, 512, "%s/%s", DEBUGFS_DRI_PATH, entry->d_name);
+            closedir(dir);
+            return selected_path;
+        }
+    }
+
+    rewinddir(dir);
+    while ((entry = readdir(dir)) != NULL)
+    {
+        if (!isdigit(entry->d_name[0]))
+            continue;
+
+        selected_path = malloc(512);
+        if (!selected_path)
+        {
+            log_message(LOG_ERROR, "Memory allocation failed");
+            closedir(dir);
+            return NULL;
+        }
+
+        snprintf(selected_path, 512, "%s/%s", DEBUGFS_DRI_PATH, entry->d_name);
+        log_message(LOG_INFO, "Using debugfs path: %s", selected_path);
+        break;
+    }
+
+    closedir(dir);
+    return selected_path;
+}
\ No newline at end of file
-- 
2.43.0

