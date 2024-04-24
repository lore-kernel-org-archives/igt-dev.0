Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A462C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 16:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0AA113C79;
	Wed, 24 Apr 2024 16:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNt8nLYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22759113054;
 Wed, 24 Apr 2024 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713977501; x=1745513501;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pwrWLigiwDXNhWmXAXC6bQ2HQHe/Bu1OERravSL0yR0=;
 b=dNt8nLYkAQ0NbY7voxhFOVfMrMeehwuCJ3icQIMzgauiIaF8TuqvwZEu
 d7bt7XCL/28h/sstUi+Q2HR8VmluY+ZNi30GwLGYb3VEJoFDF3Rheizys
 85A0klIU/kOkGkUkAenm8hC/9TeLgALlcNvbat6gpMqzG6DCxDhSEMFaf
 BVZFUFGgSCVUfOGdWE8lJhFF3Ya8jtF9B5NZtVpgqU/LSardWjNcRgwWK
 tU58a+V8hxJIvVtgBzGcgZM20odgic4LoVu2qlavju6apMo75qiVnC3Ta
 iXEVvDsbpEe6fVdDe0PG8Ebx8qObOohRNfX+5ZsdxACBhTWheJkfHg80y Q==;
X-CSE-ConnectionGUID: Oq/MH4DWTQWtYyNCtgLpeA==
X-CSE-MsgGUID: +gQS6ajzRWaSZ9nqC/3L9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9783046"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9783046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 09:51:08 -0700
X-CSE-ConnectionGUID: 6ICrYoRcRtWCFNdI0Gwlmg==
X-CSE-MsgGUID: VPO7KT+OQ66TXedyfcAWLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="29408055"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 09:51:04 -0700
Date: Wed, 24 Apr 2024 18:50:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?utf-8?Q?ing_with_=5Bi-g-t=2C1=2F4=5D_tests=2Fintel=2Fxe=5Fwedged?=
 =?utf-8?Q?=3A?= Introduce a new test for Xe device wedged state
Message-ID: <20240424165048.dlq2qbkgpusl6kvh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
 <171391827529.1610961.6688357556192677636@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171391827529.1610961.6688357556192677636@8e613ede5ea5>
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
On 2024-04-24 at 00:24:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/4] tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
> URL   : https://patchwork.freedesktop.org/series/132799/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14637 -> IGTPW_11062
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11062 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11062, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html
> 
> Participating hosts (39 -> 37)
> ------------------------------
> 
>   Missing    (2): fi-apl-guc fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11062:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@nb-await:
>     - bat-arls-2:         NOTRUN -> [TIMEOUT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_fence@nb-await.html
> 
>   * igt@gem_exec_gttfill@basic:
>     - bat-arls-2:         [PASS][2] -> [TIMEOUT][3] +1 other test timeout
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/bat-arls-2/igt@gem_exec_gttfill@basic.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_gttfill@basic.html
> 
>   * igt@gem_exec_parallel@engines:
>     - bat-arls-2:         NOTRUN -> [ABORT][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_parallel@engines.html
>

These are unrelated to Xe test, no need for respin as it is
already merged.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11062 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [ABORT][5] ([i915#10594]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
>   [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7819 -> IGTPW_11062
> 
>   CI-20190529: 20190529
>   CI_DRM_14637: b5b592a3902a51cc5747c625aa1898768d4ce79a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11062: a72f03b3feb0591c8cf0260253a8a04b9f6ea779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html
