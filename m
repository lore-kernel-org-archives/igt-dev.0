Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31E6E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 16:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404410E0A4;
	Tue, 17 Dec 2024 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJgNLTj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398B10E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734454068; x=1765990068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZhYI/IFA8jT1KF8SSppP4NpqSvAu0Mn5bdYA34u3KnU=;
 b=VJgNLTj9IZbXF3oBEuJzfXhv+92qX9Lngkpe+PyaoiPv6+Yy9uwJIDWG
 iabowJGgdtLk1y2aDi2i/s9bQDfXeaAKqDOa/fIjQoXjxjAgMUJYNIikx
 aJv8Vj2dOnB1t83GHgXlpH7naI9jci2pTLFxgshICITUy7L/+RIFyce6S
 fUMlCkV9jabHbABpFOH/xidn+7kX4q5tmFbyvy71igazIWAte6634Cbav
 Wr9yvaC1dbZT4/0mTWMVTma9CmfEkfakeQVKRG87Pnbqs/mgoVKQIoXCg
 wxgrA0cmiAhU+r94Xl+/BXs8AmOsKGWHDz+s9zHR1QbtOPw9O+7Ll++fb Q==;
X-CSE-ConnectionGUID: m/nHyUT+RsqPUmiS90NZmQ==
X-CSE-MsgGUID: yfmuSVGgQQmQgXS0DgRw3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34213042"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34213042"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:47:48 -0800
X-CSE-ConnectionGUID: ppB5xO22QoCS3Jmnc6+wZw==
X-CSE-MsgGUID: 2JwUymKYQIORv3abYUbXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97456361"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 08:47:47 -0800
Date: Tue, 17 Dec 2024 17:47:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-12-17 at 11:58:07 +0100, Zbigniew Kempczyński wrote:

please improve subject, imho better something like:

Avoid overflow in micro/nano-seconds calculations
or
Fix overflow in micro/nano-seconds calculations

or propose yourself one line description.

> Multiplication without using casting to long (long) for at least
> one argument in expression may cause overflow especially when we're
> using this for calculating timeouts in nanoseconds precision.
> 
> Ensure we're picking valid ul/ull suffix for base definitions for
> all dependents.
> 
> Reported-by: Ilia Levi <ilia.levi@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
> 

I agree here with Lucas, remove this empty line.

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  lib/igt_core.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 90f57402f0..1b6e70182b 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
>  #define le32_to_cpu(x)  (x)
>  #endif
>  
> -#define MSEC_PER_SEC (1000u)
> +#if __WORDSIZE == 64

I am not sure if this is defined on all platforms where igt
is compiled, on musl and on non-Linux like FreeBSD,
why not make #ifndef/#define/#endif for __WORDSIZE ?

BTW is it just sizeof(1ul) == 8 ?

With this fixed and subject improved
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +#define MSEC_PER_SEC (1000ul)
> +#define USEC_PER_MSEC (1000ul)
> +#else
> +#define MSEC_PER_SEC (1000ull)
> +#define USEC_PER_MSEC (1000ull)
> +#endif
> +
>  #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
>  #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
>  #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
> -#define USEC_PER_MSEC (1000u)
>  #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
>  
>  #define for_if(expr__) if (!(expr__)) {} else
> -- 
> 2.34.1
> 
