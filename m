Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7823C27C77
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 15:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605110E69C;
	Tue, 11 Jun 2024 15:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fzdjwm9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703710E681;
 Tue, 11 Jun 2024 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718120212; x=1749656212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H2WM6Mwg4bEybU6Y15shTYIECGQ2DrI9e6ptawIM90Q=;
 b=Fzdjwm9ehuGfWUWedlBo8awP8fa1GdtlNH2QAc8zeigQ4QX7B4RRENT5
 8cXo9nTI0ch+btfAWXMegm/9WpdbFIUmXduDMLILSXBL4lxdnkFRWe+i/
 seTeeLa61vKE++w1JOF3KrMXg7Q6k6gF89SJhMDkY04MdzAZiKxjQn7by
 M+2CRfjMWZDcWN4KjiyyRzzxzg+ruHM01FiNTx8zsy1Fa3TQpgRvpRgbg
 0RijRXkBmf1Xo+pgp4KliSt7M9R+kNCHOPy1+trvjX7NCnn7ktOEmp58E
 2vJZ6jMV44Nq9IgX7I91ehbj6js+cGGFMCD0vyqROGuSECl4PLkx7EQaW w==;
X-CSE-ConnectionGUID: qZxXbpaeQ+673Unf1fDSwQ==
X-CSE-MsgGUID: s4HGEuROQ6+vW+l6FJrDLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14715177"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14715177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:36:51 -0700
X-CSE-ConnectionGUID: nEPPa/hgRVynWP7fBWPc/w==
X-CSE-MsgGUID: KLEkHbPVTK2RKr1uILwD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="62637468"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:36:50 -0700
Date: Tue, 11 Jun 2024 17:36:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tools/intel_vbt_decode: Decode almost everything
Message-ID: <20240611153647.xpgndh2b7b34tczu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
 <171785212902.29541.821799228766960975@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171785212902.29541.821799228766960975@a6498e030952>
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
On 2024-06-08 at 13:08:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_vbt_decode: Decode almost everything
> URL   : https://patchwork.freedesktop.org/series/134615/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14904_full -> IGTPW_11236_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11236_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11236_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11236_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
>     - shard-glk:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html
> 
>   * igt@prime_self_import@reimport-vs-gem_close-race:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-dg1-15/igt@prime_self_import@reimport-vs-gem_close-race.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/shard-dg1-15/igt@prime_self_import@reimport-vs-gem_close-race.html
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-mtlp-3/igt@prime_self_import@reimport-vs-gem_close-race.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/shard-mtlp-4/igt@prime_self_import@reimport-vs-gem_close-race.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          [INCOMPLETE][7] ([i915#1982] / [i915#9408]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg1:          [FAIL][9] ([i915#11279]) -> [FAIL][10] +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14904/shard-dg1-13/igt@gem_exec_suspend@basic-s0@smem.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/shard-dg1-17/igt@gem_exec_suspend@basic-s0@smem.html
> 

Unrelated to tools change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11236_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7880 -> IGTPW_11236
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14904: 2bea08bd31298d60d416b2a6ed346bb53dd28037 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11236: 6309c25f8a30cd92824443a9421a3515c6c2d223 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11236/index.html
