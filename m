Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E67CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 11:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624C510E7AD;
	Wed, 29 Oct 2025 11:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcoqN3hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563210E7AD;
 Wed, 29 Oct 2025 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761739156; x=1793275156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2ke6+W/H6Q8gEudnp+NEdxIBO5/GicDuP0znFFqODLk=;
 b=CcoqN3hxnIH2LHNd8k4Py6XrXwAc0nTTgWZF1TCYvQ412fBm0tq9buGJ
 iaKjnABelvzaHYaD6mEI4E8LDbj3EnzPCyGJ2myb2mFDGCDkKxo9pNQKq
 S1WMrBJJ43mYdDf947fFAGmQ3EW0/gtPQZy6MzJDm+Ap43WoU+3lNgKMY
 reK+JHRrJet2BUGw+FqOjgcZZOScqKgMjlZvjZDaBW7INMtooTKm8cdtZ
 le+wQu+9fTt/qlEKIn3/unJrwUIk69hYlU6LJJz+SSJ/Ce22R/OcAzMMu
 PZrxXHxXaJUNDpvwkr5Xp5E5mmEUsOOnv9DNO00DmOmnAVuy4QnpIQQ95 w==;
X-CSE-ConnectionGUID: 6lIKZNATQsi8mLM+eLOoag==
X-CSE-MsgGUID: yrKvtAz9QdugJVeZGaStIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63064138"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63064138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:59:15 -0700
X-CSE-ConnectionGUID: WEls7exARUqMMoTQLlwDyA==
X-CSE-MsgGUID: C52kvKXYTnKzWr2v2nTdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="184882146"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:59:15 -0700
Date: Wed, 29 Oct 2025 12:58:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Sync_PC?=
 =?utf-8?Q?I?= ids with kernel: split BMG to BMG-G21 and add NVL-S (rev3)
Message-ID: <20251029115859.nnv77wywjs4czjnz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251028165235.39234-1-kamil.konieczny@linux.intel.com>
 <176170948194.65717.4322597929495979214@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176170948194.65717.4322597929495979214@97596180aaec>
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
On 2025-10-29 at 03:44:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Sync PCI ids with kernel: split BMG to BMG-G21 and add NVL-S (rev3)
> URL   : https://patchwork.freedesktop.org/series/156479/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8599_full -> IGTPW_13958_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13958_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13958_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13958_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-dg1:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8599/shard-dg1-14/igt@gem_eio@in-flight-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-dg1-13/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-mtlp:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8599/shard-mtlp-2/igt@i915_suspend@basic-s2idle-without-i915.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-mtlp-3/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-tglu-1:       NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-tglu-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-glk:          NOTRUN -> [DMESG-FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@perf@rc6-disable:
>     - shard-rkl:          [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8599/shard-rkl-7/igt@perf@rc6-disable.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-rkl-3/igt@perf@rc6-disable.html
> 

Unrelated, no need for respin.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8599_full and IGTPW_13958_full:
> 
> ### New IGT tests (12) ###
> 
>   * igt@kms_cursor_crc@cursor-dpms@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [1.17] s
> 
>   * igt@kms_vblank@ts-continuation-idle-hang@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [6.21] s
> 
>   * igt@syncobj_eventfd@binary-wait:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@syncobj_eventfd@binary-wait-before-signal:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@syncobj_eventfd@binary-wait-signaled:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-bad-flags:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-bad-pad:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-illegal-eventfd:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@invalid-illegal-handle:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@syncobj_eventfd@timeline-wait:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@syncobj_eventfd@timeline-wait-before-signal:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@syncobj_eventfd@timeline-wait-signaled:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13958_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_busy@semaphore:
>     - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#3936])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13958/shard-dg2-8/igt@gem_busy@semaphore.html
> 
...cut...

