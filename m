Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0E2CD4F54
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 17:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9E10F4D0;
	Thu, 28 May 2026 17:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TT1upEyb";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7201210F4D0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 17:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvWrJKifaEs7Og+UuGf4fr+nMFgUGAJ0k8Ikh826xZA=; b=TT1upEybUbZKXtLMcZZMYiWrdt
 gMUZm4JJRGhPPS7oo0hBmfhGMiDkV/pWtYVXX6YQlSjhfQYFWVkOAZ72IpH/zYjhf/6oWPkgTx9PM
 ksPiJjYKd2dSp5QewfhrymEO/anG7i4LAU+mb+HIitWfFKaqKIYlDAtL+VHbDSb+1QCqUFI9a21Zp
 yXShnHUeNclJ4kgp2nmYziAanN5zL3nG3vAgnrbC6qTRmP7xvfc1uzWK0WkrrM3mnXlOhS9KhyPaj
 faWBbQ5aRfCYB6n/QtXl/qFRk4APVbp3YM+lqtEpwHPrhuYg9lqdyZPPuzplAtxyzMuQ63YV7tIoQ
 wFBmH0AA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSefK-009Tht-JA
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 19:37:07 +0200
Content-Type: multipart/alternative;
 boundary="------------60i4SuVtlADnK0NGGf1ctQAG"
Message-ID: <61854836-43ee-473e-a5f7-989fb66f4184@Igalia.com>
Date: Thu, 28 May 2026 10:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fcolorop=3A_Assorted_fixes_/_tweaks?=
To: igt-dev@lists.freedesktop.org
References: <20260527191839.639696-1-John.Harrison@Igalia.com>
 <177995930063.18859.12159149059031139376@6beec6c84f66>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <177995930063.18859.12159149059031139376@6beec6c84f66>
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

This is a multi-part message in MIME format.
--------------60i4SuVtlADnK0NGGf1ctQAG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/26 02:08, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_colorop: Assorted fixes / tweaks
> *URL:* 	https://patchwork.freedesktop.org/series/167408/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html
>
>
>   CI Bug Log - changes from CI_DRM_18563_full -> IGTPW_15262_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15262_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15262_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html
>
>
>     Participating hosts (10 -> 10)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_15262_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-4/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html>
>
Not related to this patch set - my changes are entirely within the 
kms_colorop test, the above failure is about kernel errors during driver 
unload.

John.

>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_15262_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@dmabuf@all-tests:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@dmabuf@all-tests.html>
>         (i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>  *
>
>     igt@gem_bad_reloc@negative-reloc-lut:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@gem_bad_reloc@negative-reloc-lut.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-stop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-stop.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_ctx_sseu@engines.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@gem_eio@in-flight-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390>
>         / i915#4391
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk1/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390>)
>  *
>
>     igt@gem_exec_balancer@invalid-bonds:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture-recoverable:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#6344
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html>
>         (i915#6344
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +7 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_lmem_swapping@massive-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@gem_lmem_swapping@massive-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@random:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@gem_lmem_swapping@random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +6 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#12193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html>
>         (i915#4565
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>  *
>
>     igt@gem_media_vme:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gem_media_vme.html>
>         (i915#284
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284>)
>  *
>
>     igt@gem_mmap@bad-object:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_mmap@bad-object.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@gem_mmap@bad-object.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_mmap_wc@write-prefaulted:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@gem_pread@exhaustion.html>
>         (i915#2658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@gem_pread@exhaustion.html>
>         (i915#2658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>  *
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +2 other tests skip
>  *
>
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_readwrite@write-bad-handle:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@gem_readwrite@write-bad-handle.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@gem_readwrite@write-bad-handle.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_render_copy@yf-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@gem_render_copy@yf-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@gem_render_copy@yf-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +1 other test skip
>  *
>
>     igt@gem_softpin@evict-snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@gem_softpin@evict-snoop.html>
>         (i915#4885
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885>)
>  *
>
>     igt@gem_softpin@noreloc-s3:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-7/igt@gem_softpin@noreloc-s3.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@gem_softpin@noreloc-s3.html>
>         (i915#15840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840>)
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@reads:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +7 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>  *
>
>     igt@gem_userptr_blits@readonly-unsync:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#14586
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586>)
>  *
>
>     igt@gen7_exec_parse@cmd-crossing-page:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gen7_exec_parse@cmd-crossing-page.html>
>         +7 other tests skip
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>  *
>
>     igt@i915_module_load@fault-injection@intel_connector_register:
>
>       o shard-glk10: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html>
>         (i915#15342
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342>)
>         +1 other test abort
>  *
>
>     igt@i915_module_load@fault-injection@intel_gt_init-enodev:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html>
>         +151 other tests skip
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-7/igt@i915_module_load@reload-no-display.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@i915_module_load@reload-no-display.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         (i915#16080
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080>
>         / i915#16166
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         (i915#16080
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080>
>         / i915#16166
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         (i915#16080
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080>
>         / i915#16166
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         (i915#16080
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080>
>         / i915#16166
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>         (i915#16080
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080>
>         / i915#16166
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166>)
>  *
>
>     igt@i915_pm_rc6_residency@rc6-accuracy:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test fail
>  *
>
>     igt@i915_pm_rpm@system-suspend-devices:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@i915_pm_rpm@system-suspend-devices.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@i915_pm_rpm@system-suspend-devices.html>
>         (i915#15060
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-8/igt@i915_power@sanity.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@i915_power@sanity.html>
>         (i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>  *
>
>     igt@i915_suspend@debugfs-reader:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk3/igt@i915_suspend@debugfs-reader.html>
>         (i915#16182
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182>
>         / i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         +1 other test incomplete
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@i915_suspend@debugfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@i915_suspend@debugfs-reader.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@i915_suspend@fence-restore-tiled2untiled.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (i915#12454
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454>
>         / i915#12712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712>)
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (i915#12761
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761>)
>         +1 other test incomplete
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +2 other tests dmesg-warn
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +9 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         +77 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +187 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +14 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +26 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2.html>
>         +59 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +109 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +49 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +7 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#15582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>)
>         +1 other test incomplete
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +49 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +45 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_chamelium_color@ctm-green-to-red.html>
>         +9 other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-frame-dump:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +6 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +7 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_color@deep-color.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9979
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@lic-type-1.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_content_protection@mei-interface.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@suspend-resume:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_content_protection@suspend-resume.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@uevent-hdcp14:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>         +2 other tests fail
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x10:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +5 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +4 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-256x85:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +5 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html>
>         (i915#12358
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358>
>         / i915#14152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152>
>         / i915#7882
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882>)
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_cursor_crc@cursor-suspend.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>         +1 other test abort
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (i915#12358
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358>
>         / i915#14152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         (i915#15804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#9878
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_feature_discovery@display-3x.html>
>         (i915#16081
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081>)
>         +1 other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_feature_discovery@display-4x.html>
>         (i915#16081
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_flip@2x-flip-vs-modeset.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +6 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_flip@2x-plain-flip.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +4 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_flip@2x-plain-flip.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_flip@flip-vs-suspend.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +8 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +15 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +6 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         +113 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +27 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html>
>         +23 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         +44 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +24 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html>
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>)
>         +30 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-slowdraw:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +11 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@bpc-switch.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_hdr@bpc-switch.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +3 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@invalid-hdr.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb16161616f:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb16161616f.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010.html>
>         (i915#16025
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16025>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb2101010:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@static-swap.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@static-toggle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_hdr@static-toggle.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@kms_hdr@static-toggle.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010:
>
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010.html>
>         (i915#15436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436>)
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +3 other tests skip
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +7 other tests skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html>
>         (i915#15460
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (i915#15460
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#15638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638>
>         / i915#15722
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (i915#15815
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (i915#12756
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756>
>         / i915#13409
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409>
>         / i915#13476
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html>
>         (i915#13409
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409>
>         / i915#13476
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html>
>         (i915#15608
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-yf-tiled-modifier:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-x.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +9 other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>
>         / i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>
>         / i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>  *
>
>     igt@kms_pm_rpm@pm-caching:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_pm_rpm@pm-caching.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +1 other test skip
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html>
>         (i915#9808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +18 other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-basic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_psr@fbc-psr-basic.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-page-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +19 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html>
>         +616 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_psr@fbc-psr2-dpms.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +16 other tests skip
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr@psr-basic.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +17 other tests skip
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html>
>         (i915#15500
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500>
>         / i915#16184
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-90.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-glk11: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#10959
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_vrr@flip-basic.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_vrr@flip-basic.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@kms_vrr@flip-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#8808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@perf_pmu@busy-double-start:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@perf_pmu@busy-double-start.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@perf_pmu@busy-double-start.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>         +2 other tests fail
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html>
>         (i915#8516
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>  *
>
>     igt@perf_pmu@rc6-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@perf_pmu@rc6-suspend.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#14242
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242>
>         / i915#16236
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@perf_pmu@rc6-suspend.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@perf_pmu@rc6-suspend.html>
>         (i915#15131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131>)
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html>
>         (i915#8516
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@prime_vgem@fence-write-hang.html>
>         +72 other tests skip
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html>
>         (i915#16066
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066>)
>         +8 other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@i915_pm_freq_api@freq-suspend@gt0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#13820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         +1 other test pass
>  *
>
>     igt@kms_addfb_basic@legacy-format:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_addfb_basic@legacy-format.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_addfb_basic@legacy-format.html>
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_draw_crc@draw-method-blt:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk4/igt@kms_draw_crc@draw-method-blt.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk9/igt@kms_draw_crc@draw-method-blt.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html>
>         (i915#15718
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15718>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
>         (i915#13027
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html>
>         (i915#14600
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html>
>         +5 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html>
>         +6 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html>
>         +4 other tests pass
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#15725
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         (i915#14412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>  *
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html>
>         (i915#14419
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html>
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_setmode@basic.html>
>         (i915#15106
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_setmode@basic.html>
>  *
>
>     igt@kms_vblank@query-forked:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_vblank@query-forked.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_vblank@query-forked.html>
>
>
>         Warnings
>
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-big:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>  *
>
>     igt@gem_exec_reloc@basic-write-read-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +2 other tests skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_readwrite@beyond-eob:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_readwrite@beyond-eob.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +2 other tests skip
>  *
>
>     igt@gem_readwrite@read-write:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@gem_readwrite@read-write.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_readwrite@read-write.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +2 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@i915_query@query-topology-known-pci-ids:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#16109
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@i915_query@query-topology-known-pci-ids.html>
>         (i915#16109
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +6 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +7 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-mode-timings:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_chamelium_edid@dp-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_chamelium_edid@dp-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@kms_content_protection@srm.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_content_protection@srm.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@suspend-resume:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-7/igt@kms_content_protection@suspend-resume.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_content_protection@suspend-resume.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_content_protection@type1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@type1.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html>
>         +33 other tests skip
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9067
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         (i915#9067
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_feature_discovery@psr1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_feature_discovery@psr1.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>
>         / i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html>
>         (i915#15672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-suspend:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-suspend.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +32 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html>
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-suspend.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +8 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_hdr@invalid-hdr.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html>
>         (i915#15436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +2 other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_plane_lowres@tiling-4.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +7 other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_psr@pr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +6 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15949
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#15949
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html>
>         (i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_vrr@flip-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_vrr@flip-suspend.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@prime_vgem@basic-write.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@prime_vgem@fence-write-hang.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@prime_vgem@fence-write-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8939 -> IGTPW_15262
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15262: 15262
> IGT_8939: 8939
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>

--------------60i4SuVtlADnK0NGGf1ctQAG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/28/26 02:08, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:177995930063.18859.12159149059031139376@6beec6c84f66">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_colorop: Assorted fixes / tweaks</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/167408/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/167408/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_18563_full -&gt;
        IGTPW_15262_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15262_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15262_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 10)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_15262_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-4/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Not related to this patch set - my changes are entirely within the
    kms_colorop test, the above failure is about kernel errors during
    driver unload.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite"
      cite="mid:177995930063.18859.12159149059031139376@6beec6c84f66">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_15262_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@dmabuf@all-tests:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@dmabuf@all-tests.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931"
                moz-do-not-send="true">i915#15931</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_bad_reloc@negative-reloc-lut:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +2 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@gem_bad_reloc@negative-reloc-lut.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323"
                moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323"
                moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-process:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697"
                moz-do-not-send="true">i915#7697</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-stop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-stop.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555"
                moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_ctx_sseu@engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"
                moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"
                moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@gem_eio@in-flight-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@gem_eio@in-flight-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390"
                moz-do-not-send="true">i915#13390</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391"
                moz-do-not-send="true">i915#4391</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>)</li>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk1/igt@gem_eio@in-flight-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390"
                moz-do-not-send="true">i915#13390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@invalid-bonds:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036"
                moz-do-not-send="true">i915#4036</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@gem_exec_balancer@parallel-balancer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@gem_exec_balancer@parallel-balancer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-invisible@smem0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@gem_exec_capture@capture-invisible@smem0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334"
                moz-do-not-send="true">i915#6334</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_capture@capture-recoverable:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344"
                moz-do-not-send="true">i915#6344</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344"
                moz-do-not-send="true">i915#6344</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_exec_reloc@basic-write-read-active.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537"
                moz-do-not-send="true">i915#4537</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812"
                moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@massive-random:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_lmem_swapping@massive-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@gem_lmem_swapping@massive-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@random:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@gem_lmem_swapping@random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +3 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193"
                moz-do-not-send="true">i915#12193</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@gem_lmem_swapping@verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565"
                moz-do-not-send="true">i915#4565</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_vme:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_media_vme.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"
                moz-do-not-send="true">i915#284</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_media_vme.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"
                moz-do-not-send="true">i915#284</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@gem_media_vme.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"
                moz-do-not-send="true">i915#284</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@gem_media_vme.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"
                moz-do-not-send="true">i915#284</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gem_media_vme.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284"
                moz-do-not-send="true">i915#284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap@bad-object:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@gem_mmap@bad-object.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@gem_mmap@bad-object.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-prefaulted:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083"
                moz-do-not-send="true">i915#4083</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@gem_partial_pwrite_pread@writes-after-reads-display.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@gem_pread@exhaustion.html"
                moz-do-not-send="true">WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"
                moz-do-not-send="true">i915#2658</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@gem_pread@exhaustion.html"
                moz-do-not-send="true">WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"
                moz-do-not-send="true">i915#2658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270"
                moz-do-not-send="true">i915#4270</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270"
                moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@write-bad-handle:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@gem_readwrite@write-bad-handle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@gem_readwrite@write-bad-handle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@gem_render_copy@yf-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428"
                moz-do-not-send="true">i915#8428</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@gem_render_copy@yf-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428"
                moz-do-not-send="true">i915#8428</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@evict-snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@gem_softpin@evict-snoop.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885"
                moz-do-not-send="true">i915#4885</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@noreloc-s3:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-7/igt@gem_softpin@noreloc-s3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@gem_softpin@noreloc-s3.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840"
                moz-do-not-send="true">i915#15840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@gem_tiled_partial_pwrite_pread@reads.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-unsync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@gem_userptr_blits@coherency-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880"
                moz-do-not-send="true">i915#4880</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@readonly-unsync:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gem_userptr_blits@readonly-unsync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@gem_userptr_blits@unsync-unmap-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-fd:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@gem_workarounds@suspend-resume-fd.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356"
                moz-do-not-send="true">i915#13356</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586"
                moz-do-not-send="true">i915#14586</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gen7_exec_parse@cmd-crossing-page.html"
                moz-do-not-send="true">SKIP</a> +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +3 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527"
                moz-do-not-send="true">i915#2527</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527"
                moz-do-not-send="true">i915#2527</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527"
                moz-do-not-send="true">i915#2527</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856"
                moz-do-not-send="true">i915#2856</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856"
                moz-do-not-send="true">i915#2856</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527"
                moz-do-not-send="true">i915#2527</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856"
                moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@i915_module_load@fault-injection@intel_connector_register.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342"
                moz-do-not-send="true">i915#15342</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@fault-injection@intel_gt_init-enodev:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@i915_module_load@fault-injection@intel_gt_init-enodev.html"
                moz-do-not-send="true">SKIP</a> +151 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-7/igt@i915_module_load@reload-no-display.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@i915_module_load@reload-no-display.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029"
                moz-do-not-send="true">i915#13029</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545"
                moz-do-not-send="true">i915#14545</a>)</li>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@i915_module_load@reload-no-display.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@i915_module_load@reload-no-display.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029"
                moz-do-not-send="true">i915#13029</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545"
                moz-do-not-send="true">i915#14545</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399"
                moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080"
                moz-do-not-send="true">i915#16080</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166"
                moz-do-not-send="true">i915#16166</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080"
                moz-do-not-send="true">i915#16080</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166"
                moz-do-not-send="true">i915#16166</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080"
                moz-do-not-send="true">i915#16080</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166"
                moz-do-not-send="true">i915#16166</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080"
                moz-do-not-send="true">i915#16080</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166"
                moz-do-not-send="true">i915#16166</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080"
                moz-do-not-send="true">i915#16080</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166"
                moz-do-not-send="true">i915#16166</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@i915_pm_rc6_residency@rc6-accuracy.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964"
                moz-do-not-send="true">i915#12964</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-devices:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@i915_pm_rpm@system-suspend-devices.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@i915_pm_rpm@system-suspend-devices.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15060"
                moz-do-not-send="true">i915#15060</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@i915_pm_sseu@full-enable.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387"
                moz-do-not-send="true">i915#4387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-8/igt@i915_power@sanity.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@i915_power@sanity.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984"
                moz-do-not-send="true">i915#7984</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@debugfs-reader:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk3/igt@i915_suspend@debugfs-reader.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182"
                moz-do-not-send="true">i915#16182</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"
                moz-do-not-send="true">i915#4817</a>) +1 other test
              incomplete</li>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@i915_suspend@debugfs-reader.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@i915_suspend@debugfs-reader.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817"
                moz-do-not-send="true">i915#4817</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@i915_suspend@fence-restore-tiled2untiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454"
                moz-do-not-send="true">i915#12454</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712"
                moz-do-not-send="true">i915#12712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk8/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761"
                moz-do-not-send="true">i915#12761</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531"
                moz-do-not-send="true">i915#9531</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769"
                moz-do-not-send="true">i915#1769</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"
                moz-do-not-send="true">i915#4538</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_big_fb@linear-64bpp-rotate-0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638"
                moz-do-not-send="true">i915#3638</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638"
                moz-do-not-send="true">i915#3638</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"
                moz-do-not-send="true">i915#4538</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> +77 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"
                moz-do-not-send="true">i915#4538</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +187 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> +59 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307"
                moz-do-not-send="true">i915#10307</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +109 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +49 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582"
                moz-do-not-send="true">i915#15582</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +49 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +45 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742"
                moz-do-not-send="true">i915#3742</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742"
                moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_chamelium_color@ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> +9 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-frame-dump:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_chamelium_frames@dp-frame-dump.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +7 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +5 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_color@deep-color.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979"
                moz-do-not-send="true">i915#9979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330"
                moz-do-not-send="true">i915#15330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330"
                moz-do-not-send="true">i915#15330</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116"
                moz-do-not-send="true">i915#3116</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299"
                moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_content_protection@mei-interface.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@suspend-resume:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_content_protection@suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_content_protection@uevent-hdcp14.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173"
                moz-do-not-send="true">i915#7173</a>) +2 other tests
              fail</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_content_protection@uevent-hdcp14.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_content_protection@uevent-hdcp14.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +3 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814"
                moz-do-not-send="true">i915#8814</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>) +1 other test
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-5/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-256x85.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358"
                moz-do-not-send="true">i915#12358</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152"
                moz-do-not-send="true">i915#14152</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882"
                moz-do-not-send="true">i915#7882</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132"
                moz-do-not-send="true">i915#15132</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358"
                moz-do-not-send="true">i915#12358</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152"
                moz-do-not-send="true">i915#14152</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046"
                moz-do-not-send="true">i915#13046</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809"
                moz-do-not-send="true">i915#9809</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15804"
                moz-do-not-send="true">i915#15804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833"
                moz-do-not-send="true">i915#9833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691"
                moz-do-not-send="true">i915#13691</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691"
                moz-do-not-send="true">i915#13691</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691"
                moz-do-not-send="true">i915#13691</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691"
                moz-do-not-send="true">i915#13691</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691"
                moz-do-not-send="true">i915#13691</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804"
                moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_dp_link_training@uhbr-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748"
                moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707"
                moz-do-not-send="true">i915#13707</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707"
                moz-do-not-send="true">i915#13707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk9/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878"
                moz-do-not-send="true">i915#9878</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081"
                moz-do-not-send="true">i915#16081</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081"
                moz-do-not-send="true">i915#16081</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_flip@2x-flip-vs-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_flip@2x-flip-vs-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_flip@2x-plain-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) +4 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_flip@2x-plain-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637"
                moz-do-not-send="true">i915#3637</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745"
                moz-do-not-send="true">i915#12745</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839"
                moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745"
                moz-do-not-send="true">i915#12745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>) +2 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190"
                moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +8 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +3 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"
                moz-do-not-send="true">i915#8708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +15 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +6 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> +113 other tests skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104"
                moz-do-not-send="true">i915#15104</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104"
                moz-do-not-send="true">i915#15104</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> +23 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991"
                moz-do-not-send="true">i915#15991</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> +44 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439"
                moz-do-not-send="true">i915#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991"
                moz-do-not-send="true">i915#15991</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk8/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991"
                moz-do-not-send="true">i915#15991</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"
                moz-do-not-send="true">i915#5354</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991"
                moz-do-not-send="true">i915#15991</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-slowdraw:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_frontbuffer_tracking@psrhdr-slowdraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@bpc-switch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_hdr@bpc-switch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb16161616f:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-1-xrgb16161616f.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16025"
                moz-do-not-send="true">i915#16025</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@static-swap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2-xrgb2101010.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436"
                moz-do-not-send="true">i915#15436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@basic-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460"
                moz-do-not-send="true">i915#15460</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-4/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459"
                moz-do-not-send="true">i915#15459</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459"
                moz-do-not-send="true">i915#15459</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459"
                moz-do-not-send="true">i915#15459</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459"
                moz-do-not-send="true">i915#15459</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459"
                moz-do-not-send="true">i915#15459</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458"
                moz-do-not-send="true">i915#15458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460"
                moz-do-not-send="true">i915#15460</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458"
                moz-do-not-send="true">i915#15458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638"
                moz-do-not-send="true">i915#15638</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722"
                moz-do-not-send="true">i915#15722</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815"
                moz-do-not-send="true">i915#15815</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756"
                moz-do-not-send="true">i915#12756</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409"
                moz-do-not-send="true">i915#13409</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476"
                moz-do-not-send="true">i915#13476</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409"
                moz-do-not-send="true">i915#13409</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476"
                moz-do-not-send="true">i915#13476</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712"
                moz-do-not-send="true">i915#14712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608"
                moz-do-not-send="true">i915#15608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-none.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"
                moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-8/igt@kms_plane_multiple@2x-tiling-x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958"
                moz-do-not-send="true">i915#13958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329"
                moz-do-not-send="true">i915#15329</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329"
                moz-do-not-send="true">i915#15329</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343"
                moz-do-not-send="true">i915#12343</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812"
                moz-do-not-send="true">i915#9812</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-6/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343"
                moz-do-not-send="true">i915#12343</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812"
                moz-do-not-send="true">i915#9812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430"
                moz-do-not-send="true">i915#8430</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430"
                moz-do-not-send="true">i915#8430</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430"
                moz-do-not-send="true">i915#8430</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430"
                moz-do-not-send="true">i915#8430</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_pm_lpsp@screens-disabled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430"
                moz-do-not-send="true">i915#8430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@kms_pm_rpm@dpms-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>)</li>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@package-g7:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_pm_rpm@package-g7.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403"
                moz-do-not-send="true">i915#15403</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pm_rpm@package-g7.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403"
                moz-do-not-send="true">i915#15403</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@pm-caching:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_pm_rpm@pm-caching.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_prime@basic-crc-hybrid.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524"
                moz-do-not-send="true">i915#6524</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-glk10: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk10/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>)</li>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +3 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808"
                moz-do-not-send="true">i915#9808</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +5 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316"
                moz-do-not-send="true">i915#12316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-basic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_psr@fbc-psr-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_psr@fbc-psr-primary-page-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> +616 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-3/igt@kms_psr@fbc-psr2-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688"
                moz-do-not-send="true">i915#9688</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_psr@pr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr@psr-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_psr@psr2-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500"
                moz-do-not-send="true">i915#15500</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184"
                moz-do-not-send="true">i915#16184</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"
                moz-do-not-send="true">i915#5289</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-15/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"
                moz-do-not-send="true">i915#5289</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"
                moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755"
                moz-do-not-send="true">i915#12755</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867"
                moz-do-not-send="true">i915#15867</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-glk11: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk11/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959"
                moz-do-not-send="true">i915#10959</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"
                moz-do-not-send="true">i915#15243</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"
                moz-do-not-send="true">i915#15243</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-2/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808"
                moz-do-not-send="true">i915#8808</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_vrr@lobf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920"
                moz-do-not-send="true">i915#11920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@kms_vrr@negative-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"
                moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"
                moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"
                moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"
                moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808"
                moz-do-not-send="true">i915#8808</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906"
                moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@perf_pmu@busy-double-start.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@perf_pmu@busy-double-start.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349"
                moz-do-not-send="true">i915#4349</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@module-unload:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@perf_pmu@module-unload.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778"
                moz-do-not-send="true">i915#15778</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@perf_pmu@rc6-all-gts.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516"
                moz-do-not-send="true">i915#8516</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk4/igt@perf_pmu@rc6-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356"
                moz-do-not-send="true">i915#13356</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242"
                moz-do-not-send="true">i915#14242</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236"
                moz-do-not-send="true">i915#16236</a>)</li>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@perf_pmu@rc6-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@perf_pmu@rc6-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131"
                moz-do-not-send="true">i915#15131</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@perf_pmu@rc6@other-idle-gt0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516"
                moz-do-not-send="true">i915#8516</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@prime_vgem@basic-fence-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-6/igt@prime_vgem@basic-fence-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-3/igt@prime_vgem@coherency-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"
                moz-do-not-send="true">i915#4077</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-9/igt@prime_vgem@fence-write-hang.html"
                moz-do-not-send="true">SKIP</a> +72 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066"
                moz-do-not-send="true">i915#16066</a>) +8 other tests
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356"
                moz-do-not-send="true">i915#13356</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820"
                moz-do-not-send="true">i915#13820</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@legacy-format:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_addfb_basic@legacy-format.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_addfb_basic@legacy-format.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956"
                moz-do-not-send="true">i915#5956</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"
                moz-do-not-send="true">i915#13566</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-blt:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk4/igt@kms_draw_crc@draw-method-blt.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk9/igt@kms_draw_crc@draw-method-blt.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15718"
                moz-do-not-send="true">i915#15718</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027"
                moz-do-not-send="true">i915#13027</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600"
                moz-do-not-send="true">i915#14600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-vga1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-modesetfrombusy.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15725"
                moz-do-not-send="true">i915#15725</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-7/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-5/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412"
                moz-do-not-send="true">i915#14412</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-1/igt@kms_pm_lpsp@kms-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340"
                moz-do-not-send="true">i915#9340</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-idle:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419"
                moz-do-not-send="true">i915#14419</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_pm_rpm@system-suspend-idle.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_setmode@basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106"
                moz-do-not-send="true">i915#15106</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_setmode@basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_vblank@query-forked.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_vblank@query-forked.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411"
                moz-do-not-send="true">i915#8411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411"
                moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@device_reset@cold-reset-bound.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078"
                moz-do-not-send="true">i915#11078</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@device_reset@cold-reset-bound.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078"
                moz-do-not-send="true">i915#11078</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323"
                moz-do-not-send="true">i915#9323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323"
                moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-big:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335"
                moz-do-not-send="true">i915#6335</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@gem_create@create-ext-cpu-access-big.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335"
                moz-do-not-send="true">i915#6335</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"
                moz-do-not-send="true">i915#280</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280"
                moz-do-not-send="true">i915#280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@gem_exec_reloc@basic-write-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"
                moz-do-not-send="true">i915#3281</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@beyond-eob:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_readwrite@beyond-eob.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@gem_readwrite@beyond-eob.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@read-write:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@gem_readwrite@read-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_readwrite@read-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282"
                moz-do-not-send="true">i915#3282</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411"
                moz-do-not-send="true">i915#8411</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411"
                moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323"
                moz-do-not-send="true">i915#3323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@gem_userptr_blits@dmabuf-sync.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323"
                moz-do-not-send="true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297"
                moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@query-topology-known-pci-ids:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@i915_query@query-topology-known-pci-ids.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109"
                moz-do-not-send="true">i915#16109</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@i915_query@query-topology-known-pci-ids.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109"
                moz-do-not-send="true">i915#16109</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531"
                moz-do-not-send="true">i915#9531</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531"
                moz-do-not-send="true">i915#9531</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769"
                moz-do-not-send="true">i915#1769</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769"
                moz-do-not-send="true">i915#1769</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"
                moz-do-not-send="true">i915#5286</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"
                moz-do-not-send="true">i915#4538</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538"
                moz-do-not-send="true">i915#4538</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313"
                moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-c-hdmi-a-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098"
                moz-do-not-send="true">i915#14098</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"
                moz-do-not-send="true">i915#6095</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-mode-timings:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_chamelium_edid@dp-mode-timings.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_chamelium_edid@dp-mode-timings.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_chamelium_frames@hdmi-crc-multiple.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"
                moz-do-not-send="true">i915#11151</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828"
                moz-do-not-send="true">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330"
                moz-do-not-send="true">i915#15330</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116"
                moz-do-not-send="true">i915#3116</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330"
                moz-do-not-send="true">i915#15330</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116"
                moz-do-not-send="true">i915#3116</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-8/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-10/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173"
                moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@suspend-resume:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-7/igt@kms_content_protection@suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_content_protection@suspend-resume.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_content_protection@type1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865"
                moz-do-not-send="true">i915#15865</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049"
                moz-do-not-send="true">i915#13049</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html"
                moz-do-not-send="true">SKIP</a> +33 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067"
                moz-do-not-send="true">i915#9067</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067"
                moz-do-not-send="true">i915#9067</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103"
                moz-do-not-send="true">i915#4103</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103"
                moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723"
                moz-do-not-send="true">i915#9723</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723"
                moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707"
                moz-do-not-send="true">i915#13707</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707"
                moz-do-not-send="true">i915#13707</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"
                moz-do-not-send="true">i915#3840</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840"
                moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"
                moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"
                moz-do-not-send="true">i915#9934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745"
                moz-do-not-send="true">i915#12745</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839"
                moz-do-not-send="true">i915#4839</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113"
                moz-do-not-send="true">i915#6113</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-glk6/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745"
                moz-do-not-send="true">i915#12745</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839"
                moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643"
                moz-do-not-send="true">i915#15643</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-load-detect:</p>
          <ul>
            <li>shard-mtlp: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672"
                moz-do-not-send="true">i915#15672</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-mtlp-5/igt@kms_force_connector_basic@force-load-detect.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132"
                moz-do-not-send="true">i915#15132</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989"
                moz-do-not-send="true">i915#15989</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-tiling-4:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439"
                moz-do-not-send="true">i915#5439</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439"
                moz-do-not-send="true">i915#5439</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"
                moz-do-not-send="true">i915#3023</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"
                moz-do-not-send="true">i915#8708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"
                moz-do-not-send="true">i915#8708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433"
                moz-do-not-send="true">i915#10433</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-12/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-19/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990"
                moz-do-not-send="true">i915#15990</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"
                moz-do-not-send="true">i915#3023</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"
                moz-do-not-send="true">i915#3023</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433"
                moz-do-not-send="true">i915#10433</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"
                moz-do-not-send="true">i915#1825</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-12/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg1: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg1-16/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"
                moz-do-not-send="true">i915#4423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg1-14/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psrhdr-suspend:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_frontbuffer_tracking@psrhdr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102"
                moz-do-not-send="true">i915#15102</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012"
                moz-do-not-send="true">i915#16012</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011"
                moz-do-not-send="true">i915#16011</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"
                moz-do-not-send="true">i915#8228</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436"
                moz-do-not-send="true">i915#15436</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458"
                moz-do-not-send="true">i915#15458</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458"
                moz-do-not-send="true">i915#15458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709"
                moz-do-not-send="true">i915#15709</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-4:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-3/igt@kms_plane_lowres@tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane_lowres@tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259"
                moz-do-not-send="true">i915#14259</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259"
                moz-do-not-send="true">i915#14259</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329"
                moz-do-not-send="true">i915#15329</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329"
                moz-do-not-send="true">i915#15329</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@kms_pm_dc@dc5-retention-flops.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828"
                moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"
                moz-do-not-send="true">i915#15073</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520"
                moz-do-not-send="true">i915#11520</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-render:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-1/igt@kms_psr@fbc-psr2-sprite-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-4/igt@kms_psr@pr-cursor-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"
                moz-do-not-send="true">i915#1072</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732"
                moz-do-not-send="true">i915#9732</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949"
                moz-do-not-send="true">i915#15949</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949"
                moz-do-not-send="true">i915#15949</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-dg2-10/igt@kms_rotation_crc@primary-rotation-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867"
                moz-do-not-send="true">i915#15867</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755"
                moz-do-not-send="true">i915#12755</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867"
                moz-do-not-send="true">i915#15867</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"
                moz-do-not-send="true">i915#5289</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289"
                moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@kms_vrr@flip-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"
                moz-do-not-send="true">i915#15243</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-3/igt@kms_vrr@flip-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"
                moz-do-not-send="true">i915#15243</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"
                moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-5/igt@prime_vgem@basic-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291"
                moz-do-not-send="true">i915#3291</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@prime_vgem@fence-write-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-8/igt@prime_vgem@fence-write-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708"
                moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-rkl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18563/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"
                moz-do-not-send="true">i915#14544</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917"
                moz-do-not-send="true">i915#9917</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15262/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917"
                moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8939 -&gt; IGTPW_15262</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/gfx-ci/linux">git://anongit.freedesktop.org/gfx-ci/linux</a><br>
        IGTPW_15262: 15262<br>
        IGT_8939: 8939<br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        <a class="moz-txt-link-freetext" href="git://anongit.freedesktop.org/piglit">git://anongit.freedesktop.org/piglit</a></p>
    </blockquote>
    <br>
  </body>
</html>

--------------60i4SuVtlADnK0NGGf1ctQAG--
