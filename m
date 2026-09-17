Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B425CC982D0
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 09:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F5810E67F;
	Thu, 17 Sep 2026 09:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXxZR9qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8942710E67F;
 Thu, 17 Sep 2026 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789636532; x=1821172532;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Q07UJ+uyCfXUHj4qFSLIKXbDzsrcy6kKCEOo/MIymU=;
 b=BXxZR9qMP8ui7pFog1LlV/czgOkVsgCdTB8Fp1XR/kK9GVvSIi8qcPcs
 YOq4iHgfeupAvCgAEa2XPxg/E8RyUSO6VZYnh/yrppQDTFb3FUAfljXbD
 O3wQVjRWZ7CTUDmkMQ5opKKD7D4n18xVgxelCI0CMS4DFYzZWWRgk4ecI
 pE8hfU1syWNqfINsyFmuuzhA+11U+WMNkPFg8y0AfMIlaBWi272hyH4jC
 Ep+oXm6Y91DfmojzP5W7YWot+fgRiImFOaNXVCqfmz8YFrZ6Suv5k/5/A
 m6H0kDmasWVIVnSgz8NS23OFySdU5uYbV57M2a2Xx5eeYs+YsaYeVQVj0 g==;
X-CSE-ConnectionGUID: 8DOsGz+PSJyBGGtdj+nJYQ==
X-CSE-MsgGUID: 5GiTqaaYQU6L1F66PSyPUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100636750"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100636750"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:15:32 -0700
X-CSE-ConnectionGUID: 11EAIygiTGmb4SmCU2/W7w==
X-CSE-MsgGUID: UeMESp4OQnWVAoYZJoZcJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1890633"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:15:32 -0700
Date: Thu, 17 Sep 2026 11:15:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Bump debian version to bookworm (rev2)
Message-ID: <20260917091513.nnjm7dsrv37lh5oh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
 <178961131930.175570.1793448749142483661@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178961131930.175570.1793448749142483661@61270ab9df2a>
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

Hi igt-dev,
On 2026-09-17 at 02:15:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Bump debian version to bookworm (rev2)
> URL   : https://patchwork.freedesktop.org/series/174271/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19156_full -> IGTPW_15852_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15852_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15852_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15852_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@bonded-false-hang:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/shard-glk6/igt@gem_exec_balancer@bonded-false-hang.html
> 

Unrelated.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15852_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][2] ([i915#6230])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15852/shard-rkl-7/igt@api_intel_bb@crc32.html
> 
...cut...
