Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B95C41513
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 07:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661710E29F;
	Tue, 28 May 2024 07:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NC8+JnsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FD589C46
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716882459; x=1748418459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Stk2ueoqqGtJVQblen0oAZ9YrQLqP6WkkOH8moEQpOA=;
 b=NC8+JnsPluo+sEuxMLPiEyqkPAKlZag3LK/X+aSvxDrLLLv1J+XvxsnD
 dAtjenJx/5OEF9vWM3pehe36lQFZitMidr8Ne0PvDZ2Enzg363MiZHVl0
 RbN0JroAtu+6d3la77N6uNrrCYfg6REtvS/E9cGc8loOdkt1ZcWaRUPCB
 P1fJQ2kEkdkez9L20g6PYxz5UWIsuFaBlTxuigBM3abf4/QLGwpEyUXVG
 XRNaHDc0UmZ2mKLpGWRl1nLqXlpT9CPYPVvfla0LB2Qi10xLfmec+prGT
 KhV48siXUv6VPCT/QVrAArQc2K4+Wy1i01eywHr7dy5DIkpPrW6c4gA/J A==;
X-CSE-ConnectionGUID: XPJ+fFJiRlC9mkHwJDUEgw==
X-CSE-MsgGUID: BwaJtRBhSZ2NuwrV66JAdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24627670"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24627670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:47:38 -0700
X-CSE-ConnectionGUID: SIMyVnksRnOCO2nlmC/HMg==
X-CSE-MsgGUID: Wv8NYh5ySyG6DMZcIFzZgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="39380464"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 00:47:37 -0700
Date: Tue, 28 May 2024 09:47:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_fb: Mark Xe framebuffers as slow access
Message-ID: <20240528074734.bclddc3jlzbmtgrm@zkempczy-mobl2>
References: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
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

On Mon, May 27, 2024 at 04:17:47PM +0300, Juha-Pekka Heikkila wrote:
> Reading from Xe device framebuffers is slow hence mark is as such.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5df5cb08f..26d6957f8 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4401,7 +4401,8 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>  		setup_linear_mapping(&blit->base);
>  
>  		/* speed things up by working from a copy in system memory */
> -		cvt.src.slow_reads = is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
> +		cvt.src.slow_reads = (is_i915_device(fd) && !gem_has_mappable_ggtt(fd)) ||
> +			is_xe_device(fd);
>  	} else {
>  		blit->base.linear.fb = *fb;
>  		blit->base.linear.fb.gem_handle = 0;
> @@ -4409,7 +4410,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>  		igt_assert(blit->base.linear.map);
>  
>  		/* reading via gtt mmap is slow */
> -		cvt.src.slow_reads = is_i915_device(fd);
> +		cvt.src.slow_reads = is_intel_device(fd);
>  	}
>  
>  	cvt.dst.ptr = blit->shadow_ptr;
> -- 
> 2.43.2
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
