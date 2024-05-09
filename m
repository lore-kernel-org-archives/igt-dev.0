Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E64C25B4F
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 10:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A8410E184;
	Thu,  9 May 2024 10:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuwjTtqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C310E184
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715250669; x=1746786669;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z4/HX7W6BEIeHzbPFK7t4yUXmVedMFDmM6oQTraax7k=;
 b=NuwjTtqYKJYSjNwXpxCkTSRwf8ZVScDBUAxl9FmR2V6sQenNr7oHLAxF
 YaQUi2FlVSHofBWjIE7mM3T6rGQWWiNgX3S5FNtzucrvPcvGhfs7TEixU
 k7shZJnOyACxJT77geoqanCU0R5Yri+pFr3EtSdlRSnEgGPQ7ngD26cTJ
 o/rWu9EjYOVlElZS2bXkCVNU6xn/klLnLHSkAy3gi3LqVtYPakmqS3imR
 LTSHSYVIOS0GXndQmzuH89RhlgM1sT2B6EmvbuYzIj5ji3D7noGB4Udl5
 NnVlfop2bumRe0QlotKcK6aMLAkbogcr84uTQB4Al4zV5vdHL8RPT1yfV A==;
X-CSE-ConnectionGUID: IPvNCiBATC6iKDqBDgJ4iQ==
X-CSE-MsgGUID: QjCxOsLgSYSeZyuzPsLnJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22566029"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="22566029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:31:09 -0700
X-CSE-ConnectionGUID: jzOum/JmQIidLpvdpsx4bQ==
X-CSE-MsgGUID: I2Q6kyOgRmqmd3vE401jbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="52405125"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:31:07 -0700
Date: Thu, 9 May 2024 12:31:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 5/6] lib/igt_fb: put intel blt cleanup into its
 own function
Message-ID: <20240509103104.qsplekf4prd2u4mv@zkempczy-mobl2>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
 <20240430162939.272990-6-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430162939.272990-6-juhapekka.heikkila@gmail.com>
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

On Tue, Apr 30, 2024 at 07:29:38PM +0300, Juha-Pekka Heikkila wrote:
> make blitcopy function bit easier to handle

s/make/Make/

Please other patches, I've notice small letter on other patches as
well.

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 1730f6394..5b4670e8d 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2938,6 +2938,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
>  	}
>  }
>  
> +static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
> +				  uint32_t xe_bb, uint32_t exec_queue,
> +				  uint32_t vm, intel_ctx_t *xe_ctx,
> +				  int fd, const intel_ctx_t *ictx)
> +{
> +	if (ctx)
> +		gem_context_destroy(fd, ctx);
> +	put_ahnd(ahnd);
> +
> +	if(is_xe) {

Checkpatch is complaining about missing space after if.

With this fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		gem_close(fd, xe_bb);
> +		xe_exec_queue_destroy(fd, exec_queue);
> +		xe_vm_destroy(fd, vm);
> +		free(xe_ctx);
> +	}
> +
> +	intel_ctx_destroy(fd, ictx);
> +}
> +
>  static void blitcopy(const struct igt_fb *dst_fb,
>  		     const struct igt_fb *src_fb)
>  {
> @@ -3078,18 +3097,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  		}
>  	}
>  
> -	if (ctx)
> -		gem_context_destroy(dst_fb->fd, ctx);
> -	put_ahnd(ahnd);
> -
> -	if(is_xe) {
> -		gem_close(dst_fb->fd, xe_bb);
> -		xe_exec_queue_destroy(dst_fb->fd, exec_queue);
> -		xe_vm_destroy(dst_fb->fd, vm);
> -		free(xe_ctx);
> -	}
> -
> -	intel_ctx_destroy(src_fb->fd, ictx);
> +	cleanup_blt_resources(ctx, ahnd, is_xe, bb, exec_queue, vm, xe_ctx,
> +			      src_fb->fd, ictx);
>  }
>  
>  static void free_linear_mapping(struct fb_blit_upload *blit)
> -- 
> 2.25.1
> 
