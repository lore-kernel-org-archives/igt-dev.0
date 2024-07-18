Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E34C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 08:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06EC10E5AA;
	Thu, 18 Jul 2024 08:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EP4pRbQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831EE10E5AA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721289807; x=1752825807;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XCZSfxAIDpEOuKatfuCUyvVhOW3lwkQ8Mjc/QDFuarc=;
 b=EP4pRbQDLkg9ZR0oNksp/AWC3MKfkE7PuWfd4SiXprD0lptvLTLaGlzd
 XAC0koUVN/Rptf3yPldsdPIe/HC9wLB37/dp6E1hS3JETpuhck7x8zbYW
 lU28wPeynK6QRi9GK+8PAlcCPUuBsAFOCgClMpV3j2XnSi3NpX6mzDdVh
 uQrZLagM+DJKkufMHgUjOxiGuOmxM3O8koyC82tngPikWlgD2481e512f
 XbYfqoDgK36MzXtaSb743bXtw1YJMBabzEJtuM6ctU7rnIPyS2QhWtNcV
 gBQKR1l+41c2PFeDcxTqMTZxRzLcYSzkCJMHFSVfIulCvQUgSceWHXluX g==;
X-CSE-ConnectionGUID: PyMnkxu3T6q3YkoYn9Pzng==
X-CSE-MsgGUID: pcXFKGASRqOpKkwmxMwgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18978522"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18978522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:03:26 -0700
X-CSE-ConnectionGUID: s54FSidPQNudZzWs2E/uSQ==
X-CSE-MsgGUID: bRJUBHC4TpGJX5U7JHZ0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="55810924"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.28.172])
 ([10.246.28.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 01:03:24 -0700
Message-ID: <7c0cd092-fb11-40f7-b922-232ed1247788@linux.intel.com>
Date: Thu, 18 Jul 2024 10:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel-?=
 =?UTF-8?Q?ci/xe-sriov-vf=2Eblocklist=2Etxt=3A_Blocklist_for_SR-IOV_VF_BAT_r?=
 =?UTF-8?Q?uns?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240717153051.1000030-1-marcin.bernatowicz@linux.intel.com>
 <172128576969.272204.8580360488717304780@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172128576969.272204.8580360488717304780@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/18/2024 8:56 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for SR-IOV 
> VF BAT runs
> *URL:*	https://patchwork.freedesktop.org/series/136202/ 
> <https://patchwork.freedesktop.org/series/136202/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7928_full -> IGTPW_11423_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11423_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11423_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/index.html
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_11423_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rps@reset:
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb5/igt@i915_pm_rps@reset.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb7/igt@i915_pm_rps@reset.html>

Not related to the change. The change does not impact existing runs.

Regards,
marcin

> 
> 
>     New tests
> 
> New tests have been introduced between IGT_7928_full and IGTPW_11423_full:
> 
> 
>       New IGT tests (4)
> 
>   *
> 
>     igt@kms_color@deep-color@pipe-b-dp-4-ctm:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.86] s
>   *
> 
>     igt@kms_color@deep-color@pipe-b-dp-4-degamma:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.89] s
>   *
> 
>     igt@kms_color@deep-color@pipe-b-dp-4-gamma:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [5.91] s
>   *
> 
>     igt@kms_rmfb@rmfb-ioctl@pipe-a-vga-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.16] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11423_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-purge-cache:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@api_intel_bb@object-reloc-keep-cache:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>) +1 other test skip
>   *
> 
>     igt@api_intel_bb@object-reloc-purge-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>) +1 other test skip
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@device_reset@unbind-cold-reset-rebind:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@device_reset@unbind-cold-reset-rebind.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@drm_fdinfo@busy-check-all@ccs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@drm_fdinfo@busy-check-all@ccs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +5 other tests skip
>   *
> 
>     igt@drm_fdinfo@busy-idle-check-all@vcs1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +17 other tests skip
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@drm_fdinfo@most-busy-check-all@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +8 other tests skip
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ccs@block-multicopy-inplace:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-3/igt@gem_ccs@block-multicopy-inplace.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@suspend-resume:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@gem_ccs@suspend-resume.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html> (i915#9846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846>)
>   *
> 
>     igt@gem_create@create-ext-set-pat:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@gem_create@create-ext-set-pat.html> (i915#8562 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>   *
> 
>     igt@gem_ctx_freq@sysfs@gt0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html> (i915#9561 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-hostile:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hostile.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>) +1 other test skip
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-13/igt@gem_ctx_sseu@engines.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-13/igt@gem_eio@unwedge-stress.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-13/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>   *
> 
>     igt@gem_exec_balancer@bonded-sync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@gem_exec_balancer@sliced.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@gem_exec_capture@capture-invisible@lmem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>) +1 other test skip
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846>)
>   *
> 
>     igt@gem_exec_fair@basic-flow:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-1/igt@gem_exec_fair@basic-flow.html> (i915#4473 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>   *
> 
>     igt@gem_exec_fair@basic-none-share:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-3/igt@gem_exec_fair@basic-none-share.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +6 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +1 other test fail
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +4 other tests fail
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +3 other tests fail
>   *
> 
>     igt@gem_exec_flush@basic-batch-kernel-default-wb:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +1 other test skip
>   *
> 
>     igt@gem_exec_flush@basic-uc-prw-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>   *
> 
>     igt@gem_exec_reloc@basic-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@gem_exec_reloc@basic-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +20 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_exec_reloc@basic-cpu-wc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +8 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@gem_exec_reloc@basic-wc-read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +11 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-cpu-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-1/igt@gem_exec_reloc@basic-write-cpu-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +2 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-copy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@gem_fence_thrash@bo-copy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +3 other tests skip
>   *
> 
>     igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +4 other tests skip
>   *
> 
>     igt@gem_fenced_exec_thrash@too-many-fences:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-8/igt@gem_fenced_exec_thrash@too-many-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_lmem_swapping@basic@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-5/igt@gem_lmem_swapping@basic@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@gem_lmem_swapping@basic@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@massive:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@gem_lmem_swapping@massive.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@massive-random:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-4/igt@gem_lmem_swapping@massive-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +4 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk2/igt@gem_lmem_swapping@verify-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +6 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-3/igt@gem_lmem_swapping@verify-ccs@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_madvise@dontneed-before-exec:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@gem_madvise@dontneed-before-exec.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_media_fill@media-fill:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-8/igt@gem_media_fill@media-fill.html> (i915#8289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289>)
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>   *
> 
>     igt@gem_mmap_gtt@basic-small-bo:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@gem_mmap_gtt@basic-small-bo.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +13 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@fault-concurrent:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@gem_mmap_gtt@fault-concurrent.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@invalid-flags:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@gem_mmap_wc@invalid-flags.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_mmap_wc@read:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@gem_mmap_wc@read.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-prefaulted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@gem_mmap_wc@write-prefaulted.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +6 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@reads:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@gem_partial_pwrite_pread@reads.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +8 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +5 other tests skip
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@gem_pwrite@basic-exhaustion.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other tests skip
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@gem_pwrite@basic-exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>   *
> 
>     igt@gem_pxp@create-regular-buffer:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-4/igt@gem_pxp@create-regular-buffer.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +5 other tests skip
>   *
> 
>     igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@gem_pxp@reject-modify-context-protection-off-3.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@gem_pxp@verify-pxp-stale-ctx-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +9 other tests skip
>   *
> 
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +1 other test skip
>   *
> 
>     igt@gem_set_tiling_vs_pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@gem_set_tiling_vs_pwrite.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>   *
> 
>     igt@gem_softpin@evict-snoop:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@gem_softpin@evict-snoop.html> (i915#4885 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885>)
>   *
> 
>     igt@gem_tiling_max_stride:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@gem_tiling_max_stride.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@gem_unfence_active_buffers:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_unfence_active_buffers.html> (i915#4879 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879>)
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#3323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@readonly-unsync:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@gem_userptr_blits@readonly-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +3 other tests skip
>   *
> 
>     igt@gem_userptr_blits@relocations:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@gem_userptr_blits@relocations.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-overlap:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@gem_userptr_blits@unsync-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-after-close.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@gen9_exec_parse@allowed-single.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@gen9_exec_parse@allowed-single.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@secure-batches:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@gen9_exec_parse@valid-registers.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +3 other tests skip
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@i915_module_load@resize-bar.html> (i915#7178 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178>)
>   *
> 
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html> (i915#7091 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset-multiple:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@i915_pm_freq_api@freq-reset-multiple.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591>)
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> +6 other tests skip
>   *
> 
>     igt@i915_pm_rps@min-max-config-loaded:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@i915_pm_rps@min-max-config-loaded.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@i915_pm_rps@thresholds-idle-park@gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_rps@thresholds-idle@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@i915_pm_rps@thresholds-idle@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>   *
> 
>     igt@i915_selftest@mock@memory_region:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk3/igt@i915_selftest@mock@memory_region.html> (i915#9311 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-tglu: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-3/igt@i915_suspend@basic-s3-without-i915.html> (i915#7443 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (i915#3826 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826>)
>   *
> 
>     igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_addfb_basic@tile-pitch-mismatch.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_big_fb@4-tiled-addfb.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +16 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic-force-joiner:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@kms_big_joiner@basic-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@kms_big_joiner@invalid-modeset-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +99 other tests skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +12 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +55 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +174 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-3/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html> +314 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@kms_cdclk@mode-transition.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#11616 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11616> / i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_cdclk@plane-scaling.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_chamelium_color@degamma.html> +31 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-read:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-2/igt@kms_chamelium_edid@hdmi-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +12 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-without-ddc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +5 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_content_protection@atomic-dpms.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_content_protection@content-type-change.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_content_protection@lic-type-1.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_content_protection@mei-interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-9/igt@kms_content_protection@type1.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +6 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_cursor_crc@cursor-sliding-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453> / i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (i915#9809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html> (i915#9067 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html> (i915#8588 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@kms_feature_discovery@chamelium.html> (i915#2065 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065> / i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_feature_discovery@display-2x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>) +2 other tests skip
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html> (i915#9337 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@kms_feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_fence_pin_leak:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_fence_pin_leak.html> (i915#4881 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_fence_pin_leak.html> (i915#4881 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>)
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-8/igt@kms_flip@2x-absolute-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637> / i915#3966 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@kms_flip@2x-flip-vs-fences.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +3 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_flip@2x-plain-flip.html> +31 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +3 other tests skip
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb2/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>   *
> 
>     igt@kms_flip@flip-vs-fences-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk7/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a2.html> (i915#9878 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8810 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-rte.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +60 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html> +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-3/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +28 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html> +42 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +26 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> +57 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +32 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +23 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-3/igt@kms_getfb@getfb-reject-ccs.html> (i915#6118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_hdmi_inject@inject-audio.html> (i915#433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433>)
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_hdr@bpc-switch-dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +3 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk1/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html> (i915#10647 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +1 other test fail
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_plane_multiple@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8806 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-9/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +11 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_pm_dc@dc3co-vpb-simulation.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_pm_dc@dc6-dpms.html> (i915#5978 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-13/igt@kms_pm_dc@dc6-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_prime@basic-crc-hybrid:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_prime@basic-crc-vgem:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_prime@basic-crc-vgem.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-update-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-6/igt@kms_psr2_sf@cursor-plane-update-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +8 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-13/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area@psr2-pipe-b-edp-1.html> (i915#9808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@kms_psr2_su@page_flip-nv12.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-render:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +22 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-7/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +4 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_psr@pr-sprite-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +22 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_psr@psr-cursor-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +24 other tests skip
>   *
> 
>     igt@kms_psr@psr-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_psr@psr-suspend.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +6 other tests skip
>   *
> 
>     igt@kms_rotation_crc@exhaust-fences:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_rotation_crc@exhaust-fences.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) +1 other test fail
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@kms_vrr@seamless-rr-switch-drrs.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-1/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@perf@mi-rpc.html> (i915#2434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@perf@mi-rpc.html> (i915#2434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>   *
> 
>     igt@perf_pmu@busy-check-all@bcs0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@perf_pmu@busy-check-all@bcs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>) +3 other tests fail
>   *
> 
>     igt@perf_pmu@busy-check-all@rcs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-mtlp-1/igt@perf_pmu@busy-check-all@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-5/igt@perf_pmu@busy-check-all@rcs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>) +2 other tests fail
>   *
> 
>     igt@perf_pmu@busy-check-all@vcs1:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-17/igt@perf_pmu@busy-check-all@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-14/igt@perf_pmu@busy-check-all@vcs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>) +3 other tests fail
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-8/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8807 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807>)
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#9351 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-18/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@prime_vgem@coherency-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>   *
> 
>     igt@syncobj_wait@invalid-wait-zero-handles:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-7/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-9/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-4/igt@device_reset@unbind-reset-rebind.html> (i915#5507 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5507>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-tglu-5/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-tglu-6/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random@lmem0:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random@lmem0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-mtlp-6/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html> +1 other test pass
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
> 
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html> (i915#5956 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-glk2/igt@kms_cursor_legacy@torture-bo@pipe-a.html> (i915#10166 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-glk3/igt@kms_cursor_legacy@torture-bo@pipe-a.html>
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
> 
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-2/igt@kms_pm_rpm@dpms-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html> +3 other tests pass
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html> (i915#10446 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10446>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-snb7/igt@kms_content_protection@uevent.html> (i915#8816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-snb5/igt@kms_content_protection@uevent.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +2 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html> (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>   *
> 
>     igt@kms_psr@fbc-pr-basic:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-11/igt@kms_psr@fbc-pr-basic.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-2/igt@kms_psr@fbc-pr-basic.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +9 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7928/shard-dg2-10/igt@kms_psr@fbc-pr-primary-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11423/shard-dg2-11/igt@kms_psr@fbc-pr-primary-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +7 other tests skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7928 -> IGTPW_11423
> 
> CI-20190529: 20190529
> CI_DRM_15086: cf52b34c47ed2a05c46193f0b9807ffd8838dbd8 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11423: 11423
> IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
