Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7784CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 10:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0BA10E192;
	Mon, 22 Sep 2025 10:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRuHwXnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2054610E192
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758537327; x=1790073327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OXT9TQyAVUfyrohyLhr8PnkVGbqzxbn/3SAnyJtIiRA=;
 b=nRuHwXnTCxPP5uFnHy7feAY5lOTjh9YmNW7DiOocSrknS5mzFCBEMXol
 QKZ7XCwH90r3JmGyms1ALElN43YS+suQA5QsxpahjELefP77Rhgqw6JB3
 rqvD2RDa9l++ca/YN1Lv349P0HyBRO1Jges8nrtDhuGUOW7PoW56QShfw
 DU+bT7/47fRq6T68q4558s/H7NPtxdf4uOmC/9LYPEmg3fGDj13RpP4Pu
 jIbyZWHXpidQdBmPz1P2vJvwbyVHlAVixfbvEc37/pglzC/6CWPY18Ed9
 nJlVdOkymB5y1ykoLUshAeRzHPSaVIINVNJgVNQRn/M80Pc4/eGeOLjP+ Q==;
X-CSE-ConnectionGUID: SRv8KcivS6GTrwEonGpzRQ==
X-CSE-MsgGUID: qDLZoysdRIGgMbLQOTzFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60853460"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60853460"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 03:35:27 -0700
X-CSE-ConnectionGUID: cUJTNKoNTO6ZHIqfrY/pUA==
X-CSE-MsgGUID: vNLN7hS/RT609Zleq8dxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176017022"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:35:25 -0700
Date: Mon, 22 Sep 2025 12:35:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Yinjie Yao <yinjie.yao@amd.com>
Subject: Re: [PATCH] Refine VCN test skip condition to target RX9000 (GFX12)
Message-ID: <20250922103523.p3kaoixh4dose75j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Yinjie Yao <yinjie.yao@amd.com>
References: <20250919193329.92904-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250919193329.92904-1-vitaly.prosyak@amd.com>
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
On 2025-09-19 at 15:33:29 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 

small reminder: please use prefix in subject, so it will be
like:

[PATCH] lib/amdgpu: Refine VCN skip to target RX9000 (GFX12)

As this was already merged it could stay as is but please
watch out for other similar changes.

Regards,
Kamil

> The previous patch attempted to skip VCN ENC/DEC tests on RX9000
> by checking `chip_id == 0x51`, but this was not robust enough across
> multiple system configurations or future variants.
> 
> This change refines the skip condition using `family_id == AMDGPU_FAMILY_GC_12_0_0`,
> which accurately identifies the GFX12 GPU family and allows
> for consistent handling of RX9000 devices.
> 
> VCN tests are currently failing on RX 7600 and block IGT enablement
> on this platform. This patch allows test infrastructure to proceed
> until a proper VCN fix is implemented.
> 
> v2: Fix RX9000(Yonjie)
> 
> Cc: Yinjie Yao <yinjie.yao@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_vcn_shared.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
> index 61075d8db..32766c0b4 100644
> --- a/lib/amdgpu/amd_vcn_shared.c
> +++ b/lib/amdgpu/amd_vcn_shared.c
> @@ -59,9 +59,9 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>  		context->vcn_reg_index = 2;
>  	}
>  
> -	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
> -	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
> -		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
> +	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
> +	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
> +		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
>  		return false;
>  	}
>  
> -- 
> 2.34.1
> 
