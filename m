Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F045DC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 07:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7F710F028;
	Fri, 22 Mar 2024 07:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAbtC6hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2151510F021
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711093301; x=1742629301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+cRFVfonPgOe1PA8ldW0QiY+HlEQwjpBgjOKP2f8zXQ=;
 b=DAbtC6hrMSihjqXjBRxSY80W1hLlqFG1sjkokw1r4DjwuPSsiN4tq4VR
 rkKG3IBrbpotlbA6k0uc40gMkXqHIXDhQBHtmGsIS2ukF62j9OL6hm9lo
 u3dbhfsdLWspPgQkTauktwI1fFVsPU49fJqI41OQ4F+CUg2PUsxfU/sfe
 2WyM6KudolNAjJ/2U9DWSSn4lZZUbLyiyam64+UrErH21vtsgBnOLknq2
 5E6DTBtJa6DOJqWzjbWwubg584aoFVMMYsq8hO9sCYirFZsyc6kjW89kL
 3TRkbReKwnIa0itvguYoFVU9G1C5TTGMKJRu53/hdX9hiPWW9vytmYb5+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28599033"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="28599033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 00:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19503298"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 00:41:40 -0700
Date: Fri, 22 Mar 2024 08:41:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 05/24] tests/intel: Add tests to Compute
 subcategory
Message-ID: <20240322074136.dxrftb7grknmtato@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
 <20240321153847.1787625-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321153847.1787625-6-katarzyna.piecielska@intel.com>
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
On 2024-03-21 at 15:38:28 +0000, Katarzyna Piecielska wrote:
> Let's add to Compute subcategory:
>  - tests/intel/gem_compute.c
>  - tests/intel/gem_vm_create.c
> 
> v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_compute.c         | 2 +-
>  tests/intel/gem_ctx_persistence.c | 2 +-
>  tests/intel/gem_vm_create.c       | 7 ++++---
>  3 files changed, 6 insertions(+), 5 deletions(-)
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
> index 3f10c0fa3..6528e0f9c 100644
> --- a/tests/intel/gem_ctx_persistence.c
> +++ b/tests/intel/gem_ctx_persistence.c
> @@ -47,7 +47,7 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx persistence
> - * Feature: context
> + * Feature: context feature
>   * Category: Server
>   * Functionality: context
>   * Sub-category: Compute
> diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
> index 8834c987f..cb73828da 100644
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
> @@ -48,7 +49,7 @@
>   * Feature: mapping
>   *
>   * SUBTEST: isolation
> - * Feature: context, mapping
> + * Feature: context feature, mapping
>   */
>  
>  static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
> -- 
> 2.34.1
> 
