Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C746DC3ABDD
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 17:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E08B10E6CA;
	Wed, 14 May 2025 17:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8KNOz62";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C97310E6CA
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747245136; x=1778781136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INUvyCGb+CJPZeUi931PSP/MbCZtPke2wI/DHfdoK+o=;
 b=P8KNOz62pyXyTtggrUZGqkprMNYsExSDxPa/7ASynf+FgN9yFEwjVCPH
 9u2hID1KSXBFiHy2NDNpTJt4nkwCZeWM+FMlFdF4OtO9CAWIn0aG5t57A
 9P1Hw4czO6rOrb1Li76gUk44fkR54VDSlN0YUf+Ore2CMJvxplcHVt0QX
 3ddesRO9rHUt85gRgABtcJv6LnheAbqcu9SujHnAQMvcAf17k+8kzTqb1
 ZkA0g10+yRtYQb6YA276AZW1zS/sENGd8Xnd1oPUlH1+EeHal4UxM1nZ7
 ja8LUoR28ExLJbbSniqDKu8bYQTpxSz02qQgJ44yYgmPPbrOD1qHjSFjv Q==;
X-CSE-ConnectionGUID: PMHEYK7xQDC6obwLOxslIg==
X-CSE-MsgGUID: ErO6RuI9TXGo4o9VRyPIyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49025952"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49025952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:16 -0700
X-CSE-ConnectionGUID: i6sexk3YT/OI9L5C66L1eA==
X-CSE-MsgGUID: U1TWe5bLQgSBCUyKwrkMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142998420"
Received: from amiron-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.81.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:13 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [RFC i-g-t 1/5] Remove tests/intel/intel_sysfs_debugfs
Date: Wed, 14 May 2025 19:51:33 +0200
Message-ID: <20250514175140.115033-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
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

The intel_sysfs_debugfs test was originally introduced to unify testing
for both i915 and Xe drivers, aiming to prevent gaps in test coverage.
However, its implementation fell short in addressing scenarios where
both i915 and Xe were present in the system.

To address these limitations, intel_sysfs_debugfs will be replaced by a
more modular and comprehensive set of tests:

- tests/core_debugfs (gpu agnostic)
- tests/core_sysfs (gpu agnostic)
- tests/intel/xe_debugfs (complementary to core_debugfs)

This restructuring ensures better test coverage and flexibility moving
forward.

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/intel_sysfs_debugfs.c | 430 ------------------------------
 tests/meson.build                 |   1 -
 2 files changed, 431 deletions(-)
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c

diff --git a/tests/intel/intel_sysfs_debugfs.c b/tests/intel/intel_sysfs_debugfs.c
deleted file mode 100644
index dfd8d52d8..000000000
--- a/tests/intel/intel_sysfs_debugfs.c
+++ /dev/null
@@ -1,430 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#include <dirent.h>
-#include <fcntl.h>
-
-#include "i915/gem.h"
-#include "igt.h"
-#include "igt_sysfs.h"
-#include "xe/xe_query.h"
-
-struct {
-	bool warn_on_not_hit;
-} opt = { 0 };
-
-/**
- * TEST: debugfs test
- * Description: Read entries from debugfs, and sysfs paths.
- * Category: Core
- * Mega feature: General Core features
- * Sub-category: uapi
- * Functionality: debugfs
- * Feature: core
- * Test category: uapi
- *
- * SUBTEST: i915-debugfs-read-all-entries
- * Description: Read all entries from debugfs path validating debugfs entries
- *
- * SUBTEST: i915-debugfs-read-all-entries-display-off
- * Description: Read all debugfs entries with display off.
- *
- * SUBTEST: i915-debugfs-read-all-entries-display-on
- * Description: Read all debugfs entries with display on.
- *
- * SUBTEST: i915-sysfs-read-all-entries
- * Description: Read all entries from sysfs path validating debugfs entries
- *
- * SUBTEST: xe-debugfs-read-all-entries
- * Description: Read all entries from debugfs path validating debugfs entries
- *
- * SUBTEST: xe-debugfs-read-all-entries-display-off
- * Description: Read all debugfs entries with display off.
- *
- * SUBTEST: xe-debugfs-read-all-entries-display-on
- * Description: Read all debugfs entries with display on.
- *
- * SUBTEST: xe-sysfs-read-all-entries
- * Description: Read all entries from sysfs path validating debugfs entries
- *
- */
-
-IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
-
-static void read_and_discard_sysfs_entries(int path_fd, int indent)
-{
-	struct dirent *dirent;
-	DIR *dir;
-	char tabs[8];
-	int i;
-
-	igt_assert(indent < sizeof(tabs) - 1);
-
-	for (i = 0; i < indent; i++)
-		tabs[i] = '\t';
-	tabs[i] = '\0';
-
-	dir = fdopendir(path_fd);
-	if (!dir)
-		return;
-
-	while ((dirent = readdir(dir))) {
-		if (!strcmp(dirent->d_name, ".") ||
-		    !strcmp(dirent->d_name, ".."))
-			continue;
-
-		if (dirent->d_type == DT_DIR) {
-			int sub_fd;
-
-			sub_fd = openat(path_fd, dirent->d_name,
-					O_RDONLY | O_DIRECTORY);
-			if (sub_fd < 0)
-				continue;
-
-			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
-			read_and_discard_sysfs_entries(sub_fd, indent + 1);
-			close(sub_fd);
-		} else if (dirent->d_type == DT_REG) {
-			char buf[512];
-			int sub_fd;
-			ssize_t ret;
-
-			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
-			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
-
-			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
-			if (sub_fd == -1) {
-				igt_debug("%sCould not open file \"%s\" with error: %m\n",
-					  tabs, dirent->d_name);
-				continue;
-			}
-
-			do {
-				ret = read(sub_fd, buf, sizeof(buf));
-			} while (ret == sizeof(buf));
-
-			if (ret == -1)
-				igt_debug("%sCould not read file \"%s\" with error: %m\n",
-					  tabs, dirent->d_name);
-
-			close(sub_fd);
-		}
-	}
-	closedir(dir);
-}
-
-static void kms_tests(int fd, int debugfs, const char *card_name)
-{
-	igt_display_t display;
-	struct igt_fb fb[IGT_MAX_PIPES];
-	enum pipe pipe;
-	int ret;
-	char test_name[64];
-
-	igt_fixture
-		igt_display_require(&display, fd);
-
-	snprintf(test_name, sizeof(test_name),
-		 "%s-debugfs-read-all-entries-display-on", card_name);
-
-	igt_subtest(test_name) {
-		/* try to light all pipes */
-retry:
-		for_each_pipe(&display, pipe) {
-			igt_output_t *output;
-
-			for_each_valid_output_on_pipe(&display, pipe, output) {
-				igt_plane_t *primary;
-				drmModeModeInfo *mode;
-
-				if (output->pending_pipe != PIPE_NONE)
-					continue;
-
-				igt_output_set_pipe(output, pipe);
-				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-				mode = igt_output_get_mode(output);
-				igt_create_pattern_fb(display.drm_fd,
-						      mode->hdisplay, mode->vdisplay,
-						      DRM_FORMAT_XRGB8888,
-						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
-
-				/* Set a valid fb as some debugfs like to
-				 * inspect it on a active pipe
-				 */
-				igt_plane_set_fb(primary, &fb[pipe]);
-				break;
-			}
-		}
-
-		if (display.is_atomic)
-			ret = igt_display_try_commit_atomic(&display,
-					DRM_MODE_ATOMIC_TEST_ONLY |
-					DRM_MODE_ATOMIC_ALLOW_MODESET,
-					NULL);
-		else
-			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
-
-		if (ret) {
-			igt_output_t *output;
-			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
-
-			igt_require_f(found, "No valid mode combo found.\n");
-
-			for_each_connected_output(&display, output)
-				igt_output_set_pipe(output, PIPE_NONE);
-
-			goto retry;
-		}
-
-		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-
-		read_and_discard_sysfs_entries(debugfs, 0);
-	}
-
-	snprintf(test_name, sizeof(test_name),
-		 "%s-debugfs-read-all-entries-display-off", card_name);
-
-	igt_subtest(test_name) {
-		igt_output_t *output;
-		igt_plane_t *plane;
-
-		for_each_connected_output(&display, output)
-			igt_output_set_pipe(output, PIPE_NONE);
-
-		for_each_pipe(&display, pipe)
-			for_each_plane_on_pipe(&display, pipe, plane)
-				igt_plane_set_fb(plane, NULL);
-
-		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-
-		read_and_discard_sysfs_entries(debugfs, 0);
-	}
-
-	igt_fixture
-		igt_display_fini(&display);
-}
-
-static int xe_validate_entries(int fd, const char *add_path,
-			       const char * const str_val[], int str_cnt)
-{
-	int i;
-	int hit;
-	int found = 0;
-	int not_found = 0;
-	DIR *dir;
-	struct dirent *de;
-	char path[PATH_MAX];
-
-	if (!igt_debugfs_path(fd, path, sizeof(path)))
-		return -1;
-
-	strcat(path, add_path);
-	dir = opendir(path);
-	if (!dir)
-		return -1;
-
-	while ((de = readdir(dir))) {
-		if (de->d_name[0] == '.')
-			continue;
-		hit = 0;
-		for (i = 0; i < str_cnt; i++) {
-			if (!strcmp(str_val[i], de->d_name)) {
-				hit = 1;
-				break;
-			}
-		}
-		if (hit) {
-			found++;
-		} else if (opt.warn_on_not_hit) {
-			not_found++;
-			igt_warn("no test for: %s/%s\n", path, de->d_name);
-		}
-	}
-	closedir(dir);
-	return 0;
-}
-
-/**
- * SUBTEST: xe-base
- * Description: Check if various debugfs devnodes exist and test reading them
- */
-static void
-xe_test_base(int fd, struct drm_xe_query_config *config)
-{
-	uint16_t devid = intel_get_drm_devid(fd);
-	static const char * const expected_files[] = {
-		"gt0",
-		"gt1",
-		"stolen_mm",
-		"gtt_mm",
-		"vram0_mm",
-		"forcewake_all",
-		"info",
-		"gem_names",
-		"clients",
-		"name"
-	};
-	char reference[4096];
-	int val = 0;
-
-	igt_assert(config);
-	sprintf(reference, "devid 0x%llx",
-			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	sprintf(reference, "revid %lld",
-			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
-
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	if (intel_gen(devid) < 20) {
-		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
-		case 48:
-			val = 3;
-			break;
-		case 57:
-			val = 4;
-			break;
-		}
-
-		sprintf(reference, "vm_max_level %d", val);
-		igt_assert(igt_debugfs_search(fd, "info", reference));
-	}
-
-	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
-	igt_assert(igt_debugfs_search(fd, "info", reference));
-
-	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
-
-	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
-	igt_debugfs_dump(fd, "gtt_mm");
-
-	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
-		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
-		igt_debugfs_dump(fd, "vram0_mm");
-	}
-
-	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
-		igt_debugfs_dump(fd, "stolen_mm");
-
-	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
-	igt_debugfs_dump(fd, "clients");
-
-	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
-	igt_debugfs_dump(fd, "gem_names");
-
-	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
-}
-
-/**
- * SUBTEST: xe-forcewake
- * Description: Check forcewake debugfs devnode
- */
-static void
-xe_test_forcewake(int fd)
-{
-	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
-
-	igt_assert_neq(handle, -1);
-	close(handle);
-}
-
-const char *help_str =
-	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
-
-struct option long_options[] = {
-	{ "--warn-not-hit", no_argument, NULL, 'w'},
-	{ 0, 0, 0, 0 }
-};
-
-static int opt_handler(int option, int option_index, void *input)
-{
-	switch (option) {
-	case 'w':
-		opt.warn_on_not_hit = true;
-		break;
-	default:
-		return IGT_OPT_HANDLER_ERROR;
-	}
-
-	return IGT_OPT_HANDLER_SUCCESS;
-}
-
-igt_main_args("", long_options, help_str, opt_handler, NULL)
-{
-	int debugfs = -1;
-	int fd = -1;
-	int sysfs = -1;
-
-	igt_subtest_group {
-		igt_fixture {
-			fd = drm_open_driver_master(DRIVER_INTEL);
-			igt_require_gem(fd);
-			debugfs = igt_debugfs_dir(fd);
-			sysfs = igt_sysfs_open(fd);
-
-			kmstest_set_vt_graphics_mode();
-		}
-
-		igt_describe("Read all entries from sysfs path.");
-		igt_subtest("i915-sysfs-read-all-entries")
-			read_and_discard_sysfs_entries(sysfs, 0);
-		igt_describe("Read all entries from debugfs path.");
-		igt_subtest("i915-debugfs-read-all-entries")
-			read_and_discard_sysfs_entries(debugfs, 0);
-
-		igt_describe("Read all debugfs entries with display on/off.");
-		igt_subtest_group
-			kms_tests(fd, debugfs, "i915");
-
-		igt_fixture {
-			close(sysfs);
-			close(debugfs);
-			drm_close_driver(fd);
-		}
-	}
-
-	igt_subtest_group {
-		igt_fixture {
-			fd = drm_open_driver_master(DRIVER_XE);
-			__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
-			debugfs = igt_debugfs_dir(fd);
-			sysfs = igt_sysfs_open(fd);
-
-			kmstest_set_vt_graphics_mode();
-		}
-
-		igt_describe("Read all entries from sysfs path.");
-		igt_subtest("xe-sysfs-read-all-entries")
-			read_and_discard_sysfs_entries(sysfs, 0);
-		igt_describe("Read all entries from debugfs path.");
-		igt_subtest("xe-debugfs-read-all-entries")
-			read_and_discard_sysfs_entries(debugfs, 0);
-
-		igt_describe("Read all debugfs entries with display on/off.");
-		igt_subtest_group
-			kms_tests(fd, debugfs, "xe");
-
-		igt_describe("Check if various debugfs devnodes exist and test reading them.");
-		igt_subtest("xe-base") {
-			xe_test_base(fd, xe_config(fd));
-		}
-
-		igt_describe("Check forcewake debugfs devnode");
-		igt_subtest("xe-forcewake") {
-			xe_test_forcewake(fd);
-		}
-
-		igt_fixture {
-			close(sysfs);
-			close(debugfs);
-			drm_close_driver(fd);
-		}
-	}
-}
diff --git a/tests/meson.build b/tests/meson.build
index 20ddddb89..335d82e9d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -83,7 +83,6 @@ test_progs = [
 intel_i915_xe_progs = [
 	'api_intel_allocator',
 	'intel_hwmon',
-	'intel_sysfs_debugfs',
 ]
 
 intel_i915_progs = [
-- 
2.43.0

