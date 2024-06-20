Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20900C2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 14:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78F110EA50;
	Thu, 20 Jun 2024 14:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bG0EAZmm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B9210EA5B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718894376; x=1750430376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9NMm0DrvjNQKo/vbIRU1Ya/uLPHUw3r1EH5qmzobJC8=;
 b=bG0EAZmmy6MbDO0lZMQ+JLtQx380HUu+xLCaQhKKy3q1g7HfZSG9TKay
 itGnKOv4H3IlJnbt6mT+ZL9Qkwb5YUFbJQ7N8YOoLbt+hwX3Sh6/4iMcp
 fJWc9i59X1nkxr2Gpk7MB5Ogh8vUIzriGFGVc9v2WAaDQ7GwG9iQwnhaC
 yz82nvHGDeMm6t8hte3gQd/bSFCJ19Mpi4lfKtVsufk4UFyRwm6sTP9Sf
 yfMTck/tHU1cgr4QnZLBkQRn0BJiVc2u6uZ8tlVES8vthZ6DufRSy9jG6
 F62kiq2mXrG9eCQ1uSsBdoa0ggnEdjKuxWsesC3KgwTgT6TAhJKPRPTXo w==;
X-CSE-ConnectionGUID: pVZ8p9C9RAqckfDzqJLlHw==
X-CSE-MsgGUID: +tw9KJLnQkKF1TMoqU5r7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19690315"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19690315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:39:35 -0700
X-CSE-ConnectionGUID: T2pN1K+XTfWObqarTTmr8w==
X-CSE-MsgGUID: 5gQwkFfnSUa15KN69GCIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="79754247"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:39:34 -0700
Date: Thu, 20 Jun 2024 16:39:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH 1/3] lib/amdgpu: add new asic support
Message-ID: <20240620143931.gabqwrm7mq4jcwer@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240620061438.2218484-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240620061438.2218484-1-jesse.zhang@amd.com>
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

Hi Jesse,
On 2024-06-20 at 14:14:38 +0800, Jesse Zhang wrote:
> Add gfx12 family id
> 
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>

Please send this as a series with new uniqe subject in cover letter.

Regards,
Kamil

> ---
>  lib/amdgpu/amd_family.h       | 1 +
>  lib/amdgpu/amd_ip_blocks.c    | 3 +++
>  lib/amdgpu/amdgpu_asic_addr.h | 3 +++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
> index bce2c6c2e..4a5731dbf 100644
> --- a/lib/amdgpu/amd_family.h
> +++ b/lib/amdgpu/amd_family.h
> @@ -106,6 +106,7 @@ enum radeon_family {
>  	CHIP_GFX1103_R2,
>  	CHIP_GFX1150,
>  	CHIP_GFX1151,
> +	CHIP_GFX1200,
>  	CHIP_LAST,
>  };
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 2ee94105c..ff7e55525 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -695,6 +695,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		identify_chip(GFX1150);
>  		identify_chip(GFX1151);
>  		break;
> +	case FAMILY_GFX1200:
> +		identify_chip(GFX1200);
> +		break;
>  	}
>  	if (!info->name) {
>  		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
> diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
> index cbe02871e..0ecb0b803 100644
> --- a/lib/amdgpu/amdgpu_asic_addr.h
> +++ b/lib/amdgpu/amdgpu_asic_addr.h
> @@ -31,6 +31,7 @@
>  #define FAMILY_GFX1036 0x95
>  #define FAMILY_GFX1150 0x96
>  #define FAMILY_GFX1037 0x97
> +#define FAMILY_GFX1200 0x98
>  
>  // AMDGPU_FAMILY_IS(familyId, familyName)
>  #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
> @@ -108,6 +109,7 @@
>  #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
>  #define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
>  #define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
> +#define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
>  
>  #define AMDGPU_EXPAND_FIX(x) x
>  #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
> @@ -173,5 +175,6 @@
>  #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
>  #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
>  #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
> +#define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
>  
>  #endif // _AMDGPU_ASIC_ADDR_H
> -- 
> 2.25.1
> 
