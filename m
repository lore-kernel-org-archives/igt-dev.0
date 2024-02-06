Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721F4C4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 17:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B33112D0A;
	Tue,  6 Feb 2024 17:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1VmQtx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B71112D0A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707240746; x=1738776746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MdD4Z6thNQQ27GK0Owh/6PRCu+YY0Wg2tKrE6cNRuEA=;
 b=B1VmQtx5/YBWqb3Erq4PGw+T0CAoDMlpoM9yO9IM1FwjCWnEunCcLOdr
 Nxl8uHnOjR/kB7fU+TXRjHBemIaPdB/lWECwAeZb7/1XjnPyuJHYf+ubi
 QoaO+6P7Ov2OY6hVHi74JnZILhrn66SMcH72lbza3TIqOxLq5Lw2hF/WI
 Xd1rFvQIug2qWRE2HaBYdTIskNhnoOXRE3OPiG1xT38vyZ14mqvYVYWrH
 MAmCw7cvFQ2xzesWCvn+S847Pj1v6240i2U2LQAU1MQCFNz7NCoPGSqWk
 N3XZn6r/WxUGZaVTOv0rfOcp/GlHpFw5vZ5xHPR7/eRULiubSOAxFldIu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4591082"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4591082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="31897172"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 09:32:25 -0800
Date: Tue, 6 Feb 2024 18:32:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Stefano Ragni <st3r4g@protonmail.com>
Subject: Re: [igt-dev] [PATCH v3 4/7] lib/igt_halffloat.c: Fix musl/uclibc
 build
Message-ID: <20240206173221.i7urj7iekh3ffibk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>,
 Stefano Ragni <st3r4g@protonmail.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-4-bernd@kuhls.net>
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

Hi Bernd,
On 2023-10-30 at 20:58:06 +0100, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Fixes build error:
> ../lib/igt_halffloat.c:205:6: error: ‘ifunc’ is not supported on this target
>   205 | void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
> 
> ../lib/igt_halffloat.c:216:6: error: ‘ifunc’ is not supported on this target
>   216 | void igt_half_to_float(const uint16_t *h, float *f, unsigned int num)
> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v3: no changes
> 
>  lib/igt_halffloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> index 08ab05fce..5dbe08e01 100644
> --- a/lib/igt_halffloat.c
> +++ b/lib/igt_halffloat.c
> @@ -162,7 +162,7 @@ static inline float _half_to_float(uint16_t val)
>  	return fi.f;
>  }
>  
> -#if defined(__x86_64__) && !defined(__clang__)
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)

Could it be only one additional condition? like:

#if defined(__x86_64__) && !defined(__clang__) && !defined(__UCLIBC__)

I am going merge it soon so I would like to avoid adding too
many defines here and in other patch.

Regards,
Kamil

>  #pragma GCC push_options
>  #pragma GCC target("f16c")
>  
> -- 
> 2.39.2
> 
