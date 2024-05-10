Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBFC25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 08:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FF610E32F;
	Fri, 10 May 2024 08:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vspmz2oL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48210E144;
 Fri, 10 May 2024 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715330141; x=1746866141;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=wxqlvsxEkeZKer5clXqF5uPZVGjagNkrwvqh4lgjPac=;
 b=Vspmz2oLl79ijl872ahVtjvU35EF4vfFk2R2bRvA719PuEKl/K6fOsoQ
 M8e3c6cbpEBV1wYmubzZ6YVl71v54+QA/oCqGrPOL4x83GQUYsPp39axP
 +jk0ntuneTSA5mL6dtaVG+UnuAs6q060phq/79tJOh7DVDZ7EklSLvTiC
 iTqJ9L1G8jhIer/fHmfANQotRSzhsQIlXsoexPXTatMZb2GtuCUGGx6TL
 4o+VhwzO5Gq0SkJPW9zwRF1KiSHTrN3cO9Uic8//815CJb42pC558l+ik
 sbvsLmF6939s5mkJ4dilNZ4jbm/IL80VxvgzLjG3obF72AQ7PNs0IH7Sy w==;
X-CSE-ConnectionGUID: /Z0W0AkUQuOqOlP9zPIVpw==
X-CSE-MsgGUID: bjdDRVFlTHu71n0yqaataQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21971924"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="21971924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:35:41 -0700
X-CSE-ConnectionGUID: s8WcI4FPRQ6n7TkBbODIRw==
X-CSE-MsgGUID: J2nBhyHESyW7ONvVgumEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29504613"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.28.172])
 ([10.246.28.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 01:35:39 -0700
Message-ID: <b3d9f2bd-7830-4a6b-abe4-6fbf75e36548@linux.intel.com>
Date: Fri, 10 May 2024 10:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rfc3Jp?=
 =?UTF-8?Q?ov=5Fdevice=3A_Adjust_the_igt=5Fsriov=5Fis=5Fpf_function?=
To: igt-dev@lists.freedesktop.org
References: <20240509141556.4128166-1-marcin.bernatowicz@linux.intel.com>
 <171530586005.2038581.5437987462083585853@8e613ede5ea5>
Content-Language: en-US
Cc: I915-ci-infra@lists.freedesktop.org
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <171530586005.2038581.5437987462083585853@8e613ede5ea5>
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



On 5/10/2024 3:51 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_sriov_device: Adjust the igt_sriov_is_pf function
> *URL:*	https://patchwork.freedesktop.org/series/133390/ 
> <https://patchwork.freedesktop.org/series/133390/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7845_full -> IGTPW_11119_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11119_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11119_full, please notify your bug team 
> ('I915-ci-infra@lists.freedesktop.org') to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/index.html
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
> IGTPW_11119_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@core_getversion@basic:
> 
>       o shard-tglu: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-8/igt@core_getversion@basic.html>
>   *
> 
>     igt@gem_exec_schedule@u-fairslice-all:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-mtlp-2/igt@gem_exec_schedule@u-fairslice-all.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-3/igt@gem_exec_schedule@u-fairslice-all.html>
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg1-15/igt@perf@non-zero-reason@0-rcs0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@perf@non-zero-reason@0-rcs0.html>

Not related to the change.

Regards,
Marcin

> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11119_full that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-3/igt@api_intel_bb@blit-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>   *
> 
>     igt@api_intel_bb@object-reloc-purge-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>) +2 other tests skip
>   *
> 
>     igt@drm_fdinfo@idle@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-rkl-5/igt@drm_fdinfo@idle@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@drm_fdinfo@idle@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>   *
> 
>     igt@drm_fdinfo@isolation@vecs0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@drm_fdinfo@isolation@vecs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +5 other tests skip
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>   *
> 
>     igt@drm_fdinfo@virtual-busy-idle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>)
>   *
> 
>     igt@gem_ctx_freq@sysfs@gt0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-6/igt@gem_ctx_freq@sysfs@gt0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@gem_ctx_freq@sysfs@gt0.html> (i915#9561 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-stop:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-stop.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>) +1 other test skip
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@gem_ctx_sseu@engines.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@gem_ctx_sseu@engines.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_eio@hibernate:
> 
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@gem_eio@hibernate.html> (i915#10030 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030> / i915#7975 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213>)
>   *
> 
>     igt@gem_eio@reset-stress:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg1-15/igt@gem_eio@reset-stress.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@gem_eio@reset-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>   *
> 
>     igt@gem_exec_balancer@bonded-semaphore:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@gem_exec_balancer@bonded-semaphore.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@gem_exec_balancer@sliced.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@gem_exec_capture@capture-invisible@lmem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk7/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html> (i915#6344 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>   *
> 
>     igt@gem_exec_fair@basic-none@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +4 other tests fail
>   *
> 
>     igt@gem_exec_fair@basic-pace-share:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@gem_exec_fair@basic-pace-share.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +2 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-6/igt@gem_exec_fair@basic-pace@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +2 other tests fail
>   *
> 
>     igt@gem_exec_flush@basic-uc-set-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@gem_exec_flush@basic-uc-set-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>) +1 other test skip
>   *
> 
>     igt@gem_exec_flush@basic-wb-set-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@gem_exec_flush@basic-wb-set-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +2 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-scanout:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@gem_exec_reloc@basic-scanout.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +7 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read-active:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@gem_exec_reloc@basic-wc-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +11 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-contexts:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_schedule@reorder-wide:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@gem_exec_schedule@reorder-wide.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +3 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-none:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-none.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-threaded-none.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk2/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-random:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@gem_lmem_swapping@heavy-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@heavy-random@lmem0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@gem_lmem_swapping@heavy-random@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-2/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +2 other tests skip
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk7/igt@gem_lmem_swapping@verify-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +5 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@basic-wc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@gem_mmap_gtt@basic-wc.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +1 other test skip
>   *
> 
>     igt@gem_mmap_gtt@big-copy-xy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@gem_mmap_gtt@big-copy-xy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +8 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@medium-copy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@gem_mmap_gtt@medium-copy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@gem_mmap_wc@close.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-6/igt@gem_mmap_wc@close.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>   *
> 
>     igt@gem_mmap_wc@write-prefaulted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@gem_mmap_wc@write-prefaulted.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +2 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@reads-snoop:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-snoop.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@reads-uncached:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@create-valid-protected-context:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@gem_pxp@create-valid-protected-context.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-off-2.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other tests skip
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-9/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-3/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html> (i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +4 other tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@gem_set_tiling_vs_pwrite:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +9 other tests skip
>   *
> 
>     igt@gem_tiled_pread_pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@gem_tiled_pread_pwrite.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +2 other tests skip
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-3/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@dmabuf-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@gem_userptr_blits@dmabuf-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-after-close.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@gen9_exec_parse@allowed-single.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +3 other tests skip
>   *
> 
>     igt@gen9_exec_parse@batch-invalid-length:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +3 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-far:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@gen9_exec_parse@bb-start-far.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@shadow-peek:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@gen9_exec_parse@shadow-peek.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +3 other tests skip
>   *
> 
>     igt@i915_module_load@load:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk5/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-2/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html> (i915#10047 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html> (i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820> / i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>)
>   *
> 
>     igt@i915_pm_freq_api@freq-basic-api:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>) +1 other test skip
>   *
> 
>     igt@i915_pm_rps@thresholds-park@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-7/igt@i915_pm_rps@thresholds-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-5/igt@i915_selftest@live@hangcheck.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@i915_selftest@live@hangcheck.html> (i915#9840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9840>)
>   *
> 
>     igt@i915_selftest@mock@memory_region:
> 
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk8/igt@i915_selftest@mock@memory_region.html> (i915#9311 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@intel_hwmon@hwmon-write.html> (i915#7707 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@intel_hwmon@hwmon-write.html> (i915#7707 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>) +1 other test skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +11 other tests skip
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@kms_async_flips@invalid-async-flip.html> (i915#6228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228>)
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#9531 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html> (i915#3763 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3763> / i915#5138 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_big_fb@linear-8bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +8 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic-force-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@kms_big_joiner@basic-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +4 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-4.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +107 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +130 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +71 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>)
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-6/igt@kms_cdclk@mode-transition.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html> (i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@kms_chamelium_audio@dp-audio.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +8 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +8 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_content_protection@atomic.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@kms_content_protection@legacy.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_content_protection@lic-type-1.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@kms_content_protection@lic-type-1.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-8/igt@kms_content_protection@lic-type-1.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x21:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html> (i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html> (i915#9809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +28 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@single-move@pipe-a:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-mtlp-1/igt@kms_cursor_legacy@single-move@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@kms_cursor_legacy@single-move@pipe-a.html> (i915#10166 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@kms_dsc@dsc-with-bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html> (i915#3955 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-4/igt@kms_feature_discovery@display-2x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>) +1 other test skip
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>) +1 other test skip
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@kms_feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@kms_flip@2x-flip-vs-fences.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@kms_flip@2x-flip-vs-modeset.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637> / i915#3966 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3966>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html> +14 other tests skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@kms_flip@2x-wf_vblank-ts-check.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +2 other tests skip
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +38 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (i915#10055 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (i915#10055 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html> +35 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_hdr@static-swap.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_hdr@static-toggle-dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-4/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4070 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070> / i915#4816 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@kms_panel_fitting@legacy.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html> (i915#10647 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +1 other test fail
>   *
> 
>     igt@kms_plane_lowres@tiling-4:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-6/igt@kms_plane_lowres@tiling-4.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8821 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821>)
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_plane_multiple@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-3.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +15 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_pm_backlight@fade-with-suspend.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_pm_backlight@fade-with-suspend.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_pm_dc@dc3co-vpb-simulation.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +2 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html> (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_rpm@cursor:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg1-18/igt@kms_pm_rpm@cursor.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-15/igt@kms_pm_rpm@cursor.html> (i915#10553 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_prime@basic-crc-vgem:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_prime@basic-crc-vgem.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html> +48 other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_psr2_su@page_flip-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_psr2_su@page_flip-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-3/igt@kms_psr@fbc-pr-cursor-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +20 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-dpms:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-7/igt@kms_psr@fbc-pr-dpms.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +3 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@kms_psr@fbc-psr-dpms.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +8 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@kms_psr@psr-primary-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +16 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-mmap-gtt@edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-1/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077> / i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>   *
> 
>     igt@kms_psr@psr2-sprite-blt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_psr@psr2-sprite-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +23 other tests skip
>   *
> 
>     igt@kms_psr@psr2-sprite-plane-onoff:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk5/igt@kms_psr@psr2-sprite-plane-onoff.html> +340 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-tiling:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>) +1 other test skip
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-17/igt@kms_writeback@writeback-invalid-parameters.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-7/igt@kms_writeback@writeback-invalid-parameters.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-4/igt@kms_writeback@writeback-invalid-parameters.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk5/igt@kms_writeback@writeback-pixel-formats.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@perf@gen8-unprivileged-single-ctx-counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436> / i915#7387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>   *
> 
>     igt@perf@per-context-mode-unprivileged:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@perf@per-context-mode-unprivileged.html> (i915#2433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-8/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>   *
> 
>     igt@perf_pmu@frequency@gt0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@perf_pmu@frequency@gt0.html> (i915#6806 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806>)
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@perf_pmu@module-unload.html> (i915#10537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10537> / i915#5793 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5793>)
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-13/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-1/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-8/igt@prime_vgem@coherency-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>   *
> 
>     igt@prime_vgem@fence-write-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-6/igt@prime_vgem@fence-write-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-10/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-14/igt@sriov_basic@enable-vfs-bind-unbind-each.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@sriov_basic@enable-vfs-bind-unbind-each.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@syncobj_wait@invalid-wait-zero-handles:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9779 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9779>)
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-glk7/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9779 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9779>)
>   *
> 
>     igt@tools_test@sysfs_l3_parity:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-5/igt@tools_test@sysfs_l3_parity.html> +35 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@tools_test@sysfs_l3_parity.html> (i915#4818 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818>)
>   *
> 
>     igt@v3d/v3d_submit_cl@bad-in-sync:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@v3d/v3d_submit_cl@bad-in-sync.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +11 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_cl@bad-perfmon:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-6/igt@v3d/v3d_submit_cl@bad-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +8 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-pad:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-6/igt@v3d/v3d_submit_csd@bad-pad.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +6 other tests skip
>   *
> 
>     igt@vc4/vc4_perfmon@destroy-invalid-perfmon:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-16/igt@vc4/vc4_perfmon@destroy-invalid-perfmon.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +7 other tests skip
>   *
> 
>     igt@vc4/vc4_perfmon@get-values-invalid-pointer:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +8 other tests skip
>   *
> 
>     igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-4/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +1 other test skip
>   *
> 
>     igt@vc4/vc4_tiling@set-bad-modifier:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-2/igt@vc4/vc4_tiling@set-bad-modifier.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +7 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-6/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-4/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-snb2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html> (i915#11039 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11039>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html>
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html> (i915#4281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> +1 other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-snb7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-mtlp-3/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#9697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697>)
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-3/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>   *
> 
>     igt@kms_psr@psr2-basic:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-8/igt@kms_psr@psr2-basic.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-11/igt@kms_psr@psr2-basic.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +2 other tests skip
>   *
> 
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7845/shard-dg2-8/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>) -> CRASH <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11119/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html> (i915#9351 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7845 -> IGTPW_11119
> 
> CI-20190529: 20190529
> CI_DRM_14737: 92f877dd46245e4a44b6d24b5e303b8c03c40c75 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11119: 11119
> IGT_7845: 7845
> 
