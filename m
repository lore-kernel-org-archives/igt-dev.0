Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED11C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC931122CD;
	Mon,  4 Mar 2024 16:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv5Li7eW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475DB1122CE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709568158; x=1741104158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f3hVscE3izBcIyWFyZclpJL35MNlq4vx6mUtTQ5yTIQ=;
 b=Vv5Li7eWJBe92LWDvUZxi3s2Y7AMhtAYZW/hsa4BwZ95gtrF0DhVX1rC
 Akn4flYRdpjWJhHLu/Za3gPCE4Ptg0pOVJ8+KPsdZPezYCWMpBT1FokTS
 LYURE2f8o/nef5CTWZlI8aBYcs2+eUqlcv+HKlA6mebH0jeZ0EXrSpDws
 ZLiOEXAGPGd82fxVLIm8QDUHLsFjhnCPhDRT4X+0ZDkdHHqe2EgdckRyE
 FFL+my7si2A8LdkGmSHgoBRkT/qb39MVzxOKJqCnmrdEuIUXILK+CXVcq
 QJKaE+9MVqcVSJ5Fc4J+8UkwFgIamTpvnIGheXbeyigtyhBy7Me9xc++x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7836268"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7836268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9429505"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:02:34 -0800
Date: Mon, 4 Mar 2024 17:02:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t 07/24] tests/intel: Introduce GPGPU subcategory
Message-ID: <20240304160230.5hcvtxjif2kmcshd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-8-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240304111617.849785-8-katarzyna.piecielska@intel.com>
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
On 2024-03-04 at 11:16:00 +0000, Katarzyna Piecielska wrote:
> Let's introduce GPGPU subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_gpgpu_fill.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> index ac283620e..535ac0cc8 100644
> --- a/tests/intel/gem_gpgpu_fill.c
> +++ b/tests/intel/gem_gpgpu_fill.c
> @@ -51,13 +51,13 @@
>  /**
>   * TEST: gem gpgpu fill
>   * Category: Server
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: Compute
> + * Functionality: gpgpu
---------------------^^^^^
What about decipher it here into: General Purpose GPU

Regards,
Kamil

> + * Sub-category: GPGPU
>   * Test category: GEM_Legacy
> + * Feature: compute
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
