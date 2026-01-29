Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F483D358FE
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE4C10E327;
	Thu, 29 Jan 2026 11:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7ZtOEu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D98610E31B;
 Thu, 29 Jan 2026 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769685012; x=1801221012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+3VKp3+NKp2xv0L5kicQH5Sg8XXgRhYFLVDR/FYLij8=;
 b=I7ZtOEu48i1IWm9NBHwGJEYqYWdskck2lmIN2Cypryx0Awz1L7bCPuhg
 Sz4nBsK6Y0Gusnyj/3KN0gAKerKjcpduRcf2tbtsKwdD+qh+OeFZ/TNJN
 eXOTIfckqoIva1+9t8dGqI7GgR3dQwfxEO4mbs+wTvcxr8ocdvKobADcm
 rBxD/il3aR74c4EPG9UjEOM1PkEJ/Om25kupCxJ4ecqisSzC1VddPDK/n
 qDfaqPzrbNDRAjuesA+JhRROol4chJvpbRsC+y137WdblWQwYRSVnTBnN
 DJP3epXZTGNZWYv4A+uF6myJw+Scq06LNERMNAaejZM75ZVQ00IVF9lcn Q==;
X-CSE-ConnectionGUID: SUtcNq/UTtmB2EnBFWs/+Q==
X-CSE-MsgGUID: fPegkbTEQY6/dtWj28D9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="58503009"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="58503009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:09:55 -0800
X-CSE-ConnectionGUID: QKWjJQ+lRnKaeemgLoW4aA==
X-CSE-MsgGUID: Twf6TzvjSWuRIQeyP+R4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="239281145"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:09:54 -0800
Date: Thu, 29 Jan 2026 12:09:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Add MediaTek CTM color test support
Message-ID: <20260129110950.t5kr6ma3jaru72pi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <176961674259.200694.14410525769329707596@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176961674259.200694.14410525769329707596@a3b018990fe9>
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
On 2026-01-28 at 16:12:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add MediaTek CTM color test support
> URL   : https://patchwork.freedesktop.org/series/160743/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17899_full -> IGTPW_14434_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14434_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14434_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14434/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14434_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17899/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-modifier.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14434/shard-mtlp-7/igt@kms_plane@pixel-format-4-tiled-modifier.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-glk:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17899/shard-glk1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14434/shard-glk1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 

Unrelated to change in kms_color.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17899_full and IGTPW_14434_full:
> 
> ### New IGT tests (15) ###
> 
>   * igt@i915_pm_rps@addfb25-4-tiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@basic-wc-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@cursora-vs-flipa-varying-size:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@draw-method-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@drm_dp_mst_helper:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@hw-rejects-pxp-context:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@psr-abgr161616f-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@single-bo:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@syncobj-repeat:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@i915_pm_rps@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_sequence@get-forked@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.37] s
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.38] s
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-b-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14434_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#6230])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14434/shard-tglu-8/igt@api_intel_bb@crc32.html
> 
...cut...
