Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1985DC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D7510E2B4;
	Tue, 20 Feb 2024 18:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhzq8b3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8FC10E2EE;
 Tue, 20 Feb 2024 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708454170; x=1739990170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GlQkOL/SFAzMkNtGXPRl7MnMz3BjkkQJDk4g35hDGFw=;
 b=bhzq8b3D1rai35F8d5gv6e4B0TbAFAyVqbQxgI5/bRhWqVYODf+ZumPf
 QmeTTVzmZn2wVnQIyLFkZukU/yAFXU68BhDpxOcZmqN7rCfwYfLBDII4+
 6Vx0EAYTCfLy7QAw2VpUqSlqyY0FYZz0yCR16H77iBD2VFm3UNfab9N1X
 sTEjtj9ikVl2SStxFTiN6igXjt/tKxBqxC5uuROs9nYtQcl6uqoL/vfsC
 MY+gtXBwiKOQSUwAcx/jearp090Er2hmCrOKzwiDysoIL2mFLfVKqpB++
 371PXSwkk9gwqcCicheOtxlVeHQCcv8Aul9fVCxkvnEXa2dUUNatsY4dS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2700896"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2700896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="936490869"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="936490869"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 10:36:07 -0800
Date: Tue, 20 Feb 2024 19:36:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jesse Zhang <jesse.zhang@amd.com>, I915-ci-infra@lists.freedesktop.org,
 lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
Message-ID: <20240220183604.qiirytlqszld4yvm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240218051955.2280087-1-jesse.zhang@amd.com>
 <170824102621.54115.4668701176842063795@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170824102621.54115.4668701176842063795@8e613ede5ea5>
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
On 2024-02-18 at 07:23:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/amdgpu: add GC 11.5.1 to GC 11.5.0 family
> URL   : https://patchwork.freedesktop.org/series/130044/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14287_full -> IGTPW_10691_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10691_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10691_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10691_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@api_intel_bb@render-ccs:
>     - shard-dg2:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/shard-dg2-1/igt@api_intel_bb@render-ccs.html
> 
>   * igt@gem_exec_schedule@manyslice@vcs0:
>     - shard-dg2:          [PASS][2] -> [FAIL][3] +3 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14287/shard-dg2-10/igt@gem_exec_schedule@manyslice@vcs0.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/shard-dg2-10/igt@gem_exec_schedule@manyslice@vcs0.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/shard-dg2-5/igt@kms_plane_alpha_blend@constant-alpha-min.html
> 

Not related to amdgpu, no need for respin.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs}:
>     - shard-rkl:          NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/shard-rkl-2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_14287_full and IGTPW_10691_full:
> 
> ### New IGT tests (59) ###
> 
>   * igt@gem_barrier_race@remote-request@rcs0:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.00, 5.27] s
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.94] s
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:

...cut...

>   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7716 -> IGTPW_10691
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_14287: b09fd1bd9f8b4a8e5cd8c1de8dbba4d4eb15b4e9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10691: 10691
>   IGT_7716: 7716
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10691/index.html
