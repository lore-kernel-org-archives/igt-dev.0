Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E564C30658
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 10:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4536610EA13;
	Fri,  5 Jul 2024 10:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR7m+V6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC04710EA22;
 Fri,  5 Jul 2024 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720174131; x=1751710131;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1Qksmo9Sw7eMjZZxrc04Mr5tKFgVyejQRlTPxQkKN/U=;
 b=DR7m+V6s8xLhFt0UsZGdQj93wa7dvX5MbdwfE0rlIjb0iddqYAjKqSHJ
 XAUhwtP1qUP1qdqpNniZYGQ5BQJSauIi9Z0oATAHJZRiky3qeA7+ZOZEA
 lNAftMdIWdhH9lzS2qLhILt04YXDE5hFuQ3dgqc/p32otql9Vi28w5TDV
 BEJnG0kk7KNbbXClWy1cdCYAe+KRB0l7dhk98DoeCVsXIrmD1bSX8olL6
 uxSPIfakQ8mZtUIUyWqpt7wIGByzub4n4mj8IlQV9MTtAOx+T21LslmWr
 GO5heJCPquIJE/0g7LvQniawTyLzs+FhKRnya2lxXGHmNmnmKeig4Odyh Q==;
X-CSE-ConnectionGUID: 02z1BxKBTP6uuQg8lXpwYQ==
X-CSE-MsgGUID: okyN13xYQyK+CXs8P5+1CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28078680"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="28078680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 03:08:50 -0700
X-CSE-ConnectionGUID: ZMtH5DGjSxWxJ9515IBuHQ==
X-CSE-MsgGUID: /v0ZSJQuQEGFIBvC9UJJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="46618305"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 03:08:49 -0700
Message-ID: <160be73c-9a17-445e-954f-0d3273119f55@linux.intel.com>
Date: Fri, 5 Jul 2024 12:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGxpYi9pZ3RfZGV2?=
 =?UTF-8?Q?ice=5Fscan=3A_Skip_attributes_in_subdirectories?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
 <172016636589.30233.15083309213267182267@2413ebb6fbb6>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <172016636589.30233.15083309213267182267@2413ebb6fbb6>
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

Hi,

On 7/5/2024 9:59 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_device_scan: Skip attributes in subdirectories
> *URL:*	https://patchwork.freedesktop.org/series/135769/ 
> <https://patchwork.freedesktop.org/series/135769/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_15034_full -> IGTPW_11372_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11372_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11372_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/index.html
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
> IGTPW_11372_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_eio@in-flight-contexts-1us:
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-snb6/igt@gem_eio@in-flight-contexts-1us.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb4/igt@gem_eio@in-flight-contexts-1us.html>

Not related to the change. Change is connected with device 
selection/filtering, so either wrong or no device issue would be hit,
which does not happen in this and any other tests.

Regards,
marcin

> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11372_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@object-reloc-keep-cache:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@api_intel_bb@object-reloc-keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@device_reset@unbind-reset-rebind.html> (i915#9413 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413>)
>   *
> 
>     igt@drm_fdinfo@all-busy-idle-check-all:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@drm_fdinfo@all-busy-idle-check-all.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@bcs0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@drm_fdinfo@most-busy-check-all@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +10 other tests skip
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_busy@semaphore:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@gem_busy@semaphore.html> (i915#3936 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936>)
>   *
> 
>     igt@gem_ccs@block-multicopy-inplace:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>) +1 other test skip
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>)
>   *
> 
>     igt@gem_ctx_persistence@engines-hang:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb7/igt@gem_ctx_persistence@engines-hang.html> (i915#1099 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>   *
> 
>     igt@gem_ctx_persistence@hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@gem_ctx_persistence@hang.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-many:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-many.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_exec_balancer@bonded-sync:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@bonded-true-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@gem_exec_balancer@bonded-true-hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-in-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gem_exec_capture@capture@vecs0-lmem0.html> (i915#10386 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10386>) +1 other test fail
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-2/igt@gem_exec_fair@basic-deadline.html> (i915#4473 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@gem_exec_fair@basic-deadline.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk7/igt@gem_exec_fair@basic-none-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +2 other tests fail
>   *
> 
>     igt@gem_exec_fence@submit3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gem_exec_fence@submit3.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_flush@basic-uc-prw-default:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-14/igt@gem_exec_flush@basic-uc-prw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>) +1 other test skip
>   *
> 
>     igt@gem_exec_flush@basic-uc-rw-default:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_exec_flush@basic-uc-rw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +2 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-7/igt@gem_exec_reloc@basic-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-concurrent0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gem_exec_reloc@basic-concurrent0.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +10 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +7 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-copy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@gem_fence_thrash@bo-copy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +4 other tests skip
>   *
> 
>     igt@gem_lmem_evict@dontneed-evict-race:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613> / i915#7582 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>   *
> 
>     igt@gem_lmem_swapping@basic@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@massive:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk3/igt@gem_lmem_swapping@massive.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@gem_mmap_gtt@medium-copy-odd:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_mmap_gtt@medium-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +18 other tests skip
>   *
> 
>     igt@gem_mmap_wc@close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_mmap_wc@close.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@set-cache-level:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-5/igt@gem_mmap_wc@set-cache-level.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@gem_mmap_wc@set-cache-level.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_partial_pwrite_pread@reads-uncached:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-7/igt@gem_partial_pwrite_pread@reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +5 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +4 other tests skip
>   *
> 
>     igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@gem_pxp@regular-baseline-src-copy-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +3 other tests skip
>   *
> 
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +3 other tests skip
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +1 other test skip
>   *
> 
>     igt@gem_set_tiling_vs_gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_userptr_blits@sd-probe.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4958 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-cycles.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@gem_userptr_blits@unsync-unmap-cycles.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@gem_userptr_blits@unsync-unmap-cycles.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gen9_exec_parse@batch-invalid-length:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@gen9_exec_parse@batch-invalid-length.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-oversize:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +3 other tests skip
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@i915_pm_freq_mult@media-freq@gt0.html> (i915#6590 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591>)
>   *
> 
>     igt@i915_pm_rps@thresholds-idle-park@gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@query-topology-coherent-slice-mask:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@i915_query@query-topology-coherent-slice-mask.html> (i915#6188 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188>)
>   *
> 
>     igt@i915_query@test-query-geometry-subslices:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html> (i915#5723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>   *
> 
>     igt@i915_selftest@mock@memory_region:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk4/igt@i915_selftest@mock@memory_region.html> (i915#9311 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html> (i915#10031 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10031> / i915#11279 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11279>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +7 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-rc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +1 other test skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +11 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +9 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_big_fb@linear-32bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +5 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_big_joiner@basic.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_big_joiner@basic-force-joiner:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_big_joiner@basic-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +91 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +49 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-dp-4.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +156 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +2 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-d-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-dp-4.html> (i915#4087 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_chamelium_color@degamma.html> +7 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_content_protection@atomic-dpms.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_content_protection@content-type-change.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_content_protection@mei-interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453> / i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_cursor_crc@cursor-random-512x512.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html> (i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +6 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html> (i915#9067 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@torture-move@pipe-a:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-tglu-9/igt@kms_cursor_legacy@torture-move@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-5/igt@kms_cursor_legacy@torture-move@pipe-a.html> (i915#10166 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166> / i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +6 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a2:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a2.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) +2 other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> +51 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html> +30 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +41 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +22 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html> +13 other tests skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_hdr@invalid-hdr.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-7/igt@kms_hdr@static-swap.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-tglu-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html> (i915#10159 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-tglu-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982> / i915#8797 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8797>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb6/igt@kms_plane_scaling@intel-max-src-size.html> +31 other tests skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi-a-3.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423> / i915#9728 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +19 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_pm_backlight@fade-with-dpms.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@kms_pm_dc@dc3co-vpb-simulation.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_pm_dc@dc5-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_rpm@fences-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@kms_pm_rpm@fences-dpms.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-7/igt@kms_pm_rpm@i2c.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@kms_pm_rpm@i2c.html> (i915#8717 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-11/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>   *
> 
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-sf.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html> (i915#11520 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>) +5 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-render:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-8/igt@kms_psr@fbc-psr-cursor-render.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@kms_psr@fbc-psr2-sprite-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_psr@pr-cursor-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +20 other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-plane-onoff:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_psr@pr-cursor-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +19 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_psr@psr-sprite-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +1 other test skip
>   *
> 
>     igt@kms_psr@psr2-sprite-plane-onoff:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html> +169 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>) +1 other test skip
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-full:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-snb5/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb6/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>) +1 other test fail
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg1-17/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-4.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>) +1 other test skip
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@perf@mi-rpc.html> (i915#2434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>   *
> 
>     igt@perf_pmu@rc6-all-gts:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-16/igt@perf_pmu@rc6-all-gts.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>) +1 other test skip
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-5/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-13/igt@prime_vgem@basic-fence-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-14/igt@prime_vgem@coherency-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>   *
> 
>     igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-glk7/igt@syncobj_timeline@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>   *
> 
>     igt@syncobj_wait@invalid-wait-zero-handles:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-2/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html> (i915#7297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7297>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html>
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-2/igt@gem_eio@kms.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-5/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>   *
> 
>     igt@gem_lmem_swapping@heavy-random@lmem0:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg1-16/igt@gem_lmem_swapping@heavy-random@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg1-15/igt@gem_lmem_swapping@heavy-random@lmem0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-snb: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-6/igt@kms_dp_aux_dev.html> (i915#1257 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_dp_aux_dev.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html>
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-7/igt@kms_hdmi_inject@inject-audio.html> (i915#433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_hdmi_inject@inject-audio.html>
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html> (i915#4281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-2/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-10/igt@kms_pm_rpm@modeset-lpsp.html> +1 other test pass
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html> +1 other test pass
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-2/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_sysfs_edid_timing.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-snb6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html> (i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-mc-ccs:
> 
>       o shard-mtlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-mtlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-mc-ccs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-mtlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-edp-1-4-mc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (i915#11453 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11453> / i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +2 other tests skip
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4070 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070> / i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-rkl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>   *
> 
>     igt@kms_psr@fbc-psr-primary-page-flip:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-11/igt@kms_psr@fbc-psr-primary-page-flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-6/igt@kms_psr@fbc-psr-primary-page-flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-mmap-cpu:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-5/igt@kms_psr@psr-cursor-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_psr@psr-cursor-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +18 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_rotation_crc@primary-rotation-270.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (i915#11131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11131> / i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>) +2 other tests skip
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15034/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html> (i915#9100 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11372/shard-dg2-4/igt@perf@non-zero-reason@0-rcs0.html> (i915#7484 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7916 -> IGTPW_11372
> 
> CI-20190529: 20190529
> CI_DRM_15034: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11372: 11372
> IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
