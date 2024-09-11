Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E87CEE49B8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 14:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD6310E07D;
	Wed, 11 Sep 2024 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzElzZpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40010E07D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726065191; x=1757601191;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ay6ocoZ+fImldYuotmg+1tssRS3CNOv1H/dSyvQe0qA=;
 b=nzElzZpDJQJZ65ixn19UpBXCvfVI12Dvx/rEa/3Y1IZXw6tIyieW9y4k
 KJhTCJ3Y8U/3XI6Dhr1hOcquaCmoAkaJZqdvrS8bK0jfh4L65ul1dbv75
 za26qldDcaNqR71WxgKSfQnxTgSDKEo8D3L/RhO4kM6z7nnMIYIFsx1Gu
 AXfjEYSx5Xa4WJSotAuyRLU8eifk3sL0w3P5cbF5C+RK5kWNcXzSNU/6B
 Oy73XxdiBl35vc3vMrTmPdoaxIczFpn1HDYRPcDbO7YPb01HUJ8dKyxKD
 FY6EbNSntiT7HRcajSh/VllVnkcYkpNurw3o8vnzpufZc281D0v9KVD9S Q==;
X-CSE-ConnectionGUID: QBw30heZRKmbj6grnfqBiA==
X-CSE-MsgGUID: lv53kWkQRi2klXWcz0HblA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36257988"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="36257988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:33:09 -0700
X-CSE-ConnectionGUID: MNbb5JOlTQqkg+GgCgmKTw==
X-CSE-MsgGUID: BMB4CVlKSRKmfy6FcFf2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71526093"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:33:07 -0700
Message-ID: <f2502c0b-2bfe-4387-ba83-4fadb60535b1@linux.intel.com>
Date: Wed, 11 Sep 2024 16:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_sriov_mmio_regs: Add tests to
 verify registers on VFs
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
References: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
 <20240904084701.186664-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240904084701.186664-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

It appears we do not need to merge this test.
Patch can be ingored.

--
marcin

On 9/4/2024 10:46 AM, Marcin Bernatowicz wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> In the case of SR-IOV, the VF has limited access to the registers.
> Add tests to verify that the VF has access only to the allowed list
> of registers and that registers dedicated to VFs are working properly.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: C V Narasimha <narasimha.c.v@intel.com>
> ---
>   tests/intel/xe_sriov_mmio_regs.c | 310 +++++++++++++++++++++++++++++++
>   tests/meson.build                |   1 +
>   2 files changed, 311 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_mmio_regs.c
> 
> diff --git a/tests/intel/xe_sriov_mmio_regs.c b/tests/intel/xe_sriov_mmio_regs.c
> new file mode 100644
> index 000000000..0f16ce09e
> --- /dev/null
> +++ b/tests/intel/xe_sriov_mmio_regs.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +#include "drmtest.h"
> +#include "igt_sriov_device.h"
> +#include "intel_chipset.h"
> +
> +#include "xe/xe_query.h"
> +#include "lib/xe/xe_mmio.h"
> +
> +/**
> + * TEST: xe_sriov_mmio_regs
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: MMIO
> + * Functionality: MMIO isolation
> + * Run type: FULL
> + * Description: Checks MMIO isolation
> + *
> + * SUBTEST: vf-cap-reg
> + * Description:
> + *   Verify that VF has access to VF capability register
> + *
> + * SUBTEST: vf-scratch-regs
> + * Description:
> + *   Verify that VF has RW access to VF scratch registers
> + *
> + * SUBTEST: vf-not-allowed-regs
> + * Description:
> + *   Verify that VF does not have access to restricted registers
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV MMIO");
> +
> +/*
> + * Although 8 MB is reserved for the registers, they actually use only
> + * the first 4 MB
> + */
> +#define MMIO_REGS_TILE_SIZE SZ_4M
> +
> +#define VF_CAP_REG		0x1901f8
> +#define MEDIA_VF_CAP_REG	0x19030C
> +#define    IS_VF_MASK		0x1
> +
> +#define SOFT_SCRATCH_COUNT	4
> +#define SOFT_SCRATCH(n)		(0x190240 + (n) * 4)
> +#define MEDIA_SOFT_SCRATCH(n)	(0x190310 + (n) * 4)
> +
> +#define for_each_reg(reg_addr__) \
> +	for ((reg_addr__) = 0; \
> +	     (reg_addr__) < (MMIO_REGS_TILE_SIZE); \
> +	     (reg_addr__) += 0x4)
> +
> +enum reg_access_type {
> +	NO_ACCESS_OR_UNDEFINED = 0,
> +	RO,
> +	RW,
> +};
> +
> +struct vf_regs_allowlist {
> +	uint32_t start;
> +	uint32_t end;
> +	uint32_t mask;
> +	uint32_t expected_mask;
> +	enum reg_access_type access_type;
> +	bool (*requires)(int pf_fd, int gt);
> +};
> +
> +static const char *stringify_reg_access_type(enum reg_access_type access_type)
> +{
> +	switch (access_type) {
> +	case NO_ACCESS_OR_UNDEFINED:
> +		return "NO ACCESS OR UNDEFINED";
> +	case RO:
> +		return "RO";
> +	case RW:
> +		return "RW";
> +	default:
> +		igt_assert(0);
> +	}
> +
> +	return "";
> +}
> +
> +static bool has_vf_fence(int pf_fd, int gt)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return (intel_graphics_ver(dev_id) < IP_VER(12, 10));
> +}
> +
> +static bool has_memirq(int pf_fd, int gt)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50));
> +}
> +
> +static bool no_memirq(int pf_fd, int gt)
> +{
> +	return !has_memirq(pf_fd, gt);
> +}
> +
> +static bool has_media_regs(int pf_fd, int gt)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return (intel_graphics_ver(dev_id) >= IP_VER(12, 70));
> +}
> +
> +static enum reg_access_type check_vf_reg_access(int pf_fd, int gt, struct xe_mmio *vf_mmio, u_int32_t reg)
> +{
> +	enum reg_access_type access = NO_ACCESS_OR_UNDEFINED;
> +	uint32_t orig;
> +
> +	orig = xe_mmio_gt_read32(vf_mmio, gt, reg);
> +	if (orig != 0 && orig != ~0)
> +		access = RO;
> +
> +	xe_mmio_gt_write32(vf_mmio, gt, reg, ~orig);
> +	if (xe_mmio_gt_read32(vf_mmio, gt, reg) != orig)
> +		access = RW;
> +
> +	xe_mmio_gt_write32(vf_mmio, gt, reg, orig);
> +
> +	return access;
> +}
> +
> +static void vf_check_cap_reg(int pf_fd, unsigned int vf_id, int gt)
> +{
> +	struct xe_mmio vf_mmio;
> +	enum reg_access_type access_type;
> +	uint32_t val;
> +
> +	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
> +
> +	access_type = check_vf_reg_access(pf_fd, gt, &vf_mmio, VF_CAP_REG);
> +	val = xe_mmio_gt_read32(&vf_mmio, gt, VF_CAP_REG);
> +
> +	xe_mmio_access_fini(&vf_mmio);
> +
> +	igt_fail_on_f(access_type != RO, "VF%u capability register should be RO, Detected: %s\n",
> +		      vf_id, stringify_reg_access_type(access_type));
> +	igt_fail_on_f(!(val & IS_VF_MASK), "VF%u capability register should report VF active\n",
> +		      vf_id);
> +}
> +
> +static void vf_check_scratch_regs(int pf_fd, unsigned int vf_id, int gt)
> +{
> +	bool failed = false;
> +	struct xe_mmio vf_mmio;
> +	uint8_t i;
> +
> +	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
> +
> +	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
> +		enum reg_access_type access_type = check_vf_reg_access(pf_fd, gt, &vf_mmio, SOFT_SCRATCH(i));
> +
> +		if (access_type != RW) {
> +			igt_warn("VF%u Soft Scratch %d (%#x) register should be RW. Detected: %s\n",
> +				 vf_id, i, SOFT_SCRATCH(i), stringify_reg_access_type(access_type));
> +			failed = true;
> +		}
> +	}
> +
> +	xe_mmio_access_fini(&vf_mmio);
> +
> +	igt_fail_on_f(failed, "At least one of VF%u Soft Scratch register is not RW.\n", vf_id);
> +}
> +
> +/* XXX: Keep sorted */
> +static const struct vf_regs_allowlist allowlist[] = {
> +	{ .start = 0x100000, .end = 0x10001c, .requires = has_vf_fence },
> +	{ .start = 0x190010, .end = 0x190010, .requires = no_memirq },
> +	{ .start = 0x190018, .end = 0x19001C, .requires = no_memirq },
> +	{ .start = 0x190030, .end = 0x190048, .requires = no_memirq },
> +	{ .start = 0x190060, .end = 0x190064, .requires = no_memirq },
> +	{ .start = 0x190070, .end = 0x190074, .requires = no_memirq },
> +	{ .start = 0x190090, .end = 0x190090, .requires = no_memirq },
> +	{ .start = 0x1900a0, .end = 0x1900a0, .requires = no_memirq },
> +	{ .start = 0x1900a8, .end = 0x1900ac, .requires = no_memirq },
> +	{ .start = 0x1900b0, .end = 0x1900b4, .requires = no_memirq },
> +	{ .start = 0x1900d0, .end = 0x1900d4, .requires = no_memirq },
> +	{ .start = 0x1900e8, .end = 0x1900ec, .requires = no_memirq },
> +	{ .start = 0x1900f0, .end = 0x1900f4, .requires = no_memirq },
> +	{ .start = 0x190100, .end = 0x190100, .requires = no_memirq },
> +	{ .start = 0x1901f0, .end = 0x1901f0 },
> +	{ .start = 0x1901f8, .end = 0x1901f8 },
> +	{ .start = 0x190240, .end = 0x19024c },
> +	{ .start = 0x190300, .end = 0x190300 },
> +	{ .start = 0x190304, .end = 0x190304, .requires = has_media_regs },
> +	{ .start = 0x19030c, .end = 0x19031c, .requires = has_media_regs },
> +};
> +
> +static int addr_range_cmp(const void *addr, const void *range)
> +{
> +	if (*(uint32_t *)addr < ((const struct vf_regs_allowlist *)range)->start)
> +		return -1;
> +	else if (*(uint32_t *)addr > ((const struct vf_regs_allowlist *)range)->end)
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +static bool skip_if_on_whitelist(int pf_fd, int gt, u_int32_t reg_addr)
> +{
> +	struct vf_regs_allowlist *item;
> +
> +	if (reg_addr < allowlist[0].start && reg_addr > allowlist[ARRAY_SIZE(allowlist) - 1].end)
> +		return false;
> +
> +	item = bsearch(&reg_addr, &allowlist[0], ARRAY_SIZE(allowlist), sizeof(allowlist[0]),
> +		       addr_range_cmp);
> +	if (item) {
> +		if (item->requires)
> +			return (item->requires(pf_fd, gt)) ? true : false;
> +		else
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void vf_check_not_allowed_regs(int pf_fd, unsigned int vf_id, int gt)
> +{
> +	bool failed = false;
> +	struct xe_mmio vf_mmio;
> +	u_int32_t reg;
> +
> +	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
> +
> +	for_each_reg(reg) {
> +		enum reg_access_type access_type;
> +
> +		if (skip_if_on_whitelist(pf_fd, gt, reg))
> +			continue;
> +
> +		access_type = check_vf_reg_access(pf_fd, gt, &vf_mmio, reg);
> +		if (access_type != NO_ACCESS_OR_UNDEFINED) {
> +			igt_warn("VF%u register (%#x) shouldn't be %s.\n", vf_id, reg,
> +				 stringify_reg_access_type(access_type));
> +			failed = true;
> +		}
> +	}
> +
> +	xe_mmio_access_fini(&vf_mmio);
> +
> +	igt_fail_on_f(failed,
> +		      "At least one of VF%u register, outside the allowlist, is accessible\n",
> +		      vf_id);
> +}
> +
> +igt_main
> +{
> +	int pf_fd;
> +	bool autoprobe;
> +	int gt;
> +
> +	igt_fixture
> +	{
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_srandom();
> +
> +		igt_sriov_enable_vfs(pf_fd, igt_sriov_get_total_vfs(pf_fd));
> +	}
> +
> +	igt_describe("Verify that VF has access to VF capability register");
> +	igt_subtest_with_dynamic("vf-cap-reg") {
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_gt(pf_fd, gt)
> +				igt_dynamic_f("vf%u-gt-%u", vf_id, gt) {
> +					vf_check_cap_reg(pf_fd, vf_id, gt);
> +				}
> +	}
> +
> +	igt_describe("Verify that VF has RW access to VF scratch registers");
> +	igt_subtest_with_dynamic("vf-scratch-regs") {
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_gt(pf_fd, gt)
> +				igt_dynamic_f("vf%u-gt-%u", vf_id, gt) {
> +					vf_check_scratch_regs(pf_fd, vf_id, gt);
> +				}
> +	}
> +
> +	igt_describe("Verify that VF does not have access to restricted registers");
> +	igt_subtest_with_dynamic("vf-not-allowed-regs") {
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_gt(pf_fd, gt)
> +				igt_dynamic_f("vf%u-gt-%u", vf_id, gt) {
> +					vf_check_not_allowed_regs(pf_fd, vf_id, gt);
> +				}
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
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 00556c9d6..d7a8262ce 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -313,6 +313,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_mmio_regs',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

