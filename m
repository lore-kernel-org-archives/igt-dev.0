Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB3EC25B7E
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 08:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9C110E42C;
	Tue,  4 Jun 2024 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBryR0s0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AAA10E42C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717488119; x=1749024119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EuI3okyy2eWcpCqssw2mcZENl+T1DOi4BCkRKJ7JF4g=;
 b=aBryR0s0yVInRvj3L86UVK2ZjYQM58OqYm00FB7P91ihbhtKpgrO3IFw
 07WsFWtL5jED8sKbS3ScyXS5ezsi3z+DOAYR4j1GHp22Ga7qkggbpCl6G
 TJSk0wlCqctLZP4gBGILXmTRPrB0mgg6QOvjlWfSgJ0K253YJs7UXEqOW
 +TFkuC9OgekefDt3s9xZpnpaqyUyXrMw8whZNrkxTLkYrfb24drzRK639
 dAuQSlD7TbhSG5SBZgwr8s40FG0U22FubjPu/WKpWmR4NII0Wx42XQP2G
 JRNyI4iOa+z2jHK5Ww6dQpwsIXzX6peiAq+Fd/eMmHztvDjZ9GNwyq8NR w==;
X-CSE-ConnectionGUID: APlz5W5aQcCmk7dlKaTQuQ==
X-CSE-MsgGUID: XzHRFPg/Tv+9YQG7wDOvZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25415736"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="25415736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:01:58 -0700
X-CSE-ConnectionGUID: 6365Y7h0QN6FDtQX0c+x5g==
X-CSE-MsgGUID: s+4OXKhGTNCOTh9zbwOVIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37276339"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:01:57 -0700
Date: Tue, 4 Jun 2024 10:01:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 4/5] lib/igt_fb: put intel blt cleanup into its
 own function
Message-ID: <20240604080155.dz7cbzslhrtmad7z@zkempczy-mobl2>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <20240530142346.1511811-5-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240530142346.1511811-5-juhapekka.heikkila@gmail.com>
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

On Thu, May 30, 2024 at 05:23:45PM +0300, Juha-Pekka Heikkila wrote:
> make blitcopy function bit easier to handle
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_fb.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index e225b9090..d8608ef08 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2939,6 +2939,25 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
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

Add space after if before merging.

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
> @@ -3079,18 +3098,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
> 2.43.2
> 
