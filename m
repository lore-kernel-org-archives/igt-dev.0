Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2655AC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 06:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19BC113124;
	Tue, 23 Apr 2024 06:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kptAecdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7000113124
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713852641; x=1745388641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pft1GcUh1FcopoWRKKuBe70L+8Sy9c0DaI/7ohCk8Zw=;
 b=kptAecdnjvVSsJqWd4kRYzw0aQvc0+vNV4zwsxTD06fmPk434SRrnBVZ
 4Hbho4gyr0ZDnbOqXYNbO+rKhLv6S2dvUn2Qz8KAGAQDctX7XmwznpFnD
 DrBWaA4xi7xU7Ip9E7Tkb7luRXOaHaQQWbGGQdRtqWxBDahmimNKEB3kR
 3f/3xUwbKQzAITjyKLWGX+R0+R3BUZs79CnQ1Pc/yfthEytvD8R0bHzCC
 Gdzy2wChnCUOtV8p/jc6L9geHISr7HDx1s/eFcAAoYfx+le/XvAy/hCfx
 anQcSbZCgXdSaBkcdgV6pwxZgUiXnhhPxefYvWWo4+RJrNM2CI2GAGaBy A==;
X-CSE-ConnectionGUID: vL0oK61gT5SjsfaEZmNdDQ==
X-CSE-MsgGUID: tiYnPbpDRrK3uKL1oY5boQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20031364"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20031364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 23:10:40 -0700
X-CSE-ConnectionGUID: J3MHKcAZTlufd+95Qc7crw==
X-CSE-MsgGUID: aQZt2lseRh+/esqrGHsXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28703490"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 23:10:38 -0700
Date: Tue, 23 Apr 2024 08:10:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v7 2/2] tests/xe_ccs: Update compression check
 based on flat-ccs  enablement
Message-ID: <20240423061035.3tsllgguyhuwjhnc@zkempczy-mobl2>
References: <4272a719354527049943ab167f0a2913704dc02a.1713886487.git.akshata.jahagirdar@intel.com>
 <a374522456782f67cdf00a48303d24cec6c1884c.1713886487.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a374522456782f67cdf00a48303d24cec6c1884c.1713886487.git.akshata.jahagirdar@intel.com>
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

On Tue, Apr 23, 2024 at 08:37:01AM -0700, Akshata Jahagirdar wrote:
> In Xe2+ platforms,we need to run this test regardless of the status of flat-ccs.
> Check if the platform supports compression and has flat ccs enabled, and if it
> doesn't, then update the checks accordingly and proceed with the test.
> 
> Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying
> from VRAM -> sysmem the KMD uses mapping with uncompressed PAT so the copy
> in system memory is guaranteed to be uncompressed. When restoring such buffers
> from sysmem -> VRAM the KMD can't easily know which pages were originally
> compressed, so we always use uncompressed -> uncompressed here. so this means
> there's no need for extra CCS storage on such platforms.
> Thats why we shouldn't need to run suspend-resume on xe2 dgpu.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_ccs.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index b3bf97af7..706d760cc 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -114,10 +114,11 @@ static void surf_copy(int xe,
>  	uint32_t sysmem = system_memory(xe);
>  	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
>  	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
> +	uint32_t devid = intel_get_drm_devid(xe);
>  	int result;
>  
>  	igt_assert(mid->compression);
> -	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
> +	if (AT_LEAST_GEN(devid, 20) && mid->compression) {
>  		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>  		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>  	}
> @@ -162,8 +163,24 @@ static void surf_copy(int xe,
>  						      (void *)mid->ptr, mid->size);
>  
>  		munmap(ccsmap2, ccssize);
> -		igt_assert(!strcmp(orig, newsum));
> -		igt_assert(!strcmp(orig2, newsum2));
> +		if (blt_platform_has_flat_ccs_enabled(xe)) {
> +			if (IS_GEN(devid, 12) && is_intel_dgfx(xe)) {
> +				igt_assert(!strcmp(orig, newsum));
> +				igt_assert(!strcmp(orig2, newsum2));
> +			} else if (AT_LEAST_GEN(devid, 20)) {
> +				if (is_intel_dgfx(xe)) {
> +					/* buffer object would become
> +					 * uncompressed in xe2+ dgfx
> +					 */
> +					igt_assert(!blt_surface_is_compressed(xe, ctx,
> +							NULL, ahnd, mid));
> +				} else {
> +					/* ccs should be present in xe2+ igfx */
> +					igt_assert(blt_surface_is_compressed(xe, ctx,
> +							NULL, ahnd, mid));
> +				}
> +			}
> +		}
>  		g_free(orig);
>  		g_free(orig2);
>  		g_free(newsum);
> @@ -193,10 +210,18 @@ static void surf_copy(int xe,
>  	intel_ctx_xe_sync(ctx, true);
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
> -	igt_assert(result != 0);
> +	if (blt_platform_has_flat_ccs_enabled(xe))
> +		igt_assert(result != 0);
>  
> -	/* retrieve back ccs */
> -	memcpy(ccsmap, ccscopy, ccssize);
> +	/* In case of suspend_resume, buffer object would become
> +	 * uncompressed in xe2+ dgfx, and therefore retrieve the
> +	 * ccs by copying 0 to ccsmap
> +	 */
> +	if (suspend_resume && AT_LEAST_GEN(devid, 20) && is_intel_dgfx(xe))
> +		memset(ccsmap, 0, ccssize);
> +	else
> +		/* retrieve back ccs */
> +		memcpy(ccsmap, ccscopy, ccssize);
>  	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
>  
>  	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
> @@ -365,7 +390,8 @@ static void block_copy(int xe,
>  	 * occurs and ctrl surface will be filled with some not-zeroed values.
>  	 */
>  	if (mid->compression && FROM_EXP_WH(width, height))
> -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> +		if (blt_platform_has_flat_ccs_enabled(xe))
> +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>  
>  	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>  
> -- 
> 2.34.1
> 

Now it should work fine. I only didn't test it on Xe2/integrated with
flat ccs turned off. If we missed some case we'll fix it later, but
for now:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
