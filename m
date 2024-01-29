Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E8CC47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB3F1128EE;
	Mon, 29 Jan 2024 12:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4651128EB;
 Mon, 29 Jan 2024 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706530562; x=1738066562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p2C2ddXzwdcgalSJpULQn7i52EmJPycr8mkkn/85B4M=;
 b=O8tjql8zXbIsT/VRwz3RAxjzfXdeavgdYamhiJELBx4UGLAeXqEH4Z1s
 T9XrgcBM2t2msx/lb67czbdOtAtz8Nk3EJh90qHfMjYTptA8gm6QGkQDM
 NmxmedMmP0pb7CkdjahMoaECNHxmXQQn3QaHTV8tMhmjAG4OJj+GhbZSE
 nwvjom3gNGy/d1AfQygKAjYixmtuZLRphnyK8LejspUOBlNBZ9Fi1vF9K
 l8z+j0cZ4osTt+nhrGNypvwFJcM3o+mtnPhj7EQaXRaSYhvkjnFoxdkUv
 nRZP19vNEmfpsm4mF3TB7zc1NlzpW1+jCHLg86oNBciL8GzmC0ldwpYEG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="402575176"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="402575176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 04:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3290102"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:16:00 -0800
Date: Mon, 29 Jan 2024 13:15:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_serie?=
 =?utf-8?Q?s?= starting with [1/3] lib/amdgpu: add support for gang cs
Message-ID: <20240129121557.724ymfmokz7avmrm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
 <170616921115.709515.12624223504725969949@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170616921115.709515.12624223504725969949@5338d5abeb45>
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
Cc: lgci.bug.filing@intel.com, I915-ci-infra@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi igt-dev,
On 2024-01-25 at 07:53:31 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/3] lib/amdgpu: add support for gang cs
> URL   : https://patchwork.freedesktop.org/series/129148/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14173_full -> IGTPW_10586_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10586_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10586_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10586_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14173/shard-mtlp-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/shard-mtlp-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@pipe-a-edp-1.html
> 

Unrelated to amdgpu, no need for respin,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14173_full and IGTPW_10586_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@gem_pxp:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10586_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#8411]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/shard-dg2-5/igt@api_intel_bb@object-reloc-keep-cache.html

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/index.html
