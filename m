Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B35DC3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3D010E7E8;
	Thu, 18 Jul 2024 12:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6d1RC1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9AF10E7E8;
 Thu, 18 Jul 2024 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721305155; x=1752841155;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tt1Sl9oyk9Xwh3XGw/PHSeKfoKLl10sQg8wqaU0RDA8=;
 b=J6d1RC1nf2tDWYXe/jabNcem9WSdD2qhCVewqvRsX7hgowOTvwh42WVk
 9KlPZtoJWWhPWQgbXEBEtszI+SuH05z4w9lFOje4jjsX/2GsfBXrMMoSD
 nQ/nWJ9dBuGB6j54nAkDvV4w2I++BvILGOI7bRZqurLQEFzsm22agCjwT
 QDqpi4815Cl2IQgDdtx4ByOISFHvul5wMw8fat2kd0qI4CWMHx+tK58C2
 5OoseDWA7C6bOCBJwwcAHCoA0zXM5wPFTWa6FE5UFo1/p00FWioXxk/gi
 XuxBaB4lbw1LBahpiKXxJLSy/GNWsBPZwprYIvg5HIlV4L5niJM9bPuqE Q==;
X-CSE-ConnectionGUID: 4uxzZYZjSIu4GJkXoqSBNw==
X-CSE-MsgGUID: AlO0sWhoSpmSoCcGttvFwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29443250"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="29443250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:19:15 -0700
X-CSE-ConnectionGUID: gglkeuQ0QfGLPxxSaJcVkg==
X-CSE-MsgGUID: H1sGVrURTj6bjeArX4VIqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50501427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:19:13 -0700
Date: Thu, 18 Jul 2024 14:19:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/gem_ctx_exec: Fix failing preempt timeout updates
Message-ID: <20240718121910.56r2iijprqifm7fh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240718085912.15434-7-janusz.krzysztofik@linux.intel.com>
 <172129767455.285786.10377245009692341486@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172129767455.285786.10377245009692341486@2413ebb6fbb6>
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
On 2024-07-18 at 10:14:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
> URL   : https://patchwork.freedesktop.org/series/136228/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7929_BAT -> XEIGTPW_11425_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11425_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11425_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11425_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 

Unrelated to change in i915 test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11425_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
>     - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] ([Intel XE#1169] / [Intel XE#1356])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
> 
>   * igt@xe_gt_freq@freq_basic_api:
>     - bat-adlp-7:         [PASS][7] -> [FAIL][8] ([Intel XE#2196])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_gt_freq@freq_basic_api:
>     - {bat-lnl-2}:        [FAIL][9] ([Intel XE#2196]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - {bat-lnl-2}:        [FAIL][11] ([Intel XE#2262]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7929/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#2196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2196
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7929 -> IGTPW_11425
>   * Linux: xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3 -> xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
>   IGTPW_11425: eac9ea37cf3260872513fc310dde1efb3c2fdd0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7929: 7929
>   xe-1621-edeb340ae6172c699ea801a19d831d37cee9d2b3: edeb340ae6172c699ea801a19d831d37cee9d2b3
>   xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7: 66d3fbb024886f8fbbc15fe79222f046cccd18c7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11425/index.html
