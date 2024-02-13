Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D4C4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 18:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096510E8CC;
	Tue, 13 Feb 2024 18:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0rEPILS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7289C10E888;
 Tue, 13 Feb 2024 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707847713; x=1739383713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NHBIcoXW8cubGs8VX67HaML7BgzTIZYvpmRQRZ3mdww=;
 b=A0rEPILS6YHCQOwlBKhEO6PL6J2pN93PUh0oC1w2SovQF1VBsVahQOOw
 HEh9zAbnpOkjf+bTgKSseDxi8kqZf61LFM6+qfaxMXj0qxoMxW3uyMOCJ
 Y5vWfAVt7damYjknm9Fv42i1tQQjKHq90n3cE1nxJf4/FZbjBs91x+VyQ
 oa6S+6cEU5q66JIdO2ZO7jpsLH6Z2eH6+NaSY8aWpGmkTLXRb96Nfyoo1
 2+eMVwT0ZNm7xmE5inhMiPk+Ev8pWKeeQITs5u8LZFesMU5pGxa4yCDFh
 +6qXA4QpkPZaAzUwLS45tVpo6evK4z26JujAtSQlSOPikKK9p3GkndH3S g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12591530"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="12591530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 10:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2915894"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 10:08:31 -0800
Date: Tue, 13 Feb 2024 19:08:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 benchmarks: Add VKMS benchmark (rev3)
Message-ID: <20240213180829.g64qntiwfsocgr36@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240209-bench-v3-1-24a01f366d3b@riseup.net>
 <170754544126.1129906.8222139670718035516@5338d5abeb45>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170754544126.1129906.8222139670718035516@5338d5abeb45>
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
On 2024-02-10 at 06:10:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks: Add VKMS benchmark (rev3)
> URL   : https://patchwork.freedesktop.org/series/129644/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7709_full -> IGTPW_10660_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10660_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10660_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10660/index.html
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10660_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10660/shard-rkl-3/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a2.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_7709_full and IGTPW_10660_full:
> 
> ### New IGT tests (7) ###
> 
>   * igt@kms_plane_scaling@invalid-num-scalers@pipe-d-hdmi-a-1-invalid-num-scalers:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1-pipe-b-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.26] s
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-1-pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.27] s
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-1-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.33] s
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-1-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.32] s
> 
>   * igt@kms_setmode@invalid-clone-single-crtc@pipe-a-hdmi-a-1-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.04] s
> 
>   * igt@kms_setmode@invalid-clone-single-crtc@pipe-b-hdmi-a-1-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.04] s
> 
>   

These are unrelated to new benchmark adedd, no need for respin.

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10660_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8411])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10660/shard-dg2-6/igt@api_intel_bb@object-reloc-keep-cache.html
> 
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7709 -> IGTPW_10660
> 
>   CI-20190529: 20190529
>   CI_DRM_14248: c7d234dd2d329f223f56699636248a609dbe2267 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10660: 10660
>   IGT_7709: 17a41dcf1ed551e7a5f2ca88cad055b3f6d67e7e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10660/index.html
