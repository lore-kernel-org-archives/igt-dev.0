Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E28DC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 09:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4C610E9BC;
	Fri,  4 Jul 2025 09:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQAB2/1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DEC10E9BC
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751619981; x=1783155981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NQModE7ZkETHcIrfq60F94pOQUeOgkCIfp3rKlR0boc=;
 b=FQAB2/1MtxkxwrrAb63SKg9x4KpVpbC4Ykr9DYstny6hNcjB7uWiT9pn
 t/WF85rQJE/x5nT+D25tpgg1wkt/x5u0Un6axOpZz5g8RjJL7eVY3NRr1
 VrOl3Z2GrTvDenEFKqcb7tqfCMo/IBujsd3bYp4OeSP4C0NmuQsq4cNaq
 lbE8uW/aUPxtLk70kza/EZcGPrmU49U+Yp3dPSjuq1qLS0zn3yuCcUePJ
 qCcxC5BpGq5B+MgsBLvPazw3CxiJT9NN6qC/U+pmY7A+GuPSz3qPE8bJh
 Fx4R7pUGHuhmN/jz6mPb/uDzmaiZsN3vx6StFIRsZwG9ak3eY+zy6DLrf Q==;
X-CSE-ConnectionGUID: nNNQiO1uRVSaDCbPKxGWUw==
X-CSE-MsgGUID: ntFr70WCTY20vJ/w0igsIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56579904"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="56579904"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:06:20 -0700
X-CSE-ConnectionGUID: vicFuwYYT2uc6H39Qy1LoQ==
X-CSE-MsgGUID: MaUylD80R7ijxEi55WUogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="159149713"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 02:06:18 -0700
Message-ID: <81885310-1ccf-4d0e-9ec2-606807c5a185@linux.intel.com>
Date: Fri, 4 Jul 2025 11:06:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 resend i-g-t 5/6] tests: Add xe_debugfs
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org, michal.wajdeczko@intel.com,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-6-peter.senna@linux.intel.com>
 <aGbpyhgv6AwZ41Sm@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <aGbpyhgv6AwZ41Sm@intel.com>
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



On 7/3/2025 10:36 PM, Rodrigo Vivi wrote:
> On Mon, Jun 16, 2025 at 09:42:37AM +0200, Peter Senna Tschudin wrote:
>> xe_debugfs is a test specific to Xe GPUs. It is intended to complement
>> the existing generic debugfs tests core_debugfs and
>> core_debugfs_display_on_off.
>>
>> Additionally, this test has been updated to use the igt_dir
>> infrastructure, resulting in simpler code.
>>
>> Cc: michal.wajdeczko@intel.com
>> Cc: marcin.bernatowicz@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Cc: zbigniew.kempczynski@intel.com
>> Cc: ewelina.musial@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>> v3:
>>  - unchanged from v2
>> v2:
>>  - changed style of comparison to NULL
>>
>>  tests/intel-ci/xe-fast-feedback.testlist |   2 +
>>  tests/intel/xe_debugfs.c                 | 208 +++++++++++++++++++++++
>>  tests/meson.build                        |   1 +
>>  3 files changed, 211 insertions(+)
>>  create mode 100644 tests/intel/xe_debugfs.c
>>
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>> index a5f799f6b..c52f08953 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -78,6 +78,8 @@ igt@xe_create@create-execqueues-noleak
>>  igt@xe_create@create-execqueues-leak
>>  igt@xe_create@create-invalid-mbz
>>  igt@xe_create@create-massive-size
>> +igt@xe_debugfs@xe-base
>> +igt@xe_debugfs@xe-forcewake
>>  igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
>>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
>>  igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
>> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
>> new file mode 100644
>> index 000000000..66a5fa0f6
>> --- /dev/null
>> +++ b/tests/intel/xe_debugfs.c
>> @@ -0,0 +1,208 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +
>> +#include "igt.h"
>> +#include "igt_debugfs.h"
>> +#include "igt_dir.h"
>> +#include "igt_sysfs.h"
>> +#include "xe/xe_query.h"
>> +
>> +
>> +struct {
>> +	bool warn_on_not_hit;
>> +} opt = { 0 };
>> +
>> +/**
>> + * TEST: Xe debugfs test
>> + * Description: Xe-specific debugfs tests. These are complementary to the
>> + * core_debugfs and core_debugfs_display_on_off tests.
>> + *
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: debugfs
>> + * Feature: core
>> + * Test category: uapi
>> + *
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
>> +
>> +static int xe_validate_entries(igt_dir_t *igt_dir,
>> +			       const char * const str_val[], int str_cnt)
>> +{
>> +	igt_dir_file_list_t *file_list_entry;
>> +
>> +	if (!igt_dir)
>> +		return -1;
>> +
>> +	igt_dir_scan_dirfd(igt_dir, -1);
>> +
>> +	for (int i = 0; i < str_cnt; i++) {
>> +		int hit = 0;
>> +
>> +		igt_list_for_each_entry(file_list_entry,
>> +					&igt_dir->file_list_head, link) {
>> +			if (strcmp(file_list_entry->relative_path,
>> +				   str_val[i]) == 0) {
>> +				hit = 1;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!hit && opt.warn_on_not_hit)
>> +			igt_warn("no test for: %s\n", str_val[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * SUBTEST: xe-base
>> + * Description: Check if various debugfs devnodes exist and test reading them
>> + */
>> +static void
>> +xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
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
>> +	xe_validate_entries(igt_dir, expected_files,
>> +			    ARRAY_SIZE(expected_files));
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
> 
> What I don't see here is how do we avoid the forcewake_all to be read
> in the other test? Or that doesn't matter there?

There is a recent kernel change that I forgot about. Now the kernel
requires opening the files for write to trigger a GPU reset.

The core_ tests only attempt to open files for reading using O_RDONLY.
This should no longer trigger resets in the GPU. So I guess that from
the Xe perspective, we are actually good to go trying to open all files
for reading.

> 
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
> 
> what about make this the default?
> 
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
>> +	int fd = -1;
>> +	igt_dir_t *igt_dir = NULL;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver_master(DRIVER_XE);
>> +		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
>> +		debugfs = igt_debugfs_dir(fd);
>> +
>> +		igt_dir = igt_dir_create(debugfs);
>> +		igt_require(igt_dir);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +	}
>> +
>> +	igt_describe("Check if various debugfs devnodes exist and test reading them.");
>> +	igt_subtest("xe-base") {
>> +		xe_test_base(fd, xe_config(fd), igt_dir);
>> +	}
>> +
>> +	igt_describe("Check forcewake debugfs devnode");
>> +	igt_subtest("xe-forcewake") {
>> +		xe_test_forcewake(fd);
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_dir_destroy(igt_dir);
>> +		close(debugfs);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a06172d2e..847598255 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -283,6 +283,7 @@ intel_xe_progs = [
>>  	'xe_compute_preempt',
>>  	'xe_copy_basic',
>>  	'xe_configfs',
>> +	'xe_debugfs',
>>  	'xe_dma_buf_sync',
>>  	'xe_drm_fdinfo',
>>  	'xe_eu_stall',
>> -- 
>> 2.43.0
>>

