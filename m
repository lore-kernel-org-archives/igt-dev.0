Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8336EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 08:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1924010F4DA;
	Fri, 12 Apr 2024 08:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE0WuCub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804BB10F4DA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712910349; x=1744446349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9ELXwYg6GL+fM2tpeiHrGJs1qxgj+EFo3rwXzuqa9HY=;
 b=OE0WuCubpO4w+LtsPCgklDikz6W8vI5+74ZRc9A9j30zY/13jN4/vGko
 SuMlSzZo1S2xbKRVgl4srGYStI+hQKznujrA0dFxWLk5EGRWxbYjeAyQX
 kK2wxCItictsdyT4w/CbZkg857hR8E7esBKY1Qib1wsOkQ9WiqPKVjB2C
 mxmM9QjhTAemNKWoEz3EQ1f6neD+ptDvx7Fep8FWNXHaCVxc+35udOL+e
 4CWytn7oEv144k1ODvWpTPP4in56bJkFSHFSUclOVu2ho+LrBwKdix3x8
 R8E4JajrycnsdFu4LAZEx499dNHusduFus42zatTjYto1RyUlE19O30R5 g==;
X-CSE-ConnectionGUID: cPQTL+YIQgyJSHeWz19d7g==
X-CSE-MsgGUID: 2HHL70vkRE2T1+alS4x/9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19069769"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19069769"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 01:25:48 -0700
X-CSE-ConnectionGUID: LKe6rfvSTF6ZiNsQ5WBgAA==
X-CSE-MsgGUID: 46xoiB7lT2uxncPqIPAN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25827905"
Received: from unknown (HELO localhost) ([10.245.246.170])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 01:25:46 -0700
Date: Fri, 12 Apr 2024 10:25:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com
Subject: Re: [PATCH i-g-t v4 2/2] tests/xe_ccs: Update compression check
 based on flat-ccs  enablement
Message-ID: <20240412082541.3nw6xzl4ap5ncmc7@zkempczy-mobl2>
References: <cover.1712928787.git.akshata.jahagirdar@intel.com>
 <af10689c8fc1c87fb713e94ca4d725e2c20613f9.1712928787.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af10689c8fc1c87fb713e94ca4d725e2c20613f9.1712928787.git.akshata.jahagirdar@intel.com>
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

On Fri, Apr 12, 2024 at 06:37:30AM -0700, Akshata Jahagirdar wrote:
> In Xe2+ platforms, we need to run this test regardless of the status of
> flat-ccs. Check if the platform supports compression and has flat ccs enabled,
> and if it doesn't, then update the checks based on  compression
> accordingly and  proceed with the test.
> 
> Additionally, On Xe2 dGPU, compression is only supported with VRAM. When copying from
> VRAM -> system memory the KMD uses mapping with uncompressed PAT
> so the copy in system memory is guaranteed to be uncompressed.
> When restoring such buffers from system memory -> VRAM the KMD can't
> easily know which pages were originally compressed, so we always use
> uncompressed -> uncompressed here.
> so this means that there's no need for extra CCS storage on such
> platforms.
> Thats why we shouldn't need to run suspend-resume on xe2 dgpu.

Use !fmt -w 72 to format the commit message (kernel assumes 72, but in
igt we're not that strict and 80 is fine either).

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_ccs.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index b3bf97af7..ce695c80a 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -162,8 +162,11 @@ static void surf_copy(int xe,
>  						      (void *)mid->ptr, mid->size);
>  
>  		munmap(ccsmap2, ccssize);
> -		igt_assert(!strcmp(orig, newsum));
> -		igt_assert(!strcmp(orig2, newsum2));
> +		if (AT_LEAST_GEN(xe, 20) && !is_intel_dgfx(xe) &&
> +		    !blt_platform_has_flat_ccs_enabled(xe)) {
> +			igt_assert(!strcmp(orig, newsum));
> +			igt_assert(!strcmp(orig2, newsum2));
> +		}

If I'm not wrong you're stopping verification on Xe platforms (DG2).

>  		g_free(orig);
>  		g_free(orig2);
>  		g_free(newsum);
> @@ -193,7 +196,8 @@ static void surf_copy(int xe,
>  	intel_ctx_xe_sync(ctx, true);
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
> -	igt_assert(result != 0);
> +	if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +		igt_assert(result != 0);

Same here.

>  
>  	/* retrieve back ccs */
>  	memcpy(ccsmap, ccscopy, ccssize);
> @@ -365,7 +369,8 @@ static void block_copy(int xe,
>  	 * occurs and ctrl surface will be filled with some not-zeroed values.
>  	 */
>  	if (mid->compression && FROM_EXP_WH(width, height))
> -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> +		if (AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));

Same here.

--
Zbigniew

>  
>  	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>  
> -- 
> 2.34.1
> 
