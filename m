Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C55CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AD810EAC4;
	Wed, 10 Apr 2024 15:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDMbByvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FD110FA69
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712763445; x=1744299445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=udeHTU1CwAVFL3Hhe1IkDVJz8YK3JTapSUGBbersbtU=;
 b=CDMbByvzoHO1dek9clBA6pi1++yUIt99LLvoDnWtKl2DRWpOToDI+kb1
 1SseMsXfciMjvDErGDq4nBmVaPZTGZ//SVd+QvjvO2Yg5TVaD6RehBgIg
 ydUcXiohtOaGYrSwX35JLWR8nnyM7B4T8VtxB85HtT1MPWe2xzjXMKBR7
 oZR4NL/qt/LixcsixTcCT3/zIrfnNmx3rPKNEQ4eGTEdpA6sJHnAEe3Db
 H+QlFCu+G9lbEEqpuNoC9otsaIWpdpiN1inqvxQzNjPeYnm7RQotXFG36
 rWqMWCRu+BBCLmqXbjusmiOEKBi+QuAmPWJG9yVAuhk0HJCwiGrrLg1m3 Q==;
X-CSE-ConnectionGUID: 7gPVTDbYTKO/Z2KQ0zKCug==
X-CSE-MsgGUID: DrG1ULqJQMSYfem7aG5bmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11913996"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11913996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:37:23 -0700
X-CSE-ConnectionGUID: JzA/M9+fRsGhZVDzJElZOA==
X-CSE-MsgGUID: gAMlSR3kRj24ITcwKHYtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20477438"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:37:22 -0700
Date: Wed, 10 Apr 2024 17:37:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tests/intel: Remove documentation collisions
 in i915_selftest
Message-ID: <20240410153719.ihv5qv3nkcoj2awt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
 <20240409111915.2842477-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409111915.2842477-5-katarzyna.piecielska@intel.com>
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
On 2024-04-09 at 11:19:14 +0000, Katarzyna Piecielska wrote:
> Let's remove Category/Sub-category/Functionality name collisions.
> Also reorder documentation in those cases to follow pattern as in other
> tests:
> 	SUBTEST
> 	Description
> 	Category
> 	Sub-category
> 	Functionality
> 	Feature

Here one is left:

 * SUBTEST: live@display
 * Category: Selftest
 * Functionality: display sanity
 * Test category: i915
 * Sub-category: Display
---------------- ^^^^^^^
imho here should be:
 * Sub-category: Selftest subcategory

Regards,
Kamil

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/i915_selftest.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index edacb6250..1d03fb388 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -28,10 +28,10 @@
>   * Description: Basic unit tests for i915.ko
>   *
>   * SUBTEST: live
> - * Feature: gem_core
> - * Sub-category: Selftest
>   * Category: Selftest
> + * Sub-category: Selftest subcategory
>   * Functionality: live selftest
> + * Feature: gem_core
>   *
>   * SUBTEST: live@active
>   * Category: Selftest
> @@ -312,11 +312,11 @@
>   * Sub-category: Reset
>   *
>   * SUBTEST: live@sanitycheck
> - * Category: Selftest
>   * Description: Checks the selftest infrastructure itself
> - * Functionality: selftest
> - * Test category: i915
> + * Category: Selftest
>   * Sub-category: Core
> + * Functionality: sanitycheck
> + * Test category: i915
>   *
>   * SUBTEST: live@scheduler
>   * Category: Selftest
> @@ -369,9 +369,9 @@
>   *
>   * SUBTEST: mock
>   * Category: Selftest
> - * Feature: gem_core
> - * Sub-category: Selftest
> + * Sub-category: Selftest subcategory
>   * Functionality: mock selftest
> + * Feature: gem_core
>   *
>   * SUBTEST: mock@buddy
>   * Category: Selftest
> @@ -465,11 +465,11 @@
>   * Sub-category: uapi
>   *
>   * SUBTEST: mock@sanitycheck
> - * Category: Selftest
>   * Description: Selftest for the selftest
> - * Functionality: selftest
> - * Test category: i915
> + * Category: Selftest
>   * Sub-category: Core
> + * Functionality: sanitycheck
> + * Test category: i915
>   *
>   * SUBTEST: mock@scatterlist
>   * Category: Selftest
> -- 
> 2.34.1
> 
