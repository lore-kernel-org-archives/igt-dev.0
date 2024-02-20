Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46DDC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 11:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F00C10E1D6;
	Tue, 20 Feb 2024 11:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7GPTgyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4EA10E1D6;
 Tue, 20 Feb 2024 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708429898; x=1739965898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JsK1/a4XiYbNRbwDtw6qPTS3a53xeTwV9G+ZGxYrS0A=;
 b=G7GPTgyM/nfNickwxZSdMDAuoIaHPgno93RcFMu8nojlCIY8/rrraNqY
 AICuXqMDapX2kRJ/cL1lIE816AdCMA3o7qtRt0EW0eztp+ja9eBJRga5G
 Y+PSYPcy9Bb+nUGXdq81R1Rt1c2uhbYikJKhJWgPLD50gRT1+0VD8QSg/
 3mQjxp6etU7GmFSTHkSt/Fqv0J4s4QuLWDOoWb8dgiSkZnLP+5HZHbf7S
 9RUdj5pDT5iCKRUtBMF7d25rGFG7jZNOW8q+wOby6U5xkRjk/A0jTJNuV
 LCqu2sgId8mfzawRjTKG4Y0SDMKOmx2vkw42TCvWOjMB2g8lW4TMKvzEv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2671912"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2671912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="27919175"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:51:26 -0800
Date: Tue, 20 Feb 2024 12:51:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/drmtest: drop legacy check from filtered opens (rev2)
Message-ID: <20240220115108.rusf4qhxz6atojmj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240219173534.38360-1-kamil.konieczny@linux.intel.com>
 <170839748467.108021.3957456089750643653@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170839748467.108021.3957456089750643653@8e613ede5ea5>
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
On 2024-02-20 at 02:51:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: drop legacy check from filtered opens (rev2)
> URL   : https://patchwork.freedesktop.org/series/130025/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14297_full -> IGTPW_10698_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10698_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10698_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10698_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14297/shard-dg2-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/shard-dg2-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-dg2:          [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14297/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_plane@plane-panning-top-left:
>     - shard-dg2:          NOTRUN -> [TIMEOUT][5] +2 other tests timeout
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/shard-dg2-6/igt@kms_plane@plane-panning-top-left.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg2:          [SKIP][6] ([i915#5354]) -> [TIMEOUT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14297/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          [SKIP][8] ([i915#8708]) -> [TIMEOUT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14297/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   

Above err/warns are unrelated,

Regards,
Kamil

> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7718 -> IGTPW_10698
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14297: 52bdc58b3b2bd7b77710f0d6710c1b9dbaee1af9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10698: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/index.html
>   IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10698/index.html
