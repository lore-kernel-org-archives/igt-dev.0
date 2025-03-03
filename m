Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F86DC282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 11:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CABD10E224;
	Mon,  3 Mar 2025 11:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp48qAiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BF310E224;
 Mon,  3 Mar 2025 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741000566; x=1772536566;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QRxP8tK3Qz66mJXvm5lI2S3JEEfzFpTnEJdvHpTGxx4=;
 b=Dp48qAivBkPYbhoykpZONCmpR3MhMCK193IZZIXwjtqVFBhwHiehOO/i
 MwrzT89evK/kjp+iF1qfKmcvLAThnDg3h+DXH7dFLA7HE+go0BctnJukb
 noXhN52MyBtuT9c/YL2sAy5gwVW6XKs4Bx1wobaHBGGyvI67xad0hgvy7
 W6tJmIsWdu8Z4Ct/WOJXMaRGLGcIggWcaacun7Q3KdYbW+lsQ5OLDkVbc
 XDPIVm6sqvwXV26YKqatqJXMjiuK5GnjxNMWqgga1ET8rZiW+MfpjKSs5
 zY9OevHwBMQ0C2F2bVbpladAqj6u+XS49JOEnpauyRl8Gg1RZLIM3PVSJ g==;
X-CSE-ConnectionGUID: bpIxJJciSgiF0ZmofH9SvA==
X-CSE-MsgGUID: 4fg7scMsRPyU3/y6djApKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41724011"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41724011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 03:16:06 -0800
X-CSE-ConnectionGUID: Eo2VKthKQH24mJ6w2wJvCQ==
X-CSE-MsgGUID: K8kLDJxFQ/+B0yHTqCeHyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118526846"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:16:04 -0800
Date: Mon, 3 Mar 2025 12:15:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 runner: Parse results harder (rev2)
Message-ID: <20250303111547.afm5qtswpckl2alt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250228171519.49523-1-kamil.konieczny@linux.intel.com>
 <174083433677.3509304.9822856144111396371@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174083433677.3509304.9822856144111396371@b555e5b46a47>
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
On 2025-03-01 at 13:05:36 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Parse results harder (rev2)
> URL   : https://patchwork.freedesktop.org/series/145520/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16207_full -> IGTPW_12686_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12686_full absolutely need to be
>   verified manually.

These are unrelated to igt_runner changes,

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12686_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12686_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16207/shard-snb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/shard-snb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-ts-check@d-hdmi-a1:
>     - shard-tglu:         [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16207/shard-tglu-9/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/shard-tglu-10/igt@kms_flip@plain-flip-ts-check@d-hdmi-a1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12686_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/shard-rkl-4/igt@api_intel_bb@crc32.html
>     - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#6230])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/shard-dg1-13/igt@api_intel_bb@crc32.html
>     - shard-tglu:         NOTRUN -> [SKIP][7] ([i915#6230])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/shard-tglu-10/igt@api_intel_bb@crc32.html
> 
...cut...
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8255 -> IGTPW_12686
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16207: f79125df21812dda30ee327bc9c6ce28b079d610 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12686: 12686
>   IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12686/index.html
