Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC6BCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1CD10E845;
	Wed,  8 Oct 2025 15:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYfmlK+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F8510E845
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759938040; x=1791474040;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jky6EGrzXsJGWr0pblTOwlF/doFFAyV5MxZPyCsqEkA=;
 b=kYfmlK+p8CD2kPJWIq3n6CONktU9kQ2RWtTqfBY846OjRHZJYApg5rnh
 Jzr6/rYZPtF6ik7+jq8IYCXYYHKNImoJ4Zrd1bXGSg3re6SL5QZPgU9Ju
 5QwBv2kqm22RqNpLf7zSCXVZP7ziCJINCl6vpCWBc0jCFfn/JOnXstdmZ
 bdIg8fhwm0XrVhXNIHpXoxv+Jac2hT5TdCkjRX+DKgRd7dqRW7SKtHA5X
 gVKVksVOSKHQsBbR39VF27cU9sXvyaX3GEjhB6DhFFHh3sIXCJbX2BGbk
 ixwJoZh99DfHGM2UqgprOsX8jzDBXfgrOKHXsW55RagZghaayQrEwKe5U g==;
X-CSE-ConnectionGUID: iHvTZjJPR8uPC5Knf79IBA==
X-CSE-MsgGUID: QLm+Xz75RS2FtrlmbV3RMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73238981"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="73238981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:40:34 -0700
X-CSE-ConnectionGUID: Ipnk1xG0S8mIqdvU0AP8Rw==
X-CSE-MsgGUID: MpwIZYQNRVWrtPSIg83lhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180400374"
Received: from unknown (HELO [172.28.180.171]) ([172.28.180.171])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:40:32 -0700
Message-ID: <fcf56b47-4199-4030-90dd-fcd2d9a2faef@linux.intel.com>
Date: Wed, 8 Oct 2025 17:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
References: <20251007104525.15500-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251007104525.15500-1-lukasz.laguna@intel.com>
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



On 10/7/2025 12:45 PM, Lukasz Laguna wrote:
> Add a test to validate VF access to VRAM via BAR. The following
> scenarios are covered:
> - VF can access all provisioned memory via the VRAM BAR,
> - VF cannot access memory beyond what's provisioned via the VRAM BAR,
> - VF can access memory via the VRAM BAR after reprovisioning.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vram.c | 407 ++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |   1 +
>   2 files changed, 408 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_vram.c
> 
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> new file mode 100644
> index 0000000000..74e7dffe9a
> --- /dev/null
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -0,0 +1,407 @@
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
> + * Sub-category: VRAM
> + * Functionality: VRAM access
> + * Description: Validate VF access to VRAM
> + *
> + * SUBTEST: vf-access-provisioned
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
> +static bool extended_scope, verbose;
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
> +struct range {
> +	uint64_t start;
> +	uint64_t end;
> +	uint8_t write_val;
> +	uint8_t read_val;
> +};
> +
> +static int update_failing_range(struct range **ranges, unsigned int *nr_ranges, uint64_t offset,
> +				uint8_t write, uint8_t read)
> +{
> +	struct range *new_ranges;
> +
> +	if (!(*ranges) || (offset - (*ranges)[*nr_ranges - 1].end > STEP)) {
> +		new_ranges = realloc(*ranges, (*nr_ranges + 1) * sizeof(struct range));
> +		if (!new_ranges) {
> +			free(*ranges);
> +			*ranges = NULL;
> +			*nr_ranges = 0;
> +			return -ENOMEM;
> +		}
> +
> +		*ranges = new_ranges;
> +		(*nr_ranges)++;
> +		(*ranges)[*nr_ranges - 1].start = offset;
> +		(*ranges)[*nr_ranges - 1].write_val = write;
> +		(*ranges)[*nr_ranges - 1].read_val = read;
> +	}
> +
> +	(*ranges)[*nr_ranges - 1].end = offset;
> +
> +	return 0;
> +}
> +
> +static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id, size_t size)
> +{
> +	struct range *fail_ranges = NULL, *restore_fail_ranges = NULL;
> +	unsigned int nr_fail_ranges = 0, nr_restore_fail_ranges = 0;
> +	uint8_t read, orig;
> +	unsigned int i;
> +
> +	for (size_t offset = 0; offset < size; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read != vf_id) {
> +			if (verbose)
> +				igt_debug("VRAM write/read check failed on VF%u "
> +					  "(offset: %#lx, write: %u, read: %u)\n",
> +					  vf_id, offset, vf_id, read);
> +			igt_assert(!update_failing_range(&fail_ranges, &nr_fail_ranges, offset,
> +							 vf_id, read));
> +		}
> +
> +		read = intel_vram_write_readback8(vram, offset, orig);
> +		if (read != orig) {
> +			if (verbose)
> +				igt_debug("Failed to restore original value on VF%u "
> +					  "(offset: %#lx, original: %u, read: %u)\n",
> +					  vf_id, offset, orig, read);
> +			igt_assert(!update_failing_range(&restore_fail_ranges,
> +							 &nr_restore_fail_ranges, offset,
> +							 orig, read));
> +		}
> +	}
> +
> +	for (i = 0; i < nr_fail_ranges; i++)
> +		igt_info("VRAM write/read check failed in range %lx-%lx on VF%u "
> +			 "(offset: %#lx, write: %u, read: %u)\n",
> +			 fail_ranges[i].start, fail_ranges[i].end, vf_id,
> +			 fail_ranges[i].start, fail_ranges[i].write_val, fail_ranges[i].read_val);
> +
> +	for (i = 0; i < nr_restore_fail_ranges; i++)
> +		igt_info("Failed to restore original value in range %lx-%lx on VF%u\n "
> +			 "(offset: %#lx, original: %u, read: %u)\n",
> +			 restore_fail_ranges[i].start, restore_fail_ranges[i].end, vf_id,
> +			 restore_fail_ranges[i].start, restore_fail_ranges[i].write_val,
> +			 restore_fail_ranges[i].read_val);
> +
> +	if (nr_fail_ranges || nr_restore_fail_ranges) {
> +		free(fail_ranges);
> +		free(restore_fail_ranges);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void access_provisioned(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	struct vram_mapping vram;
> +	size_t provisioned_vram;
> +	uint64_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_vram);
> +
> +		igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size < provisioned_vram) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
> +		}
> +
> +		igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, provisioned_vram,
> +					    PROT_READ | PROT_WRITE, &vram));
> +
> +		passed &= validate_access_basic(&vram, vf_id, provisioned_vram);
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
> +				   size_t provisioned_vram, size_t vram_bar_size)
> +{
> +	struct range *fail_ranges = NULL, *restore_fail_ranges = NULL;
> +	unsigned int nr_fail_ranges = 0, nr_restore_fail_ranges = 0;
> +	uint8_t read, orig;
> +	unsigned int i;
> +
> +	for (size_t offset = provisioned_vram; offset < vram_bar_size; offset += STEP) {
> +		orig = intel_vram_read8(vram, offset);
> +
> +		read = intel_vram_write_readback8(vram, offset, vf_id);
> +		if (read == vf_id) {
> +			igt_assert(!update_failing_range(&fail_ranges, &nr_fail_ranges, offset,
> +							 vf_id, read));
> +
> +			read = intel_vram_write_readback8(vram, offset, orig);
> +			if (read != orig) {
> +				if (verbose)
> +					igt_debug("Failed to restore original value on VF%u "
> +						  "(offset: %#lx, original: %u, read: %u)\n",
> +						  vf_id, offset, orig, read);
> +				igt_assert(!update_failing_range(&restore_fail_ranges,
> +								 &nr_restore_fail_ranges, offset,
> +								 orig, read));
> +			}
> +		}
> +	}
> +
> +	for (i = 0; i < nr_fail_ranges; i++)
> +		igt_info("Unexpected VRAM write beyond provisioned size in range %lx-%lx on VF%u "
> +			 "(offset: %#lx, write: %u, read: %u)\n",
> +			 fail_ranges[i].start, fail_ranges[i].end, vf_id,
> +			 fail_ranges[i].start, fail_ranges[i].write_val, fail_ranges[i].read_val);
> +
> +	for (i = 0; i < nr_restore_fail_ranges; i++)
> +		igt_info("Failed to restore original value in range %lx-%lx on VF%u "
> +			 "(offset: %#lx, original: %u, read: %u)\n",
> +			 restore_fail_ranges[i].start, restore_fail_ranges[i].end, vf_id,
> +			 restore_fail_ranges[i].start, restore_fail_ranges[i].write_val,
> +			 restore_fail_ranges[i].read_val);
> +
> +	if (fail_ranges || restore_fail_ranges) {
> +		free(fail_ranges);
> +		free(restore_fail_ranges);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
> +{
> +	struct vram_mapping vram;
> +	size_t provisioned_vram;
> +	uint64_t vram_bar_size;
> +	bool passed = true;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
> +			  vf_id, provisioned_vram);
> +
> +		igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +		if (vram_bar_size <= provisioned_vram) {
> +			igt_sriov_disable_vfs(pf_fd);
> +			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
> +		}
> +
> +		igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, vram_bar_size,
> +					    PROT_READ | PROT_WRITE, &vram));
> +
> +		passed &= validate_access_beyond(&vram, vf_id, provisioned_vram, vram_bar_size);
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
> +	struct vram_mapping vram;
> +	size_t provisioned_vram;
> +	uint64_t vram_bar_size;
> +	unsigned int total_vfs;
> +	const unsigned int vf_id = 1;
> +	bool passed;
> +
> +	total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
> +
> +	provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_vram);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
> +
> +	provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_vram);
> +
> +	igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
> +	igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
> +
> +	if (resize_up && vram_bar_size < provisioned_vram) {
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
> +	}
> +
> +	if (!resize_up && vram_bar_size <= provisioned_vram) {
> +		igt_sriov_disable_vfs(pf_fd);
> +		igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
> +	}
> +
> +	igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, vram_bar_size, PROT_READ | PROT_WRITE,
> +				    &vram));
> +
> +	passed = validate_access_basic(&vram, vf_id, provisioned_vram);
> +	passed &= validate_access_beyond(&vram, vf_id, provisioned_vram, vram_bar_size);
> +
> +	intel_vram_munmap(&vram);
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	igt_assert(passed);
> +}
> +
> +static int opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	case 'v':
> +		verbose = true;
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
> +	{ .name = "verbose", .has_arg = false, .val = 'v', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n"
> +	"  --verbose\tEnable verbose logging\n";
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
> +	igt_subtest_with_dynamic_f("vf-access-provisioned") {
> +		if (extended_scope) {
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_provisioned(pf_fd, num_vfs);
> +		} else {
> +			for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +				igt_dynamic_f("numvfs-random") {
> +					igt_debug("numvfs=%u\n", num_vfs);
> +					access_provisioned(pf_fd, num_vfs);
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
> +	igt_subtest_with_dynamic_f("vf-access-beyond") {
> +		if (extended_scope) {
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					access_beyond(pf_fd, num_vfs);
> +		} else {
> +			for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +				igt_dynamic_f("numvfs-random") {
> +					igt_debug("numvfs=%u\n", num_vfs);
> +					access_beyond(pf_fd, num_vfs);
> +				}
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
> index a7b9375ed0..73edd3e710 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +	'xe_sriov_vram',

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>> 
'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

