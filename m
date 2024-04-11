Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED91C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7FE10F0FA;
	Thu, 11 Apr 2024 14:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWduM/6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FDF10F0F9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844690; x=1744380690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vaNPlmhfJVqAogDVc0h5/VcdBc+yOEUWWTLirgnew+g=;
 b=GWduM/6tqPvwqBELfdZwIYZLEq/rFl/etaq8Uh9u6cAjcu3+gxyFMkea
 vQiL0OCgvYS01XkXJACTrJwXR+g7hNMEeS+JtetfB+FQl4E+RJStvdTwC
 d8ZzxwVP19UxzHTba8MbHKubVnMCrFZH3/OEsxShreM6YvNUiz3oki5lz
 ywkATa0WzIlNw3uLMZKYVA4wjgNt6hLis//aMmYF4Zrhv6qv2VbCq5T5v
 LSngAKNCphrTFsIruv+bC3VpNdM2vNs9zn7edLI9l0ZocUfEt7Pdz6CrN
 fY8HedZopFxXqSt3wv8XJKqOfv6du5cZunYRzJjTBY0GHBwglPFWD+S1b g==;
X-CSE-ConnectionGUID: Z+AQQ/JUS8OJoAh7yNlRdw==
X-CSE-MsgGUID: yQSW2wiFQyWNH8pkpZwZDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8429958"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8429958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:11:30 -0700
X-CSE-ConnectionGUID: hVpJU39bRUi27SGczoT0Hg==
X-CSE-MsgGUID: 0gGYtDU0S5q/mvQLKfOuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20873914"
Received: from unknown (HELO localhost) ([10.245.246.159])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:11:29 -0700
Date: Thu, 11 Apr 2024 16:11:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [i-g-t,v3,4/5] tests/intel: Remove documentation collisions in
 i915_selftest
Message-ID: <20240411141126.uegj7gstt3iaksg6@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411131554.2999053-5-katarzyna.piecielska@intel.com>
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
On 2024-04-11 at 13:15:53 +0000, Katarzyna Piecielska wrote:
> Let's remove Category/Sub-category/Functionality name collisions.
> Also reorder documentation in those cases to follow pattern as in other
> tests:
> 	SUBTEST
> 	Description
> 	Category
> 	Sub-category
> 	Functionality
> 	Feature
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  tests/intel/i915_selftest.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index edacb6250..a466a9009 100644
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
> @@ -70,7 +70,7 @@
>   * Category: Selftest
>   * Functionality: display sanity
>   * Test category: i915
> - * Sub-category: Display
> + * Sub-category: Display tests
>   *
>   * SUBTEST: live@dmabuf
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

This is 'Core' above but can be corrected (or not) later, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


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
