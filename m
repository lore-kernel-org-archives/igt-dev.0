Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1FDCA0EFC
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 16:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA11710E080;
	Thu, 21 Aug 2025 16:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="baxTjAMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93A10E080
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755795223; x=1787331223;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gFHmW5lA8qmTGEIbdSH+5YtEoOi7oeTQ5Hhlecjh5/g=;
 b=baxTjAMXyYybTlfqFev0RTW+FHHQTB8ZpAzBJ4Eb+3IlH4CdTKpmSRdL
 9rimyALgAxobPSY5JEJ8E3HFIbOh/Bt2kn9UGkZZnq7fsuUvBXmTyVWtM
 rOWG/3rpVmb1fzWJS8UNANjiDijofNFEAx2DPm4D0B53nKY49/GHVtdIS
 /XXI5kVMZAKb/cz+wRufUfD1vxBOnaI3SsYS8ceafIgPm+HA7z21pbF1G
 GtN328WOjUY3tLrIByCxUwyppoEp36sqq/hq8B2lurdpPZffu7GTTc9K9
 0q0ne4AwSOJIfVuCAMd3J8YTcsi4R2WAKCrcnLN65fRQhUORQkxBkyOmk g==;
X-CSE-ConnectionGUID: K5dyaXFYSJaKfQoEsVgdpg==
X-CSE-MsgGUID: jFN2qgHTTJaMdp17C25fEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61927587"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61927587"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:53:43 -0700
X-CSE-ConnectionGUID: i0TenYrlTOa4ZX0Es02g6Q==
X-CSE-MsgGUID: k/ceBMaMQsuoGsuu/fVsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="173795285"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.85.180])
 ([10.245.85.180])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:53:41 -0700
Message-ID: <efe4389c-9380-45a6-af0b-157121595e82@linux.intel.com>
Date: Thu, 21 Aug 2025 18:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 satyanarayana.k.v.p@intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
 <20250717090812.28628-5-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250717090812.28628-5-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/17/2025 11:08 AM, Lukasz Laguna wrote:
> Add a test to validate VF access to VRAM via BAR. The following
> scenarios are covered:
> - VF can access all provisioned memory via the VRAM BAR,
> - VF cannot access memory beyond what's provisioned via the VRAM BAR,
> - VF can access memory via the VRAM BAR after reprovisioning.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vram.c | 310 ++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |   1 +
>   2 files changed, 311 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_vram.c
> 
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> new file mode 100644
> index 000000000..82f0a2f09
> --- /dev/null
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sriov_device.h"
> +#include "intel_vram.h"
> +#include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe_sriov_vram
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: LMTT
> + * Functionality: VRAM access
> + * Description: Validate VF access to VRAM
> + *
> + * SUBTEST: vf-access-basic
> + * Description: Verify that VF can access all the provisioned memory via VRAM BAR
> + *
> + * SUBTEST: vf-access-beyond
> + * Description: Verify that VF cannot access memory beyond what's provisioned via VRAM BAR
> + *
> + * SUBTEST: vf-access-after-resize-down
> + * Description: Verify that VF can access the reprovisioned memory (reduced size) via VRAM BAR
> + *
> + * SUBTEST: vf-access-after-resize-up
> + * Description: Verify that VF can access the reprovisioned memory (increased size) via VRAM BAR
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
> +
> +const size_t STEP = SZ_1M;
> +
> +static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
> +{
> +	uint64_t size = 0;
> +
> +	/* TODO: adjust for multitile platforms */
> +	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
> +
> +	return size;
> +}
> +
> +static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id,
> +				  uint64_t provisioned_lmem)
> +{
> +	uint8_t read, orig;
> +	bool passed = true;
> +
> +	for (size_t offset = 0; offset < provisioned_lmem; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read != vf_id) {
> +			igt_debug("VRAM write/read check failed on VF%u (offset: %#lx, write: %u, read: %u)\n",
> +				  vf_id, offset, vf_id, read);
> +			passed = false;

Do we want to continue after first fail (isn't it too noisy) ?

> +		}
> +
> +		read = intel_vram_write_readback8(vram, offset, orig);
> +		if (read != orig) {
> +			igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
> +				  vf_id, offset, orig, read);
> +			passed = false;
> +		}
> +	}
> +
> +	return passed;
> +}
> +
> +static void access_basic(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	size_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_lmem);
> +
> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size < provisioned_lmem) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
> +		}
> +
> +		vram = intel_vram_mmap(pf_fd, vf_id, provisioned_lmem, PROT_READ | PROT_WRITE, 0);
> +		igt_assert(vram.addr);
> +
> +		passed &= validate_access_basic(&vram, vf_id, provisioned_lmem);
> +
> +		intel_vram_munmap(&vram);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static bool validate_access_beyond(struct vram_mapping *vram, unsigned int vf_id,
> +				   uint64_t provisioned_lmem, size_t vram_bar_size)
> +{
> +	uint8_t read, orig;
> +	bool passed = true;
> +
> +	for (size_t offset = provisioned_lmem; offset < vram_bar_size; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read == vf_id) {
> +			igt_debug("Successful VRAM write above provisioned size on VF%u (offset: %#lx)\n",
> +				  vf_id, offset);

Current wording sounds as if the test succeeded, maybe: "Unexpected VRAM 
write beyond provisioned size ..." or "ERROR: VF%u was able to write 
beyond provisioned VRAM ..."

> +			passed = false;

Do we want to continue after first fail ?

> +
> +			read = intel_vram_write_readback8(vram, offset, orig);
> +			if (read != orig)
> +				igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
> +					  vf_id, offset, orig, read);
> +		}
> +	}
> +
> +	return passed;
> +}
> +
> +static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	size_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_lmem);
> +
> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size <= provisioned_lmem) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
> +		}
> +
> +		vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
> +		igt_assert(vram.addr);
> +
> +		passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
> +
> +		intel_vram_munmap(&vram);
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static void resize_and_access(unsigned int pf_fd, bool resize_up)
> +{
> +	const unsigned int vf_id = 1;
> +	uint64_t provisioned_lmem;
> +	struct vram_mapping vram;
> +	unsigned int total_vfs;
> +	size_t vram_bar_size;
> +	bool passed;
> +
> +	total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
> +
> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
> +
> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
> +
> +	vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
> +	igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +	if (vram_bar_size <= provisioned_lmem) {
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
> +	}
> +
> +	vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
> +	igt_assert(vram.addr);
> +
> +	passed = validate_access_basic(&vram, vf_id, provisioned_lmem);
> +	passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
> +
> +	intel_vram_munmap(&vram);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static bool extended_scope;
> +
> +static int opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n";
> +
> +igt_main_args("", long_opts, help_str, opts_handler, NULL)
> +{
> +	bool autoprobe;
> +	int pf_fd;
> +	static struct subtest_resize_variants {
> +		const char *name;
> +		bool resize_up;
> +	} resize_variant[] = {
> +		{ "up", true },
> +		{ "down", false },
> +		{ NULL },
> +	};
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
> +	igt_subtest_with_dynamic_f("vf-access-basic") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_basic(pf_fd, num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				access_basic(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
> +	igt_subtest_with_dynamic_f("vf-access-beyond") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_beyond(pf_fd, num_vfs);
> +
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				igt_debug("numvfs=%u\n", num_vfs);
> +				access_beyond(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	for (const struct subtest_resize_variants *s = resize_variant; s->name; s++) {
> +		igt_describe("Verify that VF can access the reprovisioned memory via VRAM BAR");
> +		igt_subtest_f("vf-access-after-resize-%s", s->name) {
> +			unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +			igt_require(total_vfs > 1);
> +
> +			resize_and_access(pf_fd, s->resize_up);
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		close(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..6054a2c34 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +	'xe_sriov_vram',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

