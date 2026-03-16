Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D6FF46453
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E681210E3B8;
	Mon, 16 Mar 2026 11:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmFT/1f3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A710E3B8
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773661557; x=1805197557;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=37CO1adpKP5OqVA+AtUbHi4SK0mAND9geKLpT38EyhQ=;
 b=DmFT/1f3I8pPAoacekCXFtoCF3iKagbjoobCAp5ofPXNRsbXxAx0+gXo
 ZNfC40dpBIeV/Zw69GH/NkPLtjaN/2sY2kqQdUGPSigUfub3Uyftxwqfg
 s9mnLIRw02OzrqZ0fOe2sGqU5szJYtqkLSwXJvGTggrZ4rxxyoaTC09Fu
 mMCK2ugwDJJbIg7pxjEGLAZl4woE5vfcOXv8UrJXA9p6gZpw1Od2qg6y6
 J3/5wFLkTLNvMySchpqDkRcPLWTFvogRtolWpkel8r4glmTjWthaup95R
 3SFdeA6YyEfmIoQRNoK4ybobNQF/hQlrv83z9qaLViUCA5d33p91OhiuT w==;
X-CSE-ConnectionGUID: bRXasJMtRW645TZJJIQ8EA==
X-CSE-MsgGUID: Nts4LxkmS/alz2pVQ8r3zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92057100"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92057100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:45:56 -0700
X-CSE-ConnectionGUID: cpm2qg7IQD+9XmcANfuKug==
X-CSE-MsgGUID: oaEEYkKhQkGcSErtPYiUfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226350322"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.246])
 ([10.245.244.246])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:45:56 -0700
Message-ID: <96456cfc-9dea-4d12-9c91-edab96a6d9d8@intel.com>
Date: Mon, 16 Mar 2026 11:45:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/intel_pat: Handle platforms without compressed PAT
 index
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, igt-dev@lists.freedesktop.org
References: <20260316065843.287818-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260316065843.287818-2-sanjay.kumar.yadav@intel.com>
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

On 16/03/2026 06:58, Sanjay Yadav wrote:
> Previously intel_get_pat_idx_uc_comp() would silently return zero on
> platforms where no compressed PAT index exists (e.g. CRI),
> since uc_comp was zero-initialized by default. This could lead to
> incorrect behavior when callers assume the returned index is valid.
> 
> Fix this by:
> - Adding XE_PAT_IDX_INVALID sentinel to detect unsupported platforms
> - Initializing uc_comp to XE_PAT_IDX_INVALID in xe_get_pat_sw_config()
>    before parsing debugfs; only platforms whose kernel exposes
>    IDX[XE_CACHE_NONE_COMPRESSION] in gt0/pat_sw_config will override it
>    with a valid index
> - Adding igt_assert(HAS_FLATCCS()) and igt_assert_f() in
>    intel_get_pat_idx_uc_comp() to fail with a clear error instead of
>    returning an invalid index
> 
> Also update the bo-comp-disable-bind test to distinguish between "CCS
> is disabled" and "CCS does not exist" using HAS_FLATCCS(). On platforms
> without CCS, the compressed PAT bind check is skipped since there is no
> valid compressed PAT index to test with.
> 
> v2:
> - Rebase
> - Update commit message accordingly
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Assuming CI is still happy,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/intel_pat.c      |  5 +++++
>   lib/intel_pat.h      |  1 +
>   tests/intel/xe_pat.c | 30 ++++++++++++++++++++++--------
>   3 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 9feeeb39d..525d9ad24 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -37,6 +37,8 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>   	}
>   
>   	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	xe_pat_cache->uc_comp = XE_PAT_IDX_INVALID;
> +
>   	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
>   		uint32_t value = 0;
>   		char *p = NULL;
> @@ -159,8 +161,11 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   
>   	igt_assert(intel_gen(dev_id) >= 20);
> +	igt_assert(HAS_FLATCCS(dev_id));
>   
>   	intel_get_pat_idx(fd, &pat);
> +	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,
> +		     "No compressed PAT index available on this platform\n");
>   	return pat.uc_comp;
>   }
>   
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index e9ade2e2e..e5dd8a0af 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -10,6 +10,7 @@
>   #include <stdint.h>
>   
>   #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> +#define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
>   #define XE_PAT_MAX_ENTRIES 32
>   
>   struct xe_pat_entry {
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index b92512164..e91b037a5 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -934,15 +934,18 @@ static bool has_no_compression_hint(int fd)
>    * Test category: functionality test
>    * Description: Validates that binding a BO created with
>    * the NO_COMPRESSION flag using a compressed PAT index fails
> - * with -EINVAL on Xe2+ platforms.
> + * with -EINVAL on Xe2+ platforms. On platforms where CCS
> + * does not exist, the test verifies uncompressed access works.
>    */
>   
>   static void bo_comp_disable_bind(int fd)
>   {
>   	size_t size = xe_get_default_alignment(fd);
> -	uint8_t comp_pat_index, uncomp_pat_index;
> -	bool supported;
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	bool has_flatccs = HAS_FLATCCS(dev_id);
> +	uint8_t uncomp_pat_index;
>   	uint32_t vm, bo;
> +	bool supported;
>   	int ret;
>   
>   	supported = has_no_compression_hint(fd);
> @@ -958,14 +961,25 @@ static void bo_comp_disable_bind(int fd)
>   	igt_assert_eq(ret, 0);
>   	vm = xe_vm_create(fd, 0, 0);
>   
> -	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>   	uncomp_pat_index = intel_get_pat_idx_uc(fd);
>   
> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> -				   size, 0, 0, NULL, 0,
> -				   0, comp_pat_index, 0),
> -		      -EINVAL);
> +	/*
> +	 * On platforms with CCS, binding a NO_COMPRESSION BO with a
> +	 * compressed PAT index must fail. On platforms without CCS,
> +	 * there is no valid compressed PAT index, so skip this check.
> +	 */
> +	if (has_flatccs) {
> +		uint8_t comp_pat_index = intel_get_pat_idx_uc_comp(fd);
> +
> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
> +					   size, 0, 0, NULL, 0,
> +					   0, comp_pat_index, 0),
> +			      -EINVAL);
> +	} else {
> +		igt_debug("Platform has no CCS, skipping compressed PAT bind check\n");
> +	}
>   
> +	/* Uncompressed bind must always succeed */
>   	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>   				   size, 0, 0, NULL, 0,
>   				   0, uncomp_pat_index, 0),

