Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA4AC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 11:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB45010E79B;
	Thu, 21 Mar 2024 11:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcS8sBze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542DB10E79B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020801; x=1742556801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lMOp07UPEyDwTWuHkwGP0hDWyg1t94QgTiegXA1H7mQ=;
 b=EcS8sBze0JUW/EBQTVoXPtLHgKN+OLuO/y/x5HLOE7DKxYeNR1VO0mVH
 5c0FT4IlSmZpad0DzEbetOsOvaRuhMmBM2M+SaWWXFiNDvYyU6Nn+xuR8
 LMKezJGSyBbg9Zo82Uv/pVKYaHkZsxSLX8nVNrTW/52uWzr2ZUF99U7tx
 bfOHDg8encTb1Spx1LBxdGeeKX0kfd9U4jFXe9r2txbMNhn7UK0ruIlZf
 ZzwkBVwg6sGdGvEB1DbQq8uaX9Jm4XGqJ0HRU9DmzqGI6bNFmxpwrulwm
 PrhLxtWR6WIkUDOKmRH7xmqGjxRePcLTqrdQ9STIxxDxqqhjTcTIuLfBH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17141140"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17141140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14378686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 04:33:19 -0700
Date: Thu, 21 Mar 2024 12:33:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 07/25] tests/intel: Introduce GPGPU subcategory
Message-ID: <20240321113317.o7iagprzxrk74gep@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-8-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314143455.1436688-8-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-14 at 14:34:37 +0000, Katarzyna Piecielska wrote:
> Let's introduce GPGPU subcategory.
> 
> v2: functionality s/gpgpu/gpgpu_fill/ to not trouble automation tools
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_gpgpu_fill.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index ac283620e..3a6d66b35 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -51,13 +51,13 @@
>  /**
>   * TEST: gem gpgpu fill
>   * Category: Server
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: Compute
> + * Functionality: gpgpu_fill
> + * Sub-category: GPGPU
>   * Test category: GEM_Legacy
> + * Feature: compute
-------------- ^
This will collide with
gem_compute.c: * Sub-category: Compute

so maybe 'compute feature'? In other test you already have:

xe_evict.c: * Feature: compute machine
xe_evict.c: * Feature: compute mode threads

Regards,
Kamil

> + * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Feature: compute
>   */
>  
>  #define WIDTH 64
> -- 
> 2.34.1
> 
