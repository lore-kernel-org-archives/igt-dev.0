Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D3C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 17:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741710FBF3;
	Tue, 19 Mar 2024 17:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdTsxWlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD69310FBF3
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710868176; x=1742404176;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UPaW9Ou7wSdePg3ngTHX9H0vZ2nNie1lmSNa8tkUoV4=;
 b=RdTsxWluK9btV3SHQE4RJJ3rrT8Sr9fiypvMs4FNoROY2XaXCmRhGZtu
 cqNO8ipP9UvxkJAjhxKcRFkJ+bvWdkqnwEJPAn346ICG2WkQZ1Od7H1q5
 CcCXpMVazSgcpOPaRNgsMnCTjqoyh2EUpk6J2xY3G94P5hfTQu09+1O0b
 Mt3n3OlruhKHR26nswUcZk6tvN/zWaoiUSoH4aZwnGEmZd5JQRHoJUdS+
 zB+A/orSkbNv9Om+LzHEW8ewe43+UR5YUtEIVspMUPytA6wu1itMr2AIx
 UYUyxe6YfUOVvM4crJivfkYVYQIHIaWff36Rmpd5KfzPwEXGPkrTjIRn8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5877027"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5877027"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13944303"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 10:09:24 -0700
Date: Tue, 19 Mar 2024 18:09:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Message-ID: <20240319170921.2raqcp5pw3kukwlx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-6-katarzyna.piecielska@intel.com>
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
On 2024-03-14 at 14:34:35 +0000, Katarzyna Piecielska wrote:
> There is gem_workaround test that deserves it's own subcategory.
> 
> v2: Make Sub-category/Functionality/Feature unique values (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

There are few 'workarounds' left:

957:intel/gem_workarounds.c: * Feature: hibernate, workarounds
958:intel/gem_workarounds.c: * Feature: hibernate, workarounds
959:intel/gem_workarounds.c: * Feature: hibernate, workarounds

Also what about using 'gpu_workaround'?

Regards,
Kamil

> ---
>  tests/intel/gem_workarounds.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index d83c0a1db..ddb9bddbe 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -35,9 +35,9 @@
>  /**
>   * TEST: gem workarounds
>   * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: workarounds
> - * Sub-category: Context
> + * Feature: workaround
> + * Functionality: context
> + * Sub-category: Workarounds
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> @@ -59,12 +59,12 @@
>   *
>   * SUBTEST: suspend-resume-context
>   * Description: Test to verify gem WA registers during suspend-resume
> - * Feature: suspend, workarounds
> + * Feature: suspend, workaround
>   * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-fd
>   * Description: Test to verify gem WA registers during suspend-resume
> - * Feature: suspend, workarounds
> + * Feature: suspend, workaround
>   * Test category: suspend
>   */
>  
> -- 
> 2.34.1
> 
