Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843DBCD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74AD1125A0;
	Wed, 10 Apr 2024 15:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXyqlZs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0364710ED03
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712763727; x=1744299727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rxQ9U9Y+9cXamRBEN5LFOpEv6mhf50GsDJ/8JIzJvwE=;
 b=XXyqlZs/sNOlnPupyp4xyx/Rf/aHoLG6Luv/k4+yto3yz3Z4jtbeQpqg
 Nu3lKDayWoBi4QWG9lQIkMU8cruFj/NAonlo11hHFQVTcDciQOjzzMyCn
 fHtkoFm1a1FyQ7yp2joHSHa7IXjJNmsrR/fSvgp+DeV/ECsgYvUsdbaQq
 TUuz3pUDkM/1R2dE4jCysW3JNrJRKA9WchVK/PhzSVqkCeRpp636Tai/Z
 xkijf7rrukXEYXqPV3o1s3FKdcMR2NZGV0eT0yJtIm2p3vd+f2a8huoFu
 HYkUr9Td8KmWoQ2b5XXhuCM1eMKuHaPM22Ivw6OKRSKGKGJrB0uFkcu9w Q==;
X-CSE-ConnectionGUID: d749meSIRemAofnsPkPXNQ==
X-CSE-MsgGUID: GVcRxmd+SRGHsXUUAcEUew==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8010618"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8010618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:42:07 -0700
X-CSE-ConnectionGUID: tYR5YLTcTV6NVryZWbi6WA==
X-CSE-MsgGUID: HH0QwYbaTrqmjcIFj5CpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25357325"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:42:05 -0700
Date: Wed, 10 Apr 2024 17:42:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 2/5] tests/intel: Remove name collision in Display
 tests visible in Core docs
Message-ID: <20240410154202.czgbd5ikktpp4xct@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
 <20240409111915.2842477-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409111915.2842477-3-katarzyna.piecielska@intel.com>
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
On 2024-04-09 at 11:19:12 +0000, Katarzyna Piecielska wrote:
> Display team is not using Subcategory field, but this test is
> visible in Core documentation. Let's remove name collision in
> Category, Subcategory and Functionality.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/i915_pipe_stress.c | 2 +-
>  tests/intel/prime_mmap_kms.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
> index 6c5e951ab..de4df830f 100644
> --- a/tests/intel/i915_pipe_stress.c
> +++ b/tests/intel/i915_pipe_stress.c
> @@ -26,7 +26,7 @@
>   *              possible bandwidth/watermark and similar problems.
>   * Functionality: kms_core
>   * Mega feature: General Display Features
> - * Sub-category: Display
> + * Sub-category: Display Tests
>   * Test category: stress test
>   *
>   * SUBTEST: stress-xrgb8888-untiled
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index 35d1eedde..7759b9469 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -41,7 +41,7 @@ IGT_TEST_DESCRIPTION(
>   * TEST: prime mmap kms
>   * Category: Infrastructure
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
>   *
> -- 
> 2.34.1
> 
