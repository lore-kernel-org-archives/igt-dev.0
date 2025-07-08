Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D7C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 14:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA00310E66B;
	Tue,  8 Jul 2025 14:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E89Ce5eK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA78A10E67C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751985492; x=1783521492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kA6r7iD6ydpHjp14svroCuvX+gnh8b98G61vlB7OrIQ=;
 b=E89Ce5eKWVB0RNQ6lfoqH1oic86uGzBlNmq4HExk8/k7tKE6ixyGylP0
 Zt3f3y/1kaNf5BsNkIzLi1Oz/2axJOzjC+YoSAg6SdhiU3e0QR56n8BIA
 Y7h3cD8Wscc/PuN8uzJOquB7yvKYsgzksBG74vkGmYDODcKvdkCbIBRBe
 SuMzlrcARm2JcjOXXQ7KABqxr7fBoJes67CZNmaN9e1sSLa1oErX6zOKC
 y18esoy8y8OEe8EX8gyhld9MnHt0/AEJA8B+Kp1JnYf7uF6VxA2F5fZPH
 msXytfn1ydoV526wN+tXPUzmd+T7RtX7b3iFSCe2zNdLMknlo2WpXCAmo w==;
X-CSE-ConnectionGUID: dRJVqazPSwykKN/9xY7xEg==
X-CSE-MsgGUID: BWlAORORSqe05rstZ5ih4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53433327"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53433327"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:38:12 -0700
X-CSE-ConnectionGUID: 0X4wAbJ9RxmEPh13Z4fj4A==
X-CSE-MsgGUID: if9S0wKRQDCBCCYYY02z5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="156001420"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:38:08 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH v5 i-g-t 1/6] lib/igt_dir: Directory processing and flexible
 file handling
Date: Tue,  8 Jul 2025 16:37:30 +0200
Message-ID: <20250708143737.52338-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708143737.52338-1-peter.senna@linux.intel.com>
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
 <20250708143737.52338-1-peter.senna@linux.intel.com>
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

Introduces new utilities to facilitate reading and processing files
within a directory, giving test writers greater control over file
selection and processing. For example, to read and discard all files
from debugfs:

  fd = drm_open_driver_master(DRIVER_ANY);
  debugfs = igt_debugfs_dir(fd);

  igt_dir = igt_dir_create(debugfs);
  igt_dir_scan_dirfd(igt_dir, -1); // -1 means unlimited scan depth
  igt_dir_process_files(igt_dir, NULL, NULL);

The igt_dir_scan_dirfd() function builds a linked list of files (using
igt_list), making it easy to add or remove specific files before
processing. If you only want to process a predetermined set of files,
you can skip the scan step and add the files directly to the list.

The last two parameters of igt_dir_process_files() specify a callback
function and user data. If the callback is NULL, a default "read and
discard" function is used.

Alternatively a "_simple" interface is also available. This function
encapsulate the calls to igt_dir_create(), igt_dir_scan_dirfd(),
igt_dir_process_files(), and igt_dir_destroy(). For using the "_simple"
interface:

  fd = drm_open_driver_master(DRIVER_ANY);
  debugfs = igt_debugfs_dir(fd);
  igt_dir_process_files_simple(debugfs);

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v5:
 - Added igt_dir_process_files_simple()
v4:
 - unchanged from v3
v3:
 - unchanged from v2
v2:
 - changed style of comparison to NULL

 lib/igt_dir.c   | 287 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dir.h   |  62 +++++++++++
 lib/meson.build |   1 +
 3 files changed, 350 insertions(+)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
new file mode 100644
index 000000000..bbb984ab4
--- /dev/null
+++ b/lib/igt_dir.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_dir.h"
+
+/**
+ * igt_dir_get_fd_path: Get the path of a file descriptor
+ * @fd: file descriptor to get the path for
+ * @path: buffer to store the path
+ * @path_len: length of the buffer
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+int igt_dir_get_fd_path(int fd, char *path, size_t path_len)
+{
+	ssize_t len;
+	char proc_path[64];
+
+	snprintf(proc_path, sizeof(proc_path), "/proc/self/fd/%d", fd);
+	len = readlink(proc_path, path, path_len - 1);
+	if (len == -1)
+		return -1;
+
+	path[path_len] = '\0';
+	return 0;
+}
+
+/**
+ * igt_dir_callback_read_discard: Default callback function for reading and
+ *				  discarding file contents
+ * @filename: Path to the file
+ * @callback_data: Optional pointer to user-defined data passed to the callback
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+int igt_dir_callback_read_discard(const char *filename,
+				  void *callback_data)
+{
+	int fd;
+	char buf[4096];
+	ssize_t bytes_read;
+
+	fd = open(filename, O_RDONLY);
+	if (fd < 0) {
+		igt_debug("Failed to open file %s\n", filename);
+		return -1;
+	}
+	bytes_read = read(fd, buf, sizeof(buf) - 1);
+	if (bytes_read < 0) {
+		igt_debug("Failed to read file %s\n", filename);
+		close(fd);
+		return -1;
+	}
+	buf[bytes_read] = '\0';
+	igt_debug("Read %zd bytes from file %s: %s\n", bytes_read,
+		  filename, buf);
+	close(fd);
+	return 0;
+}
+
+/**
+ * igt_dir_create: Create a new igt_dir_t struct
+ * @dirfd: file descriptor of the root directory
+ *
+ * Returns: Pointer to the new igt_dir_t struct, or NULL on failure
+ */
+igt_dir_t *igt_dir_create(int dirfd)
+{
+	igt_dir_t *config;
+	size_t path_len = 512;
+	char path[path_len];
+
+	config = malloc(sizeof(igt_dir_t));
+	if (!config)
+		return NULL;
+
+	config->dirfd = dirfd;
+
+	igt_dir_get_fd_path(dirfd, path, path_len);
+	igt_require(path[0] != '\0');
+
+	config->root_path = malloc(path_len);
+	if (!config->root_path) {
+		free(config);
+		return NULL;
+	}
+
+	strncpy(config->root_path, path, path_len);
+
+	IGT_INIT_LIST_HEAD(&config->file_list_head);
+
+	config->callback = NULL;
+
+	return config;
+}
+
+static int _igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth,
+			       int depth, const char *current_path)
+{
+	struct dirent *entry;
+	igt_dir_file_list_t *file_list_entry;
+	DIR *dirp;
+	int dirfd;
+	int ret = 0;
+
+	if (depth > scan_maxdepth && scan_maxdepth != -1)
+		return 0;
+
+	if (!current_path) {
+		igt_debug("Invalid current path\n");
+		return -1;
+	}
+
+	dirfd = open(current_path, O_RDONLY | O_DIRECTORY);
+	if (dirfd < 0) {
+		igt_debug("Failed to open directory %s\n", current_path);
+		return -1;
+	}
+
+	dirp = fdopendir(dirfd);
+	if (!dirp) {
+		igt_debug("Failed to fdopendir %s\n", current_path);
+		close(dirfd);
+		return -1;
+	}
+
+	while ((entry = readdir(dirp))) {
+		char entry_path[PATH_MAX];
+
+		if (strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		snprintf(entry_path, sizeof(entry_path),
+			 "%s/%s", current_path, entry->d_name);
+
+		if (entry->d_type == DT_DIR) {
+			ret = _igt_dir_scan_dirfd(config, scan_maxdepth,
+						  depth + 1, entry_path);
+			if (ret)
+				break;
+		} else {
+			/* Compute path relative to the scan root */
+			const char *relative_path = entry_path +
+						    strlen(config->root_path);
+			if (*relative_path == '/')
+				relative_path++; /* skip leading slash */
+
+			file_list_entry = malloc(sizeof(igt_dir_file_list_t));
+			if (!file_list_entry) {
+				igt_debug("Failed to allocate memory for file list entry\n");
+				continue;
+			}
+			file_list_entry->relative_path = strdup(relative_path);
+			file_list_entry->match = true;
+			igt_list_add(&file_list_entry->link,
+				     &config->file_list_head);
+		}
+	}
+
+	closedir(dirp);
+	close(dirfd);
+	return ret;
+}
+
+/**
+ * igt_dir_scan_dirfd: Perform a directory scan based on config.
+ * @config: Pointer to the igt_dir struct
+ * @scan_maxdepth: Maximum depth to scan the directory. -1 means no limit
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth)
+{
+	igt_require(config);
+	igt_require(config->root_path);
+	igt_require(config->dirfd >= 0);
+	igt_require(scan_maxdepth >= -1);
+	igt_require(scan_maxdepth != 0);
+
+	/* If the linked list is not empty, clean it first */
+	if (!igt_list_empty(&config->file_list_head)) {
+		igt_dir_file_list_t *file_list_entry, *tmp;
+
+		igt_list_for_each_entry_safe(file_list_entry, tmp,
+					     &config->file_list_head, link) {
+			free(file_list_entry->relative_path);
+			free(file_list_entry);
+		}
+	}
+
+	return _igt_dir_scan_dirfd(config, scan_maxdepth, 0, config->root_path);
+}
+
+/**
+ * igt_dir_process_files: Process files in the directory
+ * @config: Pointer to the igt_dir struct
+ * @callback: Callback function to process each file
+ * @callback_data: Optional pointer to user-defined data passed to the callback
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+int igt_dir_process_files(igt_dir_t *config,
+			 igt_dir_file_callback callback,
+			 void *callback_data)
+{
+	igt_dir_file_list_t *file_list_entry;
+	int ret = 0;
+
+	igt_require(config);
+	igt_require(config->root_path);
+	igt_require(config->dirfd >= 0);
+
+	if (!callback)
+		callback = igt_dir_callback_read_discard;
+
+	igt_list_for_each_entry(file_list_entry, &config->file_list_head, link) {
+		/* Only if match is true */
+		if (file_list_entry->match) {
+			char full_path[PATH_MAX];
+
+			snprintf(full_path, sizeof(full_path),
+				 "%s/%s", config->root_path,
+				 file_list_entry->relative_path);
+			ret = callback(full_path, callback_data);
+			if (ret)
+				break;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * igt_dir_destroy: Destroy the igt_dir struct
+ * @config: Pointer to the igt_dir struct
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+void igt_dir_destroy(igt_dir_t *config)
+{
+	igt_dir_file_list_t *file_list_entry, *tmp;
+
+	igt_require(config);
+
+	igt_list_for_each_entry_safe(file_list_entry, tmp,
+				 &config->file_list_head, link) {
+		free(file_list_entry->relative_path);
+		free(file_list_entry);
+	}
+
+	free(config->root_path);
+	free(config);
+}
+
+/**
+ * igt_dir_process_files_simple: Process files in the directory using the
+ *				 default callback to read and discard file
+ *				 contents.
+ *
+ * @dirfd: file descriptor of the root directory
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+int igt_dir_process_files_simple(int dirfd)
+{
+	igt_dir_t *config;
+	int ret;
+
+	config = igt_dir_create(dirfd);
+	if (!config)
+		return -1;
+
+	igt_dir_scan_dirfd(config, -1);
+
+	/* Use the default callback to read and discard file contents */
+	ret = igt_dir_process_files(config, NULL, NULL);
+
+	igt_dir_destroy(config);
+	return ret;
+}
diff --git a/lib/igt_dir.h b/lib/igt_dir.h
new file mode 100644
index 000000000..5e36d8af8
--- /dev/null
+++ b/lib/igt_dir.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef IGT_DIR_H
+#define IGT_DIR_H
+
+#include "igt_list.h"
+
+/**
+ * Callback function type for processing files
+ * The callback is blocking, meaning traversal waits for it to return
+ * before proceeding to the next file
+ * @filename: Path to the file
+ * @callback_data: Optional pointer to user-defined data passed to the callback
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure.
+ */
+typedef int (*igt_dir_file_callback)(const char *filename,
+				     void *callback_data);
+
+/**
+ * igt_dir_file_list_t: List of files with a relative path
+ * @relative_path: path to a file, relative to the root directory
+ * @match: a boolean used to filter the list of files. When match=true the
+ *	   file is processed, otherwise it is skipped
+ * @link: list head for linking files in the list
+ */
+typedef struct {
+	char *relative_path;
+	bool match;
+	struct igt_list_head link;
+} igt_dir_file_list_t;
+
+/**
+ * igt_dir_t: Main struct for igt_dir
+ * @dirfd: file descriptor of the root directory
+ * @root_path: string of the root path, for example:
+ *	       /sys/kernel/debug/dri/0000:00:02.0/
+ * @file_list_head: head of the list of files
+ * @callback: Callback function for file operations. If NULL, defaults
+ *	      to reading and discarding file contents
+ */
+typedef struct {
+	int dirfd;
+	char *root_path;
+	struct igt_list_head file_list_head;
+	igt_dir_file_callback callback;
+} igt_dir_t;
+
+int igt_dir_get_fd_path(int fd, char *path, size_t path_len);
+int igt_dir_callback_read_discard(const char *filename,
+				  void *callback_data);
+igt_dir_t *igt_dir_create(int dirfd);
+int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth);
+int igt_dir_process_files(igt_dir_t *config,
+			  igt_dir_file_callback callback,
+			  void *callback_data);
+void igt_dir_destroy(igt_dir_t *config);
+int igt_dir_process_files_simple(int dirfd);
+#endif /* IGT_DIR_H */
diff --git a/lib/meson.build b/lib/meson.build
index 1fed74565..7b3674c98 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -92,6 +92,7 @@ lib_sources = [
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
+	'igt_dir.c',
 	'igt_draw.c',
 	'igt_list.c',
 	'igt_map.c',
-- 
2.43.0

