Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C3EE9A04D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3212D10E2B8;
	Thu, 19 Feb 2026 14:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGy8k0xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976A210E194;
 Thu, 19 Feb 2026 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771511840; x=1803047840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i9iHktvvwuex7pnLWFENTPK1821onczKAW98+KKUu9Y=;
 b=eGy8k0xYrD6ogejDjeRePc+96aJkxvTHqq2LV0wTfYPxqRltgl08lmi8
 U9DBugeuaTC13hJzABDHyNCqSxJHwMsz5rSRAZC0o5uCY+i+djotzHB4H
 WEa+vDhdIVZyjBaURqwrWwKmRgtj6d+ZqMYLYZgsco+u35ftZdgpwmADB
 azQdCFZfdNM+Bglt030nRR1ZSXxHU/lfQMXe3fK5oDsP52gNiJbmE42+T
 esQSDi+pE2vwRSmT9g+vOx55i2G7Kfw6dIY2jEEwT9/aZjq+xnHHJRz9Y
 X6FUwB08rbe+FOIYGTQKKfWHkZbtydPJcsDZz3wIzxWydIzKb7r1ZPJlm g==;
X-CSE-ConnectionGUID: Wpu+D8jTRZiVPRnZ2z9LMA==
X-CSE-MsgGUID: m2NTHjdeRgKlie1L97YVhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83220102"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83220102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:37:20 -0800
X-CSE-ConnectionGUID: flmoNcCnSgWggu6xZALo3w==
X-CSE-MsgGUID: PlrBS6l+TQyA0kXwyaLYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="219063398"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:37:19 -0800
Date: Thu, 19 Feb 2026 15:37:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 panthor: Enable compilation on big-endian arch
Message-ID: <20260219143717.cs44ji4cr2jcpmij@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
 <177144378560.262554.16344035022434558189@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177144378560.262554.16344035022434558189@a3b018990fe9>
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
On 2026-02-18 at 19:43:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: panthor: Enable compilation on big-endian arch
> URL   : https://patchwork.freedesktop.org/series/161768/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18004_full -> IGTPW_14569_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14569_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14569_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14569_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@system-suspend-execbuf:
>     - shard-dg2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18004/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-dg2-6/igt@i915_pm_rpm@system-suspend-execbuf.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18004/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
>     - shard-mtlp:         NOTRUN -> [SKIP][5] +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
>     - shard-tglu:         NOTRUN -> [SKIP][6] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>     - shard-tglu-1:       NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
>     - shard-dg1:          NOTRUN -> [SKIP][8] +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][9] +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-dg2-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-rkl:          NOTRUN -> [SKIP][10] +4 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-rkl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          NOTRUN -> [FAIL][11]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-rkl-7/igt@kms_pm_dc@dc6-dpms.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>     - shard-rkl:          [SKIP][12] ([i915#14544]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18004/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [SKIP][14] ([i915#15128]) -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18004/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html
> 

Unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18004_full and IGTPW_14569_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.48] s
> 
>   * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.34] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14569_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#11078])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14569/shard-dg2-3/igt@device_reset@cold-reset-bound.html
> 
...cut...
