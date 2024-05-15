Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EACC25B78
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6493C10E2F2;
	Wed, 15 May 2024 17:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJTFIuQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5C10E1BE;
 Wed, 15 May 2024 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793276; x=1747329276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uTR6sxAEABbl479zvP6k/HptB9z5XmFP2ONWxSpSNWE=;
 b=cJTFIuQiI/Bt8I4FmfmOn1OZa6xCZJ7Ol2mF5B4uJ1XRcCyXOzSg5Zm2
 aZjnWLF/Ppo0odOK8q/CsfLSz1DRHMFLLU5yeWfPJRy3gsvOXOvgdTaIu
 cgpsgnkuAmyQIA5/xgKt96peoEPE7AHrVWEbxyeZnP5IQmCxJHnIRzjd8
 rqLglLSrZ/p7aP2irjNybB3el3UTwn89NP/We0bqPCNA7oeDArwPoO8lY
 uMP/AqQztXrX5cuOTPl1El5khZmEnPqy/fh6VTeblkHcXrOsEBSVKkPXD
 sQK5GMX4S/sNHqOTCG7d+84vXpMZ9Fta1ikq9cPQQaRtenwGl1wwkI5aG Q==;
X-CSE-ConnectionGUID: Wfk8mE31Qt6cC3KX9WtC9w==
X-CSE-MsgGUID: VYpUxLZWRzqR4253ZqW4Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12032168"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="12032168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:14:36 -0700
X-CSE-ConnectionGUID: kNFdABIPSYKz8T0OqFqUYg==
X-CSE-MsgGUID: tpBFpBOIRuK+nt536wwY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="54332475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:14:34 -0700
Date: Wed, 15 May 2024 19:14:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?utf-8?Q?ing?= with [i-g-t,1/2] tests/amdgpu: support jpeg test on gfx940
Message-ID: <20240515171431.xu53ass433qstlcw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
 <171561191998.2095830.14917336101853323410@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171561191998.2095830.14917336101853323410@8e613ede5ea5>
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
On 2024-05-13 at 14:51:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] tests/amdgpu: support jpeg test on gfx940
> URL   : https://patchwork.freedesktop.org/series/133544/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7848 -> IGTPW_11133
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11133 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11133, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html
> 
> Participating hosts (43 -> 40)
> ------------------------------
> 
>   Additional (1): bat-mtlp-9 
>   Missing    (4): bat-mtlp-8 bat-arls-2 bat-jsl-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11133:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@active:
>     - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-glk-j4005/igt@i915_selftest@live@active.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-glk-j4005/igt@i915_selftest@live@active.html
> 
>   

Unrelated to amdgpu.

Regards
Kamil

> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6:
>     - {bat-mtlp-9}:       NOTRUN -> [FAIL][3] +2 other tests fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11133 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@basic@lmem0:
>     - bat-dg2-9:          [PASS][4] -> [FAIL][5] ([i915#10378])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
> 
>   * igt@i915_module_load@load:
>     - bat-arls-3:         [PASS][6] -> [ABORT][7] ([i915#11041])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-arls-3/igt@i915_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-arls-3/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][8] -> [ABORT][9] ([i915#10594])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
>   [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
>   [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
>   [i915#11041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9970]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7848 -> IGTPW_11133
> 
>   CI-20190529: 20190529
>   CI_DRM_14754: 7def831e1e6b6d95c92e0a4fad9539a95141403d @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11133: 11133
>   IGT_7848: dc2d7fb4f978048b87707ea9ec32da748b01b378 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html
