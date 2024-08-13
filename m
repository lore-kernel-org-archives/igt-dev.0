Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2CAC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 07:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54B10E2CD;
	Tue, 13 Aug 2024 07:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ata6tFuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D4910E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 07:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723533228; x=1755069228;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UuacMs5slVWjzPYXF34uGjm79KReH4Z6eumS1vDsY9g=;
 b=Ata6tFuIbPTFUZY3l4QZGqYFTUWL8Osh7V27wZT7lpME1tzJEVMzA/Jo
 Qxjx24BhW3q/3efDnS7Mss36bp0eXU2PzJqGlOBI5iOFMg+sFuOm1n9di
 Q9MEORcxnIaATYyypFJ7aCtwgRFhFOagj07Re7GPcXJJy/Z5MyE9wJzCs
 2Za6SpR19SyN+/fzlETl68+U5yPZ2FL7d7a6By4kofL8G6oGHJSw5kV7c
 6SIdjbpumo+Q+Zp2ylW+hvCCen6soZH6xWmPjcnvm0JMhRCTgASu7MbXm
 viE8+4WrtkE1eiLWVGCtkbu+wTQzzuP0aabNnsSWvzk0N6YYbLJEriwFK g==;
X-CSE-ConnectionGUID: mWlIlZPeRyeE5sd0dGvoZg==
X-CSE-MsgGUID: TCjD5koVQQ+N0wqkTmxS5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21493374"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21493374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:12:04 -0700
X-CSE-ConnectionGUID: 48TRioiLTRWiM2CWAHKI5w==
X-CSE-MsgGUID: uFKIbrczTZ+iGs/nkw56zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63264363"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.96.225])
 ([10.245.96.225])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 00:12:01 -0700
Message-ID: <5dbd1fcc-149d-4c34-a9d1-655e74d9949e@linux.intel.com>
Date: Tue, 13 Aug 2024 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fhuc=5Fcopy=3A_Enhance_HuC_status_check_for_VF_mode?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20240812180812.1310155-1-marcin.bernatowicz@linux.intel.com>
 <172353160394.597321.18024494226008374663@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172353160394.597321.18024494226008374663@2413ebb6fbb6>
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



On 8/13/2024 8:46 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_huc_copy: Enhance HuC status check for VF mode
> *URL:*	https://patchwork.freedesktop.org/series/137198/ 
> <https://patchwork.freedesktop.org/series/137198/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_15220_full -> IGTPW_11559_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11559_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11559_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/index.html
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
> IGTPW_11559_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_exec_balancer@individual:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_exec_balancer@individual.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-1/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html>
> 

Not related to the change. This change is isolated to the xe_huc_copy 
and does not impact other tests.

Regards,
marcin

> 
>     Known issues
> 
> Here are the changes found in IGTPW_11559_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-10/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@device_reset@unbind-cold-reset-rebind:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@device_reset@unbind-cold-reset-rebind.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@drm_fdinfo@busy-idle@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@drm_fdinfo@busy-idle@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +22 other tests skip
>   *
> 
>     igt@drm_fdinfo@busy-idle@vecs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@drm_fdinfo@busy-idle@vecs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +6 other tests skip
>   *
> 
>     igt@drm_fdinfo@isolation@vecs0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@drm_fdinfo@isolation@vecs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +10 other tests skip
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) +2 other tests skip
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>) +1 other test skip
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) +1 other test skip
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) +1 other test skip
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@gem_create@create-ext-cpu-access-big.html> (i915#6335 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@gem_create@create-ext-cpu-access-big.html> (i915#9846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846>)
>   *
> 
>     igt@gem_create@create-ext-set-pat:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_create@create-ext-set-pat.html> (i915#8562 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@gem_create@create-ext-set-pat.html> (i915#8562 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-hostile:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hostile.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-args:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@gem_ctx_sseu@invalid-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_exec_balancer@bonded-sync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@gem_exec_balancer@bonded-sync.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>   *
> 
>     igt@gem_exec_balancer@invalid-bonds:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html> (i915#4036 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@gem_exec_balancer@parallel-ordering.html> (i915#6117 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6117>)
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gem_exec_fair@basic-deadline.html> (i915#4473 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>) +1 other test skip
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@gem_exec_fair@basic-none-rrul.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +1 other test skip
>   *
> 
>     igt@gem_exec_fair@basic-none@bcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +8 other tests fail
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-throttle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_exec_fair@basic-throttle.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>) +1 other test skip
>   *
> 
>     igt@gem_exec_fence@concurrent:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gem_exec_fence@concurrent.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_fence@submit3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@gem_exec_fence@submit3.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_flush@basic-uc-pro-default:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +2 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-concurrent0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_exec_reloc@basic-concurrent0.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +8 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +3 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-scanout:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@gem_exec_reloc@basic-scanout.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +6 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@gem_exec_reloc@basic-wc-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +8 other tests skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts-chain.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-contexts-chain.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-y:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-y.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +1 other test skip
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +5 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@gem_lmem_swapping@parallel-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@gem_lmem_swapping@verify.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_madvise@dontneed-before-exec:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gem_madvise@dontneed-before-exec.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_media_fill@media-fill:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@gem_media_fill@media-fill.html> (i915#8289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289>)
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@gem_media_vme.html> (i915#284 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>   *
> 
>     igt@gem_mmap_gtt@basic-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_mmap_gtt@basic-wc.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +4 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-medium-copy-odd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +10 other tests skip
>   *
> 
>     igt@gem_mmap_wc@invalid-flags:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_mmap_wc@invalid-flags.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +1 other test skip
>   *
> 
>     igt@gem_mmap_wc@read-write:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gem_mmap_wc@read-write.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-cpu-read-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@gem_mmap_wc@write-cpu-read-wc.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +3 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@write:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@gem_partial_pwrite_pread@write.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_pxp@fail-invalid-protected-context:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@gem_pxp@fail-invalid-protected-context.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-on:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-on.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other tests skip
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-execution:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@gem_pxp@verify-pxp-stale-buf-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-4/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +3 other tests skip
>   *
> 
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +4 other tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +3 other tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@gem_tiled_partial_pwrite_pread@writes.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +17 other tests skip
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-9/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@gem_userptr_blits@create-destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@gem_userptr_blits@create-destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#3323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@gem_userptr_blits@forbidden-operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@gem_userptr_blits@readonly-pwrite-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +2 other tests skip
>   *
> 
>     igt@gem_userptr_blits@relocations:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@gem_userptr_blits@relocations.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +4 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-large:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@gen9_exec_parse@bb-large.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>   *
> 
>     igt@gen9_exec_parse@bb-secure:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-10/igt@gen9_exec_parse@bb-secure.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-start-param:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@gen9_exec_parse@bb-start-param.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@gen9_exec_parse@shadow-peek.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +1 other test skip
>   *
> 
>     igt@i915_fb_tiling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@i915_fb_tiling.html> (i915#4881 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>)
>   *
> 
>     igt@i915_module_load@load:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@i915_module_load@resize-bar.html> (i915#7178 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178>)
>   *
> 
>     igt@i915_pm_freq_api@freq-basic-api:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset-multiple:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-6/igt@i915_pm_freq_api@freq-reset-multiple.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> +14 other tests skip
>   *
> 
>     igt@i915_pm_rps@min-max-config-idle:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@i915_pm_rps@min-max-config-idle.html> (i915#11681 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681> / i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@i915_power@sanity:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@i915_power@sanity.html> (i915#7984 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>   *
> 
>     igt@i915_selftest@mock@memory_region:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk9/igt@i915_selftest@mock@memory_region.html> (i915#9311 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html> (i915#4817 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@clobberred-modifier:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_addfb_basic@clobberred-modifier.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (i915#3826 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +3 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +7 other tests skip
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#9531 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-1.html> (i915#5956 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-dp-4.html> (i915#5956 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb.html> (i915#6187 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +9 other tests skip
>   *
> 
>     igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +43 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +215 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +55 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-10/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +67 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +7 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html> (i915#4087 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html> (i915#4087 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-read:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@kms_chamelium_edid@hdmi-edid-read.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +10 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_chamelium_frames@hdmi-frame-dump.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +4 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@kms_content_protection@atomic-dpms.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_content_protection@atomic-dpms.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_content_protection@content-type-change.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-4/igt@kms_content_protection@legacy.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-1/igt@kms_content_protection@lic-type-0.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_content_protection@srm.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_content_protection@uevent.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_cursor_crc@cursor-random-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html> (i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> (i915#72 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/72>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html> (i915#9067 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@kms_display_modes@extended-mode-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html> (i915#8588 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_dp_aux_dev.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_dp_aux_dev.html> (i915#1257 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-2/igt@kms_dp_aux_dev.html> (i915#1257 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-5/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_dsc@dsc-with-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>) +1 other test skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-1/igt@kms_fbcon_fbt@fbc-suspend.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html> (i915#4767 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_fbcon_fbt@psr.html> (i915#3469 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-10/igt@kms_fbcon_fbt@psr.html> (i915#3469 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_feature_discovery@display-2x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>) +1 other test skip
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_flip@2x-flip-vs-fences.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_flip@2x-flip-vs-modeset.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-9/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@kms_flip@2x-plain-flip.html> +34 other tests skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +4 other tests skip
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg1-17/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-fences-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_flip@flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8810 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html> (i915#118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html> +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +30 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +27 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html> +25 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-rte:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +45 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +13 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@kms_getfb@getfb-reject-ccs.html> (i915#6118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118>)
>   *
> 
>     igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html> +18 other tests skip
>   *
> 
>     igt@kms_plane_lowres@tiling-none@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_plane_lowres@tiling-none@pipe-d-edp-1.html> (i915#11614 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614> / i915#3582 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>) +1 other test skip
>   *
> 
>     igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html> (i915#10226 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226> / i915#11614 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614> / i915#3582 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>) +5 other tests skip
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_plane_lowres@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8821 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_plane_multiple@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (i915#9809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_plane_scaling@intel-max-src-size.html> (i915#6953 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-3.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +28 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html> (i915#9728 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-3.html> (i915#9728 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728>) +11 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_pm_backlight@bad-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc5-dpms-negative:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@kms_pm_dc@dc5-dpms-negative.html> (i915#9293 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9293>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_pm_dc@dc6-psr.html> (i915#10139 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10139>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_pm_dc@dc6-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_pm_dc@dc6-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_pm_rpm@dpms-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +2 other tests skip
>   *
> 
>     igt@kms_prime@basic-crc-hybrid:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +5 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#4348 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_psr2_su@page_flip-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-17/igt@kms_psr@fbc-pr-cursor-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +16 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_psr@fbc-pr-primary-blt.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +8 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-mmap-gtt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@kms_psr@fbc-psr-cursor-mmap-gtt.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_psr@fbc-psr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +20 other tests skip
>   *
> 
>     igt@kms_psr@psr2-cursor-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>   *
> 
>     igt@kms_psr@psr2-cursor-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +27 other tests skip
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff@edp-1:
> 
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_psr@psr2-cursor-plane-onoff@edp-1.html> (i915#10105 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105>)
>   *
> 
>     igt@kms_psr@psr2-sprite-plane-onoff:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk6/igt@kms_psr@psr2-sprite-plane-onoff.html> +244 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-13/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-9/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg1-18/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html> (i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>) +2 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg1-18/igt@kms_sysfs_edid_timing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-18/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2> / i915#6493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_vrr@flip-suspend:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_vrr@negative-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk5/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@perf@gen8-unprivileged-single-ctx-counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>   *
> 
>     igt@perf@global-sseu-config-invalid:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-5/igt@perf@global-sseu-config-invalid.html> (i915#7387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@perf@global-sseu-config-invalid.html> (i915#7387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>   *
> 
>     igt@perf_pmu@busy-double-start@ccs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-5/igt@perf_pmu@busy-double-start@ccs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@perf_pmu@busy-double-start@ccs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>   *
> 
>     igt@perf_pmu@busy-double-start@vecs0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg1-16/igt@perf_pmu@busy-double-start@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-15/igt@perf_pmu@busy-double-start@vecs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>) +1 other test fail
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>   *
> 
>     igt@perf_pmu@event-wait@rcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-7/igt@perf_pmu@event-wait@rcs0.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8807 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807>)
>   *
> 
>     igt@perf_pmu@rc6-all-gts:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg1-16/igt@perf_pmu@rc6-all-gts.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@perf_pmu@rc6-all-gts.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-1/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-4/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-10/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-3/igt@prime_vgem@basic-write.html> (i915#10216 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>   *
> 
>     igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@syncobj_timeline@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>) +1 other test fail
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html>
>   *
> 
>     igt@gem_exec_big@single:
> 
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-tglu-10/igt@gem_exec_big@single.html> (i915#11713 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-3/igt@gem_exec_big@single.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-mtlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> (i915#11808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808> / i915#5956 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-mtlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-rkl-5/igt@kms_content_protection@mei-interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-rkl-5/igt@kms_content_protection@mei-interface.html> (i915#8063 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063>)
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-tglu-5/igt@kms_content_protection@mei-interface.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-tglu-10/igt@kms_content_protection@mei-interface.html> (i915#8063 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8063>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-snb7/igt@kms_content_protection@srm.html> (i915#8816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-snb6/igt@kms_content_protection@srm.html>
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-3/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453> / i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +6 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-mmap-gtt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_psr@fbc-pr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-2/igt@kms_psr@fbc-pr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-mmap-cpu:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-3/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html> (i915#10959 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-glk8/igt@kms_tiled_display@basic-test-pattern.html>
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15220/shard-dg2-10/igt@perf@non-zero-reason@0-rcs0.html> (i915#9100 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11559/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html> (i915#7484 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7966 -> IGTPW_11559
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_15220: 4f95bd933f4dacd22752bf8d6e548e8cc445d093 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11559: 11559
> IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
