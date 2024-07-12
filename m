Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E1C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9143C10EC62;
	Fri, 12 Jul 2024 08:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE8WPijU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319510EC62
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720773584; x=1752309584;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xA73aaAPzHlGLDg/hdEi8BQcoEDPBP8uzlp07596j5g=;
 b=aE8WPijUvmDZwxlgwoQjVIQIIEy0aEkYN0af/D+IODgbhxJ367fDtCwx
 j75+M3tB11Lnb5NgcGtZI7fEx7fxsadFSlkbCA9cgKmlOzdyiGMcuDOOT
 PoHkvOziUpMG4f5US08aLHCATpaG9b49d4SBTuh1J6XpvMLXziId0kcBR
 Iq5htf5qJ2R11EJfHyQzApf2UFl39RyPDtkjxzpJ6OGiVo0K6KEBC0H5X
 g6lgyvIikRIfL4+ua1cUIIlTAFKtF+WlmdluQZ+TUH2Ezvy2j3WZPFXBt
 shfmwMKkS3azApjimGYeD4KKLqGnx2+nAwqi9CnYiYoutdaGkbw1w5Dge g==;
X-CSE-ConnectionGUID: XHleezGMSjOR6AXIn9XT7A==
X-CSE-MsgGUID: Yle6epCLTbqFIkz5RDyhHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35747786"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35747786"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:39:44 -0700
X-CSE-ConnectionGUID: WgLgXmvlTau31rIYtevlhw==
X-CSE-MsgGUID: 3fZkPQTjR6en5mph3t9zLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53152146"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.122])
 ([10.246.0.122])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:39:42 -0700
Message-ID: <597ddd98-641c-429e-b605-79da64dcfbde@linux.intel.com>
Date: Fri, 12 Jul 2024 10:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel-?=
 =?UTF-8?Q?ci/xe=2Eblocklist=3A_Blocklist_SR-IOV_stress_tests?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240711151437.996509-1-marcin.bernatowicz@linux.intel.com>
 <172074985465.165706.5851892156554153589@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172074985465.165706.5851892156554153589@2413ebb6fbb6>
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



On 7/12/2024 4:04 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
> *URL:*	https://patchwork.freedesktop.org/series/136001/ 
> <https://patchwork.freedesktop.org/series/136001/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_15064_full -> IGTPW_11401_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11401_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11401_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/index.html
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
> IGTPW_11401_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_exec_big@single:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-tglu-7/igt@gem_exec_big@single.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-5/igt@gem_exec_big@single.html>
>   *
> 
>     igt@gem_workarounds@suspend-resume-context:
> 
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-3/igt@gem_workarounds@suspend-resume-context.html>
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-18/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html>
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-8/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-5/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html>
> 


Not related to the change.

Regards,
marcin

> 
>     Known issues
> 
> Here are the changes found in IGTPW_11401_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-keep-cache:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@api_intel_bb@blit-reloc-keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@api_intel_bb@blit-reloc-purge-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-9/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@drm_fdinfo@busy-check-all@bcs0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@drm_fdinfo@busy-check-all@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +10 other tests skip
>   *
> 
>     igt@drm_fdinfo@busy-idle@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-5/igt@drm_fdinfo@busy-idle@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +13 other tests skip
>   *
> 
>     igt@drm_fdinfo@busy@bcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-7/igt@drm_fdinfo@busy@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +5 other tests skip
>   *
> 
>     igt@drm_fdinfo@idle@rcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@drm_fdinfo@idle@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html> (i915#6335 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>   *
> 
>     igt@gem_ctx_persistence@hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@gem_ctx_persistence@hang.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-many:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-stop:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-stop.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_exec_balancer@bonded-dual:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@gem_exec_balancer@bonded-dual.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@gem_exec_balancer@sliced.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@gem_exec_fair@basic-deadline.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +6 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@gem_exec_fair@basic-none-rrul.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +2 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-none@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +2 other tests fail
>   *
> 
>     igt@gem_exec_fair@basic-throttle:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_exec_fair@basic-throttle.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>) +2 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_exec_fair@basic-throttle@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +2 other tests fail
>   *
> 
>     igt@gem_exec_fence@concurrent:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-4/igt@gem_exec_fence@concurrent.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_fence@submit:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@gem_exec_fence@submit.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +17 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-gtt-noreloc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +14 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read-active:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-1/igt@gem_exec_reloc@basic-wc-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +2 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +7 other tests skip
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-random@lmem0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-17/igt@gem_lmem_swapping@heavy-random@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@gem_lmem_swapping@heavy-random@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@massive-random:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk3/igt@gem_lmem_swapping@massive-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +4 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg1: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs@lmem0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@gem_lmem_swapping@verify-ccs@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>) +1 other test skip
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>   *
> 
>     igt@gem_mmap_gtt@big-bo-tiledx:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@gem_mmap_gtt@big-bo-tiledx.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +3 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_wc@copy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@gem_mmap_wc@copy.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +1 other test skip
>   *
> 
>     igt@gem_mmap_wc@read-write-distinct:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@gem_mmap_wc@read-write-distinct.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-prefaulted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@gem_mmap_wc@write-prefaulted.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +3 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@reads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +5 other tests skip
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk1/igt@gem_pwrite@basic-exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>   *
> 
>     igt@gem_pwrite@basic-random:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@gem_pwrite@basic-random.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_pwrite_snooped:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_pwrite_snooped.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +4 other tests skip
>   *
> 
>     igt@gem_pxp@create-regular-context-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-9/igt@gem_pxp@create-regular-context-1.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@display-protected-crc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@gem_pxp@display-protected-crc.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +5 other tests skip
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-2.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_readwrite@read-bad-handle:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-4/igt@gem_readwrite@read-bad-handle.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html> (i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +4 other tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@gem_set_tiling_vs_gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@gem_set_tiling_vs_gtt.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@gem_set_tiling_vs_gtt.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +10 other tests skip
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@dmabuf-unsync:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +4 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-7/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@readonly-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-1/igt@gem_userptr_blits@readonly-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@relocations:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-3/igt@gem_userptr_blits@relocations.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-5/igt@gem_userptr_blits@relocations.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4958 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk1/igt@gen9_exec_parse@allowed-single.html> (i915#5566 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566>)
>   *
> 
>     igt@gen9_exec_parse@batch-zero-length:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-6/igt@gen9_exec_parse@batch-zero-length.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-start-cmd:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@gen9_exec_parse@bb-start-cmd.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +4 other tests skip
>   *
> 
>     igt@gen9_exec_parse@unaligned-jump:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-6/igt@gen9_exec_parse@unaligned-jump.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@gen9_exec_parse@valid-registers.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@gen9_exec_parse@valid-registers.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +5 other tests skip
>   *
> 
>     igt@i915_fb_tiling:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@i915_fb_tiling.html> (i915#4881 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@i915_pm_freq_mult@media-freq@gt0.html> (i915#6590 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence@gt0:
> 
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence@gt0.html> (i915#2681 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>)
>   *
> 
>     igt@i915_pm_rps@thresholds@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@i915_pm_rps@thresholds@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_rps@waitboost:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@i915_pm_rps@waitboost.html> (i915#8346 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@test-query-geometry-subslices:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html> (i915#5723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@i915_query@test-query-geometry-subslices.html> (i915#5723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html> (i915#10031 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10031> / i915#11279 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11279>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>)
>   *
> 
>     igt@kms_addfb_basic@bo-too-small-due-to-tiling:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +3 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +7 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_big_fb@linear-32bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html> +8 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +6 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_big_joiner@invalid-modeset.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-d-hdmi-a-2.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +156 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +103 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +67 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>) +1 other test skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html> (i915#4087 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +10 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-single:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-6/igt@kms_chamelium_frames@hdmi-crc-single.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-after-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +7 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_content_protection@atomic.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_content_protection@dp-mst-type-1.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-1/igt@kms_content_protection@legacy.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@kms_content_protection@lic-type-1.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_content_protection@mei-interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> (i915#9809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> +33 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html> (i915#9067 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_display_modes@mst-extended-mode-negative.html> (i915#8588 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html> (i915#8812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_dsc@dsc-fractional-bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840> / i915#9053 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html> (i915#3955 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-1/igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html> (i915#9337 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_feature_discovery@dp-mst.html> (i915#9337 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-4/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> +10 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-9/igt@kms_flip@2x-flip-vs-suspend.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +8 other tests skip
>   *
> 
>     igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) +1 other test fail
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-snb4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) +1 other test fail
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-snb4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html> (i915#10826 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> +52 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +31 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +49 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html> +19 other tests skip
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-1/igt@kms_hdr@static-swap.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_panel_fitting@atomic-fastset.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html> (i915#7862 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862>) +1 other test fail
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-2/igt@kms_plane_lowres@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8821 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-5/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-2.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-hdmi-a-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +5 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_pm_backlight@bad-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@kms_pm_dc@dc3co-vpb-simulation.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_pm_dc@dc5-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +2 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@kms_pm_dc@dc6-dpms.html> (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +2 other tests skip
>   *
> 
>     igt@kms_prime@basic-crc-vgem:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_prime@basic-crc-vgem.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +7 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-4/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1.html> (i915#9808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +2 other tests skip
>   *
> 
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_psr2_su@page_flip-nv12.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-3/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-plane-move:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-2/igt@kms_psr@pr-cursor-plane-move.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +4 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_psr@pr-sprite-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +24 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-6/igt@kms_psr@pr-sprite-render.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-mmap-cpu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@kms_psr@psr2-primary-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +26 other tests skip
>   *
> 
>     igt@kms_psr@psr2-sprite-plane-onoff:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk7/igt@kms_psr@psr2-sprite-plane-onoff.html> +336 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-center.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@kms_vrr@flip-dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@kms_vrr@negative-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk3/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#9351 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351>)
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-15/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-5/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@syncobj_wait@invalid-wait-zero-handles:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-glk2/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@virtual-idle:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-18/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-14/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-5/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html> +2 other tests pass
>   *
> 
>     igt@i915_module_load@reload-no-display:
> 
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-snb2/igt@i915_module_load@reload-no-display.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-snb4/igt@i915_module_load@reload-no-display.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html>
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-tglu-8/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2876 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2876>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#9697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html> (i915#4281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-rkl-2/igt@kms_pm_dc@dc9-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>   *
> 
>     igt@kms_psr@psr-cursor-render:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-4/igt@kms_psr@psr-cursor-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@kms_psr@psr-cursor-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-render:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg1-17/igt@kms_psr@psr-sprite-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg1-18/igt@kms_psr@psr-sprite-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>   *
> 
>     igt@kms_psr@psr2-cursor-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-2/igt@kms_psr@psr2-cursor-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-11/igt@kms_rotation_crc@bad-tiling.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-10/igt@kms_rotation_crc@bad-tiling.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15064/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11401/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7924 -> IGTPW_11401
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_15064: e07122bf67b924e3cf597c65a6fb6b36b394f069 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11401: 11401
> IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
