Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10930D29FB3
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 08:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EE710E12D;
	Wed,  6 Nov 2024 08:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEmgOuEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF5710E12D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730880495; x=1762416495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uy2hFSarfnTfnJvO9IGO4ojM2FkrRXJ/Bm/Hz1fIsYQ=;
 b=DEmgOuEv2TFbuBWTv/HKICLJBLkgm5aa0i+YMhqP1kZS3ir2RjPeeci5
 fAGH8PKpS74UVj2v9W10eXSyH8LZ55mqv7ncqzEJRqTa+HMXnbyw1S/sP
 61YUYEsYATud0WWxMbsCSG9mfOyFeVYllWYLavJ0H0l1ql6+xWQw4BAxu
 8op7sAgIFfG7rjAh5OFYWlS9/Hrr7BLULfTBVPSr+vwG5Fa90NINjIohy
 u8tg+h+V11yrWPEJxAZQR6OcepeJcDjG6t0EODiE0VNAWrhHn4nOkaIA9
 DnzWXDpn0IFjeZeXIR0G1dkI0dkmxYQeGu+6o4/xtJWf4wrI+97F7VdIN w==;
X-CSE-ConnectionGUID: py2fFYfrQ/eLQP2L2x3grw==
X-CSE-MsgGUID: g/InJeiEQ/OvaZkCNvqPKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30516594"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30516594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 00:08:15 -0800
X-CSE-ConnectionGUID: S/asOm2RTUa1gTueig20xQ==
X-CSE-MsgGUID: WYLzE3D2S7+iKSCK4w9X4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="115190222"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.112.13])
 ([10.245.112.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 00:08:11 -0800
Message-ID: <dd202765-6c93-4a91-8b9a-a9b579caa89e@linux.intel.com>
Date: Wed, 6 Nov 2024 09:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] lib/xe/xe_sriov_provisioning: Extract function
 to search provisioned PTE ranges
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
 <20241030193629.1238637-6-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20241030193629.1238637-6-marcin.bernatowicz@linux.intel.com>
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

On 30.10.2024 20:36, Marcin Bernatowicz wrote:
> Extract the function to search for GGTT provisioned PTE ranges for each VF
> from test/xe_sriov_flr to a library file lib/xe/xe_sriov_provisioning.
> This refactoring improves code reusability and will allow to prepare a
> test comparing debugfs exposed ggtt_provisioned attribute.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: C V Narasimha <narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c |  91 +++++++++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |   5 ++
>   tests/intel/xe_sriov_flr.c     | 130 +++++++++++----------------------
>   3 files changed, 137 insertions(+), 89 deletions(-)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 6a9ad411a..cbd6a49b6 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -5,6 +5,10 @@
>   
>   #include <stdlib.h>
>   
> +#include "igt_core.h"
> +#include "intel_chipset.h"
> +#include "linux_scaffold.h"
> +#include "xe/xe_mmio.h"
>   #include "xe/xe_sriov_provisioning.h"
>   
>   /**
> @@ -31,3 +35,90 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
>   
>   	return NULL;
>   }
> +
> +#define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
> +#define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
> +#define GGTT_PTE_VFID_SHIFT			2
> +
> +static uint64_t get_vfid_mask(int fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +
> +	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
> +		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
> +}
> +
> +/**
> + * xe_sriov_find_ggtt_provisioned_pte_offsets - Find GGTT provisioned PTE offsets
> + * @pf_fd: File descriptor for the Physical Function
> + * @gt: GT identifier
> + * @mmio: Pointer to the MMIO structure
> + * @ranges: Pointer to the array of provisioned ranges
> + * @nr_ranges: Pointer to the number of provisioned ranges
> + *
> + * This function searches for GGTT provisioned PTE ranges for each VF and
Nit: "This function" seems redundant. I suggest to align with an other 
descriptions, that start with just a verb.
> + * populates the provided ranges array with the start and end offsets of
> + * each range. The number of ranges found is stored in nr_ranges.
> + *
> + * The function reads the GGTT PTEs and identifies the VF ID associated with
Ditto.
> + * each PTE. It then groups contiguous PTEs with the same VF ID into ranges.
> + * The ranges are dynamically allocated and must be freed by the caller.
> + * The start and end offsets in each range are inclusive.
> + *
> + * Returns 0 on success, or a negative error code on failure.
> + */
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +					       struct xe_sriov_provisioned_range **ranges,
> +					       unsigned int *nr_ranges)
> +{
> +	uint64_t vfid_mask = get_vfid_mask(pf_fd);
> +	unsigned int vf_id, current_vf_id = -1;
> +	uint32_t current_start = 0;
> +	uint32_t current_end = 0;
> +	xe_ggtt_pte_t pte;
> +
> +	*ranges = NULL;
> +	*nr_ranges = 0;
> +
> +	for (uint32_t offset = 0; offset < SZ_8M; offset += sizeof(xe_ggtt_pte_t)) {
> +		pte = xe_mmio_ggtt_read(mmio, gt, offset);
> +		vf_id = (pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT;
> +
> +		if (vf_id != current_vf_id) {
> +			if (current_vf_id != -1) {
> +				/* End the current range */
> +				*ranges = realloc(*ranges, (*nr_ranges + 1) *
> +						  sizeof(struct xe_sriov_provisioned_range));
> +				igt_assert(*ranges);
> +				igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
> +					  current_vf_id, current_start, current_end,
> +					  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
> +					  sizeof(xe_ggtt_pte_t));
> +				(*ranges)[*nr_ranges].vf_id = current_vf_id;
> +				(*ranges)[*nr_ranges].start = current_start;
> +				(*ranges)[*nr_ranges].end = current_end;
> +				(*nr_ranges)++;
> +			}
> +			/* Start a new range */
> +			current_vf_id = vf_id;
> +			current_start = offset;
> +		}
> +		current_end = offset;
> +	}
> +
> +	if (current_vf_id != -1) {
> +		*ranges = realloc(*ranges, (*nr_ranges + 1) *
> +				  sizeof(struct xe_sriov_provisioned_range));
> +		igt_assert(*ranges);
> +		igt_debug("Found VF%u ggtt range [%#x-%#x] num_ptes=%ld\n",
> +			  current_vf_id, current_start, current_end,
> +			  (current_end - current_start + sizeof(xe_ggtt_pte_t)) /
> +			  sizeof(xe_ggtt_pte_t));
> +		(*ranges)[*nr_ranges].vf_id = current_vf_id;
> +		(*ranges)[*nr_ranges].start = current_start;
> +		(*ranges)[*nr_ranges].end = current_end;
> +		(*nr_ranges)++;
> +	}
> +
> +	return 0;
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index 7b7b3db90..aa2f08f52 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -8,6 +8,8 @@
>   
>   #include <stdint.h>
>   
> +struct xe_mmio;
> +
>   /**
>    * enum xe_sriov_shared_res - Shared resource types
>    * @XE_SRIOV_SHARED_RES_CONTEXTS: Contexts
> @@ -41,5 +43,8 @@ struct xe_sriov_provisioned_range {
>   };
>   
>   const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
> +int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
> +					       struct xe_sriov_provisioned_range **ranges,
> +					       unsigned int *nr_ranges);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index f698eaf3d..1049cffec 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -299,14 +299,6 @@ disable_vfs:
>   #define GEN12_VF_CAP_REG			0x1901f8
>   #define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
>   #define GGTT_PTE_ADDR_SHIFT			12
> -#define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
> -#define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
> -#define GGTT_PTE_VFID_SHIFT			2
> -
> -#define for_each_pte_offset(pte_offset__, ggtt_offset_range__) \
> -	for ((pte_offset__) = ((ggtt_offset_range__)->begin);  \
> -	     (pte_offset__) < ((ggtt_offset_range__)->end);    \
> -	     (pte_offset__) += sizeof(xe_ggtt_pte_t))
>   
>   struct ggtt_ops {
>   	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> @@ -314,10 +306,15 @@ struct ggtt_ops {
>   };
>   
>   struct ggtt_provisioned_offset_range {
> -	uint32_t begin;
> +	uint32_t start;
>   	uint32_t end;
>   };
>   
> +#define for_each_pte_offset(pte_offset__, ggtt_offset_range__) \
> +	for ((pte_offset__) = ((ggtt_offset_range__)->start);  \
> +	     (pte_offset__) <= ((ggtt_offset_range__)->end);   \
> +	     (pte_offset__) += sizeof(xe_ggtt_pte_t))
> +
>   struct ggtt_data {
>   	struct subcheck_data base;
>   	struct ggtt_provisioned_offset_range *pte_offsets;
> @@ -373,98 +370,53 @@ static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
>   	return mmio->dev;
>   }
>   
> -static uint64_t get_vfid_mask(int pf_fd)
> -{
> -	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> -
> -	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
> -		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
> -}
> -
> -static bool pte_contains_vfid(const xe_ggtt_pte_t pte, const unsigned int vf_id,
> -			      const uint64_t vfid_mask)
> -{
> -	return ((pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT) == vf_id;
> -}
> -
> -static bool is_offset_in_range(uint32_t offset,
> -			       const struct ggtt_provisioned_offset_range *ranges,
> -			       size_t num_ranges)
> -{
> -	for (size_t i = 0; i < num_ranges; i++)
> -		if (offset >= ranges[i].begin && offset < ranges[i].end)
> -			return true;
> -
> -	return false;
> -}
> -
> -static void find_ggtt_provisioned_ranges(struct ggtt_data *gdata)
> +static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   {
> -	uint32_t limit = gdata->mmio->intel_mmio.mmio_size - SZ_8M > SZ_8M ?
> -				 SZ_8M :
> -				 gdata->mmio->intel_mmio.mmio_size - SZ_8M;
> -	uint64_t vfid_mask = get_vfid_mask(gdata->base.pf_fd);
> -	xe_ggtt_pte_t pte;
> +	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
> +	struct xe_sriov_provisioned_range *ranges;
> +	unsigned int nr_ranges, gt = gdata->base.gt;
>   
> -	gdata->pte_offsets = calloc(gdata->base.num_vfs + 1, sizeof(*gdata->pte_offsets));
> +	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>   	igt_assert(gdata->pte_offsets);
>   
> -	for (int vf_id = 1; vf_id <= gdata->base.num_vfs; vf_id++) {
> -		uint32_t range_begin = 0;
> -		int adjacent = 0;
> -		int num_ranges = 0;
> -
> -		for (uint32_t offset = 0; offset < limit; offset += sizeof(xe_ggtt_pte_t)) {
> -			/* Skip already found ranges */
> -			if (is_offset_in_range(offset, gdata->pte_offsets, vf_id))
> -				continue;
> -
> -			pte = xe_mmio_ggtt_read(gdata->mmio, gdata->base.gt, offset);
> -
> -			if (pte_contains_vfid(pte, vf_id, vfid_mask)) {
> -				if (adjacent == 0)
> -					range_begin = offset;
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, gt, gdata->mmio,
> +							 &ranges, &nr_ranges);
> +	if (ret) {
> +		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
> +				gt, ret);
> +		return -1;
> +	}
>   
> -				adjacent++;
> -			} else if (adjacent > 0) {
> -				uint32_t range_end = range_begin +
> -						     adjacent * sizeof(xe_ggtt_pte_t);
> +	for (unsigned int i = 0; i < nr_ranges; ++i) {
> +		const unsigned int vf_id = ranges[i].vf_id;
>   
> -				igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
> -					  vf_id, range_begin, range_end, adjacent);
> +		if (vf_id == 0)
> +			continue;
>   
> -				if (adjacent > gdata->pte_offsets[vf_id].end -
> -					       gdata->pte_offsets[vf_id].begin) {
> -					gdata->pte_offsets[vf_id].begin = range_begin;
> -					gdata->pte_offsets[vf_id].end = range_end;
> -				}
> +		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
>   
> -				adjacent = 0;
> -				num_ranges++;
> -			}
> +		if (gdata->pte_offsets[vf_id].end) {
> +			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> +					vf_id);
> +			free(ranges);
> +			return -1;
>   		}
>   
> -		if (adjacent > 0) {
> -			uint32_t range_end = range_begin + adjacent * sizeof(xe_ggtt_pte_t);
> -
> -			igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
> -				  vf_id, range_begin, range_end, adjacent);
> +		gdata->pte_offsets[vf_id].start = ranges[i].start;
> +		gdata->pte_offsets[vf_id].end = ranges[i].end;
> +	}
>   
> -			if (adjacent > gdata->pte_offsets[vf_id].end -
> -				       gdata->pte_offsets[vf_id].begin) {
> -				gdata->pte_offsets[vf_id].begin = range_begin;
> -				gdata->pte_offsets[vf_id].end = range_end;
> -			}
> -			num_ranges++;
> -		}
> +	free(ranges);
>   
> -		if (num_ranges == 0) {
> +	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +		if (!gdata->pte_offsets[vf_id].end) {
>   			set_fail_reason(&gdata->base,
> -					"Failed to find VF%d provisioned ggtt range\n", vf_id);
> -			return;
> +					"Failed to find VF%u provisioned GGTT PTE offset range\n",
> +					vf_id);
> +			return -1;
>   		}
> -		igt_warn_on_f(num_ranges > 1, "Found %d ranges for VF%d\n", num_ranges, vf_id);
> -	}
> +
> +	return 0;
>   }
>   
>   static void ggtt_subcheck_init(struct subcheck_data *data)
> @@ -486,7 +438,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>   		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
>   			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
>   
> -		find_ggtt_provisioned_ranges(gdata);
> +		populate_ggtt_pte_offsets(gdata);
>   	} else {
>   		set_fail_reason(data, "xe_mmio is NULL\n");
>   	}
> @@ -502,7 +454,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>   		return;
>   
>   	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
> -		  gdata->pte_offsets[vf_id].begin,
> +		  gdata->pte_offsets[vf_id].start,
>   		  gdata->pte_offsets[vf_id].end);
>   
>   	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {

In general LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
