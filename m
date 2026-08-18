Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C726C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 13:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFDC10E00B;
	Tue, 18 Aug 2026 13:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7gI1Pji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D8810EB88
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787060732; x=1818596732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IXyN52dcxxvpnp/x9RyTthAfTwjHRzD81i6AQT8CeRE=;
 b=l7gI1PjiAcLKSeC8Oxa6YkcygWfTylodv0yx0of6zMD3cBFDZOW/7E7t
 QH19Osk6I0f5WwToRz8asRsSLk8IjABF+9HzVqAPHX83UMh8j5DKEQN/b
 Z6bKmEqlfTJ2Lj3dtpQMQ2GOq2v+4Es2yegUAIerKB+OG6Nozo+WYpyv3
 EgrrMYIVWyFa8tRV/r7Fyfw/caw+TQp3it/Uln33+g26Szu/8hn5EoSMv
 tGsAOQ8CL6u7bMyaDvkuWX6U+AB4s4zmkyHuh6oqy/ogIQMuZuoYt9/3J
 IE4c2zotCQIXNKmbG+hS32EIz2TCK/oE4XcKm2YIP8Ybso1hBtBsqxtTC Q==;
X-CSE-ConnectionGUID: 0/zlvOQfQH6NoeKXzbZQ+Q==
X-CSE-MsgGUID: wE7o8ng7Soq+OQ72RBRCyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105086940"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105086940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:32 -0700
X-CSE-ConnectionGUID: gTG3KvnzSlCTQ+BHgqLPiw==
X-CSE-MsgGUID: ydjnKWwnRBWV+9M1eS8s8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262602068"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.106])
 ([172.28.182.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 06:45:30 -0700
Message-ID: <83f80118-b804-49a7-b008-8d469aad1bc8@linux.intel.com>
Date: Tue, 18 Aug 2026 15:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_sriov_ggtt: Add test checking GGTT
 accesses
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com
References: <20260804072407.1090889-1-lukasz.laguna@intel.com>
 <20260804072407.1090889-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260804072407.1090889-2-lukasz.laguna@intel.com>
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 8/4/2026 9:24 AM, Lukasz Laguna wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add a test validating PTE ownership, accessibility, and modifiability
> by PF and VFs.
>
> The following scenarios are covered:
> - pf-check-vfs-ids: verify VF ID assignment for each VF GGTT range,
> - pf-check-vfs-pte: verify PF modifiability of VF PTEs,
> - vfs-check-own-pte: verify VF modifiability of its own PTEs,
> - vfs-check-other-vfs-pte: verify VF can't access other VFs PTEs,
> - vfs-check-pf-pte: verify VF can't access PF PTEs.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Co-developed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/xe/xe_ggtt.h            |   7 +
>   tests/intel/xe_sriov_ggtt.c | 757 ++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |   1 +
>   3 files changed, 765 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_ggtt.c
>
> diff --git a/lib/xe/xe_ggtt.h b/lib/xe/xe_ggtt.h
> index ada7ddbb0..8e0202cd7 100644
> --- a/lib/xe/xe_ggtt.h
> +++ b/lib/xe/xe_ggtt.h
> @@ -8,6 +8,11 @@
>   
>   #include <stdint.h>
>   
> +#define GGTT_PAGE_SIZE			SZ_4K
> +#define GGTT_TOP			0xfee00000
> +
> +#define XELPG_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
> +
>   #define GGTT_PTE_ADDR_MASK		GENMASK_ULL(45, 12)
>   #define TGL_GGTT_PTE_ADDR_MASK		GENMASK_ULL(38, 12)
>   #define   GGTT_PTE_ADDR_SHIFT		12
> @@ -16,10 +21,12 @@
>   #define TGL_GGTT_PTE_VFID_MASK		GENMASK_ULL(4, 2)
>   #define   GGTT_PTE_VFID_SHIFT		2
>   
> +#define GGTT_PAGE_LM			GENMASK_ULL(1, 1)
>   #define GGTT_PAGE_PRESENT		GENMASK_ULL(0, 0)
>   
>   typedef uint64_t xe_ggtt_pte_t;
>   typedef uint64_t xe_ggtt_pte_mask_t;
> +typedef uint64_t xe_ggtt_addr_t;
>   
>   xe_ggtt_pte_mask_t xe_ggtt_get_vfid_mask(int pf_fd);
>   xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd);
> diff --git a/tests/intel/xe_sriov_ggtt.c b/tests/intel/xe_sriov_ggtt.c
> new file mode 100644
> index 000000000..2c2184930
> --- /dev/null
> +++ b/tests/intel/xe_sriov_ggtt.c
> @@ -0,0 +1,757 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +
> +#include "drmtest.h"
> +#include "igt_sriov_device.h"
> +#include "intel_chipset.h"
> +#include "xe/xe_ggtt.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe_sriov_ggtt
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: GGTT
> + * Functionality: GGTT isolation
> + * Description: Checks GGTT bitfields and VFs GGTT isolation
> + *
> + * SUBTEST: pf-check-vfs-ids
> + * Description:
> + *   Verify that the VF ID in the GGTT PTE has been correctly assigned
> + *
> + * SUBTEST: pf-check-vfs-pte
> + * Description:
> + *   Verify on PF the modifiability of GGTT PTE assigned to VFs
> + *
> + * SUBTEST: vfs-check-own-pte
> + * Description:
> + *   Verify of modifiability of GGTT PTE owned by VF
> + *
> + * SUBTEST: vfs-check-other-vfs-pte
> + * Description:
> + *   Verify the non-availability of VF to GGTT PTEs owned by other VFs
> + *
> + * SUBTEST: vfs-check-pf-pte
> + * Description:
> + *   Verify the non-availability of VF to GGTT PTEs owned by PF
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV GGTT");
> +
> +#define SRIOV_GGTT_TC(__name)	.test = __name, .name = #__name
> +
> +struct ggtt_test_data {
> +	int pf_fd;
> +	struct xe_mmio mmio;
> +	struct xe_mmio pf_mmio;
> +	bool verify_on_pf;
> +	bool bus_master_enabled_in_test;
> +	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, xe_ggtt_addr_t addr,
> +			xe_ggtt_pte_t pte);
> +	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, xe_ggtt_addr_t addr);
> +};
> +
> +struct pte_testcase {
> +	const char *name;
> +	bool (*test)(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +		     xe_ggtt_pte_t *out);
> +	bool (*requires)(int pf_fd);
> +};
> +
> +static uint64_t xe_ggtt_addr_to_pte_offset(xe_ggtt_addr_t addr)
> +{
> +	igt_assert_f(IS_ALIGNED(addr, GGTT_PAGE_SIZE), "GGTT address %#lx is not aligned to %#x\n",
> +		     addr, GGTT_PAGE_SIZE);
> +
> +	return (addr / GGTT_PAGE_SIZE) * sizeof(xe_ggtt_pte_t);
> +}
> +
> +static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile, xe_ggtt_addr_t addr,
> +			  xe_ggtt_pte_t pte)
> +{
> +	xe_mmio_ggtt_write(mmio, tile, xe_ggtt_addr_to_pte_offset(addr), pte);
> +}
> +
> +#define GEN12_VF_CAP_REG	0x1901f8
> +
> +static void intel_set_pte_and_sync(struct xe_mmio *mmio, uint8_t tile, xe_ggtt_addr_t addr,
> +				   xe_ggtt_pte_t pte)
> +{
> +	intel_set_pte(mmio, tile, addr, pte);
> +
> +	/* Adding a fence by reading MMIO register to ensure memory ordering */
> +	xe_mmio_tile_read32(mmio, tile, GEN12_VF_CAP_REG);
> +}
> +
> +static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, xe_ggtt_addr_t addr)
> +{
> +	return xe_mmio_ggtt_read(mmio, tile, xe_ggtt_addr_to_pte_offset(addr));
> +}
> +
> +static bool has_lmem(int pf_fd)
> +{
> +	return xe_has_vram(pf_fd);
> +}
> +
> +static bool has_pat(int pf_fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return intel_graphics_ver(dev_id) >= IP_VER(12, 70);
> +}
> +
> +static bool check_pte_vfid(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +			   unsigned int vf_id, xe_ggtt_pte_t *out)
> +{
> +	unsigned int val;
> +
> +	*out = data->get_pte(&data->mmio, tile, addr);
> +	val = xe_ggtt_pte_get_vfid(data->pf_fd, *out);
> +
> +	return (val == vf_id);
> +}
> +
> +static bool pte_is_value_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				    xe_ggtt_pte_mask_t mask, xe_ggtt_pte_t *out)
> +{
> +	xe_ggtt_pte_t original_pte;
> +	xe_ggtt_pte_t write_pte;
> +	xe_ggtt_pte_t read_pte;
> +	bool ret = true;
> +
> +	original_pte = data->get_pte(&data->mmio, tile, addr);
> +
> +	write_pte = original_pte ^ mask;
> +	data->set_pte(&data->mmio, tile, addr, write_pte);
> +	read_pte = data->get_pte(&data->mmio, tile, addr);
> +
> +	*out = read_pte;
> +
> +	if ((read_pte & mask) != (write_pte & mask))
> +		ret = false;
> +
> +	if (data->verify_on_pf) {
> +		xe_ggtt_pte_t pf_read_pte = data->get_pte(&data->pf_mmio, tile, addr);
> +
> +		/* Double check, this time compare with value read on PF */
> +		if ((pf_read_pte & mask) != (write_pte & mask))
> +			ret = false;
> +	}
> +
> +	data->set_pte(&data->mmio, tile, addr, original_pte);
> +
> +	return ret;
> +}
> +
> +static bool pte_is_value_not_readable(struct ggtt_test_data *data, uint8_t tile,
> +				      xe_ggtt_addr_t addr, xe_ggtt_pte_mask_t mask,
> +				      xe_ggtt_pte_t *out)
> +{
> +	*out = data->get_pte(&data->mmio, tile, addr);
> +
> +	return (*out & mask) == 0;
> +}
> +
> +static bool pte_not_accessible(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +			       xe_ggtt_pte_t *out)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(data->pf_fd);
> +	xe_ggtt_pte_mask_t mask;
> +	xe_ggtt_pte_t expected;
> +
> +	if (intel_graphics_ver(dev_id) < IP_VER(12, 10)) {
> +		expected = ~0;
> +		mask = ~0;
> +	} else if (intel_graphics_ver(dev_id) < IP_VER(12, 70)) {
> +		expected = 0;
> +		mask = ~0;
> +	} else {
> +		expected = 0;
> +		mask = GGTT_PTE_ADDR_MASK | GGTT_PTE_VFID_MASK;
> +	}
> +
> +	*out = data->get_pte(&data->mmio, tile, addr);
> +	return (*out & mask) == expected;
> +}
> +
> +static bool pte_pat_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +			       xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_modifiable(data, tile, addr, XELPG_GGTT_PTE_PAT_MASK, out);
> +}
> +
> +static bool pte_pat_not_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				   xe_ggtt_pte_t *out)
> +{
> +	return !pte_pat_modifiable(data, tile, addr, out);
> +}
> +
> +static bool pte_gpa_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +			       xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_modifiable(data, tile, addr, xe_ggtt_get_gpa_mask(data->pf_fd), out);
> +}
> +
> +static bool pte_gpa_not_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				   xe_ggtt_pte_t *out)
> +{
> +	return !pte_gpa_modifiable(data, tile, addr, out);
> +}
> +
> +static bool pte_vfid_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_modifiable(data, tile, addr, xe_ggtt_get_vfid_mask(data->pf_fd), out);
> +}
> +
> +static bool pte_vfid_not_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				    xe_ggtt_pte_t *out)
> +{
> +	return !pte_vfid_modifiable(data, tile, addr, out);
> +}
> +
> +static bool pte_vfid_not_readable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				  xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_not_readable(data, tile, addr,
> +					 xe_ggtt_get_vfid_mask(data->pf_fd), out);
> +}
> +
> +static bool pte_lmem_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_modifiable(data, tile, addr, GGTT_PAGE_LM, out);
> +}
> +
> +static bool pte_lmem_not_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				    xe_ggtt_pte_t *out)
> +{
> +	return !pte_lmem_modifiable(data, tile, addr, out);
> +}
> +
> +static bool pte_valid_modifiable(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +				 xe_ggtt_pte_t *out)
> +{
> +	return pte_is_value_modifiable(data, tile, addr, GGTT_PAGE_PRESENT, out);
> +}
> +
> +static bool pte_valid_not_modifiable(struct ggtt_test_data *data, uint8_t tile,
> +				     xe_ggtt_addr_t addr, xe_ggtt_pte_t *out)
> +{
> +	return !pte_valid_modifiable(data, tile, addr, out);
> +}
> +
> +static bool run_test_on_pte(struct ggtt_test_data *data, uint8_t tile, xe_ggtt_addr_t addr,
> +			    const struct pte_testcase *tc, unsigned int vf_id)
> +{
> +	xe_ggtt_pte_t read_val;
> +
> +	if (!tc->test(data, tile, addr, &read_val)) {
> +		igt_warn("%s failed at GGTT address %#lx on VF%d. PTE value: %#lx\n",
> +			 tc->name, addr, vf_id, read_val);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool verify_each_pte_in_range;
> +
> +static xe_ggtt_addr_t next_addr(xe_ggtt_addr_t addr,
> +				const struct xe_sriov_provisioned_range *range)
> +{
> +	xe_ggtt_addr_t step, next, last_page;
> +
> +	if (verify_each_pte_in_range)
> +		return addr + GGTT_PAGE_SIZE;
> +
> +	if (addr < range->start + GGTT_PAGE_SIZE)
> +		step = GGTT_PAGE_SIZE;
> +	else
> +		step = (addr - range->start) * 2;
> +
> +	next = addr + step;
> +
> +	last_page = ALIGN_DOWN(range->end, GGTT_PAGE_SIZE);
> +	if (addr < last_page && next > last_page)
> +		return last_page;
> +
> +	return next;
> +}
> +
> +#define for_each_pte(ggtt_addr__, ggtt_range__) \
> +	for ((ggtt_addr__) = (ggtt_range__)->start; \
> +	     (ggtt_addr__) < (ggtt_range__)->end; \
> +	     (ggtt_addr__) = next_addr((ggtt_addr__), (ggtt_range__)))
> +
> +static bool is_testcase_supported(const struct pte_testcase *tc, struct ggtt_test_data *data)
> +{
> +	return !(tc->requires && !tc->requires(data->pf_fd));
> +}
> +
> +static bool run_test_on_ggtt_range(struct ggtt_test_data *data, uint8_t tile,
> +				   struct xe_sriov_provisioned_range *range,
> +				   const struct pte_testcase *tc, unsigned int vf_id)
> +{
> +	xe_ggtt_addr_t addr;
> +
> +	igt_assert_f(IS_ALIGNED(range->start, GGTT_PAGE_SIZE),
> +		     "GGTT start range for VF%d (%#lx) is not aligned to %#x\n",
> +		     vf_id, range->start, GGTT_PAGE_SIZE);
> +
> +	if (!is_testcase_supported(tc, data)) {
> +		igt_debug("Skip test case %s on VF%u\n", tc->name, vf_id);
> +		return true;
> +	}
> +
> +	for_each_pte(addr, range)
> +		if (!run_test_on_pte(data, tile, addr, tc, vf_id))
> +			return false;
> +	return true;
> +}
> +
> +static bool run_test_outside_ggtt_range(struct ggtt_test_data *data, uint8_t tile,
> +					struct xe_sriov_provisioned_range *range,
> +					const struct pte_testcase *tc, unsigned int vf_id)
> +{
> +	struct xe_sriov_provisioned_range full_range = { .start = 0, .end = GGTT_TOP};
> +	xe_ggtt_addr_t addr;
> +
> +	if (!is_testcase_supported(tc, data)) {
> +		igt_debug("Skip test case %s on VF%u\n", tc->name, vf_id);
> +		return true;
> +	}
> +
> +	for_each_pte(addr, &full_range) {
> +		if (addr >= range->start && addr <= range->end)
> +			continue;
> +		if (!run_test_on_pte(data, tile, addr, tc, vf_id))
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static bool skip_vf_bus_master;
> +
> +#define PCI_COMMAND         0x04
> +#define PCI_COMMAND_MASTER  REG_BIT(2)
> +
> +static void set_bus_master(struct ggtt_test_data *test_data, bool enable)
> +{
> +	struct pci_device *dev = test_data->mmio.intel_mmio.dev;
> +	bool was_enabled;
> +	char bdf[16];
> +	uint16_t cmd;
> +
> +	igt_assert(dev);
> +
> +	if (skip_vf_bus_master)
> +		return;
> +
> +	snprintf(bdf, sizeof(bdf), "%04x:%02x:%02x.%x",
> +		 dev->domain, dev->bus, dev->dev, dev->func);
> +
> +	pci_device_cfg_read_u16(dev, &cmd, PCI_COMMAND);
> +
> +	was_enabled = cmd & PCI_COMMAND_MASTER;
> +
> +	if (enable) {
> +		if (was_enabled)
> +			return;
> +
> +		cmd |= PCI_COMMAND_MASTER;
> +		pci_device_cfg_write_u16(dev, cmd, PCI_COMMAND);
> +		test_data->bus_master_enabled_in_test = true;
> +
> +		igt_debug("%s: Enabling Bus Master (cmd=0x%04x)\n", bdf, cmd);
> +	} else {
> +		if (!test_data->bus_master_enabled_in_test || !was_enabled)
> +			return;
> +
> +		cmd &= ~PCI_COMMAND_MASTER;
> +		pci_device_cfg_write_u16(dev, cmd, PCI_COMMAND);
> +
> +		igt_debug("%s: Disabling Bus Master (cmd=0x%04x)\n", bdf, cmd);
> +	}
> +}
> +
> +static void enable_bus_master(struct ggtt_test_data *test_data)
> +{
> +	set_bus_master(test_data, true);
> +}
> +
> +static void disable_bus_master(struct ggtt_test_data *test_data)
> +{
> +	set_bus_master(test_data, false);
> +}
> +
> +static void init_subtest(int pf_fd, int vf_id, uint8_t tile,
> +			 struct xe_sriov_provisioned_range **range,
> +			 struct ggtt_test_data *test_data, unsigned int num_vfs)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +	unsigned int nr_ranges, main_gt;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +
> +	/* refresh PCI state */
> +	igt_pci_system_reinit();
> +
> +	main_gt = xe_tile_get_main_gt_id(pf_fd, tile);
> +	xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, XE_SRIOV_SHARED_RES_GGTT,
> +						    main_gt, range, &nr_ranges);
> +	igt_assert_eq(num_vfs, nr_ranges);
> +
> +	test_data->pf_fd = pf_fd;
> +	test_data->verify_on_pf = (vf_id > 0);
> +	test_data->get_pte = intel_get_pte;
> +
> +	if (intel_graphics_ver(dev_id) >= IP_VER(12, 7))
> +		test_data->set_pte = intel_set_pte_and_sync;
> +	else
> +		test_data->set_pte = intel_set_pte;
> +
> +	xe_mmio_vf_access_init(pf_fd, vf_id, &test_data->mmio);
> +	if (test_data->verify_on_pf)
> +		xe_mmio_access_init(pf_fd, &test_data->pf_mmio);
> +
> +	enable_bus_master(test_data);
> +}
> +
> +static void fini_subtest(struct xe_sriov_provisioned_range *range,
> +			 struct ggtt_test_data *test_data)
> +{
> +	disable_bus_master(test_data);
> +
> +	free(range);
> +
> +	if (test_data->verify_on_pf)
> +		xe_mmio_access_fini(&test_data->pf_mmio);
> +	xe_mmio_access_fini(&test_data->mmio);
> +
> +	igt_sriov_disable_vfs(test_data->pf_fd);
> +}
> +
> +#define for_each_pte_test(tc__, testcases__) \
> +	for ((tc__) = (testcases__); (tc__)->test; (tc__)++)
> +
> +static void pf_check_vfs_ids(int pf_fd, uint8_t tile, unsigned int num_vfs)
> +{
> +	struct xe_sriov_provisioned_range *range;
> +	struct ggtt_test_data test_data;
> +	xe_ggtt_addr_t addr;
> +	xe_ggtt_pte_t out;
> +	unsigned int vf;
> +	bool is_correct;
> +
> +	init_subtest(pf_fd, 0, tile, &range, &test_data, num_vfs);
> +
> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
> +		igt_assert_eq(vf_id, range[vf_id - 1].vf_id);
> +		igt_assert_f(IS_ALIGNED(range[vf_id - 1].start, GGTT_PAGE_SIZE),
> +			     "GGTT start range for VF%d (%#lx) is not aligned to %#x\n",
> +			     vf_id, range[vf_id - 1].start, GGTT_PAGE_SIZE);
> +
> +		igt_debug("Checking VF%u range [%#lx-%#lx]\n",
> +			  vf_id, range[vf_id - 1].start, range[vf_id - 1].end);
> +		for_each_pte(addr, &range[vf_id - 1]) {
> +			is_correct = check_pte_vfid(&test_data, tile, addr, vf_id, &out);
> +			if (!is_correct) {
> +				vf = vf_id;
> +				goto out;
> +			}
> +		}
> +	}
> +
> +out:
> +	fini_subtest(range, &test_data);
> +
> +	igt_fail_on_f(!is_correct,
> +		      "Found PTE from VF%d range with wrong VF ID: Read PTE: %#lx on address: %#lx\n",
> +		      vf, out, addr);
> +}
> +
> +static void pf_check_vfs_pte(int pf_fd, uint8_t tile)
> +{
> +	static struct pte_testcase pte_testcases[] = {
> +		{ SRIOV_GGTT_TC(pte_pat_modifiable), .requires = has_pat },
> +		{ SRIOV_GGTT_TC(pte_gpa_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_vfid_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_lmem_modifiable), .requires = has_lmem },
> +		{ SRIOV_GGTT_TC(pte_valid_modifiable) },
> +		{ },
> +	};
> +	struct xe_sriov_provisioned_range *range;
> +	struct ggtt_test_data test_data;
> +	struct pte_testcase *tc;
> +	int failed = 0;
> +
> +	init_subtest(pf_fd, 0, tile, &range, &test_data, igt_sriov_get_total_vfs(pf_fd));
> +
> +	for_each_sriov_vf(pf_fd, vf_id) {
> +		igt_debug("Checking VF%u range [%#lx-%#lx]\n", vf_id, range[vf_id - 1].start,
> +			  range[vf_id - 1].end);
> +		for_each_pte_test(tc, pte_testcases) {
> +			igt_debug("Run '%s' check\n", tc->name);
> +			if (!run_test_on_ggtt_range(&test_data, tile, &range[vf_id - 1], tc,
> +						    vf_id))
> +				failed++;
> +		}
> +	}
> +
> +	fini_subtest(range, &test_data);
> +
> +	igt_fail_on_f(failed, "%s: Count of failed test cases: %d\n", __func__, failed);
> +}
> +
> +static void vfs_check_own_pte(int pf_fd, int vf_id, uint8_t tile)
> +{
> +	static struct pte_testcase pte_testcases[] = {
> +		{ SRIOV_GGTT_TC(pte_pat_modifiable), .requires = has_pat },
> +		{ SRIOV_GGTT_TC(pte_gpa_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_vfid_not_readable) },
> +		{ SRIOV_GGTT_TC(pte_vfid_not_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_lmem_modifiable), .requires = has_lmem },
> +		{ SRIOV_GGTT_TC(pte_valid_not_modifiable) },
> +		{ },
> +	};
> +	struct xe_sriov_provisioned_range *range;
> +	struct ggtt_test_data test_data;
> +	struct pte_testcase *tc;
> +	int failed = 0;
> +
> +	init_subtest(pf_fd, vf_id, tile, &range, &test_data, igt_sriov_get_total_vfs(pf_fd));
> +
> +	igt_debug("Checking VF%u range [%#lx-%#lx]\n", vf_id, range[vf_id - 1].start,
> +		  range[vf_id - 1].end);
> +	for_each_pte_test(tc, pte_testcases) {
> +		igt_debug("Run '%s' check\n", tc->name);
> +		if (!run_test_on_ggtt_range(&test_data, tile, &range[vf_id - 1], tc, vf_id))
> +			failed++;
> +	}
> +
> +	fini_subtest(range, &test_data);
> +
> +	igt_fail_on_f(failed, "%s: Count of failed test cases: %d\n", __func__, failed);
> +}
> +
> +static void vfs_check_other_vfs_pte(int pf_fd, int vf_id, uint8_t tile)
> +{
> +	static struct pte_testcase pte_testcases[] = {
> +		{ SRIOV_GGTT_TC(pte_not_accessible) },
> +		{ SRIOV_GGTT_TC(pte_pat_not_modifiable), .requires = has_pat },
> +		{ SRIOV_GGTT_TC(pte_gpa_not_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_vfid_not_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_lmem_not_modifiable), .requires = has_lmem },
> +		{ SRIOV_GGTT_TC(pte_valid_not_modifiable) },
> +		{ },
> +	};
> +	struct xe_sriov_provisioned_range *range;
> +	struct ggtt_test_data test_data;
> +	struct pte_testcase *tc;
> +	int failed = 0;
> +
> +	init_subtest(pf_fd, vf_id, tile, &range, &test_data, igt_sriov_get_total_vfs(pf_fd));
> +
> +	for_each_pte_test(tc, pte_testcases) {
> +		bool ret;
> +
> +		igt_debug("Run '%s' check\n", tc->name);
> +		for_each_sriov_vf(pf_fd, other_vf_id) {
> +			if (vf_id == other_vf_id)
> +				continue;
> +			igt_debug("Checking VF%u range [%#lx-%#lx]\n", other_vf_id,
> +				  range[other_vf_id - 1].start, range[other_vf_id - 1].end);
> +			ret = run_test_on_ggtt_range(&test_data, tile, &range[other_vf_id - 1], tc,
> +						     vf_id);
> +			if (!ret)
> +				break;
> +		}
> +		if (!ret)
> +			failed++;
> +	}
> +
> +	fini_subtest(range, &test_data);
> +
> +	igt_fail_on_f(failed, "%s: Count of failed test cases: %d\n", __func__, failed);
> +}
> +
> +static void assign_to_pf_other_vfs_ggtt(int pf_fd, uint8_t tile, struct xe_mmio *pf_mmio,
> +					unsigned int skip_vf_id,
> +					struct xe_sriov_provisioned_range *range)
> +{
> +	for_each_sriov_vf(pf_fd, vf_id) {
> +		xe_ggtt_pte_t pte = GGTT_PAGE_PRESENT;
> +		xe_ggtt_addr_t addr;
> +
> +		if (skip_vf_id == vf_id)
> +			continue;
> +
> +		igt_debug("Set PF as owner for VF%u range [%#lx-%#lx]\n", vf_id,
> +			  range[vf_id - 1].start, range[vf_id - 1].end);
> +		for_each_pte(addr, &range[vf_id - 1])
> +			intel_set_pte(pf_mmio, tile, addr, pte);
> +	}
> +}
> +
> +static void restore_other_vfs_ggtt(int pf_fd, uint8_t tile, struct xe_mmio *pf_mmio,
> +				   unsigned int skip_vf_id,
> +				   struct xe_sriov_provisioned_range *range)
> +{
> +	for_each_sriov_vf(pf_fd, vf_id) {
> +		xe_ggtt_pte_t pte = ((vf_id << GGTT_PTE_VFID_SHIFT) &
> +				     xe_ggtt_get_vfid_mask(pf_fd)) | GGTT_PAGE_PRESENT;
> +		xe_ggtt_addr_t addr;
> +
> +		if (skip_vf_id == vf_id)
> +			continue;
> +
> +		igt_debug("Restore the original owner for VF%u range [%#lx-%#lx]\n",
> +			  vf_id, range[vf_id - 1].start, range[vf_id - 1].end);
> +		for_each_pte(addr, &range[vf_id - 1])
> +			intel_set_pte(pf_mmio, tile, addr, pte);
> +	}
> +}
> +
> +static void vfs_check_pf_pte(int pf_fd, int vf_id, uint8_t tile)
> +{
> +	static struct pte_testcase pte_testcases[] = {
> +		{ SRIOV_GGTT_TC(pte_not_accessible) },
> +		{ SRIOV_GGTT_TC(pte_pat_not_modifiable), .requires = has_pat },
> +		{ SRIOV_GGTT_TC(pte_gpa_not_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_vfid_not_modifiable) },
> +		{ SRIOV_GGTT_TC(pte_lmem_not_modifiable), .requires = has_lmem },
> +		{ SRIOV_GGTT_TC(pte_valid_not_modifiable) },
> +		{ },
> +	};
> +	struct xe_sriov_provisioned_range *range;
> +	struct ggtt_test_data test_data;
> +	struct pte_testcase *tc;
> +	int failed = 0;
> +
> +	init_subtest(pf_fd, vf_id, tile, &range, &test_data, igt_sriov_get_total_vfs(pf_fd));
> +	assign_to_pf_other_vfs_ggtt(pf_fd, tile, &test_data.pf_mmio, vf_id, range);
> +
> +	igt_debug("Checking GGTT outside VF%u range [%#lx-%#lx]\n",
> +		  vf_id, range[vf_id - 1].start, range[vf_id - 1].end);
> +
> +	for_each_pte_test(tc, pte_testcases) {
> +		igt_debug("Run '%s' check\n", tc->name);
> +		if (!run_test_outside_ggtt_range(&test_data, tile, &range[vf_id - 1], tc, vf_id))
> +			failed++;
> +	}
> +
> +	restore_other_vfs_ggtt(pf_fd, tile, &test_data.pf_mmio, vf_id, range);
> +	fini_subtest(range, &test_data);
> +
> +	igt_fail_on_f(failed, "%s: Count of failed test cases: %d\n", __func__, failed);
> +}
> +
> +static void skip_on_mtl_vf(int pf_fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	igt_skip_on_f(IS_METEORLAKE(dev_id),
> +		      "On MTL VF there is no access to GGTT through MMIO, skip\n");
> +}
> +
> +static int opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		skip_vf_bus_master = true;
> +		break;
> +	case 'p':
> +		verify_each_pte_in_range = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "skip-vf-bme", .has_arg = false, .val = 'b', },
> +	{ .name = "verify-each-pte", .has_arg = false, .val = 'p', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --skip-vf-bme\tSkip setting VF Bus Master Enable bit\n"
> +	"  --verify-each-pte\tVerify each PTE in range\n";
> +
> +int igt_main_args("", long_opts, help_str, opts_handler, NULL)
> +{
> +	bool autoprobe;
> +	uint8_t tile;
> +	int pf_fd;
> +
> +	igt_fixture()
> +	{
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify that the VF ID in the GGTT PTE has been correctly assigned");
> +	igt_subtest_with_dynamic("pf-check-vfs-ids")
> +		for_each_sriov_num_vfs(pf_fd, num_vfs)
> +			xe_for_each_tile(pf_fd, tile)
> +				igt_dynamic_f("numvfs-%u-tile-%u", num_vfs, tile)
> +					pf_check_vfs_ids(pf_fd, tile, num_vfs);
> +
> +	igt_describe("Verify on PF the modifiability of GGTT PTE assigned to VFs");
> +	igt_subtest_with_dynamic("pf-check-vfs-pte")
> +		xe_for_each_tile(pf_fd, tile)
> +			igt_dynamic_f("tile-%u", tile)
> +				pf_check_vfs_pte(pf_fd, tile);
> +
> +	igt_describe("Verify of modifiability of GGTT PTE owned by VF");
> +	igt_subtest_with_dynamic("vfs-check-own-pte") {
> +		skip_on_mtl_vf(pf_fd);
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_tile(pf_fd, tile)
> +				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
> +					vfs_check_own_pte(pf_fd, vf_id, tile);
> +	}
> +
> +	igt_describe("Verify the non-availability of VF to GGTT PTEs owned by other VFs");
> +	igt_subtest_with_dynamic("vfs-check-other-vfs-pte") {
> +		igt_require(igt_sriov_get_total_vfs(pf_fd) > 1);
> +		skip_on_mtl_vf(pf_fd);
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_tile(pf_fd, tile)
> +				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
> +					vfs_check_other_vfs_pte(pf_fd, vf_id, tile);
> +	}
> +
> +	igt_describe("Verify the non-availability of VF to GGTT PTEs owned by PF");
> +	igt_subtest_with_dynamic("vfs-check-pf-pte") {
> +		skip_on_mtl_vf(pf_fd);
> +		for_each_sriov_vf(pf_fd, vf_id)
> +			xe_for_each_tile(pf_fd, tile)
> +				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
> +					vfs_check_pf_pte(pf_fd, vf_id, tile);
> +	}
> +
> +	igt_fixture() {
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
> index a62f447df..1ac89bab7 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -341,6 +341,7 @@ intel_xe_progs = [
>   	'xe_sriov_admin',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
> +	'xe_sriov_ggtt',
>   	'xe_sriov_vfio',
>   	'xe_sriov_scheduling',
>           'xe_survivability',
