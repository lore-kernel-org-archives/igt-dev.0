Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF2CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 09:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0410EDA1;
	Thu, 11 Jun 2026 09:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsuAWIrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DD310EDA1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781171010; x=1812707010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=23Ww0HJYU/n5vjoLRmZCXaeRlxO5N/vip7meyRCU+Ps=;
 b=gsuAWIrNJ8Qf52rUf/XDYIsyGiIKZN74nS76EW5oKjhirwk+MKcOTFBt
 quULL9drHtUCAoxy0YGP++YHIJ/tXfWbrNN/xftMrM8H9magB7Z5er9+1
 lPr3YdLEBrEpsZUrnDOk2MYEZHrgUEf0okpyfTO2tw4J7Y8rjs3aDT87t
 6HecE5Cw1GkWI9kdMCxkR0f1Vxo/O7x23bonU6ls8z1Pq4258HK6NZmHa
 XoI1GPpWhOspsp6LICTPVHfZEfKyOgIiFq/0VgiYbqHRkvbOhdjmySo62
 Gmt6bFYkSf7jI2RTDp2eSDwp5G1Lh9mADKC9LynWH89bl9IbvvwOEPpNS Q==;
X-CSE-ConnectionGUID: ykbYxM4QR6mXc7hRulZlNQ==
X-CSE-MsgGUID: TyK8z4jyRGmfqR4urdCCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82041106"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="82041106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:43:29 -0700
X-CSE-ConnectionGUID: hCj6G1WBRMeGhjIQpij4Uw==
X-CSE-MsgGUID: J6dLgPUiQV+PjPYc85ehQQ==
X-ExtLoop1: 1
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:43:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	piotr.piorkowski@intel.com
Cc: kamil.konieczny@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/xe_debugfs: Add debugfs entry read/write
 validation in root-dir
Date: Thu, 11 Jun 2026 09:43:21 +0000
Message-ID: <20260611094321.367638-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Extend the root-dir subtest to validate additional Xe debugfs entries:

- dgfx_pkg_residencies: Validate counter reads (optional, non-empty)
- dgfx_pcie_link_residencies: Validate PCIE LINK string content (optional)
- sriov_info: Validate entry is non-empty (optional)
- workarounds: Validate entry is non-empty (optional)
- atomic_svm_timeslice_ms: Validate integer read/write (optional)
- poor_man_system_atomic_support: Validate boolean read/write (optional)
- disable_late_binding: Validate boolean read/write (optional)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 198 +++++++++++++++++++++++++++++++++++----
 1 file changed, 180 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 587e3e785..5e59424fe 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -39,11 +39,24 @@ IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
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
-	bool (*condition)(struct xe_device *xe_dev);
+	bool optional;
+	bool (*condition)(struct xe_device *xe_dev, void *params);
+	void *cond_params;
 	unsigned int (*iter_mask)(struct xe_device *xe_dev);
+	enum debugfs_validate_type validate;
+	const char *expected_str;
 };
 
 static unsigned int gt_iter_mask(struct xe_device *xe_dev)
@@ -56,8 +69,13 @@ static unsigned int tile_iter_mask(struct xe_device *xe_dev)
 	return xe_dev->tile_mask;
 }
 
-static bool has_vram(struct xe_device *xe_dev)
+static bool has_vram_region(struct xe_device *xe_dev, void *params)
 {
+	uint8_t tile = (uint8_t)(uintptr_t)params;
+
+	if (!(xe_dev->tile_mask & (1u << tile)))
+		return false;
+
 	return xe_dev->has_vram;
 }
 
@@ -131,16 +149,140 @@ static bool find_not_tested_files(int dir_fd, struct igt_list_head *hit_entries)
 	return found_not_tested;
 }
 
-static bool file_in_dir_exists(int dirfd, const char *file_name, int mode)
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
+		igt_warn("Expected '%s' not found in %s\n", expected_str, file_name);
+		return false;
+	}
+
+	if (expected_str)
+		igt_debug("Successfully read %s: found '%s'\n", file_name, expected_str);
+	else
+		igt_debug("Successfully read %s: %zd bytes\n%s\n", file_name, strlen(buf), buf);
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
+	long orig_val = 0, new_val = 0, read_val = 0;
+
+	if (igt_sysfs_scanf(dirfd, file_name, "%ld", &orig_val) != 1)
+		return false;
+
+	if (orig_val < 0)
+		return false;
+
+	if (mode == O_RDWR) {
+		new_val = orig_val + 1;
+		if (igt_sysfs_printf(dirfd, file_name, "%ld", new_val) < 0)
+			return false;
+		if (igt_sysfs_scanf(dirfd, file_name, "%ld", &read_val) != 1)
+			return false;
+		if (read_val != new_val)
+			return false;
+		/* Restore original value */
+		if (igt_sysfs_printf(dirfd, file_name, "%ld", orig_val) < 0) {
+			igt_warn("Failed to restore original value for %s\n", file_name);
+			return false;
+		}
+
+		igt_debug("Successfully validated %s int %s: %ld -> %ld -> %ld\n",
+			  mode_to_str(mode), file_name, orig_val, new_val, orig_val);
+	} else {
+		igt_debug("Successfully validated %s int %s: %ld\n",
+			  mode_to_str(mode), file_name, orig_val);
+	}
+	return true;
+}
+
+static bool validate_debugfs_file(int dirfd, const char *file_name, int mode,
+				  enum debugfs_validate_type validate, const char *expected_str)
 {
-	int fd = openat(dirfd, file_name, mode);
+	bool result = true;
 
-	if (fd >= 0) {
-		close(fd);
+	if (faccessat(dirfd, file_name, F_OK, 0) < 0) {
+		igt_debug("%s does not exist\n", file_name);
+		return false;
+	}
+	if (validate == VALIDATE_NONE)
 		return true;
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
 	}
 
-	return false;
+	return result;
 }
 
 /*
@@ -160,7 +302,7 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
 		unsigned int mask;
 		unsigned int j;
 
-		if (check->condition && !check->condition(xe_dev))
+		if (check->condition && !check->condition(xe_dev, check->cond_params))
 			continue;
 
 		if (!check->iter_mask)
@@ -209,10 +351,18 @@ static int debugfs_validate_entries(struct xe_device *xe_dev, int dir_fd,
 #pragma GCC diagnostic pop
 			}
 
-			if (!file_in_dir_exists(dir_fd, entry->name, check->mode)) {
-				igt_warn("Missing debugfs file: %s\n", entry->name);
-				missing_count++;
+			if (!validate_debugfs_file(dir_fd, entry->name, check->mode,
+						   check->validate, check->expected_str)) {
+				if (check->optional) {
+					igt_info("Optional entry %s not found/invalid (skipped)\n",
+						 entry->name);
+				} else {
+					igt_warn("Missing or invalid debugfs file: %s\n",
+						 entry->name);
+					missing_count++;
+				}
 			}
+
 		}
 	}
 
@@ -239,14 +389,25 @@ out:
 static void test_root_dir(struct xe_device *xe_dev)
 {
 	const struct check_entry expected_files[] = {
-		{ "clients", O_RDONLY },
+		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "forcewake_all", O_WRONLY },
 		{ "gem_names", O_RDONLY },
-		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
-		{ "gtt_mm", O_RDONLY },
-		{ "info", O_RDONLY },
-		{ "name", O_RDONLY },
-		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
+		{ "gt%u", O_RDONLY, .iter_mask = gt_iter_mask },
+		{ "gtt_mm", O_RDONLY, },
+		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "poor_man_system_atomic_support", O_RDWR, .optional = true,
+		  .validate = VALIDATE_BOOL },
+		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true,
+		  .validate = VALIDATE_NON_EMPTY },
+		{ "dgfx_pcie_link_residencies", O_RDONLY, .optional = true,
+		  .validate = VALIDATE_CONTAINS_STR, .expected_str = "PCIE LINK" },
+		{ "sriov_info", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
+		{ "workarounds", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
+		{ "atomic_svm_timeslice_ms", O_RDWR, .optional = true,
+		  .validate = VALIDATE_INT_GE_ZERO },
+		{ "tile%u", O_RDONLY, .iter_mask = tile_iter_mask },
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
 	int missing_count;
@@ -276,7 +437,8 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
 	const struct check_entry expected_files[] = {
 		{ "ggtt", O_RDONLY },
 		{ "sa_info", O_RDONLY },
-		{ "vram_mm", O_RDONLY, has_vram },
+		{ "vram_mm", O_RDONLY, .condition = has_vram_region,
+		  .cond_params = (void *)(uintptr_t)tile },
 	};
 	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
 	int missing_count;
-- 
2.43.0

