Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC2FC27C79
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 13:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60E10E24F;
	Fri, 14 Jun 2024 13:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0x2P8sp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0008210E203;
 Fri, 14 Jun 2024 13:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718371388; x=1749907388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fTbSYHYMLcaTMXwbuFFTR1TT6q71U3eaOM/BTMQic0o=;
 b=E0x2P8spIJH0TdS4RbY813ptJT2YEkyfGDv1kyAXchqhWFKW+cBMA+Vw
 R9J1x0f9LH8mS60wWxG3zsPKaGTaQxhco7m9P1XA3Lar8N58HvHLyxptF
 oKtNdk5RDZ/EslZS4o/jZ5aolL9tKEJuUfZr/BRDViFKtnHZiKODB+eb9
 yQsHxvqpZ+VHbZ07Rt560YvEuzH2k4ToNKOfnJmRWYFjLHIkYbkSgksOU
 KDVyN5s9ggZ7vDJnmjQ3gk5PG2HY6TmHGOWiCQGsagEQ68/z0kmarys6x
 KIgd7WUVxg2N9TAAfYwxYKhT8GZN0dJZRs4h8ynIaXK3HkFt0aKmDlOxE Q==;
X-CSE-ConnectionGUID: eAFYmKrSRGynwBRqZ6MmoQ==
X-CSE-MsgGUID: oKXQTDeKQz2KpEpKhL6hhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15090402"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15090402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 06:23:07 -0700
X-CSE-ConnectionGUID: cPsRTyelRCChaw6SGlRIkA==
X-CSE-MsgGUID: c1Sz5a4USz26c3JN9+5zDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="44913207"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:23:06 -0700
Date: Fri, 14 Jun 2024 15:22:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib/gpgpu: add shader support (rev7)
Message-ID: <20240614132248.h5w4kc4mmoeevbmo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <171826683886.73458.18233799472608310245@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171826683886.73458.18233799472608310245@a6498e030952>
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
On 2024-06-13 at 08:20:38 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpgpu: add shader support (rev7)
> URL   : https://patchwork.freedesktop.org/series/133020/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14923_full -> IGTPW_11252_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11252_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11252_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11252/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11252_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_gttfill@engines@vecs0:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11252/shard-glk8/igt@gem_exec_gttfill@engines@vecs0.html
> 

I looked into logs and it seems that log for this subtest is cut
while a global igt_runner log indicates test suceeded.

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11252/shard-glk8/igt_runner7.txt

[728.327381] [108/132] (528s left) gem_exec_gttfill (engines)
[728.444597] Starting subtest: engines
[728.449291] Starting dynamic subtest: rcs0
[754.432194] Dynamic subtest rcs0: SUCCESS (25.986s)
[754.453112] Starting dynamic subtest: bcs0
[781.783364] Dynamic subtest bcs0: SUCCESS (27.348s)
[781.803190] Starting dynamic subtest: vcs0
[807.332976] Dynamic subtest vcs0: SUCCESS (25.549s)
[807.353936] Starting dynamic subtest: vecs0
[833.956681] Dynamic subtest vecs0: SUCCESS (26.617s)
[833.959823] Subtest engines: SUCCESS (105.513s)
[834.179262] [109/132] (423s left) gem_ctx_sseu (invalid-sseu)
[834.409471] Subtest invalid-sseu: SKIP (0.000s)
[834.471145] [110/132] (422s left) syncobj_timeline (etime-multi-wait-for-submit-available-unsubmitted)
[834.626878] Starting subtest: etime-multi-wait-for-submit-available-unsubmitted
[834.737361] Subtest etime-multi-wait-for-submit-available-unsubmitted: SUCCESS (0.107s)
[834.840783] [111/132] (422s left) kms_frontbuffer_tracking (psr-rgb101010-draw-mmap-wc)
[835.105366] Starting subtest: psr-rgb101010-draw-mmap-wc
[835.114256] Subtest psr-rgb101010-draw-mmap-wc: SKIP (0.000s)
[835.194252] [112/132] (422s left) gem_lmem_swapping (heavy-verify-random-ccs)
[835.350564] Subtest heavy-verify-random-ccs: SKIP (0.000s)
[835.407126] [113/132] (422s left) kms_pm_rpm (modeset-lpsp-stress-no-wait)

and here log ends. In conclusion, above bug imho is misreported.
There is --sync option for igt_runner and it can help.
Adding Ewelina to Cc.

>   * igt@prime_busy@hang@vecs1:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11252/shard-dg2-7/igt@prime_busy@hang@vecs1.html
> 

It is unrelated.

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14923_full and IGTPW_11252_full:
> 
> ### New IGT tests (14) ###
> 
>   * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.08] s
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.09] s
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@d-hdmi-a3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.65] s
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.24] s
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.22] s
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-c-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.22] s
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.14] s
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-c-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.12] s
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.13] s
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.20] s
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b-dp-4:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.19] s
> 

Above is not introduced with this igt change, why are they here?

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11252_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7882 -> IGTPW_11252
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14923: 86b413568d7dbde6078f6c40341f5ae1ae63c552 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11252: 11252
>   IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11252/index.html
