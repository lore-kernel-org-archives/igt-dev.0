Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18D4D49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874F610E994;
	Fri, 30 Jan 2026 10:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Av6TrIS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A11E10E994
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769769697; x=1801305697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yAPQDBq9U2M73ppfAibZsPZCdG4gZVaxDlWUnYtk9NQ=;
 b=Av6TrIS5bSCJLZjjQ1MDai9DfxeaeDSwMYfbBbw4J6EUeWyl83V2WvAO
 DVmIpdFZnxB5us57Sdcrdt3H3YCQLdKK4Piwllix70HXunFBqehYRNVaA
 KswlGA8pqedbolI2rFaEA5jwPU70K1H5rOAybpO6T5AVPWhGQiq2L86FC
 gGVb2Zq1IcHYhfVYeQFSxJWnUQ39ENIVR6XZSjLNxhRcLmBur9V7+pNav
 +VE3hwRV8SUFQaGz9Lv1HIvIt4iDpAs9PtHpi6hJ5LvfZcTZ1tE4+bkDh
 mEMtCCX8ILlg9zTIUIFw6CtGxNlRadpfFTF0KhXWiMJVvWMsC4+VP18Q/ w==;
X-CSE-ConnectionGUID: Hb8MGH15ReaYC0TWsBO3Vg==
X-CSE-MsgGUID: tkCbuYnaRV+j/OnHKeCuFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70997759"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70997759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:41:36 -0800
X-CSE-ConnectionGUID: JTsHYKN8S9CL8hblz17XYw==
X-CSE-MsgGUID: nmq+hQyCTOeOLkAIHIXcLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208736453"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 02:41:34 -0800
Date: Fri, 30 Jan 2026 11:41:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tessita Thomas <Tessita.Thomas@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH] Fix IGT JPEG Dec Failure
Message-ID: <20260130104113.73vjnchr2ltscxzp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tessita Thomas <Tessita.Thomas@amd.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260130081544.440891-1-Tessita.Thomas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260130081544.440891-1-Tessita.Thomas@amd.com>
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

Hi Tessita,
On 2026-01-30 at 13:45:44 +0530, Tessita Thomas wrote:

please use prefixes in subject, here instead of:
[PATCH] Fix IGT JPEG Dec Failure

better:
[PATCH] lib/amdgpu: Fix VCN JPEG Dec submission

or
[PATCH] lib/amdgpu/amd_mmd_shared: Fix VCN JPEG submission

> For VCN 4.0.5, IGT needs to send aligned IB buffer.
> Added padding logic for ip = AMDGPU_HW_IP_VCN_JPEG.
> 

If it is known failure you could add here Closes: tag
(if it is in public repo like gitlab fdo). Up to you.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>

Regards,
Kamil 

> ---
>  lib/amdgpu/amd_mmd_shared.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
> index f504db596..b9eff16f9 100644
> --- a/lib/amdgpu/amd_mmd_shared.c
> +++ b/lib/amdgpu/amd_mmd_shared.c
> @@ -161,9 +161,22 @@ submit(amdgpu_device_handle device_handle, struct mmd_context *context,
>  	struct amdgpu_cs_fence fence_status = {0};
>  	uint32_t expired;
>  	int r;
> +	
> +	unsigned int padded_ndw = ndw;
> +
> +	/* Pad IB to 16 DW alignment for VCN JPEG (ib_pad_dw_mask = 0xF)*/
> +	if (ip == AMDGPU_HW_IP_VCN_JPEG) {
> +		if (padded_ndw & 1)
> +			return -1;
> +
> +		while (padded_ndw & 0xF) {
> +			context->ib_cpu[padded_ndw++] = 0x60000000; /* NOP packet */
> +			context->ib_cpu[padded_ndw++] = 0x00000000;
> +		}
> +	}
>  
>  	ib_info.ib_mc_address = context->ib_mc_address;
> -	ib_info.size = ndw;
> +	ib_info.size = padded_ndw;
>  
>  	ibs_request.ip_type = ip;
>  
> -- 
> 2.43.0
> 
