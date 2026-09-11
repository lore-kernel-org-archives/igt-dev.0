Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63DBC88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 14:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17610F658;
	Fri, 11 Sep 2026 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uno8K8eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAF310F663
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789138320; x=1820674320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D5roB5kB6Kh42xylRYdYhh+b0PnVNxG9lSAOZu8WB5g=;
 b=Uno8K8eo/S/W8MKMl0Uc3qhhIwRG8pjGedB3kZir9NW6nItAj67DJlbl
 CIF5OtjBWRTeF6yHBmcMP4wm1JsUPC8n0+4ZR2fOYbx00fQhXL8xly9oz
 8TyDz6j4VN5546mQRVzjHtty1A+58fxJeIlXxa/XiwQasZnLSLosP8ONG
 5Fkr/aLnvhZqfaUsOWEU4cRQi8p4sguBylBzAqJehZccu5g1QI7sz85jR
 13kWnDjQF2Vqzgc0ToKA7IVR/nOqMIg4clvYO5lhezo5BRbowujXlnV3Z
 iPOee3kVl7Z/dZNSpz79VYBfclXqbgfMQpXAG5lmZ3OpBhUQcVl2U6Qn2 A==;
X-CSE-ConnectionGUID: DaKC0EY+TeqMSXBBkW049A==
X-CSE-MsgGUID: QULTpZHOS3eisg+MzBRx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93470299"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93470299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 07:51:59 -0700
X-CSE-ConnectionGUID: x9lcryuISe6sq6jURiTb6Q==
X-CSE-MsgGUID: YUXVJEl7SQyLc89sOtcmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="295426974"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 07:51:57 -0700
Date: Fri, 11 Sep 2026 16:51:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>
Subject: Re: [PATCH i-g-t v2] lib/amdgpu: use shared amdgpu_ce_cs_enabled()
 for all CE CS tests
Message-ID: <20260911145140.gl4fck6pvtpfmd5k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 Michael Strawbridge <michael.strawbridge@amd.com>
References: <20260911031038.1243176-1-Granthali.VinodkumarDhandar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911031038.1243176-1-Granthali.VinodkumarDhandar@amd.com>
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

Hi Granthali,
On 2026-09-11 at 08:40:38 +0530, Granthali Vinodkumar Dhandar wrote:
> From: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>

please subscribe to igt-dev mailing list or expect some
delay with reaching it.


Regards,
Kamil

> 
> Commit b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel
> blocks CE CS") introduced amdgpu_ce_cs_enabled() to gate the constant
> engine submission paths in lib/amdgpu/amd_gfx.c.
> 
> Extend the same gate to amdgpu_command_ce_write_fence() in
> lib/amdgpu/amd_command_submission.c. Make amdgpu_ce_cs_enabled()
> non-static and declare it in lib/amdgpu/amd_gfx.h so it can be reused
> instead of duplicating the check, leaving all three CE CS paths sharing
> a single definition.
> 
> Fixes: b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS")
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Michael Strawbridge <michael.strawbridge@amd.com>
> Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 4 ++++
>  lib/amdgpu/amd_gfx.c                | 2 +-
>  lib/amdgpu/amd_gfx.h                | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 7210cffb9..c7b36970e 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_gfx.h"
>  #include "lib/amdgpu/amdgpu_asic_addr.h"
>  
>  #include "ioctl_wrappers.h"
> @@ -805,6 +806,9 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  	const struct amdgpu_ip_block_version *ip_block =
>  		get_ip_block(dev, AMD_IP_GFX);
>  
> +	igt_require_f(amdgpu_ce_cs_enabled(),
> +		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
> +
>  	/* destination buffer */
>  	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
>  				    AMDGPU_GEM_DOMAIN_GTT, 0,
> diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
> index 10bc74b5c..ff9f869a8 100644
> --- a/lib/amdgpu/amd_gfx.c
> +++ b/lib/amdgpu/amd_gfx.c
> @@ -29,7 +29,7 @@
>  #define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
>  
>  /* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
> -static bool amdgpu_ce_cs_enabled(void)
> +bool amdgpu_ce_cs_enabled(void)
>  {
>  	FILE *f;
>  	unsigned int mask = 0;
> diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
> index 90addf5bc..8bf108365 100644
> --- a/lib/amdgpu/amd_gfx.h
> +++ b/lib/amdgpu/amd_gfx.h
> @@ -32,4 +32,7 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
>  
>  void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
>  
> +/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
> +bool amdgpu_ce_cs_enabled(void);
> +
>  #endif
> -- 
> 2.43.0
> 
