Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF5C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89D310E061;
	Fri, 28 Mar 2025 08:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa6CV5Tp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FE510E061
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743150521; x=1774686521;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lOsflbruQ5Mn8ukkVhSygFEg0H0xe8W2AimpabEzBnY=;
 b=Fa6CV5Tp4gz5lIabOm+9bjf7c5mh6x5gQHqY4BL+IT6CCqCohadhVzG/
 8eNRX9qMv9vcypbqB39kzRSf+Tw0VjwEU15ofspEmhJn4XEBLAInooF+y
 6KR+esVT5vDsL7XbyE6tQIEIGt6A/PLxsPcwNDJiZC5brPBPLBcr1Rdj8
 Y9kC64AC3bkWS/S6n/nQB1m88PJdMlt1SAe5MzTWcb/7Y2I7iQC6M/q5T
 k5g5V97iCkQzyBRJCnQEE/JapDTAZLoCadw2uq1Nr5osoHCITJlBPPU1e
 8QgNDLfHtGwm29p8azdoDKL6Dxa2I0u8BfazYlfcouvLSBYpgcPaHIhuM Q==;
X-CSE-ConnectionGUID: fEQPb99vQVOxPFGAPWMqmA==
X-CSE-MsgGUID: 6TJ4yAYRTXGEnGYK4BkYIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48379561"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48379561"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:28:41 -0700
X-CSE-ConnectionGUID: OXhuqABATT+YsYO6RIM9PA==
X-CSE-MsgGUID: Sd+txT49QyucNd26I5NjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125144897"
Received: from saswiest-mobl1.ger.corp.intel.com (HELO [10.245.80.210])
 ([10.245.80.210])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:28:40 -0700
Message-ID: <113c1b38-2f7f-4967-8767-1ac80747cab9@linux.intel.com>
Date: Fri, 28 Mar 2025 09:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/intel_kernelfs: Unify sysfs and
 debugfs testing
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
References: <20250318213755.366638-1-peter.senna@linux.intel.com>
 <20250322130316.272087-1-peter.senna@linux.intel.com>
 <20250322130316.272087-2-peter.senna@linux.intel.com>
 <Z-XPoLxOWgUpvIXK@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <Z-XPoLxOWgUpvIXK@intel.com>
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



On 3/27/2025 11:22 PM, Rodrigo Vivi wrote:
> On Sat, Mar 22, 2025 at 02:03:16PM +0100, Peter Senna Tschudin wrote:
>> Introduces intel_kernelfs, replacing debugfs_test and xe_debugfs. It
>> organizes tests into separate subgroups for i915 and xe, ensuring only
>> the relevant tests run for each driver.
>>
>> i915 test list:
>>  - i915-sysfs-read-all-entries
>>  - i915-debugfs-read-all-entries
>>  - i915-debugfs-read-all-entries-display-on
>>  - i915-debugfs-read-all-entries-display-off
>>
>> Xe test list:
>>  - xe-sysfs-read-all-entries
>>  - xe-debugfs-read-all-entries
>>  - xe-debugfs-read-all-entries-display-on
>>  - xe-debugfs-read-all-entries-display-off
>>  - xe-debugfs-read-all-entries-display-off
>>  - xe-base
>>  - xe-gt
>>  - xe-forcewake
>>
>> This unification closes testing gaps between i915 and Xe while
>> simplifying code maintenance.
>>
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: rodrigo.vivi@intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>
>> v2:
>>  - renamed xe-specific functions with the xe_ prefix
>>  - created two igt_subtest_groups: one for i915 and another for Xe
>>  - prefixed each test with either i915 or xe
>>
>>  tests/intel/intel_kernelfs.c | 500 +++++++++++++++++++++++++++++++++++
>>  tests/meson.build            |   1 +
>>  2 files changed, 501 insertions(+)
>>  create mode 100644 tests/intel/intel_kernelfs.c
>>
>> diff --git a/tests/intel/intel_kernelfs.c b/tests/intel/intel_kernelfs.c
>> new file mode 100644
>> index 000000000..55c83a48a
>> --- /dev/null
>> +++ b/tests/intel/intel_kernelfs.c
>> @@ -0,0 +1,500 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +
>> +#include "i915/gem.h"
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +#include "xe/xe_query.h"
>> +
>> +struct {
>> +	bool warn_on_not_hit;
>> +} opt = { 0 };
>> +
>> +/**
>> + * TEST: debugfs test
>> + * Description: Read entries from debugfs, and sysfs paths.
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: debugfs
>> + * Feature: core
>> + * Test category: uapi
>> + *
>> + * SUBTEST: i915-debugfs-read-all-entries
>> + * Description: Read all entries from debugfs path validating debugfs entries
>> + *
>> + * SUBTEST: i915-debugfs-read-all-entries-display-off
>> + * Description: Read all debugfs entries with display off.
>> + *
>> + * SUBTEST: i915-debugfs-read-all-entries-display-on
>> + * Description: Read all debugfs entries with display on.
>> + *
>> + * SUBTEST: i915-sysfs-read-all-entries
>> + * Description: Read all entries from sysfs path validating debugfs entries
>> + *
>> + * SUBTEST: xe-debugfs-read-all-entries
>> + * Description: Read all entries from debugfs path validating debugfs entries
>> + *
>> + * SUBTEST: xe-debugfs-read-all-entries-display-off
>> + * Description: Read all debugfs entries with display off.
>> + *
>> + * SUBTEST: xe-debugfs-read-all-entries-display-on
>> + * Description: Read all debugfs entries with display on.
>> + *
>> + * SUBTEST: xe-sysfs-read-all-entries
>> + * Description: Read all entries from sysfs path validating debugfs entries
>> + *
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
>> +
>> +static void read_and_discard_sysfs_entries(int path_fd, int indent)
>> +{
>> +	struct dirent *dirent;
>> +	DIR *dir;
>> +	char tabs[8];
>> +	int i;
>> +
>> +	igt_assert(indent < sizeof(tabs) - 1);
>> +
>> +	for (i = 0; i < indent; i++)
>> +		tabs[i] = '\t';
>> +	tabs[i] = '\0';
>> +
>> +	dir = fdopendir(path_fd);
>> +	if (!dir)
>> +		return;
>> +
>> +	while ((dirent = readdir(dir))) {
>> +		if (!strcmp(dirent->d_name, ".") ||
>> +		    !strcmp(dirent->d_name, ".."))
>> +			continue;
>> +
>> +		if (dirent->d_type == DT_DIR) {
>> +			int sub_fd;
>> +
>> +			sub_fd = openat(path_fd, dirent->d_name,
>> +					O_RDONLY | O_DIRECTORY);
>> +			if (sub_fd < 0)
>> +				continue;
>> +
>> +			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
>> +			read_and_discard_sysfs_entries(sub_fd, indent + 1);
>> +			close(sub_fd);
>> +		} else if (dirent->d_type == DT_REG) {
>> +			char buf[512];
>> +			int sub_fd;
>> +			ssize_t ret;
>> +
>> +			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
>> +			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
>> +			igt_set_timeout(5, "reading sysfs entry");
>> +
>> +			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
>> +			if (sub_fd == -1) {
>> +				igt_debug("%sCould not open file \"%s\" with error: %m\n",
>> +					  tabs, dirent->d_name);
>> +				continue;
>> +			}
>> +
>> +			do {
>> +				ret = read(sub_fd, buf, sizeof(buf));
>> +			} while (ret == sizeof(buf));
>> +
>> +			if (ret == -1)
>> +				igt_debug("%sCould not read file \"%s\" with error: %m\n",
>> +					  tabs, dirent->d_name);
>> +
>> +			igt_reset_timeout();
>> +			close(sub_fd);
>> +		}
>> +	}
>> +	closedir(dir);
>> +}
>> +
>> +static void kms_tests(int fd, int debugfs, const char *card_name)
>> +{
>> +	igt_display_t display;
>> +	struct igt_fb fb[IGT_MAX_PIPES];
>> +	enum pipe pipe;
>> +	int ret;
>> +	char test_name[64];
>> +
>> +	igt_fixture
>> +		igt_display_require(&display, fd);
>> +
>> +	snprintf(test_name, sizeof(test_name),
>> +		 "%s-debugfs-read-all-entries-display-on", card_name);
>> +
>> +	igt_subtest(test_name) {
>> +		/* try to light all pipes */
>> +retry:
>> +		for_each_pipe(&display, pipe) {
>> +			igt_output_t *output;
>> +
>> +			for_each_valid_output_on_pipe(&display, pipe, output) {
>> +				igt_plane_t *primary;
>> +				drmModeModeInfo *mode;
>> +
>> +				if (output->pending_pipe != PIPE_NONE)
>> +					continue;
>> +
>> +				igt_output_set_pipe(output, pipe);
>> +				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +				mode = igt_output_get_mode(output);
>> +				igt_create_pattern_fb(display.drm_fd,
>> +						      mode->hdisplay, mode->vdisplay,
>> +						      DRM_FORMAT_XRGB8888,
>> +						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
>> +
>> +				/* Set a valid fb as some debugfs like to
>> +				 * inspect it on a active pipe
>> +				 */
>> +				igt_plane_set_fb(primary, &fb[pipe]);
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (display.is_atomic)
>> +			ret = igt_display_try_commit_atomic(&display,
>> +					DRM_MODE_ATOMIC_TEST_ONLY |
>> +					DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +					NULL);
>> +		else
>> +			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
>> +
>> +		if (ret) {
>> +			igt_output_t *output;
>> +			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
>> +
>> +			igt_require_f(found, "No valid mode combo found.\n");
>> +
>> +			for_each_connected_output(&display, output)
>> +				igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +			goto retry;
>> +		}
>> +
>> +		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +
>> +		read_and_discard_sysfs_entries(debugfs, 0);
>> +	}
>> +
>> +	snprintf(test_name, sizeof(test_name),
>> +		 "%s-debugfs-read-all-entries-display-off", card_name);
>> +
>> +	igt_subtest(test_name) {
>> +		igt_output_t *output;
>> +		igt_plane_t *plane;
>> +
>> +		for_each_connected_output(&display, output)
>> +			igt_output_set_pipe(output, PIPE_NONE);
>> +
>> +		for_each_pipe(&display, pipe)
>> +			for_each_plane_on_pipe(&display, pipe, plane)
>> +				igt_plane_set_fb(plane, NULL);
>> +
>> +		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +
>> +		read_and_discard_sysfs_entries(debugfs, 0);
>> +	}
>> +
>> +	igt_fixture
>> +		igt_display_fini(&display);
>> +}
>> +
>> +static int xe_validate_entries(int fd, const char *add_path,
>> +			       const char * const str_val[], int str_cnt)
>> +{
>> +	int i;
>> +	int hit;
>> +	int found = 0;
>> +	int not_found = 0;
>> +	DIR *dir;
>> +	struct dirent *de;
>> +	char path[PATH_MAX];
>> +
>> +	if (!igt_debugfs_path(fd, path, sizeof(path)))
>> +		return -1;
>> +
>> +	strcat(path, add_path);
>> +	dir = opendir(path);
>> +	if (!dir)
>> +		return -1;
>> +
>> +	while ((de = readdir(dir))) {
>> +		if (de->d_name[0] == '.')
>> +			continue;
>> +		hit = 0;
>> +		for (i = 0; i < str_cnt; i++) {
>> +			if (!strcmp(str_val[i], de->d_name)) {
>> +				hit = 1;
>> +				break;
>> +			}
>> +		}
>> +		if (hit) {
>> +			found++;
>> +		} else if (opt.warn_on_not_hit) {
>> +			not_found++;
>> +			igt_warn("no test for: %s/%s\n", path, de->d_name);
>> +		}
>> +	}
>> +	closedir(dir);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * SUBTEST: xe-base
>> + * Description: Check if various debugfs devnodes exist and test reading them
>> + */
>> +static void
>> +xe_test_base(int fd, struct drm_xe_query_config *config)
>> +{
>> +	uint16_t devid = intel_get_drm_devid(fd);
>> +	static const char * const expected_files[] = {
>> +		"gt0",
>> +		"gt1",
>> +		"stolen_mm",
>> +		"gtt_mm",
>> +		"vram0_mm",
>> +		"forcewake_all",
>> +		"info",
>> +		"gem_names",
>> +		"clients",
>> +		"name"
>> +	};
>> +	char reference[4096];
>> +	int val = 0;
>> +
>> +	igt_assert(config);
>> +	sprintf(reference, "devid 0x%llx",
>> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
>> +	igt_assert(igt_debugfs_search(fd, "info", reference));
>> +
>> +	sprintf(reference, "revid %lld",
>> +			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
>> +	igt_assert(igt_debugfs_search(fd, "info", reference));
>> +
>> +	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
>> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
>> +
>> +	igt_assert(igt_debugfs_search(fd, "info", reference));
>> +
>> +	if (intel_gen(devid) < 20) {
>> +		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
>> +		case 48:
>> +			val = 3;
>> +			break;
>> +		case 57:
>> +			val = 4;
>> +			break;
>> +		}
>> +
>> +		sprintf(reference, "vm_max_level %d", val);
>> +		igt_assert(igt_debugfs_search(fd, "info", reference));
>> +	}
>> +
>> +	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
>> +	igt_assert(igt_debugfs_search(fd, "info", reference));
>> +
>> +	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
>> +
>> +	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
>> +	igt_debugfs_dump(fd, "gtt_mm");
>> +
>> +	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
>> +		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
>> +		igt_debugfs_dump(fd, "vram0_mm");
>> +	}
>> +
>> +	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
>> +		igt_debugfs_dump(fd, "stolen_mm");
>> +
>> +	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
>> +	igt_debugfs_dump(fd, "clients");
>> +
>> +	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
>> +	igt_debugfs_dump(fd, "gem_names");
>> +
>> +	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
>> +}
>> +
>> +/**
>> + * SUBTEST: xe-gt
>> + * Description: Check all gt debugfs devnodes
>> + * TODO: add support for ``force_reset`` entries
>> + */
>> +static void
>> +xe_test_gt(int fd, int gt_id)
>> +{
>> +	char name[256];
>> +	static const char * const expected_files[] = {
>> +		"uc",
>> +		"steering",
>> +		"topology",
>> +		"sa_info",
>> +		"hw_engines",
>> +		"pat",
>> +		"mocs",
>> +//		"force_reset"
>> +		"ggtt",
>> +		"register-save-restore",
>> +		"workarounds",
>> +		"default_lrc_rcs",
>> +		"default_lrc_ccs",
>> +		"default_lrc_bcs",
>> +		"default_lrc_vcs",
>> +		"default_lrc_vecs",
>> +		"hwconfig"
>> +
>> +	};
>> +	static const char * const expected_files_uc[] = {
>> +		"huc_info",
>> +		"guc_log",
>> +		"guc_info",
>> +//		"guc_ct_selftest"
>> +	};
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
>> +		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
>> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> +		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
>> +			continue;
>> +		igt_debugfs_dump(fd, name);
>> +	}
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
>> +		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
>> +		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>> +		igt_debugfs_dump(fd, name);
>> +	}
>> +
>> +	sprintf(name, "/gt%d", gt_id);
>> +	xe_validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
>> +
>> +	sprintf(name, "/gt%d/uc", gt_id);
>> +	xe_validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
>> +}
>> +
>> +/**
>> + * SUBTEST: xe-forcewake
>> + * Description: Check forcewake debugfs devnode
>> + */
>> +static void
>> +xe_test_forcewake(int fd)
>> +{
>> +	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
>> +
>> +	igt_assert_neq(handle, -1);
>> +	close(handle);
>> +}
>> +
>> +const char *help_str =
>> +	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
>> +
>> +struct option long_options[] = {
>> +	{ "--warn-not-hit", no_argument, NULL, 'w'},
>> +	{ 0, 0, 0, 0 }
>> +};
>> +
>> +static int opt_handler(int option, int option_index, void *input)
>> +{
>> +	switch (option) {
>> +	case 'w':
>> +		opt.warn_on_not_hit = true;
>> +		break;
>> +	default:
>> +		return IGT_OPT_HANDLER_ERROR;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +igt_main_args("", long_options, help_str, opt_handler, NULL)
>> +{
>> +	int debugfs = -1;
>> +	char devnode[PATH_MAX];
>> +	int fd = -1;
>> +	int gt;
>> +	int sysfs = -1;
>> +
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			fd = drm_open_driver_master(DRIVER_INTEL);
>> +			igt_require_gem(fd);
>> +			debugfs = igt_debugfs_dir(fd);
>> +			sysfs = igt_sysfs_open(fd);
>> +
>> +			kmstest_set_vt_graphics_mode();
>> +		}
>> +
>> +		igt_describe("Read all entries from sysfs path.");
>> +		igt_subtest("i915-sysfs-read-all-entries")
>> +			read_and_discard_sysfs_entries(sysfs, 0);
>> +		igt_describe("Read all entries from debugfs path.");
>> +		igt_subtest("i915-debugfs-read-all-entries")
>> +			read_and_discard_sysfs_entries(debugfs, 0);
>> +
>> +		igt_describe("Read all debugfs entries with display on/off.");
>> +		igt_subtest_group
>> +			kms_tests(fd, debugfs, "i915");
>> +
>> +		igt_fixture {
>> +			close(sysfs);
>> +			close(debugfs);
>> +			drm_close_driver(fd);
>> +		}
>> +	}
>> +
>> +	igt_subtest_group {
>> +		igt_fixture {
>> +			fd = drm_open_driver_master(DRIVER_XE);
>> +			__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
>> +			debugfs = igt_debugfs_dir(fd);
>> +			sysfs = igt_sysfs_open(fd);
>> +
>> +			kmstest_set_vt_graphics_mode();
>> +		}
>> +
>> +		igt_describe("Read all entries from sysfs path.");
>> +		igt_subtest("xe-sysfs-read-all-entries")
>> +			read_and_discard_sysfs_entries(sysfs, 0);
>> +		igt_describe("Read all entries from debugfs path.");
>> +		igt_subtest("xe-debugfs-read-all-entries")
>> +			read_and_discard_sysfs_entries(debugfs, 0);
>> +
>> +		igt_describe("Read all debugfs entries with display on/off.");
>> +		igt_subtest_group
>> +			kms_tests(fd, debugfs, "xe");
>> +
>> +		igt_describe("Check if various debugfs devnodes exist and test reading them.");
>> +		igt_subtest("xe-base") {
>> +			xe_test_base(fd, xe_config(fd));
>> +		}
>> +
>> +		igt_describe("Check all gt debugfs devnodes");
>> +		igt_subtest("xe-gt") {
>> +			xe_for_each_gt(fd, gt) {
>> +				snprintf(devnode, sizeof(devnode), "gt%d", gt);
>> +				igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
>> +				xe_test_gt(fd, gt);
>> +			}
>> +		}
>> +
>> +		igt_describe("Check forcewake debugfs devnode");
>> +		igt_subtest("xe-forcewake") {
>> +			xe_test_forcewake(fd);
>> +		}
>> +
>> +		igt_fixture {
>> +			close(sysfs);
>> +			close(debugfs);
>> +			drm_close_driver(fd);
>> +		}
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2f5406523..c98bd45ff 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -83,6 +83,7 @@ test_progs = [
>>  intel_i915_xe_progs = [
>>  	'api_intel_allocator',
>>  	'intel_hwmon',
>> +	'intel_kernelfs',
> 
> The patch looks great, thank you. The only thing that I'm not 100% comfortable with
> is its name, since kernelfs is not a real thing. perhaps intel_sysfs_debugfs?
> But I'm also terrible with name so not a blocker.

I am open to a diferent name too. The idea of 'kernelfs' is to be a single umbrela
term for both debugfs and sysfs. But I agree with you in that it can be a third
name instead of a well meaning umbrela term.
 > Another thing, perhaps we should delete the other tests that this one here is
> currently replacing?
For some reason patchwork did not get the cover letter*, but the intention
is to send a follow-up series that will(copy and paste from cover letter):
 - Remove the redundant hwmon-basic test from debugfs_test, as
   intel_hwmon already provides full coverage for i915 and Xe.
 - Remove both debugfs_test and xe_debugfs.

The removal of existing tests impacts external test lists, requiring
updates that take time. By first addressing the test gap, we ensure
complete coverage while minimizing disruption. The follow-up series will
then focus on cleanup for improving long-term maintainability.

* - https://lists.freedesktop.org/archives/igt-dev/2025-March/087640.html


