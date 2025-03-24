Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D3FC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E110E416;
	Mon, 24 Mar 2025 13:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0Ur5oJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CBC10E416
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823241; x=1774359241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RcQQHG2TlcD39qeXkmOFdpews0ePtsO9vLSACK+q0mo=;
 b=a0Ur5oJb1PVp/rE6+L8S1IIK8zszdG/DD7tqi5iuOaqkR+074j3L5osa
 ADhA+//S/zPW9G0F4SAHNjOWRw3iFk9g0++moPSOyXYwRWxOMEUnwY8uJ
 EtiJ+lLXZ3VxuodmbJGyY02IB9FJUijAUNmM8ODHAa3761ULtHmR6tULL
 /CaM7k5KAn/2Mjxo64y2unKaPaKbtTBjYdJl77dZNZTv1K4Q2A57yFSdP
 8D+l3cVkgf9vFMiXEYRzHOJj19QlzC70KmW1rGkRhxRfv5aUfLDLgwiBJ
 dLBYR4KP7105t9+ISvqNRm9+Hgt0bf5XeXQFzIqU6PNdGOwUKN2Weue4R w==;
X-CSE-ConnectionGUID: UB5x3gYSTUWDgLQxo3bvxw==
X-CSE-MsgGUID: h8hbDZFmSqKGuER+jyqzyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44191616"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44191616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:34:01 -0700
X-CSE-ConnectionGUID: oQwNDET4S56YV+M1j2F5hQ==
X-CSE-MsgGUID: cY3Ex12CRe+MUWMxknrzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129240106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:34:00 -0700
Date: Mon, 24 Mar 2025 14:33:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/iga64: miscelanious improvements
Message-ID: <20250324133357.k46wu4rwqiz6fpor@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <174200641048.38290.6765240150175096324@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174200641048.38290.6765240150175096324@18a75f3d1eae>
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
On 2025-03-15 at 02:40:10 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/iga64: miscelanious improvements
> URL   : https://patchwork.freedesktop.org/series/146324/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8275 -> IGTPW_12782
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 

Unrelated to compute change (shaders), no need for re-run.

Regards,
Kamil

>   Serious unknown changes coming with IGTPW_12782 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12782, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12782/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12782:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-adls-6:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/bat-adls-6/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12782/bat-adls-6/igt@i915_selftest@live.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12782 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@evict:
>     - bat-mtlp-9:         [PASS][3] -> [INCOMPLETE][4] ([i915#12445]) +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/bat-mtlp-9/igt@i915_selftest@live@evict.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12782/bat-mtlp-9/igt@i915_selftest@live@evict.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - bat-dg2-13:         [PASS][5] -> [DMESG-WARN][6] ([i915#13733])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8275/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12782/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   
>   [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
>   [i915#13733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13733
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8275 -> IGTPW_12782
> 
>   CI-20190529: 20190529
>   CI_DRM_16292: deccd667e475e826a1cdd91ab9aec4f897bd30c4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12782: 12782
>   IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12782/index.html
