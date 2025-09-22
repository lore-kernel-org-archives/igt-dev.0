Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03DECAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 10:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862A610E412;
	Mon, 22 Sep 2025 10:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAlgj0ya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C5610E412
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758537430; x=1790073430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NrIrKt2OCqeAbzd7MWbahGKjG7VSfnm9MI3eSRoeWDw=;
 b=SAlgj0yafLUXqz535edJOQm/pL9MuKtSMVMxxVh3BBwoHbsQ543gSvrS
 CUoTkS3yxk6rM1TbtTbhP5MqfP8CrA95XKlXg9HQjbm+Yf2Ri0TcC40rN
 cgcc9YKI4cvtwOhZ7zZkW8uoMFFPifZEH3YGZjzKktKk8OnS8JCzamdAs
 2jmdUoE/CaZkeamC/57TX6QBWYZGFqgVNxiXE6ykwID45vnAsCrb8LFkX
 1f3uClSlhT510Y0sFIvoI2eqtVXygQf7KRMr6W/Xr1HqQiRZEPOyueR2O
 lEucFZ0AyH1geY2Fkj7JR6oyUemt5TYEzCyEKtvncFbTEIvOyhvoLrMda w==;
X-CSE-ConnectionGUID: tJXrESNSQlumJYW+Dz4QUQ==
X-CSE-MsgGUID: D5YsSivrRPWwlM86GFaShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60851959"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60851959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:37:09 -0700
X-CSE-ConnectionGUID: nvGVu2eSS9aDMQDpFkInxQ==
X-CSE-MsgGUID: 4f7YUEPsTReglwT5pxspnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="180459566"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:37:08 -0700
Date: Mon, 22 Sep 2025 12:37:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Yinjie Yao <yinjie.yao@amd.com>
Subject: Re: [PATCH] Refine VCN test skip condition to target RX 7600 (GFX12)
Message-ID: <20250922103705.vavsh25wkphvylb6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Yinjie Yao <yinjie.yao@amd.com>
References: <20250919191736.90385-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250919191736.90385-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,
On 2025-09-19 at 15:17:36 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>

small nit: please use prefix in subject, so it will be like:

[PATCH] lib/amdgpu: Refine VCN skip for RX 7600 (GFX12)

Regards,
Kamil

> 
> The previous patch attempted to skip VCN ENC/DEC tests on RX 7600
> by checking `chip_id == 0x51`, but this was not robust enough across
> multiple system configurations or future variants.
> 
> This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
> which accurately identifies the GFX12 GPU family and allows
> for consistent handling of RX 7600 devices.
> 
> VCN tests are currently failing on RX 7600 and block IGT enablement
> on this platform. This patch allows test infrastructure to proceed
> until a proper VCN fix is implemented.
> 
> Cc: Yinjie Yao <yinjie.yao@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_vcn_shared.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
> index 61075d8db..ee372cb5e 100644
> --- a/lib/amdgpu/amd_vcn_shared.c
> +++ b/lib/amdgpu/amd_vcn_shared.c
> @@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>  		context->vcn_reg_index = 2;
>  	}
>  
> -	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
> -	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
> -		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
> +	/* Skip VCN tests on Radeon RX 7600  (GFX12, family_id = 152) */
> +	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
> +		igt_info("Skipping VCN tests on GFX12 RX 7600 (family_id = 152)\n");
>  		return false;
>  	}
>  
> -- 
> 2.34.1
> 
