Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1790DC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 16:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB1311A626;
	Thu, 25 Apr 2024 16:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZF/GEk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19B911A625;
 Thu, 25 Apr 2024 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714063392; x=1745599392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b7I3qKd5/hetUU5VGfkX50xqGHaL7OgaeU9NR+SoBuE=;
 b=PZF/GEk3b1mHYzk47nR9gJkH4/Y7ZFUXc3HOX9d5iN66kiUMD7dg3kG+
 bmGGKtIvOuQA7Bi+/y1GzrAplzDrXmMm7kyfeZwyHIWSeeNzNASkZVggv
 JnMlEerMsikWpyUAaBopq1C4V0Hyg/sXq5NrotlTKUyTJZbOAHWc6SpqI
 drmpxR19yComqh06Q4yzR74k6sA6LDe+E/zv5FOyr+nZnPNpzdaP1bVS/
 tlqBv4smEkvWKPigGvJRZWg+hXMyd/ezPq0IeMZ60GazitJX5Kr6FVEXW
 3MtbfXEnyq5jAHMpRHs9cBg+keH5yxzt4tnjGjsBRSYKyFzXxC7uiewZL w==;
X-CSE-ConnectionGUID: 0kAqkbo9QuSaPKf6ml+AVA==
X-CSE-MsgGUID: 4bnoc/fySw+DBdxV/nx5Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9627100"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9627100"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 09:43:10 -0700
X-CSE-ConnectionGUID: np0gLJG+R06ib0ZllqhnSA==
X-CSE-MsgGUID: X1IEM18MQVqjUWbbSc2tUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29927851"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 09:43:09 -0700
Date: Thu, 25 Apr 2024 18:42:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tools/intel_reg: Fix mchbar register write
Message-ID: <20240425164249.2trzeygxavj73h3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
 <171405917601.1667640.17568260742913552249@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171405917601.1667640.17568260742913552249@8e613ede5ea5>
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
On 2024-04-25 at 15:32:56 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_reg: Fix mchbar register write
> URL   : https://patchwork.freedesktop.org/series/132598/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14606_full -> IGTPW_11040_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11040_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11040_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11040_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@debugfs_test@read_all_entries_display_off:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-dg2-5/igt@debugfs_test@read_all_entries_display_off.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [ABORT][2] +14 other tests abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][3] +5 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-dg2-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][4] +4 other tests incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-tglu-2/igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1.html
> 
>   * igt@kms_invalid_mode@zero-vdisplay@pipe-b-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [ABORT][5] +4 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-glk1/igt@kms_invalid_mode@zero-vdisplay@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_invalid_mode@zero-vdisplay@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [DMESG-WARN][6] +2 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-glk1/igt@kms_invalid_mode@zero-vdisplay@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_lease@simple-lease@pipe-c-hdmi-a-2:
>     - shard-glk:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/shard-glk4/igt@kms_lease@simple-lease@pipe-c-hdmi-a-2.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-glk3/igt@kms_lease@simple-lease@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [INCOMPLETE][9] +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-dg1-17/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg1:          NOTRUN -> [ABORT][10] +1 other test abort
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-dg1-13/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-dg2:          NOTRUN -> [ABORT][11] +3 other tests abort
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-dg2-7/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr@psr-cursor-plane-move@edp-1:
>     - shard-mtlp:         NOTRUN -> [ABORT][12] +20 other tests abort
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-mtlp-5/igt@kms_psr@psr-cursor-plane-move@edp-1.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          NOTRUN -> [INCOMPLETE][13] +6 other tests incomplete
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-snb4/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][14]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-rkl-1/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][15] +3 other tests incomplete
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-glk4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-d-edp-1:
>     - shard-mtlp:         [ABORT][16] ([i915#10875]) -> [ABORT][17] +2 other tests abort
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/shard-mtlp-3/igt@kms_plane_multiple@tiling-none@pipe-d-edp-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/shard-mtlp-7/igt@kms_plane_multiple@tiling-none@pipe-d-edp-1.html
> 

All above are unrelated to tools/ change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11040_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8411])

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7813 -> IGTPW_11040
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14606: 121bb3cb2e7ce2d6f5c35cea84c6ae308cf1da0a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11040: d591925568a45c97dc8484361a79e9d0b01636c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html
