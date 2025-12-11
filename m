Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C2DD41D64
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 16:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFE110E06B;
	Thu, 11 Dec 2025 16:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAilcoRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BC10E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765469434; x=1797005434;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S6THRlV/DiLkijrwtA4k8yele65ZbiP8huJDANYQh0w=;
 b=WAilcoRgsjUL9CB0dt6ksN8TQLLOWJ2NDY/WDoBfOFDZJkVFlUzpLYLh
 XwZ2p6/GKSkwv1z6lxwF1Y22dPDvQrbb1Xley6rpBj93CMLjdp53intrv
 eAyfjtNV7RsI7/Bcu7D0jWusILnF09fdupP8STYGiIBAV7hWa6O1d2AYP
 gAidPC1cbiS3JlnAMEa/SqZpYJVhn/JsdOEXj7FC93tDjqA4T5Y/dm+yn
 1qZc8OH+QB4BrPzE3YX45lcjArpmmeA2WxBy+NUICXbpGRlBE/Vt/6O1G
 qGgkFdiSmeAUmDgkeMZenXMN/4JiZDCHGPwG2uEjWajkGkoSP0ovZBoSR A==;
X-CSE-ConnectionGUID: ieaaclhiSj+QOa/mKEfvGA==
X-CSE-MsgGUID: fsWPF+chSyiFwZVRRB6kkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71320944"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71320944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:10:33 -0800
X-CSE-ConnectionGUID: 0/mPG5uyQN6ltI3K6kCs8A==
X-CSE-MsgGUID: rMKwIooQQv+tgR5wMfon2g==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:10:31 -0800
Date: Thu, 11 Dec 2025 17:10:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_allocator: Fix Tile-4 format tests crash
 by initializing maps before SysV IPC check
Message-ID: <20251211161029.yqw2g5xbtopease4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com
References: <20251211095233.1172089-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211095233.1172089-1-s.sebinraj@intel.com>
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

Hi S,
On 2025-12-11 at 15:22:33 +0530, S Sebinraj wrote:

imho subject could be shorter, for example:

[PATCH i-g-t] lib/intel_allocator: Initialize maps before SysV IPC check

> The allocator was incorrectly gating essential map initialization behind
> the SysV IPC availability check. This caused crashes in tests using tiled
> formats like Tile-4 on systems where sysvipc is not accessible.
> 
> Root Cause:
> -----------
> Tile-4 (and other tiled formats) require GPU blitter operations to convert
> between tiled and linear layouts for Cairo drawing. This conversion path
> needs the allocator to provide GPU virtual addresses for blitter commands.
> 
> Linear formats bypass this entirely - Cairo can write directly to CPU-mapped
> memory without GPU operations, so the allocator is never accessed and the
> bug remains hidden.
> 
> intel_allocator_init() checked system_supports_sysvipc() and returned
> early if the check failed, leaving ctx_map and vm_map uninitialized
> when Tile-4 tests triggered blitter operations, the allocator
> tried to search these NULL maps causing SIGSEGV.
> 
> Call stack at crash:
>   - igt_get_cairo_surface(tile4_fb)
>     - blitcopy(tile4 -> linear)
>       - intel_allocator_open()
>        - allocator_find()
>           - igt_map_search(NULL ctx_map) -> SIGSEGV
> 
> Solution:
> ---------
> Initialize allocator maps (handles, ctx_map, vm_map, ahnd_map)
> unconditionally as they are required for single-process GPU operations,
> not just multi-process IPC scenarios.
> 
> Impact:
> - Tile-4 and tiled format tests
> 
> Tested with kms_plane_lowres --run-subtest tiling-4 on PTL/ADL.
> 

And here add fixes tag:

Fixes: e21d1be9fa84 ("lib/intel_allocator: Add SYSVIPC support check")
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

No need for resend, it could be corrected at merge.

Regards,
Kamil

> ---
>  lib/intel_allocator.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index fddd0f3b3..55728057a 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -1703,12 +1703,6 @@ void intel_allocator_init(void)
>  	__free_maps(vm_map, false);
>  	__free_ahnd_map();
>  
> -	if (!system_supports_sysvipc()) {
> -		alloc_debug("System doesn't support SysV IPC\n");
> -		channel = NULL;
> -		return;
> -	}
> -
>  	atomic_init(&next_handle, 1);
>  	handles = igt_map_create(hash_handles, equal_handles);
>  	ctx_map = igt_map_create(hash_instance, equal_ctx);
> @@ -1717,6 +1711,12 @@ void intel_allocator_init(void)
>  	ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
>  	igt_assert(handles && ctx_map && vm_map && ahnd_map);
>  
> +	if (!system_supports_sysvipc()) {
> +		alloc_debug("System doesn't support SysV IPC\n");
> +		channel = NULL;
> +		return;
> +	}
> +
>  	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
>  }
>  
> -- 
> 2.43.0
> 
