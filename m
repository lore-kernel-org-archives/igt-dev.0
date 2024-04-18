Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E87C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 13:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6B113CB3;
	Thu, 18 Apr 2024 13:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQLmt81B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49078113CB2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 13:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713448795; x=1744984795;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hcVoQ+TcbW3Cbg+I9C0JEy4MQci7O2Gl5e0FWz2bkEk=;
 b=ZQLmt81BRIRvZO0vbtJFPO2Dci4fZlD9LL66QQN0fsCeMwsX5G7xqQ8S
 yiPjQqO7qX1QDAEBQVZPezYICupTpFlOzcsxa3M5MOLzCJC7gPRW/tn3e
 jj64ulxNrQjwu4LlaKw3fIyrGr6XeuB1s0vB1/HkDn+lton2KsfXKj0XR
 +7Gz4oo8wVsTl2ywZWQIVnhgkDBDp21guADpH4S2Goz2I6P7ixjKPuF7e
 EqjJF8xus0Jz10e1EZqEMhuDUobUOFbegAAhO9gzniO4j08+DO0fTEdSB
 sPPultnPftrfZdQig9SVG7lmGSQiofhAvgRuak5JlAQa+uuW+svP1307E w==;
X-CSE-ConnectionGUID: ue0D53mMQXGpA2zkCsKisA==
X-CSE-MsgGUID: ugvZP/GCTTq91fdlul/oOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12781093"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="12781093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:59:54 -0700
X-CSE-ConnectionGUID: S728s/eGSWiEozK6YZvHOQ==
X-CSE-MsgGUID: SHRaypEgSxSSyFt/ZlJweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="22855672"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:59:53 -0700
Date: Thu, 18 Apr 2024 15:59:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v6 2/2] tests/xe_ccs: Update compression check
 based on flat-ccs  enablement
Message-ID: <20240418135949.ow7vnpidfjeclzcp@zkempczy-mobl2>
References: <cover.1713429755.git.akshata.jahagirdar@intel.com>
 <0cfbaccb86155a3e5b6fc5c68447848fb08c51ef.1713429755.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cfbaccb86155a3e5b6fc5c68447848fb08c51ef.1713429755.git.akshata.jahagirdar@intel.com>
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

On Thu, Apr 18, 2024 at 01:46:43AM -0700, Akshata Jahagirdar wrote:
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
>  tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index b3bf97af7..d6148dc44 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -162,8 +162,24 @@ static void surf_copy(int xe,
>  						      (void *)mid->ptr, mid->size);
>  
>  		munmap(ccsmap2, ccssize);
> -		igt_assert(!strcmp(orig, newsum));
> -		igt_assert(!strcmp(orig2, newsum2));
> +		if (blt_platform_has_flat_ccs_enabled(xe)) {
> +			if (IS_GEN(xe, 12) && is_intel_dgfx(xe)) {
> +				igt_assert(!strcmp(orig, newsum));
> +				igt_assert(!strcmp(orig2, newsum2));
> +			} else if (AT_LEAST_GEN(xe, 20)) {
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

This part is fine for me, but below code doesn't work on Xe2/discrete.
I mean I got:

(xe_ccs:6919) CRITICAL: Test assertion failure function surf_copy, file ../tests/intel/xe_ccs.c:232:
(xe_ccs:6919) CRITICAL: Failed assertion: result == 0
(xe_ccs:6919) CRITICAL: Source and destination surfaces are different after restoring source ccs data

After resume we put corrupted, then previous ccs data. In all cases
along with uncompressed surface this leads to disaster. I mean for
discrete instead putting original ccs data (this one extracted before
suspend) you should fill it with zeros. Original ccs data were fine
before suspend migrated surface to system memory, but after resume
those ccs data are not valid anymore.

I've verified that for Xe2/discrete:

	/* retrieve back ccs */
	/* memcpy(ccsmap, ccscopy, ccssize); */
	memset(ccsmap, 0, ccssize);

does last blit work correctly.

--
Zbigniew

>  		g_free(orig);
>  		g_free(orig2);
>  		g_free(newsum);
> @@ -193,7 +209,8 @@ static void surf_copy(int xe,
>  	intel_ctx_xe_sync(ctx, true);
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
> -	igt_assert(result != 0);
> +	if (!blt_platform_has_flat_ccs_enabled(xe))
> +		igt_assert(result != 0);
>  
>  	/* retrieve back ccs */
>  	memcpy(ccsmap, ccscopy, ccssize);
> @@ -365,7 +382,8 @@ static void block_copy(int xe,
>  	 * occurs and ctrl surface will be filled with some not-zeroed values.
>  	 */
>  	if (mid->compression && FROM_EXP_WH(width, height))
> -		igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
> +		if (!blt_platform_has_flat_ccs_enabled(xe))
> +			igt_assert(blt_surface_is_compressed(xe, ctx, NULL, ahnd, mid));
>  
>  	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>  
> -- 
> 2.34.1
> 
