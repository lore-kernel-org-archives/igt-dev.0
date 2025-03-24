Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD8C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 11:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C28310E247;
	Mon, 24 Mar 2025 11:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDB4Oiq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5F10E247;
 Mon, 24 Mar 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742814029; x=1774350029;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=qfxBUZ+GvApiRUkYQhPPEN3aRwRAk+5DCkFcWdQ7Xdo=;
 b=lDB4Oiq527kEoIYGlUOmbeKUVd1OQvxabj+jdoX0UEQ3VAry/NsvFd2J
 oTHzyP1DbvKa34IIHief1/LU4cm2qW+BQdLyR7G5YwN2EQodXiOmh7y2v
 h17inioXYNvBnclCOHsVoHExWEp56VAP2mAkju8RlZUvRcDcQ9tSpFBkh
 JJHGVa4DgT7mgSE4jB+7YcI7KMeD8tQrkNZWIS1Qk3q33TN63JYdNS5lL
 kn+PjUtd6+tXSMNHgJw65FcPKK/DaMzPBjuKn6YzBeGalem76VizOx6Yi
 r8eHASpGCOBIMV7Hh27luAWeQanbmwBGXEcP+DIpEZWXPjgc8tmYwwhiO w==;
X-CSE-ConnectionGUID: mylu3uTcSYOASYndKgwbuA==
X-CSE-MsgGUID: xKno5G4MQnWF4rUvrVF/Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54676223"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54676223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:00:29 -0700
X-CSE-ConnectionGUID: 9HFugjooTrClaKUmHBdLHg==
X-CSE-MsgGUID: fcJSFZjnTWKvUQb52xT8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124024048"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:00:27 -0700
Date: Mon, 24 Mar 2025 12:00:12 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/igt_core: capture logs for child processes (rev4)
Message-ID: <20250324110012.llo2qrnuaqqggbxe@pawelsik-desk>
References: <20250321120344.737080-1-pawel.sikora@linux.intel.com>
 <174260451131.66435.3086604280866089528@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174260451131.66435.3086604280866089528@18a75f3d1eae>
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

Hi I915,

On Sat, Mar 22, 2025 at 12:48:31AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: capture logs for child processes (rev4)
> URL   : https://patchwork.freedesktop.org/series/146262/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16301_full -> IGTPW_12812_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12812_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12812_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12812/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12812_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16301/shard-snb2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12812/shard-snb6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>     - shard-mtlp:         [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16301/shard-mtlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12812/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp4:
>     - shard-dg2:          [PASS][5] -> [FAIL][6] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16301/shard-dg2-10/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp4.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12812/shard-dg2-10/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp4.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
>     - shard-tglu:         NOTRUN -> [FAIL][7] +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12812/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html
> 

Unrelated to my change.

Regards,
Pawel
