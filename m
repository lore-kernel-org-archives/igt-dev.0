Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ADAC55179
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 12:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF64A10E00A;
	Mon,  3 Aug 2026 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3YNRCi6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E481F10E056
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785759972; x=1817295972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A3tlfLgt2hxjpk0LzT04THOgTiQ/VlJDpef9aewVFHs=;
 b=K3YNRCi6DfnqSRMWA6rTNXOVnoDvg0/gA7GjueuC2O0z+oLiHQYNqyLg
 hvrQg+NUbbYGq/k9vAAA7+K5LplQtKjSZn2k1JPka5Ma2FqszmnDL+s1Z
 eTfYCIibqf1FtgNtSlFioYWlWAY5Aokacio/BbSQs4+l7QtzuksSiO/av
 Hwlu05lwHFVtvlJIsX4qAWYmBlrWvkOrDZKfhawBAD2iA3jBR+xYNik10
 QbGa2JlV3hMVRzDEfIlp5JK+z3Eem6Zt9HvFfmGGuPEUUsIqKzdJxHzCR
 872P9AHNw9BLUJ4frV1tKqJNSH9rnFXj0EaT/nRkGL0PsduQiQHLLjzrc w==;
X-CSE-ConnectionGUID: wFwSSGWZTsuOcpFolfw5TQ==
X-CSE-MsgGUID: ZFlKrgVFQ/+66FNDP8K1Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97454075"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="97454075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:26:11 -0700
X-CSE-ConnectionGUID: IPvhzpy6QMeb04YFdegvJg==
X-CSE-MsgGUID: 9CKrOD5sTEOivHqkl7wLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="256883206"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 05:26:10 -0700
Message-ID: <ea3f0b58-2790-49cf-91b5-db1c067b982a@linux.intel.com>
Date: Mon, 3 Aug 2026 14:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_sriov_flr: Extend GGTT clearing checks
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
References: <20260730093807.926456-1-lukasz.laguna@intel.com>
 <20260730093807.926456-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260730093807.926456-3-lukasz.laguna@intel.com>
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


On 7/30/2026 11:38 AM, Lukasz Laguna wrote:
> In addition to GPA clearing, verify that VFID and the page present bit
> are correctly set after VF FLR.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/xe/xe_ggtt.c           | 15 +++++++++++++++
>   lib/xe/xe_ggtt.h           |  9 +++++++++
>   tests/intel/xe_sriov_flr.c | 21 +++++++++++++++++++++
>   3 files changed, 45 insertions(+)
>
> diff --git a/lib/xe/xe_ggtt.c b/lib/xe/xe_ggtt.c
> index 96b189b7a..8a98e9027 100644
> --- a/lib/xe/xe_ggtt.c
> +++ b/lib/xe/xe_ggtt.c
> @@ -6,6 +6,14 @@
>   #include "igt.h"
>   #include "xe/xe_ggtt.h"
>   
> +xe_ggtt_pte_mask_t xe_ggtt_get_vfid_mask(int pf_fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
> +		GGTT_PTE_VFID_MASK : TGL_GGTT_PTE_VFID_MASK;
> +}
> +
>   xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd)
>   {
>   	if (IS_TIGERLAKE(intel_get_drm_devid(pf_fd)))
> @@ -14,6 +22,13 @@ xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd)
>   	return GGTT_PTE_ADDR_MASK;
>   }
>   
> +uint8_t xe_ggtt_pte_get_vfid(int pf_fd, xe_ggtt_pte_t pte)
> +{
> +	xe_ggtt_pte_mask_t mask = xe_ggtt_get_vfid_mask(pf_fd);
> +
> +	return (uint8_t)((pte & mask) >> GGTT_PTE_VFID_SHIFT);
> +}
> +
>   uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte)
>   {
>   	xe_ggtt_pte_mask_t mask = xe_ggtt_get_gpa_mask(pf_fd);
> diff --git a/lib/xe/xe_ggtt.h b/lib/xe/xe_ggtt.h
> index 5e4038591..ada7ddbb0 100644
> --- a/lib/xe/xe_ggtt.h
> +++ b/lib/xe/xe_ggtt.h
> @@ -12,10 +12,19 @@
>   #define TGL_GGTT_PTE_ADDR_MASK		GENMASK_ULL(38, 12)
>   #define   GGTT_PTE_ADDR_SHIFT		12
>   
> +#define GGTT_PTE_VFID_MASK		GENMASK_ULL(11, 2)
> +#define TGL_GGTT_PTE_VFID_MASK		GENMASK_ULL(4, 2)
> +#define   GGTT_PTE_VFID_SHIFT		2
> +
> +#define GGTT_PAGE_PRESENT		GENMASK_ULL(0, 0)
> +
>   typedef uint64_t xe_ggtt_pte_t;
>   typedef uint64_t xe_ggtt_pte_mask_t;
>   
> +xe_ggtt_pte_mask_t xe_ggtt_get_vfid_mask(int pf_fd);
>   xe_ggtt_pte_mask_t xe_ggtt_get_gpa_mask(int pf_fd);
> +
> +uint8_t xe_ggtt_pte_get_vfid(int pf_fd, xe_ggtt_pte_t pte);
>   uint64_t xe_ggtt_pte_get_gpa(int pf_fd, xe_ggtt_pte_t pte);
>   
>   #endif /* __XE_GGTT_H__ */
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 556979d7b..34a379586 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -709,6 +709,16 @@ static bool check_pte_gpa(int pf_fd, xe_ggtt_pte_t pte, uint8_t expected)
>   	return (xe_ggtt_pte_get_gpa(pf_fd, pte) == expected);
>   }
>   
> +static bool check_pte_vfid(int pf_fd, xe_ggtt_pte_t pte, uint8_t expected)
> +{
> +	return (xe_ggtt_pte_get_vfid(pf_fd, pte) == expected);
> +}
> +
> +static bool check_pte_valid(int pf_fd, xe_ggtt_pte_t pte)
> +{
> +	return (pte & GGTT_PAGE_PRESENT);
> +}
> +
>   static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   {
>   	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
> @@ -828,6 +838,17 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>   			failed = true;
>   		}
>   
> +		if (!check_pte_vfid(pf_fd, pte, vf_id)) {
> +			igt_debug("Wrong GGTT VFID on VF%u after VF%u FLR\n", vf_id, flr_vf_id);
> +			failed = true;
> +		}
> +
> +		if (!check_pte_valid(pf_fd, pte)) {
> +			igt_debug("GGTT page present bit not set on VF%u after VF%u FLR\n",
> +				  vf_id, flr_vf_id);
> +			failed = true;
> +		}
> +

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   		if (failed) {
>   			set_fail_reason(data,
>   					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
