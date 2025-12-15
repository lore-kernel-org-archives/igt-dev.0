Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5A4D59D99
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 10:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7A10E3D8;
	Mon, 15 Dec 2025 10:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYOtujoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595EF10E3D8;
 Mon, 15 Dec 2025 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793494; x=1797329494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aamP09PMLSvZZ2tMNMEKNal9cW6dtPHfnATUrrWApKk=;
 b=NYOtujoE2k5IT2uZ9mMpIPIGvRiBN/MAA/pcFOEQeTG9enOQPupcYfDr
 x95QLaMOFMQjaVZZW1ArGIi0jVOrcuplxNVK/Efqgb2Gl88UXb21GrkiV
 oUNoZbsFLD8qMf+GohF+hX1xeTc9l313kriEskRcVJUXuLX/IBJY1eEPf
 Ye7WkwiMzzJZT2ekIs0CbWwAmjJ9WmTkyIpCErwxw1idtu5fFyFL5gho4
 NV2fG+rASmeMJ76vo0A175hbF6c3OduYEoPd1/Heg0tk7YK22CVexX6Ip
 U6FM3FvGUrX3hlKLGfyhxapWGWwueuI+//Jr+A+haTO5zj7K60wq3iDOz g==;
X-CSE-ConnectionGUID: jzTSWgEUTwOStPKwsND7pA==
X-CSE-MsgGUID: aLP6TQHYRDuV48M3Ci0ZYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67444795"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67444795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:11:33 -0800
X-CSE-ConnectionGUID: YrABvMhzRhmYZmaJbfacdA==
X-CSE-MsgGUID: pVA6kpCCRh+XbfGTJmi9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="228334326"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:11:33 -0800
Date: Mon, 15 Dec 2025 11:11:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 intel-ci: remove few i915 symlinks
Message-ID: <20251215101114.25pjjqnccrdahok3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
 <176560435936.82897.560243205588258657@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176560435936.82897.560243205588258657@a3b018990fe9>
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
On 2025-12-13 at 05:39:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: intel-ci: remove few i915 symlinks
> URL   : https://patchwork.freedesktop.org/series/158863/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8665_full -> IGTPW_14203_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14203_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14203_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14203/index.html
> 
> Participating hosts (11 -> 9)
> ------------------------------
> 
>   Missing    (2): shard-dg2-set2 shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14203_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-tglu-1:       NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14203/shard-tglu-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3:
>     - shard-dg1:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14203/shard-dg1-13/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a3.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14203_full that come from known issues:
> 
> ### IGT changes ###
