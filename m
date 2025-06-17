Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D23C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 10:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B9710E4B0;
	Tue, 17 Jun 2025 10:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8wQWVTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079F10E4B0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750157786; x=1781693786;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=rY40VySTVeHkJkxS0KmPkSI2vAUx4+D/KDYINawaFbA=;
 b=E8wQWVTwKLjloIT9Xq4NXl0k80CddS8h2GeB7p+P1TLgF+OYK7Ar/OXZ
 uaM4bWhGIX+8b6WmqokEuXrdMT32VTqIX6KR2IgclNqhpDrfH6qkRVbQ7
 JgAIF2wUhHUbih4Db7EaCsnu4lUWa0We2WAFtb84vzufCx8lGTkDRxsnO
 1DYA9X0eX5JTullExMyGjtCrdeS++2lLGuNIeS+EVH9LIxyMu34QvngxF
 Cbk96NK+IKIcLuwp+8VAtZfxerFKaypKkUdCS3PIKcy2DDVcPf8xjb2gH
 Pf9cMB1jLPQ+1n3Uz9kCdGZExdm9lHxM3BG2BZhLqD8o6f0EqNmirCkQg g==;
X-CSE-ConnectionGUID: 8KR9rBicQyeMY+txDVZOPQ==
X-CSE-MsgGUID: 3vXn6Zz1T+yA64DQ2L7RBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52191242"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52191242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:56:25 -0700
X-CSE-ConnectionGUID: dhbnmCAVSJaZvVmWWoGBEw==
X-CSE-MsgGUID: 9lt6BRrQTjeWa+HOKanqrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154038439"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 03:56:25 -0700
Date: Tue, 17 Jun 2025 12:56:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 runner/executor: Abort if dmesg is flooded
Message-ID: <20250617105622.4jeyedsnop7liutl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250613162013.103165-1-kamil.konieczny@linux.intel.com>
 <174983896187.78228.10176676452917222262@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174983896187.78228.10176676452917222262@1538d3639d33>
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
On 2025-06-13 at 18:22:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure

Please do not file a bug for ABORT with 'Dmesg ratio exceeded'

This is introduced by this patch to igt_runner,
also no need for full i915 run as this is experimental.

Regards,
Kamil


> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8411 -> IGTPW_13295
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13295 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13295, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13295:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - fi-blb-e6850:       NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-blb-e6850/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@i915_module_load@reload:
>     - fi-cfl-guc:         NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-cfl-guc/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-jsl-1:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-jsl-1/igt@i915_selftest@live.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - fi-kbl-7567u:       [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-kbl-2:          [PASS][6] -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-kbl-2/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@vgem_basic@dmabuf-fence:
>     - fi-skl-6600u:       NOTRUN -> [ABORT][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/fi-skl-6600u/igt@vgem_basic@dmabuf-fence.html
> 
>   
> #### Warnings ####
> 
>   * igt@prime_self_import@basic-with_one_bo:
>     - bat-twl-2:          [ABORT][9] ([i915#14463]) -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8411/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13295/bat-twl-2/igt@prime_self_import@basic-with_one_bo.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13295 that come from known issues:
> 
...cut...

