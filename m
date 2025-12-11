Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A369D41C36
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 13:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66E10E2D7;
	Thu, 11 Dec 2025 13:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3DnLGj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4780210E2D7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765459528; x=1796995528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z0obOuD+AKx68lpjmJYzXNE3vCnli0a2I5iOKZ3eT1k=;
 b=n3DnLGj9/e+pMuTIJniC0Xqfg9rTy6vVQTL6FD9C9RwJi+uOgZm1wfQe
 1CuvBFa2oB+eml7qzlxgXvqceioi8MyT5Mb44DFsRa7LyHW70r7FSeY67
 WMyDjtBKo1Q9WpTk8/Ou7qPqGibLaPY1mnbNBT/TQbkBLCyZGm/tisNGt
 1D77AVvLVaUlQ9rsHKBo/4mk37Bd6CD2j94EkomIUF57eR7Y/O1qjDSKV
 S6k0jpN2K1tTKIVoP8BFUldMFMc1235PqtpMXi+CjAunvKQTRztR/PIOW
 EXdxjUCHN06zjuX85hgqqE0hQN0EhLXKaY0r2mSST7lCRfZwlzvDc+vdg g==;
X-CSE-ConnectionGUID: QTL1yJkaSDCOQNgc4gfixA==
X-CSE-MsgGUID: kJ8eOKnlTVC2KGM88ua+nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67611395"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67611395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:25:27 -0800
X-CSE-ConnectionGUID: OSe6IVOJQ22Qx+px3C14MQ==
X-CSE-MsgGUID: umrpN9ROT6yi17u49uNd9g==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.245])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 05:25:25 -0800
Date: Thu, 11 Dec 2025 14:25:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_allocator: Fix Tile-4 format tests crash
 by initializing maps before SysV IPC check
Message-ID: <r5hyzs4sg44hjjfiwokrhzo3rmpxs7sfawfenhhluim3hmq334@4cc6m4nlmuvv>
References: <20251211095233.1172089-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Dec 11, 2025 at 03:22:33PM +0530, S Sebinraj wrote:
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
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
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

Right, if you're using allocator in single/multithreaded scenarios
above maps must be correct.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew


>  	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
>  }
>  
> -- 
> 2.43.0
> 
