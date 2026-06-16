Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384E1CD98CE
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 05:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC1510E810;
	Tue, 16 Jun 2026 05:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fglUEePb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C054610E579
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781586837; x=1813122837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZezUG44YZf5Q39vXubLdOvHeUpxidFFp9Q76XARg44=;
 b=fglUEePbcTMoa6luFPlIf/VveQ3SDuf7C42bK+plTMlcVD0q1FdLd/Ny
 qOgg2pF5CcOHBUhqC47ESRZ8s1G6xleOKL+JGd0LGuC0mUBqEgxvBrj0Y
 xxzylltTKwwMOoOVhhdFzlmklxcdNpjzx00SPU5cals21Jkf1uIyOT35X
 gSSmaK52ZT/3AOquRwXyjkdyy0UV6+3ULElHeq6pm+ijBKMaot6/9krqI
 l6xQZRNLMSpz0Dq7z4UtjxsSdE86AqFl0C9L4a6JU17jBd4dyNOC0a264
 Gw4q0GJzRuAj/PUcG9hZOQc0jxBWtusVGYTBJJ6YC2DSARFmjzMSbWoy7 g==;
X-CSE-ConnectionGUID: XX6yB/1tTC2lnCnfGWHIjg==
X-CSE-MsgGUID: G5fB/RqTT9i5xl4GuN3LWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82536823"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82536823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:57 -0700
X-CSE-ConnectionGUID: YjGqYmA6TeWL1x2ZCMbb8w==
X-CSE-MsgGUID: LpJuYC1ZTg2R6ZTzNeobiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="243294068"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:57 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Add debugfs optional entry
 validation
Date: Tue, 16 Jun 2026 05:13:45 +0000
Message-ID: <20260616051348.610849-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260616051348.610849-1-sobin.thomas@intel.com>
References: <20260616051348.610849-1-sobin.thomas@intel.com>
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

Extend the root-dir subtest to validate additional optional Xe debugfs
entries. Optional entries are those that may not be present on all
platforms or configurations — their absence is not treated as a failure.
Validate:

- dgfx_pkg_residencies: Counter reads are non empty
- dgfx_pcie_link_residencies: PCIE LINK string content
- sriov_info: entry is non-empty
- workarounds: entry is non-empty
- atomic_svm_timeslice_ms: integer read/write
- poor_man_system_atomic_support: boolean read/write
- disable_late_binding: boolean read/write

v2: Fixed the optional file check and added fail count.
    Replaced igt_debug with igt_info in few places  (kamil)
v3: Removed uniused condition params and restored has_vram() usage.
    Used igt_info() for validation failure logs.
    Kept only new optional debugfs entries in this patch. (kamil)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 177 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 587e3e785..d7a204a09 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -39,11 +39,23 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
 	__m && ((__i) = __builtin_ctz(__m), 1);	\
 	__m &= __m - 1)
 
+/* Validation types for debugfs read tests */
+enum debugfs_validate_type {
+	VALIDATE_NONE,		/* Just check file exists */
+	VALIDATE_NON_EMPTY,	/* Just check buffer is not empty */
+	VALIDATE_CONTAINS_STR,	/* Check buffer contains expected string */
+	VALIDATE_INT_GE_ZERO,	/* Parse as integer, verify >= 0 */
+	VALIDATE_BOOL,		/* Check bool value (0 or 1) */
+};
+
 struct check_entry {
 	const char *name_fmt;
 	int mode;
 	bool (*condition)(struct xe_device *xe_dev);
 	unsigned int (*iter_mask)(struct xe_device *xe_dev);
+	bool optional;
+	enum debugfs_validate_type validate;
+	const char *expected_str;
 };
 
 static unsigned int gt_iter_mask(struct xe_device *xe_dev)
@@ -131,6 +143,110 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
 	return found_not_tested;
 }
 
+/* Validate that debugfs buffer is non-empty or contains expected string */
+static bool validate_string(int dirfd, const char *file_name, const char *expected_str)
+{
+	char buf[4096];
+	int ret = 0;
+
+	ret = igt_sysfs_read(dirfd, file_name, buf, sizeof(buf) - 1);
+	if (ret < 0)
+		return false;
+	buf[ret] = '\0';
+
+	/* Check for empty buffer */
+	if (strlen(buf) == 0) {
+		igt_warn("Empty output from %s\n", file_name);
+		return false;
+	}
+
+	/* If expecting specific string, verify it's present */
+	if (expected_str && !strstr(buf, expected_str)) {
+		igt_info("Expected '%s' not found in %s\n", expected_str, file_name);
+		return false;
+	}
+
+	if (expected_str)
+		igt_info("Successfully read %s: found '%s'\n", file_name, expected_str);
+	else
+		igt_info("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
+
+	return true;
+}
+
+static const char *mode_to_str(int mode)
+{
+	switch (mode & O_ACCMODE) {
+	case O_RDONLY: return "RO";
+	case O_WRONLY: return "WO";
+	case O_RDWR:   return "RW";
+	default:       return "UNKNOWN";
+	}
+}
+
+static bool validate_bool_file(int dirfd, const char *file_name, int mode)
+{
+	int orig_val = 0, read_val = 0, test_val = 0;
+
+	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1 ||
+	    (orig_val != 0 && orig_val != 1))
+		return false;
+
+	if (mode == O_RDWR) {
+		test_val = (orig_val == 0) ? 1 : 0;
+
+		if (igt_sysfs_printf(dirfd, file_name, "%d", test_val) < 0)
+			return false;
+
+		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1 || read_val != test_val)
+			return false;
+
+		/* Restore original value */
+		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
+			igt_warn("Failed to restore original value for %s\n", file_name);
+			return false;
+		}
+	}
+
+	igt_info("Successfully validated %s bool %s\n", mode_to_str(mode), file_name);
+	return true;
+}
+
+static bool validate_int_file(int dirfd, const char *file_name, int mode)
+{
+	int orig_val = 0, new_val = 0, read_val = 0;
+
+	if (igt_sysfs_scanf(dirfd, file_name, "%d", &orig_val) != 1)
+		return false;
+
+	if (orig_val < 0)
+		return false;
+
+	if (mode == O_RDWR) {
+		new_val = orig_val + 1;
+		if (new_val < 0)
+			new_val = orig_val - 1;
+		if (igt_sysfs_printf(dirfd, file_name, "%d", new_val) < 0)
+			return false;
+		if (igt_sysfs_scanf(dirfd, file_name, "%d", &read_val) != 1)
+			return false;
+		if (read_val != new_val)
+			return false;
+		/* Restore original value */
+		if (igt_sysfs_printf(dirfd, file_name, "%d", orig_val) < 0) {
+			igt_warn("Failed to restore original value for %s\n", file_name);
+			return false;
+		}
+
+		igt_info("Successfully validated writing int %s: %d\n",
+			  file_name, new_val);
+	} else {
+		igt_info("Successfully validated reading int %s: %d\n",
+			  file_name, orig_val);
+	}
+	return true;
+}
+
 static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
 {
 	int fd = openat(dirfd, file_name, mode);
@@ -139,10 +255,39 @@ static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
 		close(fd);
 		return true;
 	}
-
 	return false;
 }
 
+static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
+				  enum debugfs_validate_type validate, const char *expected_str)
+{
+	bool result = true;
+
+	if (validate == VALIDATE_NONE)
+		return true;
+
+	switch (validate) {
+	case VALIDATE_NON_EMPTY:
+		result = validate_string(dirfd, file_name, NULL);
+		break;
+	case VALIDATE_CONTAINS_STR:
+		result = validate_string(dirfd, file_name, expected_str);
+		break;
+	case VALIDATE_INT_GE_ZERO:
+		result = validate_int_file(dirfd, file_name, mode);
+		break;
+	case VALIDATE_BOOL:
+		result = validate_bool_file(dirfd, file_name, mode);
+		break;
+	default:
+		igt_warn("Unknown validate type %d for %s\n", validate, file_name);
+		result = false;
+		break;
+	}
+
+	return result;
+}
+
 /*
  * Return: negative error code on failure, or number of missing files
  */
@@ -151,6 +296,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
 {
 	struct igt_list_head hit_entries;
 	int missing_count = 0;
+	int fail_count = 0;
 	int err = 0;
 
 	IGT_INIT_LIST_HEAD(&hit_entries);
@@ -210,9 +356,22 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
 			}
 
 			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
-				igt_warn("Missing debugfs file: %s\n", entry->name);
-				missing_count++;
+				if (check->optional) {
+					igt_info("Optional entry %s not found (skipped)\n",
+						 entry->name);
+				} else {
+					igt_info("Missing debugfs file: %s\n",
+						 entry->name);
+					missing_count++;
+				}
+			} else {
+				if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
+							   check->validate, check->expected_str)) {
+					igt_info("Fail at debugfs file: %s\n", entry->name);
+					fail_count++;
+				}
 			}
+
 		}
 	}
 
@@ -229,7 +388,10 @@ out:
 		}
 	}
 
-	return (err < 0) ? err : missing_count;
+	if (fail_count || missing_count)
+		igt_warn("Fails: %d missing debugfs file(s): %d\n", fail_count, missing_count);
+
+	return (err < 0) ? err : (missing_count + fail_count);
 }
 
 /**
@@ -240,6 +402,7 @@ static void test_root_dir(struct xe_device *xe_dev)
 {
 	const struct check_entry expected_files[] = {
 		{ "clients", O_RDONLY },
+		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "forcewake_all", O_WRONLY },
 		{ "gem_names", O_RDONLY },
 		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
@@ -247,6 +410,12 @@ static void test_root_dir(struct xe_device *xe_dev)
 		{ "info", O_RDONLY },
 		{ "name", O_RDONLY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
+		{ "poor_man_system_atomic_support", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
+		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
+		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
+		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
+		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
+		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true, .validate = VALIDATE_INT_GE_ZERO },
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
 	int missing_count;
-- 
2.52.0

