Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F42EE95372
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD710E5B5;
	Wed,  4 Feb 2026 10:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hT/6A5Km";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058B010E5B5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770200845; x=1801736845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wFDwVV+jfW8qri2AUbsJxpdDlja2W2r53qmKlTlefoM=;
 b=hT/6A5Kmto/t2HL6jMiR/02Ibgt7FeJuYBsGkt5uGTu+fZgnJkzKHZRu
 99+rCxVpi1f31LSHbAK4IxCC4BWTKNpC5UEsG4HTtz/gnST28DMGhzPuy
 CZDADijiwZLKRBTZRSbw/8pmhTQ/q4Je8aszQ+zXnxxI2YW19Ma2eAc0P
 Y0o1M+D3Vm53dJKgHLGIJMokxK6DibgoWuxRZZckILujC3ISgBdDbkIL/
 ejlPiv1ElyLDPFY1uOc4/GXKqO7nBoz2HQYFojvVxP+7bOKbHC8fjqSTC
 n9yOvEUUHsleZ+vRy26kOdJperRv9CMmv2sLNJOZ+izw90EkYhD9+tS9q w==;
X-CSE-ConnectionGUID: ERXhiKgSRbSx8FBn63AKtQ==
X-CSE-MsgGUID: mnAu1b1uRLSi9evRt8gm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75240316"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75240316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:27:25 -0800
X-CSE-ConnectionGUID: aaaPt4PhTMCgSySEx28TnQ==
X-CSE-MsgGUID: E2qNrGGITlyaMFnLIcVNEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="215106012"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:27:23 -0800
Date: Wed, 4 Feb 2026 11:27:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tessita Thomas <Tessita.Thomas@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_jpeg_dec: Fix compilation warnings
Message-ID: <20260204102720.m52e2jh35nbmts6x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 Tessita Thomas <Tessita.Thomas@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260204053452.741530-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204053452.741530-1-karthik.b.s@intel.com>
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

Hi Karthik,
On 2026-02-04 at 11:04:52 +0530, Karthik B S wrote:
> Fix compilation warning:
> 
> [1611/2036] Compiling C object tests/amdgpu/amd_jpeg_dec.p/amd_jpeg_dec.c.o
> ../tests/amdgpu/amd_jpeg_dec.c: In function ‘amdgpu_cs_jpeg_decode’:
> ../tests/amdgpu/amd_jpeg_dec.c:201:9: warning: ISO C90 forbids mixed declarations and code
> [-Wdeclaration-after-statement]
>   201 |         unsigned int ib_dw_capacity = IB_SIZE / 4;
>       |
> 
> Cc: Tessita Thomas <Tessita.Thomas@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Fixes: 020b7f0da24d ("tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/amdgpu/amd_jpeg_dec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
> index f0876bfe1..81638bae0 100644
> --- a/tests/amdgpu/amd_jpeg_dec.c
> +++ b/tests/amdgpu/amd_jpeg_dec.c
> @@ -170,6 +170,12 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
>  	uint32_t idx;
>  	struct mmd_context acontext = {0};
>  	struct mmd_context *context = &acontext;
> +	/*
> +	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
> +	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
> +	 */
> +	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
> +	unsigned int ib_dw_capacity = IB_SIZE / 4;
>  
>  	r = mmd_context_init(device_handle, context);
>  	igt_assert_eq(r, 0);
> @@ -193,12 +199,6 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
>  		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
>  	}
>  
> -	/*
> -	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
> -	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
> -	 */
> -	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
> -	unsigned int ib_dw_capacity = IB_SIZE / 4;
>  	igt_assert_eq(idx & 1, 0);
>  
>  	while (idx & 0xF) {
> -- 
> 2.43.0
> 
