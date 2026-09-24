Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E441C98310
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEFE10F38C;
	Thu, 24 Sep 2026 07:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/XHarQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393410F388;
 Thu, 24 Sep 2026 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236359; x=1821772359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jb/srXJyP2yLaS/D8H0PnAu5cFB+Mzt9LFcr1fuNDHE=;
 b=W/XHarQIconr0P7NEVc9vnQztXaA8dACFH2OkbDgr8TCdXkNSPZbD9eT
 AF7W1iDBr2Rg5yOA7LPU8R/2NgWe+czUagyjHagKmzs65Oiq4/yNhjH9q
 n4YzVsHD2GAQCQvG2bhN8Feeag8CbOmMYHdtrwOefsOY/QksTvCvfs3LW
 kVTGAEuIeOYM7+WKjgyFQGQLLOkf85Tmm5iq+J/zsUbNOGG9Q3FhaD6vi
 lW8ZIJok+YrZ4rkR0CeqJzSjVL5gVglaPKXVDCdH3yLWUdL+FfNZIfDMX
 lEkBusdxW8DfgfyMzF9D/djvbaQu0utKrx523HjI3i5LLDE3GJpwvFhGN Q==;
X-CSE-ConnectionGUID: AmIvk7BwSaisV2OnfcgiVg==
X-CSE-MsgGUID: JmmUew32Qq+dbH1kpgsRWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91016685"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91016685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:52:38 -0700
X-CSE-ConnectionGUID: vBzlCfDPRUWCqUmEIJYhXw==
X-CSE-MsgGUID: nQUCpnxxQOGxx6MiWkY4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="273093286"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:52:37 -0700
Date: Thu, 24 Sep 2026 09:52:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_profiling: configure Panthor enable state
Message-ID: <20260924075235.erq632glcpf7fgxr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260922-b4-gputop_panthor-v1-1-e908705bd062@collabora.com>
 <179019114224.196549.15609239599400233641@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179019114224.196549.15609239599400233641@61270ab9df2a>
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
On 2026-09-23 at 19:19:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_profiling: configure Panthor enable state
> URL   : https://patchwork.freedesktop.org/series/174754/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_19205_full -> IGTPW_15888_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15888_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15888_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15888/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15888_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19205/shard-rkl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15888/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15888/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html
> 

They are unrelated,


Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_19205_full and IGTPW_15888_full:
> 
> ### New IGT tests (12) ###
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-1-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-1-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-1-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.92] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-1-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.92] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-1-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.93] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-1-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.94] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-1-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.93] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-1-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.93] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-1-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.94] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-1-ctm:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-1-degamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.93] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-1-gamma:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.92] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15888_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#6230])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15888/shard-rkl-8/igt@api_intel_bb@crc32.html
> 
...cut...
