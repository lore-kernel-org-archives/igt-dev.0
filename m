Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C323FCA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DCD10E712;
	Wed, 13 Aug 2025 13:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOrKPM4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EE210E717
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755091222; x=1786627222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g9K5fuULfKRRJ6yq0UCUNEU21Y2oLZZzLTXLlKsXJpg=;
 b=dOrKPM4SGn+HsWVGnBuZ7xqmPTtovWpM7YgHftjhZBLsLjw/XKgJFPgH
 0O8gus9LMXQmYaYdKb4egfTCam9kiVhMIMo/ncCjHwVTLi0e/JIMPCHWQ
 dEcHegkDhszYzh/QVl06AFubiqiIceyOZA2jDmK3DlClDWIywMqivRBrk
 x1jLHjpjcC0irBWe+xp1y4BgHA0hpRSC28GpNYTDomWbGkSR+Z4/VsUES
 YiiRLeEoqogQMIFwCeeMCBFPV73vTDKgpI6UacWVjx7h+5qJ4WUlJzq9M
 2Ug+wztsjlR1171iWcWqw/0N2/kU2Q/6ITY0iIFASMe7D1NmmzfJ8AQwM w==;
X-CSE-ConnectionGUID: VU/O2s1gT1e1vxe9+1jRLQ==
X-CSE-MsgGUID: hJQPsRchRNC/6gs5VGFLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57305831"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57305831"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:20:22 -0700
X-CSE-ConnectionGUID: 0tI7D2iTRYm7d1VgSZ8fPA==
X-CSE-MsgGUID: tzmcg1KxSRi7JhxmEqGDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="197323233"
Received: from jjerz-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:20:19 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sysfs_file_perm: Verify sysfs file
 permissions for security
Date: Wed, 13 Aug 2025 15:19:47 +0200
Message-ID: <20250813131948.573785-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This IGT adds checks for the 13 sysfs files identified in the Xe threat
model, ensuring they are only writable by the root user. If any of these
files are writable by non-root users, a warning is issued.

When files are not present in the system, only informational messages
are logged. No warnings or test aborts occur in such cases.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_sysfs_file_perm.c | 578 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 579 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_file_perm.c

diff --git a/tests/intel/xe_sysfs_file_perm.c b/tests/intel/xe_sysfs_file_perm.c
new file mode 100644
index 000000000..2833de10c
--- /dev/null
+++ b/tests/intel/xe_sysfs_file_perm.c
@@ -0,0 +1,578 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <fcntl.h>
+#include <pwd.h>
+#include <regex.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_dir.h"
+#include "igt_hwmon.h"
+#include "igt_list.h"
+#include "igt_sysfs.h"
+#include "xe/xe_query.h"
+
+/**
+ * Sysfs subdirectories for Xe devices:
+ * GT_DIR      /sys/class/drm/.../tile?/gt?/
+ * HWMON_DIR   /sys/class/drm/.../hwmon/hwmon/
+ * DEVICES_DIR /sys/bus/pci/devices/.../
+ */
+#define DIR_COUNT 3
+typedef enum {
+	GT_DIR,
+	HWMON_DIR,
+	DEVICES_DIR
+} xe_fd_type;
+
+struct fd_node {
+	xe_fd_type xe_fd_type;
+	int fd;
+	struct igt_list_head link;
+};
+
+struct pattern_node {
+	xe_fd_type xe_fd_type;
+	const char *pattern;
+	regex_t regex; /* Compiled regex */
+	int match_count;
+	struct igt_list_head link;
+};
+
+/**
+ * We only care if the user and group are root or not, no need to save username
+ */
+struct file_permissions {
+	bool root_user;
+	bool root_group;
+	mode_t mode;
+};
+
+struct file_node {
+	char *full_path;
+	struct file_permissions permissions;
+	struct igt_list_head link;
+};
+
+struct dir_input {
+	xe_fd_type xe_fd_type;
+	const char * const *patterns;
+	int pattern_count;
+};
+
+struct callback_data {
+	struct igt_list_head *pattern_list;
+	struct igt_list_head *files_list;
+	xe_fd_type xe_fd_type;
+};
+
+static int get_fd_path(int fd, char *buffer, size_t bufsize)
+{
+	ssize_t len;
+	char proc_path[64];
+
+	snprintf(proc_path, sizeof(proc_path), "/proc/self/fd/%d", fd);
+	len = readlink(proc_path, buffer, bufsize - 1);
+
+	if (len == -1) {
+		igt_warn("Failed to read link for fd %d: %m\n", fd);
+		return -1;
+	}
+
+	buffer[len] = '\0';
+	return 0;
+}
+
+#define gt_mask_for_each_bit(__mask, __bit) \
+	for ( ; __bit = ffsll(__mask) - 1, __mask != 0; __mask &= ~(1ull << __bit))
+
+static bool fds_open_all(struct igt_list_head *fds_list)
+{
+	int drm_fd;
+	struct fd_node *fd_node;
+	char full_path[1024];
+	u32 gt;
+	uint64_t gt_mask;
+	int sysfs_fd;
+
+	drm_fd = drm_open_driver(DRIVER_XE);
+	if (drm_fd < 0) {
+		igt_warn("Failed to open DRM device: %m\n");
+		return false;
+	}
+
+	/* GTs */
+	gt_mask = xe_device_get(drm_fd)->gt_mask;
+	igt_debug("GT mask: 0x%lx\n", gt_mask);
+
+	/* There could be more than one GT */
+	gt_mask_for_each_bit(gt_mask, gt) {
+		fd_node = malloc(sizeof(*fd_node));
+		if (!fd_node) {
+			igt_warn("Failed to allocate memory for fd_node\n");
+			drm_close_driver(drm_fd);
+			return false;
+		}
+
+		fd_node->xe_fd_type = GT_DIR;
+		fd_node->fd = xe_sysfs_gt_open(drm_fd, gt);
+		if (fd_node->fd < 0) {
+			igt_warn("Failed to open GT sysfs for GT %d: %m\n", gt);
+			free(fd_node);
+			continue;
+		}
+
+		igt_list_add(&fd_node->link, fds_list);
+		igt_debug("GT%d: %d\n", gt, fd_node->fd);
+
+		if (get_fd_path(fd_node->fd, full_path, sizeof(full_path)) == 0)
+			igt_debug("GT: full path %s\n", full_path);
+	}
+
+	/* HWMON */
+	fd_node = malloc(sizeof(*fd_node));
+	if (!fd_node) {
+		igt_warn("Failed to allocate memory for fd_node\n");
+		drm_close_driver(drm_fd);
+		return false;
+	}
+
+	fd_node->xe_fd_type = HWMON_DIR;
+	fd_node->fd = igt_hwmon_open(drm_fd);
+	if (fd_node->fd < 0) {
+		igt_warn("Failed to open HWMon sysfs: %m\n");
+		free(fd_node);
+		drm_close_driver(drm_fd);
+		return false;
+	}
+
+	igt_list_add(&fd_node->link, fds_list);
+	igt_debug("HWMON_DIR: %d\n", fd_node->fd);
+	if (get_fd_path(fd_node->fd, full_path, sizeof(full_path)) == 0)
+		igt_debug("HWMon: full path %s\n", full_path);
+
+	/* DEVICES */
+	fd_node = malloc(sizeof(*fd_node));
+	if (!fd_node) {
+		igt_warn("Failed to allocate memory for fd_node\n");
+		close(sysfs_fd);
+		drm_close_driver(drm_fd);
+		return false;
+	}
+	fd_node->xe_fd_type = DEVICES_DIR;
+	sysfs_fd = igt_sysfs_open(drm_fd);
+	if (sysfs_fd < 0) {
+		igt_warn("Failed to open sysfs: %m\n");
+		drm_close_driver(drm_fd);
+		return false;
+	}
+
+	fd_node->fd = openat(sysfs_fd, "device", O_RDONLY | O_DIRECTORY);
+	close(sysfs_fd);
+	drm_close_driver(drm_fd);
+
+	if (fd_node->fd < 0) {
+		igt_warn("Failed to open Devices sysfs: %m\n");
+		free(fd_node);
+		return false;
+	}
+
+	igt_list_add(&fd_node->link, fds_list);
+	igt_debug("DEVICES_DIR: %d\n", fd_node->fd);
+	if (get_fd_path(fd_node->fd, full_path, sizeof(full_path)) == 0)
+		igt_debug("Devices: full path %s\n", full_path);
+
+	return true;
+}
+
+static bool fds_close_and_free_list(struct igt_list_head *fds_list)
+{
+	struct fd_node *fd_node, *tmp;
+
+	igt_list_for_each_entry_safe(fd_node, tmp, fds_list, link) {
+		if (fd_node->fd >= 0) {
+			close(fd_node->fd);
+			igt_debug("Closed fd %d\n", fd_node->fd);
+		}
+		igt_list_del(&fd_node->link);
+		free(fd_node);
+	}
+
+	return true;
+}
+
+static bool get_file_permissions(const char *filename,
+				 struct file_permissions *permissions)
+{
+	struct stat st;
+
+	if (stat(filename, &st) < 0) {
+		igt_warn("Failed to stat file %s: %m\n", filename);
+		return false;
+	}
+
+	permissions->root_user = (st.st_uid == 0);
+	permissions->root_group = (st.st_gid == 0);
+	permissions->mode = st.st_mode;
+
+	return true;
+}
+
+/**
+ * file_list_add: Adds a file node to the list if it does not already exist.
+ * If the file already exists, it skips adding it and prints a debug message.
+ *
+ * @param file_node: The file node to add
+ * @param head: The head of the list to add the file node to
+ *
+ * Returns: void
+ */
+static void file_list_add(struct file_node *file_node, struct igt_list_head *head)
+{
+	struct file_node *existing_node;
+
+	igt_list_for_each_entry(existing_node, head, link) {
+		if (strcmp(existing_node->full_path, file_node->full_path) == 0) {
+			igt_debug("File %s already exists in the list, skipping\n",
+				  file_node->full_path);
+			return;
+		}
+	}
+
+	igt_list_add(&file_node->link, head);
+	igt_debug("Added file %s to the list\n", file_node->full_path);
+}
+
+/**
+ * callback_read_file_permissions: Reads file permissions and updates the file
+ * list.
+ *
+ * @filename: Path to the file
+ * @data: Pointer to the callback data containing the pattern list and files
+ * list
+ *
+ * Returns: 0 on success, a negative error code on failure
+ */
+static int callback_read_file_permissions(const char *filename,
+					  void *data)
+{
+	struct callback_data *callback_data = (struct callback_data *)data;
+	struct file_node *file_node;
+	struct pattern_node *pattern_node;
+	int ret;
+
+	igt_list_for_each_entry(pattern_node, callback_data->pattern_list, link) {
+		/**
+		 * The list contains patterns for all directories, but we scan
+		 * only one directory at a time.
+		 */
+		if (pattern_node->xe_fd_type != callback_data->xe_fd_type) {
+			igt_debug("Skipping pattern %s for dir type %d\n",
+				  pattern_node->pattern, callback_data->xe_fd_type);
+			continue;
+		}
+
+		ret = regexec(&pattern_node->regex, filename, 0, NULL, 0);
+
+		if (ret == 0) {
+			pattern_node->match_count++;
+
+			file_node = malloc(sizeof(struct file_node));
+			if (!file_node) {
+				igt_warn("Failed to allocate memory for file node\n");
+				continue;
+			}
+
+			file_node->full_path = strdup(filename);
+			if (!file_node->full_path) {
+				igt_warn("Failed to allocate memory for the file path\n");
+				continue;
+			}
+
+			igt_require(get_file_permissions(filename, &file_node->permissions));
+
+			file_list_add(file_node, callback_data->files_list);
+			igt_debug("Matched file: %s, permissions: root_user: %d, root_group: %d, mode: %o\n",
+				  file_node->full_path,
+				  file_node->permissions.root_user,
+				  file_node->permissions.root_group,
+				  file_node->permissions.mode);
+		}
+	}
+
+	/* No match */
+	return 0;
+}
+
+/**
+ * prepare_patterns: Prepares the linked list of patterns for all xe
+ * sysfs subdirectories compiling the regex for each pattern.
+ *
+ * @inputs: Array of dir_input structures containing the patterns
+ * @pattern_list: List to store the prepared patterns
+ *
+ * Returns: true on success, false on failure
+ */
+static bool prepare_patterns(struct dir_input *inputs,
+			     struct igt_list_head *pattern_list)
+{
+	char full_regex[1024];
+
+	for (int i = 0; i < DIR_COUNT; i++) {
+		for (int j = 0; j < inputs[i].pattern_count; j++) {
+			struct pattern_node *node = malloc(sizeof(struct pattern_node));
+
+			if (!node) {
+				igt_warn("Failed to allocate memory for pattern node\n");
+				return false;
+			}
+
+			if (strlen(inputs[i].patterns[j]) >= sizeof(full_regex)) {
+				igt_warn("Pattern too long: %s\n", inputs[i].patterns[j]);
+				free(node);
+				continue;
+			}
+
+			snprintf(full_regex, sizeof(full_regex), "%s", inputs[i].patterns[j]);
+			if (regcomp(&node->regex, full_regex, REG_EXTENDED) != 0) {
+				igt_warn("Failed to compile regex: %s\n", full_regex);
+				continue;
+			}
+			node->pattern =  inputs[i].patterns[j];
+			node->xe_fd_type = inputs[i].xe_fd_type;
+			node->match_count = 0;
+
+			igt_list_add(&node->link, pattern_list);
+		}
+	}
+
+	return true;
+}
+
+/**
+ * search_files: Searches for files in the provided list of file descriptors
+ * matching the patterns in the pattern list. It uses the callback function to
+ * process each file found.
+ *
+ * @param fds_list: List of file descriptors to search
+ * @param pattern_list: List of patterns to match against
+ * @param files_list: List to store the found files
+ *
+ * Returns: true if files were found and processed, false otherwise
+ */
+static bool search_files(struct igt_list_head *fds_list,
+			 struct igt_list_head *pattern_list,
+			 struct igt_list_head *files_list)
+{
+	struct callback_data callback_data = {
+		.pattern_list = pattern_list,
+		.files_list = files_list,
+	};
+	struct fd_node *fd_node;
+	igt_dir_t *igt_dir_config = NULL;
+
+	igt_list_for_each_entry(fd_node, fds_list, link) {
+		callback_data.xe_fd_type = fd_node->xe_fd_type;
+
+		igt_dir_config = igt_dir_create(fd_node->fd);
+		igt_require(igt_dir_config);
+
+		igt_dir_scan_dirfd(igt_dir_config, -1);
+		igt_dir_process_files(igt_dir_config,
+				      callback_read_file_permissions,
+				      &callback_data);
+
+		igt_dir_destroy(igt_dir_config);
+	}
+
+	return true;
+}
+
+/**
+ * check_pattern_match: Checks if all patterns in the pattern list matched at
+ * least one file. We do not abort or warn if not all patterns match because not
+ * all nodes are present in all systems. We simply inform the user about
+ * patterns that did not match any file.
+ *
+ * @pattern_list: List of patterns to check
+ *
+ * Returns: true if all patterns matched at least one file, false otherwise
+ */
+static bool check_pattern_match(struct igt_list_head *pattern_list)
+{
+	bool header = false;
+	struct pattern_node *pattern_node;
+	bool ret = true;
+
+	igt_list_for_each_entry(pattern_node, pattern_list, link) {
+		if (pattern_node->match_count == 0) {
+			if (!header) {
+				igt_info("\n(INFO) Not all patterns matched at least one file. ");
+				igt_info("Patterns that did not match any file:\n");
+				header = true;
+			}
+			igt_info("\t- '%s'\n",
+				 pattern_node->pattern);
+			ret = false;
+		}
+	}
+	if (header)
+		igt_info("\n");
+
+	return ret;
+}
+
+/**
+ * TEST: sysfs file permission access control
+ * Description: Check if important sysfs files are only acessible by root.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sysfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: check-file-permissions
+ * Description: Check if important sysfs files are only accessible by root.
+ *
+ */
+
+IGT_TEST_DESCRIPTION("Check if only root can write to important sysfs files.");
+
+/**
+ * check_files_permissions: Checks if the files in the provided list have
+ * correct permissions. The expected permissions are:
+ * - Owner: root
+ * - Group: root
+ * - Only owner can write to the file (mode 100644).
+ * If any file does not have the expected permissions,
+ * it will print a warning and return false.
+ * If all files have the expected permissions,
+ * it will return true.
+ *
+ * @param files_list: List of files to check
+ *
+ * Returns: true if all files have correct permissions, false otherwise
+ */
+static bool check_files_permissions(struct igt_list_head *files_list)
+{
+	bool header = false;
+	struct file_node *file_node;
+	bool ret = true;
+
+	/* Check if owner and group are root and if only owner can
+	 * write to the file.
+	 */
+	igt_list_for_each_entry(file_node, files_list, link) {
+		if (!file_node->permissions.root_user ||
+		    !file_node->permissions.root_group ||
+		    (file_node->permissions.mode & 0022)) {
+			if (!header) {
+				igt_warn("\n\nFiles with incorrect permissions:\n");
+				header = true;
+			}
+
+			igt_warn("\t- %s\n\t\troot_user: %s, root_group: %s, mode: %o (expected: 100644)\n",
+				 file_node->full_path,
+				 file_node->permissions.root_user ? "true" : "false",
+				 file_node->permissions.root_group ? "true" : "false",
+				 file_node->permissions.mode);
+			ret = false;
+		}
+	}
+	if (header)
+		igt_warn("\n");
+
+	return ret;
+}
+
+igt_main
+{
+	struct igt_list_head fds_list;
+	struct igt_list_head files_list;
+	struct igt_list_head pattern_list;
+
+	/**
+	 * Do not change the list below without checking the Xe threat
+	 * modeling first. You can contact peter.senna@intel.com or
+	 * michal.winiarski@intel.com for questions and support.
+	 */
+
+	/* DO NOT CHANGE START */
+	static const char * const gt_patterns[] = {
+		"ccs_mode",
+		"engines/[a-zA-Z0-9]+/job_timeout_ms",
+		"engines/[a-zA-Z0-9]+/preempt_timeout_us",
+		"engines/[a-zA-Z0-9]+/timeslice_duration_min",
+		"engines/[a-zA-Z0-9]+/timeslice_duration_max",
+		"engines/[a-zA-Z0-9]+/timeslice_duration_us",
+		"freq0/max_freq",
+		"freq0/min_freq"
+	};
+
+	static const char * const hwmon_patterns[] = {
+		"power[0-9]+_crit",
+		"curr[0-9]+_crit",
+		"power[0-9]+_max",
+		"power[0-9]+_max_interval"
+	};
+
+	static const char * const devices_patterns[] = {
+		"vram_d3cold_threshold"
+	};
+
+	struct dir_input dir_inputs[DIR_COUNT] = {
+		{ GT_DIR, gt_patterns, ARRAY_SIZE(gt_patterns) },
+		{ HWMON_DIR, hwmon_patterns, ARRAY_SIZE(hwmon_patterns) },
+		{ DEVICES_DIR, devices_patterns, ARRAY_SIZE(devices_patterns) }
+	};
+	/* DO NOT CHANGE END */
+
+	igt_fixture {
+		IGT_INIT_LIST_HEAD(&fds_list);
+		IGT_INIT_LIST_HEAD(&pattern_list);
+		IGT_INIT_LIST_HEAD(&files_list);
+
+		igt_require(prepare_patterns(dir_inputs, &pattern_list));
+
+		igt_require(fds_open_all(&fds_list));
+		igt_require(search_files(&fds_list, &pattern_list, &files_list));
+		igt_require(fds_close_and_free_list(&fds_list));
+
+		/* We do not warn or abort if not all patterns match
+		 * because not all nodes are always available
+		 */
+		check_pattern_match(&pattern_list);
+	}
+
+	igt_describe("Check if only root can write to important sysfs files.");
+	igt_subtest("check-file-permissions")
+		igt_assert(check_files_permissions(&files_list));
+
+	igt_fixture {
+		struct pattern_node *pattern_node, *pattern_tmp;
+		struct file_node *file_node, *file_tmp;
+
+		igt_list_for_each_entry_safe(pattern_node, pattern_tmp, &pattern_list, link) {
+			/* pattern_node->pattern is static and const and
+			 * should not be freed
+			 */
+			regfree(&pattern_node->regex);
+			igt_list_del(&pattern_node->link);
+			free(pattern_node);
+		}
+
+		igt_list_for_each_entry_safe(file_node, file_tmp, &files_list, link) {
+			free(file_node->full_path);
+			igt_list_del(&file_node->link);
+			free(file_node);
+		}
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 5c01c64e9..d904dffcd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -330,6 +330,7 @@ intel_xe_progs = [
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
 	'xe_sysfs_defaults',
+	'xe_sysfs_file_perm',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
         'xe_sysfs_timeslice_duration',
-- 
2.43.0

