Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D18FC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 17:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389E10FA86;
	Tue, 19 Mar 2024 17:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6uzPbUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A75810FC3E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710871195; x=1742407195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IFX9osoW9pNx1FGLK1rHcSCrp+JTth4sb56ha9vsT3w=;
 b=l6uzPbULV2b/zoPOUIAePd8ry2V6IO3WbmkfuaAu59pXdi1Fq6lubU4q
 FCRS+kiHcLLrNGWiIQHlFRMyMVh8Heg39bKcO6xyu8xoG00iLBXtD740S
 +kED/QgNHkNQbW2aYv8n7E0BdMv87630o7+941zqzqy7uPa3yTd30C8I6
 uxCTcyt2qPTbyR1q+m6VOnECRse06PYfMxcLa8l2IpKXdAvckw5y3ppdu
 UMq7Ngh5zbAQIpr84sx8nConbdphWzFobX0QqEAPLuIRp4Z1/QG7chxjH
 V9Mv9YxO2vHiqsm2V7I3zxCFLx2bABHYVlgrRRqU8pDiSf8MMaomNteuF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5884985"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5884985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="44982316"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:59:54 -0700
Date: Tue, 19 Mar 2024 18:59:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 06/25] tests/intel: Add tests to Compute
 subcategory
Message-ID: <20240319175951.u7w53u72hxdr64kv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-7-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-7-katarzyna.piecielska@intel.com>
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
On 2024-03-14 at 14:34:36 +0000, Katarzyna Piecielska wrote:
> Let's add to Compute subcategory:
>  - tests/intel/gem_compute.c
>  - tests/intel/gem_vm_create.c

gem_vm_create.c already has this category?

> 
> v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 

In your 7th patch "Introduce GPGPU subcategory" there is:

+ * Sub-category: GPGPU
+ * Feature: compute

It is colliding with this patch,

Regards,
Kamil


> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_compute.c         | 2 +-
>  tests/intel/gem_ctx_persistence.c | 2 +-
>  tests/intel/gem_vm_create.c       | 5 +++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
> index 8d0214c4d..8bd9635ae 100644
> --- a/tests/intel/gem_compute.c
> +++ b/tests/intel/gem_compute.c
> @@ -6,7 +6,7 @@
>  /**
>   * TEST: Check compute-related functionality
>   * Category: Hardware building block
> - * Sub-category: compute
> + * Sub-category: Compute
>   * Test category: functionality test
>   * Run type: BAT
>   */
> diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
> index 3f10c0fa3..1c1476356 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -47,7 +47,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx persistence
> - * Feature: context
> + * Feature: contexts
>   * Category: Server
>   * Functionality: context
>   * Sub-category: Compute
> diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
> index 8834c987f..12503c0e5 100644
> --- a/tests/intel/gem_vm_create.c
> +++ b/tests/intel/gem_vm_create.c
> @@ -30,10 +30,11 @@
>  /**
>   * TEST: gem vm create
>   * Category: Server
> - * Functionality: context management
> - * Run type: FULL
> + * Functionality: context
>   * Sub-category: Compute
> + * Feature: mapping
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: create-ext
>   * Feature: mapping
> -- 
> 2.34.1
> 
