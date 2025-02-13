Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B2C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 15:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0316D10E3EC;
	Thu, 13 Feb 2025 15:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaFyJEE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9510E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739458943; x=1770994943;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IkyCq9teOzKXgKly8cUooOd0GUVzvQJabacbIPy5bCw=;
 b=ZaFyJEE2TI0+YJmByYFSPaNAEtmhForFFKdtG/JS1XN8EzJros9sVkjE
 h0btQh5Q3F8auI6igMG9ahRhDS/R7wTmkAiuVVeX8nR5gB+WalRR+TWqi
 ZPk+LgoDCYkA/qq1glrklE7e8EEp0XvHgweL48kT9PeGGZV2Tugybe2xM
 lYMQqF9e7MaKrZtsdCtrgN0GPOb8N89eDbVQ3oooNblU7B2fSyII805iK
 aOVKaK9OBwP3hwxxF/fzICbwaNPn6t7YS8OkkdIUH32022nvjDsrPXegn
 P9XmniPExK9nY+3NqO63s6MN7vAx0tcIJ6BRrsJvE0gfabnHmt2Q5tU7i g==;
X-CSE-ConnectionGUID: RqQbihDcSii9XAigKXDfag==
X-CSE-MsgGUID: zrqk0tefRP2KxAnDFbGQ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50379121"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="50379121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:02:23 -0800
X-CSE-ConnectionGUID: W56J0wScRv2xRBCXVd8cYw==
X-CSE-MsgGUID: f8gGnGOkSzOjpi1Umlrbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118356397"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:02:21 -0800
Message-ID: <5e886b6d-ebf6-41da-908c-94c706b98233@linux.intel.com>
Date: Thu, 13 Feb 2025 16:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Add_SR-IO?=
 =?UTF-8?Q?V_provisioning_scheduling_attributes_and_tests_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
 <173945080953.1663573.17768054256114056803@b555e5b46a47>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173945080953.1663573.17768054256114056803@b555e5b46a47>
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



On 2/13/2025 1:46 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	Add SR-IOV provisioning scheduling attributes and tests (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/143762/ <https:// 
> patchwork.freedesktop.org/series/143762/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/ 
> index.html <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_16125_full -> IGTPW_12583_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_12583_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12583_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/ 
> index.html
> 
> 
>     Participating hosts (10 -> 11)
> 
> Additional (1): shard-snb-0
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_12583_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_tiled_swapping@non-threaded:
> 
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk8/igt@gem_tiled_swapping@non-threaded.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ac-hdmi-a1-
>     hdmi-a2:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-glk9/igt@kms_flip@2x-flip-vs-absolute-
>         wf_vblank-interruptible@ac-hdmi-a1-hdmi-a2.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/shard-
>         glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-
>         interruptible@ac-hdmi-a1-hdmi-a2.html> +2 other tests fail
>   *
> 
>     igt@kms_flip@dpms-off-confusion-interruptible:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg2-8/igt@kms_flip@dpms-off-confusion-
>         interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg2-3/igt@kms_flip@dpms-off-
>         confusion-interruptible.html>
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg1-15/igt@kms_flip@dpms-off-confusion-
>         interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg1-19/igt@kms_flip@dpms-off-
>         confusion-interruptible.html> +1 other test incomplete
>   *
> 
>     igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a3:
> 
>       o shard-dg2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg2-3/igt@kms_flip@dpms-off-
>         confusion-interruptible@a-hdmi-a3.html>

Not related to the change.
--
marcin
> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_16125_full and 
> IGTPW_12583_full:
> 
> 
>       New IGT tests (4)
> 
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-d-hdmi-a-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.21] s
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-c-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.50] s
>   *
> 
>     igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-vga-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.40] s
>   *
> 
>     igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [3.42] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_12583_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@drm_fdinfo@all-busy-check-all:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@drm_fdinfo@all-busy-check-
>         all.html> ([i915#8414]) +1 other test skip
>   *
> 
>     igt@drm_fdinfo@busy-hang@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/igt@drm_fdinfo@busy-hang@bcs0.html>
>         ([i915#8414]) +8 other tests skip
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@vcs0:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@drm_fdinfo@most-busy-check-
>         all@vcs0.html> ([i915#8414]) +6 other tests skip
>   *
> 
>     igt@drm_fdinfo@virtual-busy-idle:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@drm_fdinfo@virtual-busy-
>         idle.html> ([i915#8414])
>   *
> 
>     igt@gem_bad_reloc@negative-reloc-lut:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-
>         lut.html> ([i915#3281]) +8 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-19/igt@gem_bad_reloc@negative-reloc-
>         lut.html> ([i915#3281]) +2 other tests skip
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_basic@multigpu-create-
>         close.html> ([i915#7697])
>   *
> 
>     igt@gem_caching@writes:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-1/igt@gem_caching@writes.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/
>         shard-rkl-2/igt@gem_caching@writes.html> ([i915#12917] /
>         [i915#12964])
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@gem_ccs@block-multicopy-
>         compressed.html> ([i915#9323])
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-6/igt@gem_ccs@ctrl-surf-
>         copy.html> ([i915#3555] / [i915#9323])
>   *
> 
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-
>         ctx.html> ([i915#9323])
>   *
> 
>     igt@gem_ccs@large-ctrl-surf-copy:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-
>         copy.html> ([i915#13008])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@gem_ccs@large-ctrl-surf-
>         copy.html> ([i915#13008])
>   *
> 
>     igt@gem_ccs@suspend-resume:
> 
>       o shard-dg2-9: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_ccs@suspend-
>         resume.html> ([i915#13356])
>   *
> 
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
> 
>       o shard-dg2-9: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_ccs@suspend-
>         resume@linear-compressed-compfmt0-lmem0-lmem0.html>
>         ([i915#12392] / [i915#13356])
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-glk2/igt@gem_ctx_isolation@preservation-
>         s3@rcs0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-glk2/
>         igt@gem_ctx_isolation@preservation-s3@rcs0.html> ([i915#12353])
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-
>         hang.html> ([i915#8555])
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@gem_ctx_sseu@engines.html>
>         ([i915#280])
>   *
> 
>     igt@gem_ctx_sseu@invalid-args:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@gem_ctx_sseu@invalid-args.html>
>         ([i915#280])
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_ctx_sseu@invalid-
>         args.html> ([i915#280])
>   *
> 
>     igt@gem_ctx_sseu@mmap-args:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-4/igt@gem_ctx_sseu@mmap-
>         args.html> ([i915#280])
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_ctx_sseu@mmap-args.html>
>         ([i915#280]) +1 other test skip
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-dg1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@gem_eio@kms.html> ([i915#5784])
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg1-19/igt@gem_eio@unwedge-stress.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/
>         shard-dg1-19/igt@gem_eio@unwedge-stress.html> ([i915#12714] /
>         [i915#5784])
>   *
> 
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-5/igt@gem_exec_balancer@parallel-
>         dmabuf-import-out-fence.html> ([i915#4525])
>   *
> 
>     igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_exec_balancer@parallel-
>         keep-submit-fence.html> ([i915#4525]) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@parallel-out-fence:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@gem_exec_balancer@parallel-out-
>         fence.html> ([i915#4525]) +2 other tests skip
>   *
> 
>     igt@gem_exec_balancer@sliced:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-1/igt@gem_exec_balancer@sliced.html>
>         ([i915#4812]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/
>         igt@gem_exec_balancer@sliced.html> ([i915#4812])
>   *
> 
>     igt@gem_exec_big@single:
> 
>       o shard-tglu-1: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_exec_big@single.html>
>         ([i915#11713])
>   *
> 
>     igt@gem_exec_capture@capture-invisible:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_exec_capture@capture-
>         invisible.html> ([i915#6334]) +2 other tests skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk4/igt@gem_exec_capture@capture-
>         invisible@smem0.html> ([i915#6334]) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-2/igt@gem_exec_capture@capture-
>         recoverable.html> ([i915#6344])
>   *
> 
>     igt@gem_exec_flush@basic-uc-ro-default:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gem_exec_flush@basic-uc-ro-
>         default.html> ([i915#3539] / [i915#4852])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@gem_exec_flush@basic-uc-ro-
>         default.html> ([i915#3539] / [i915#4852])
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-wc-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-
>         wc-noreloc.html> ([i915#3281]) +5 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-
>         cpu-active.html> ([i915#3281]) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gem_exec_reloc@basic-write-read-
>         active.html> ([i915#3281]) +8 other tests skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gem_exec_schedule@preempt-
>         queue.html> ([i915#4537] / [i915#4812])
>   *
> 
>     igt@gem_exec_schedule@reorder-wide:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-19/igt@gem_exec_schedule@reorder-
>         wide.html> ([i915#4812]) +2 other tests skip
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@gem_exec_schedule@semaphore-
>         power.html> ([i915#7276])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/
>         igt@gem_exec_schedule@semaphore-power.html> ([i915#4537] /
>         [i915#4812])
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-none:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/igt@gem_fence_thrash@bo-write-
>         verify-none.html> ([i915#4860]) +1 other test skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-x:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@gem_fence_thrash@bo-write-
>         verify-x.html> ([i915#4860])
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_fenced_exec_thrash@no-
>         spare-fences-busy-interruptible.html> ([i915#4860])
>   *
> 
>     igt@gem_lmem_swapping@parallel-multi:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-6/igt@gem_lmem_swapping@parallel-
>         multi.html> ([i915#4613])
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@gem_lmem_swapping@parallel-
>         random-verify-ccs.html> ([i915#4613]) +3 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gem_lmem_swapping@parallel-
>         random-verify-ccs.html> ([i915#4613]) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@gem_lmem_swapping@random-
>         engines.html> ([i915#4613]) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk3/igt@gem_lmem_swapping@verify-
>         ccs.html> ([i915#4613]) +8 other tests skip
>   *
> 
>     igt@gem_media_fill@media-fill:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@gem_media_fill@media-
>         fill.html> ([i915#8289])
>   *
> 
>     igt@gem_media_vme:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@gem_media_vme.html> ([i915#284])
>   *
> 
>     igt@gem_mmap@bad-offset:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@gem_mmap@bad-offset.html>
>         ([i915#4083]) +1 other test skip
>   *
> 
>     igt@gem_mmap_gtt@basic-write-read-distinct:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-
>         read-distinct.html> ([i915#4077]) +9 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@close-race:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-1/igt@gem_mmap_gtt@close-race.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-rkl-6/igt@gem_mmap_gtt@close-race.html>
>         ([i915#12964]) +31 other tests dmesg-warn
>   *
> 
>     igt@gem_mmap_gtt@hang:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_mmap_gtt@hang.html>
>         ([i915#4077]) +3 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@medium-copy-xy:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@gem_mmap_gtt@medium-copy-
>         xy.html> ([i915#4077]) +11 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@gem_mmap_gtt@medium-copy-
>         xy.html> ([i915#4077]) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@bad-object:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@gem_mmap_wc@bad-object.html>
>         ([i915#4083]) +3 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-read:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@gem_mmap_wc@write-
>         read.html> ([i915#4083]) +3 other tests skip
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_mmap_wc@write-read.html>
>         ([i915#4083])
>   *
> 
>     igt@gem_partial_pwrite_pread@reads-display:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@gem_partial_pwrite_pread@reads-display.html> ([i915#3282])
>         +2 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-8/igt@gem_partial_pwrite_pread@writes-
>         after-reads-snoop.html> ([i915#3282]) +3 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-
>         after-reads-uncached.html> ([i915#3282]) +7 other tests skip
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@gem_pread@exhaustion.html>
>         ([i915#3282]) +1 other test skip
>       o shard-tglu: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>   *
> 
>     igt@gem_pxp@create-regular-buffer:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_pxp@create-regular-
>         buffer.html> ([i915#4270])
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-rkl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-rkl-4/igt@gem_pxp@dmabuf-shared-
>         protected-dst-is-context-refcounted.html> ([i915#12964])
>   *
> 
>     igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-
>         buffer.html> ([i915#13398])
>   *
> 
>     igt@gem_pxp@hw-rejects-pxp-context:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-
>         context.html> ([i915#13398])
>   *
> 
>     igt@gem_pxp@reject-modify-context-protection-off-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@gem_pxp@reject-modify-context-
>         protection-off-1.html> ([i915#4270])
>       o shard-rkl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-rkl-5/igt@gem_pxp@reject-modify-
>         context-protection-off-1.html> ([i915#12917] / [i915#12964]) +3
>         other tests timeout
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@gem_pxp@reject-modify-context-
>         protection-off-1.html> ([i915#4270]) +2 other tests skip
>   *
> 
>     igt@gem_readwrite@read-write:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@gem_readwrite@read-
>         write.html> ([i915#3282]) +1 other test skip
>   *
> 
>     igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gem_render_copy@mixed-tiled-to-
>         yf-tiled-ccs.html> ([i915#5190] / [i915#8428]) +6 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-
>         to-y-tiled.html> ([i915#5190] / [i915#8428]) +3 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-6/igt@gem_render_copy@y-tiled-to-
>         vebox-x-tiled.html> ([i915#8428]) +3 other tests skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-
>         to-untiled.html> ([i915#4079])
>   *
> 
>     igt@gem_set_tiling_vs_gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-5/igt@gem_set_tiling_vs_gtt.html>
>         ([i915#4079])
>   *
> 
>     igt@gem_tiled_pread_pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@gem_tiled_pread_pwrite.html>
>         ([i915#4079])
>   *
> 
>     igt@gem_tiled_swapping@non-threaded:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/igt@gem_tiled_swapping@non-
>         threaded.html> ([i915#12941])
>   *
> 
>     igt@gem_userptr_blits@access-control:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gem_userptr_blits@access-
>         control.html> ([i915#3297])
>   *
> 
>     igt@gem_userptr_blits@coherency-sync:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@gem_userptr_blits@coherency-
>         sync.html> ([i915#3297]) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/
>         igt@gem_userptr_blits@coherency-sync.html> ([i915#3297]) +2
>         other tests skip
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-3/igt@gem_userptr_blits@forbidden-
>         operations.html> ([i915#3282] / [i915#3297])
>   *
> 
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-10/igt@gem_userptr_blits@invalid-
>         mmap-offset-unsync.html> ([i915#3297]) +2 other tests skip
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_userptr_blits@sd-
>         probe.html> ([i915#3297] / [i915#4958])
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@gem_userptr_blits@unsync-unmap-
>         after-close.html> ([i915#3297])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@gem_userptr_blits@unsync-
>         unmap-after-close.html> ([i915#3297])
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gem_userptr_blits@unsync-
>         unmap-after-close.html> ([i915#3297])
>   *
> 
>     igt@gem_workarounds@suspend-resume:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-tglu-7/igt@gem_workarounds@suspend-
>         resume.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-tglu-9/igt@gem_workarounds@suspend-
>         resume.html> ([i915#12817])
>   *
> 
>     igt@gen3_render_mixed_blits:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@gen3_render_mixed_blits.html> +6 other tests skip
>   *
> 
>     igt@gen7_exec_parse@basic-rejected:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/igt@gen7_exec_parse@basic-
>         rejected.html> +7 other tests skip
>   *
> 
>     igt@gen7_exec_parse@oacontrol-tracking:
> 
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-snb1/igt@gen7_exec_parse@oacontrol-
>         tracking.html> +36 other tests skip
>   *
> 
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-7/igt@gen9_exec_parse@basic-
>         rejected-ctx-param.html> ([i915#2856]) +2 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@gen9_exec_parse@basic-
>         rejected-ctx-param.html> ([i915#2527] / [i915#2856])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@gen9_exec_parse@basic-rejected-
>         ctx-param.html> ([i915#2527])
>   *
> 
>     igt@gen9_exec_parse@bb-oversize:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-3/igt@gen9_exec_parse@bb-
>         oversize.html> ([i915#2527]) +3 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-out:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@gen9_exec_parse@bb-start-
>         out.html> ([i915#2856]) +1 other test skip
>   *
> 
>     igt@gen9_exec_parse@cmd-crossing-page:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-2/igt@gen9_exec_parse@cmd-
>         crossing-page.html> ([i915#2527] / [i915#2856]) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@unaligned-jump:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@gen9_exec_parse@unaligned-
>         jump.html> ([i915#2856]) +1 other test skip
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-glk: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-glk7/igt@i915_module_load@reload-with-
>         fault-injection.html> ([i915#9820])
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-snb4/igt@i915_module_load@reload-with-fault-
>         injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-snb6/igt@i915_module_load@reload-with-
>         fault-injection.html> ([i915#9820])
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-mtlp-5/igt@i915_module_load@reload-with-
>         fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-mtlp-5/
>         igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10131] / [i915#10887] / [i915#9820])
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@i915_module_load@resize-
>         bar.html> ([i915#6412])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/igt@i915_module_load@resize-
>         bar.html> ([i915#6412])
>   *
> 
>     igt@i915_pm_freq_api@freq-reset-multiple:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@i915_pm_freq_api@freq-
>         reset-multiple.html> ([i915#8399]) +1 other test skip
>   *
> 
>     igt@i915_pm_freq_api@freq-suspend:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@i915_pm_freq_api@freq-
>         suspend.html> ([i915#8399])
>   *
> 
>     igt@i915_pm_freq_mult@media-freq@gt0:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@i915_pm_freq_mult@media-
>         freq@gt0.html> ([i915#6590]) +1 other test skip
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-
>         accuracy.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-
>         accuracy.html> ([i915#12942]) +1 other test fail
>   *
> 
>     igt@i915_pm_rps@thresholds-idle-park:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-8/igt@i915_pm_rps@thresholds-idle-
>         park.html> ([i915#11681]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@i915_pm_rps@thresholds-idle-
>         park.html> ([i915#11681])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@i915_pm_rps@thresholds-
>         idle-park.html> ([i915#11681])
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@i915_pm_sseu@full-enable.html>
>         ([i915#4387])
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-2/igt@i915_pm_sseu@full-enable.html>
>         ([i915#4387])
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@i915_pm_sseu@full-
>         enable.html> ([i915#4387])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@i915_pm_sseu@full-enable.html>
>         ([i915#4387])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/igt@i915_pm_sseu@full-
>         enable.html> ([i915#8437])
>   *
> 
>     igt@i915_power@sanity:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@i915_power@sanity.html>
>         ([i915#7984])
>   *
> 
>     igt@i915_query@query-topology-coherent-slice-mask:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-6/igt@i915_query@query-topology-
>         coherent-slice-mask.html> ([i915#6188])
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-8/igt@i915_selftest@live@gt_pm.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-rkl-3/igt@i915_selftest@live@gt_pm.html>
>         ([i915#13550]) +1 other test dmesg-fail
>   *
> 
>     igt@i915_suspend@debugfs-reader:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk1/igt@i915_suspend@debugfs-
>         reader.html> ([i915#4817]) +1 other test incomplete
>   *
> 
>     igt@intel_hwmon@hwmon-read:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@intel_hwmon@hwmon-
>         read.html> ([i915#7707])
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_addfb_basic@basic-x-
>         tiled-legacy.html> ([i915#4212])
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/igt@kms_async_flips@alternate-
>         sync-async-flip-atomic.html> ([i915#10991] / [i915#13320]) +1
>         other test fail
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-glk3/igt@kms_async_flips@alternate-sync-
>         async-flip-atomic.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk8/
>         igt@kms_async_flips@alternate-sync-async-flip-atomic.html>
>         ([i915#10991] / [i915#13335])
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-2:
> 
>       o shard-glk: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-glk3/igt@kms_async_flips@alternate-sync-
>         async-flip-atomic@pipe-a-hdmi-a-2.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/drm-tip/IGTPW_12583/shard-glk8/
>         igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-
>         hdmi-a-2.html> ([i915#13335])
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-
>     hdmi-a-1-y-rc-ccs-cc:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@kms_async_flips@async-flip-with-
>         page-flip-events-atomic@pipe-a-hdmi-a-1-y-rc-ccs-cc.html>
>         ([i915#8709]) +1 other test skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-
>     hdmi-a-2-4-rc-ccs-cc:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_async_flips@async-flip-
>         with-page-flip-events-atomic@pipe-d-hdmi-a-2-4-rc-ccs-cc.html>
>         ([i915#8709]) +7 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-
>     mc-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html> ([i915#8709])
>         +7 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-
>     a-1-y-rc-ccs-cc:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html>
>         ([i915#8709]) +3 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_atomic_transition@plane-all-
>         modeset-transition-internal-panels.html> ([i915#1769] / [i915#3555])
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-snb7/igt@kms_atomic_transition@plane-all-
>         modeset-transition-internal-panels.html> ([i915#1769])
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-
>     hdmi-a-1:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-tglu-9/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition@pipe-a-hdmi-a-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12583/shard-
>         tglu-6/igt@kms_atomic_transition@plane-toggle-modeset-
>         transition@pipe-a-hdmi-a-1.html> ([i915#11808]) +3 other tests fail
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-
>     hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition@pipe-a-hdmi-a-3.html> ([i915#5956])
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_big_fb@4-tiled-32bpp-
>         rotate-0.html> ([i915#5286]) +9 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_big_fb@4-tiled-64bpp-
>         rotate-0.html> ([i915#5286]) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@kms_big_fb@4-tiled-8bpp-
>         rotate-90.html> ([i915#4538] / [i915#5286]) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-async-flip.html> ([i915#5286]) +7 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-12/igt@kms_big_fb@linear-32bpp-
>         rotate-90.html> ([i915#3638]) +1 other test skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-
>         rotate-270.html> +13 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-270.html> ([i915#3638]) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_big_fb@yf-tiled-32bpp-
>         rotate-270.html> ([i915#4538] / [i915#5190]) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-6/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> ([i915#4538] / [i915#5190]) +8 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/igt@kms_big_fb@yf-tiled-64bpp-
>         rotate-180.html> ([i915#4538]) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb-
>         size-overflow.html> ([i915#6187])
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-
>         mtl-mc-ccs@pipe-a-hdmi-a-4.html> ([i915#6095]) +133 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-
>         tiled-dg2-rc-ccs.html> ([i915#6095]) +24 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/igt@kms_ccs@bad-pixel-format-4-
>         tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html> ([i915#4423] /
>         [i915#6095])
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-
>         mtl-rc-ccs@pipe-d-hdmi-a-1.html> ([i915#10307] / [i915#10434] /
>         [i915#6095]) +2 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-
>         y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html> ([i915#6095]) +59
>         other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-y-
>         tiled-gen12-mc-ccs@pipe-b-hdmi-a-3.html> ([i915#10307] /
>         [i915#6095]) +152 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_ccs@crc-primary-
>         basic-4-tiled-bmg-ccs.html> ([i915#12313])
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_ccs@crc-primary-
>         basic-4-tiled-lnl-ccs.html> ([i915#12313])
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_ccs@crc-primary-
>         basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html> ([i915#6095])
>         +54 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk9/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html> +495 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-4/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs.html> ([i915#12805])
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs.html> ([i915#12805])
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html> ([i915#6095]) +11 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk9/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html> ([i915#12796])
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-
>         tiled-ccs.html> ([i915#6095]) +107 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> ([i915#12313]) +2 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-
>         basic-yf-tiled-ccs@pipe-b-hdmi-a-2.html> ([i915#10307] /
>         [i915#6095]) +19 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/igt@kms_cdclk@mode-transition-
>         all-outputs.html> ([i915#7213] / [i915#9010])
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_chamelium_audio@dp-
>         audio.html> ([i915#11151] / [i915#7828]) +12 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-fast:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_chamelium_frames@dp-crc-
>         fast.html> ([i915#11151] / [i915#7828]) +7 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@dp-crc-single:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_chamelium_frames@dp-
>         crc-single.html> ([i915#11151] / [i915#7828]) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_chamelium_hpd@dp-hpd-
>         enable-disable-mode.html> ([i915#11151] / [i915#7828]) +2 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_chamelium_hpd@hdmi-hpd-for-
>         each-pipe.html> ([i915#11151] / [i915#7828]) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-
>         enable-disable-mode.html> ([i915#11151] / [i915#7828]) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-for-
>         each-pipe.html> ([i915#11151] / [i915#7828]) +11 other tests skip
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_color@deep-color.html>
>         ([i915#3555]) +1 other test skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/
>         igt@kms_content_protection@atomic.html> ([i915#7118] / [i915#9424])
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_content_protection@content-
>         type-change.html> ([i915#9424])
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@kms_content_protection@content-
>         type-change.html> ([i915#9424])
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/igt@kms_content_protection@dp-
>         mst-lic-type-1.html> ([i915#3116] / [i915#3299]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@kms_content_protection@dp-
>         mst-lic-type-1.html> ([i915#3299])
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_content_protection@dp-
>         mst-type-1.html> ([i915#3116] / [i915#3299])
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/
>         igt@kms_content_protection@legacy.html> ([i915#6944] / [i915#9424])
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-3:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_content_protection@lic-
>         type-0@pipe-a-dp-3.html> ([i915#7173])
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_content_protection@srm.html>
>         ([i915#7118])
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_cursor_crc@cursor-
>         offscreen-32x32.html> ([i915#3555]) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_cursor_crc@cursor-
>         offscreen-512x170.html> ([i915#13049]) +2 other tests skip
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-3/igt@kms_cursor_crc@cursor-
>         offscreen-512x170.html> ([i915#13049])
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> ([i915#13049])
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@kms_cursor_crc@cursor-
>         onscreen-256x85@pipe-a-hdmi-a-2.html> ([i915#13566]) +3 other
>         tests fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_cursor_crc@cursor-
>         onscreen-512x170.html> ([i915#13049]) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_cursor_crc@cursor-
>         onscreen-64x21@pipe-a-hdmi-a-1.html> ([i915#13566]) +1 other
>         test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-tglu-6/igt@kms_cursor_crc@cursor-
>         random-256x85@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_12583/shard-tglu-6/
>         igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html>
>         ([i915#13566]) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-
>         movement-512x170.html> ([i915#13049])
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_cursor_crc@cursor-
>         rapid-movement-64x21.html> ([i915#8814]) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-4/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-rkl-7/igt@kms_cursor_crc@cursor-
>         sliding-256x85.html> ([i915#13566]) +2 other tests fail
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_cursor_crc@cursor-
>         sliding-32x10.html> ([i915#3555]) +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-9/igt@kms_cursor_crc@cursor-
>         sliding-32x10.html> ([i915#3555]) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> ([i915#13049])
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-max-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-5/igt@kms_cursor_crc@cursor-
>         sliding-max-size.html> ([i915#3555] / [i915#8814])
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-rkl-1/
>         igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-
>         a-2.html> ([i915#12964]) +20 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-
>         cursor-legacy.html> +29 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@kms_cursor_legacy@2x-flip-
>         vs-cursor-legacy.html> ([i915#9809]) +2 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-
>         flip-before-cursor-legacy.html> ([i915#4103]) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_cursor_legacy@basic-
>         busy-flip-before-cursor-legacy.html> ([i915#4103]) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_cursor_legacy@cursora-
>         vs-flipb-toggle.html> ([i915#13046] / [i915#5354]) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-atomic-transitions-varying-size.html> ([i915#13046] /
>         [i915#5354]) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_cursor_legacy@short-busy-
>         flip-before-cursor-atomic-transitions-varying-size.html>
>         ([i915#4103] / [i915#4213])
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> ([i915#9723])
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> ([i915#9833])
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_dp_aux_dev.html> ([i915#1257])
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-
>         wc.html> ([i915#8812])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-
>         wc.html> ([i915#8812])
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) +2 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_dsc@dsc-fractional-
>         bpp.html> ([i915#3840] / [i915#9688])
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-5/igt@kms_dsc@dsc-fractional-bpp-with-
>         bpc.html> ([i915#3840])
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp-with-
>         bpc.html> ([i915#3840])
>   *
> 
>     igt@kms_dsc@dsc-with-bpc:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_dsc@dsc-with-bpc.html>
>         ([i915#3555] / [i915#3840])
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/igt@kms_dsc@dsc-with-output-
>         formats.html> ([i915#3555] / [i915#3840])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_dsc@dsc-with-output-
>         formats.html> ([i915#3555] / [i915#3840]) +2 other tests skip
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-9/igt@kms_dsc@dsc-with-output-
>         formats.html> ([i915#3555] / [i915#3840])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-5/igt@kms_dsc@dsc-with-output-
>         formats.html> ([i915#3555] / [i915#3840])
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-2/
>         igt@kms_feature_discovery@display-4x.html> ([i915#1839]) +1
>         other test skip
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_feature_discovery@dp-
>         mst.html> ([i915#9337])
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_feature_discovery@dp-
>         mst.html> ([i915#9337])
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_feature_discovery@psr2.html>
>         ([i915#658])
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_feature_discovery@psr2.html>
>         ([i915#658])
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-1/igt@kms_flip@2x-blocking-
>         wf_vblank.html> ([i915#9934]) +4 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk4/igt@kms_flip@2x-flip-vs-
>         suspend-interruptible@ab-hdmi-a1-hdmi-a2.html> ([i915#4839])
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-7/igt@kms_flip@2x-flip-vs-
>         wf_vblank-interruptible.html> ([i915#3637]) +5 other tests skip
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_flip@2x-nonexisting-
>         fb.html> ([i915#3637]) +4 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_flip@2x-plain-
>         flip.html> ([i915#3637]) +6 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-7/igt@kms_flip@2x-plain-flip-
>         interruptible.html> ([i915#9934]) +9 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@kms_flip@2x-plain-flip-
>         interruptible.html> ([i915#9934]) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_flip@2x-wf_vblank-ts-
>         check.html> ([i915#9934]) +1 other test skip
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-3/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> ([i915#10826] / [i915#11989])
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-snb6/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-snb7/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> ([i915#11989]) +5 other tests fail
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-7/igt@kms_flip@flip-vs-absolute-
>         wf_vblank.html> ([i915#6113]) +1 other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-3/igt@kms_flip@flip-vs-absolute-
>         wf_vblank@a-hdmi-a3.html> ([i915#10826])
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a3:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-3/igt@kms_flip@flip-vs-absolute-
>         wf_vblank@c-hdmi-a3.html> ([i915#11989]) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg1-13/igt@kms_flip@flip-vs-expired-
>         vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-dg1-14/igt@kms_flip@flip-vs-expired-
>         vblank.html> ([i915#13027])
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a4:
> 
>       o shard-dg1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/igt@kms_flip@flip-vs-expired-
>         vblank@a-hdmi-a4.html> ([i915#13027])
>   *
> 
>     igt@kms_flip@flip-vs-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@kms_flip@flip-vs-fences.html>
>         ([i915#8381])
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk4/igt@kms_flip@flip-vs-
>         suspend-interruptible.html> ([i915#12745] / [i915#4839]) +1
>         other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk4/igt@kms_flip@flip-vs-
>         suspend-interruptible@a-hdmi-a1.html> ([i915#12745])
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@a-edp1:
> 
>       o shard-mtlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_flip@plain-flip-ts-
>         check@a-edp1.html> ([i915#11989]) +1 other test fail
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-8/igt@kms_flip@wf_vblank-ts-check-
>         interruptible.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-
>         interruptible.html> ([i915#11989])
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-
>         interruptible@a-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-mtlp-3/igt@kms_flip@wf_vblank-ts-
>         check-interruptible@a-edp1.html> ([i915#11989]) +1 other test fail
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
> 
>       o shard-rkl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@kms_flip@wf_vblank-ts-check-
>         interruptible@b-hdmi-a1.html> ([i915#11989]) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-32bpp-yftileccs-downscaling.html> ([i915#2672] /
>         [i915#3555])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-
>         yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         upscaling@pipe-a-valid-mode.html> ([i915#2587] / [i915#2672]) +1
>         other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         downscaling@pipe-a-valid-mode.html> ([i915#2587] / [i915#2672])
>         +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytileccs-downscaling.html> ([i915#2672] /
>         [i915#3555] / [i915#5190]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytileccs-downscaling.html> ([i915#2587] /
>         [i915#2672] / [i915#3555])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         downscaling@pipe-a-default-mode.html> ([i915#2672] /
>         [i915#3555] / [i915#8813]) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-
>         ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-3/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         upscaling.html> ([i915#2587] / [i915#2672] / [i915#3555]) +1
>         other test skip
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>         upscaling.html> ([i915#2672] / [i915#3555] / [i915#5190])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>         downscaling@pipe-a-valid-mode.html> ([i915#2672]) +5 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> ([i915#2672] / [i915#3555]) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     upscaling:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling.html> ([i915#2672] / [i915#3555]) +5 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> ([i915#2672] / [i915#3555]) +1 other test skip
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> ([i915#2672] / [i915#3555])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling@pipe-a-valid-mode.html> ([i915#2672]) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         upscaling@pipe-a-default-mode.html> ([i915#2672] / [i915#8813])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> ([i915#8708]) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-shrfb-pgflip-blt.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_12583/shard-dg2-7/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-
>         blt.html> ([i915#6880]) +2 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-cur-indfb-draw-mmap-wc.html> ([i915#8708]) +16 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-indfb-plflip-blt.html> ([i915#1825]) +52 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-snb: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-spr-indfb-fullscreen.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/drm-tip/IGTPW_12583/shard-snb2/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-
>         onoff.html> +80 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>       o shard-dg2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-
>         indfb-scaledprimary.html> ([i915#6880])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> ([i915#10055])
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-
>         mmap-gtt.html> ([i915#8708]) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         ([i915#3023]) +32 other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         ([i915#3458]) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-11/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-
>         pwrite.html> ([i915#3458]) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-
>         mmap-gtt.html> ([i915#8708]) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         onoff.html> ([i915#1825]) +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         mmap-cpu.html> ([i915#5354]) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-2/
>         igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> ([i915#9766])
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-
>         blt.html> ([i915#5354]) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-
>         pwrite.html> +54 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/
>         igt@kms_frontbuffer_tracking@psr-slowdraw.html> ([i915#3458]) +5
>         other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html>
>         ([i915#3555] / [i915#8228])
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_hdr@bpc-switch-
>         dpms.html> ([i915#3555] / [i915#8228])
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_hdr@invalid-hdr.html>
>         ([i915#3555] / [i915#8228])
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_hdr@static-swap.html>
>         ([i915#3555] / [i915#8228]) +2 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@kms_hdr@static-toggle-
>         suspend.html> ([i915#3555] / [i915#8228]) +1 other test skip
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_joiner@basic-big-
>         joiner.html> ([i915#10656])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_joiner@basic-big-
>         joiner.html> ([i915#10656])
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-2/igt@kms_joiner@basic-force-big-
>         joiner.html> ([i915#12388])
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/igt@kms_joiner@basic-force-ultra-
>         joiner.html> ([i915#10656]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@kms_joiner@basic-force-ultra-
>         joiner.html> ([i915#12394])
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-10/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> ([i915#10656])
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-2/igt@kms_joiner@invalid-modeset-
>         force-big-joiner.html> ([i915#12388])
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_joiner@invalid-modeset-
>         ultra-joiner.html> ([i915#12339])
>   *
> 
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_joiner@switch-modeset-
>         ultra-joiner-big-joiner.html> ([i915#13522])
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-10/igt@kms_multipipe_modeset@basic-
>         max-pipe-crc-check.html> ([i915#4816])
>   *
> 
>     igt@kms_plane_multiple@tiling-y:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-2/igt@kms_plane_multiple@tiling-
>         y.html> ([i915#3555] / [i915#8806])
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_plane_multiple@tiling-
>         y.html> ([i915#8806])
>   *
> 
>     igt@kms_plane_multiple@tiling-yf:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-2/igt@kms_plane_multiple@tiling-
>         yf.html> ([i915#3555]) +9 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_plane_multiple@tiling-
>         yf.html> ([i915#3555]) +4 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-8/igt@kms_plane_scaling@plane-
>         downscale-factor-0-25-with-modifiers.html> ([i915#12247] /
>         [i915#9423])
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_plane_scaling@plane-
>         downscale-factor-0-25-with-pixel-format.html> ([i915#12247]) +4
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-5/igt@kms_plane_scaling@plane-
>         downscale-factor-0-25-with-rotation@pipe-c.html> ([i915#12247])
>         +17 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_plane_scaling@plane-
>         upscale-20x20-with-rotation@pipe-a.html> ([i915#12247]) +26
>         other tests skip
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@kms_plane_scaling@plane-
>         upscale-20x20-with-rotation@pipe-a.html> ([i915#12247]) +8 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25.html> ([i915#12247] /
>         [i915#6953] / [i915#9423]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25.html> ([i915#12247] /
>         [i915#6953])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25.html> ([i915#12247] /
>         [i915#6953])
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-7/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25.html> ([i915#12247] /
>         [i915#6953])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25.html> ([i915#12247] /
>         [i915#6953])
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>     factor-0-25@pipe-a:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-4/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25@pipe-a.html>
>         ([i915#12247]) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>     factor-0-25@pipe-b:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-8/igt@kms_plane_scaling@planes-
>         downscale-factor-0-25-upscale-factor-0-25@pipe-b.html>
>         ([i915#12247]) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-5/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-25.html> ([i915#12247] /
>         [i915#3555])
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_pm_backlight@bad-
>         brightness.html> ([i915#5354])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-18/igt@kms_pm_backlight@bad-
>         brightness.html> ([i915#5354])
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-10/igt@kms_pm_backlight@bad-
>         brightness.html> ([i915#9812])
>   *
> 
>     igt@kms_pm_backlight@brightness-with-dpms:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-7/
>         igt@kms_pm_backlight@brightness-with-dpms.html> ([i915#12343])
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@kms_pm_dc@dc5-retention-
>         flops.html> ([i915#3828])
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#5978])
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html>
>         ([i915#4281])
>   *
> 
>     igt@kms_pm_lpsp@screens-disabled:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_pm_lpsp@screens-
>         disabled.html> ([i915#8430])
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@kms_pm_rpm@dpms-non-
>         lpsp.html> ([i915#9519]) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>       o shard-rkl: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-
>         stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         ([i915#9519])
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-9/igt@kms_pm_rpm@modeset-non-
>         lpsp-stress-no-wait.html> ([i915#9519]) +2 other tests skip
>   *
> 
>     igt@kms_pm_rpm@system-suspend-modeset:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk3/igt@kms_pm_rpm@system-
>         suspend-modeset.html> ([i915#10553])
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_prime@d3hot.html>
>         ([i915#6524])
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-move-continuous-exceed-sf.html> ([i915#11520]) +1 other
>         test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-
>         update-sf-dmg-area.html> ([i915#11520]) +14 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-cursor-
>         plane-move-continuous-exceed-sf.html> ([i915#11520]) +8 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-snb: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-snb1/igt@kms_psr2_sf@fbc-psr2-overlay-
>         plane-update-continuous-sf.html> ([i915#11520]) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area@pipe-a-edp-1.html> ([i915#9808])
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-plane-
>         move-sf-dmg-area@pipe-b-edp-1.html> ([i915#12316]) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_psr2_sf@pr-cursor-plane-
>         move-continuous-sf.html> ([i915#11520]) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-sf.html> ([i915#11520]) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-7/igt@kms_psr2_sf@psr2-overlay-
>         plane-move-continuous-exceed-fully-sf.html> ([i915#11520]) +5
>         other tests skip
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-6/igt@kms_psr2_sf@psr2-overlay-plane-
>         update-continuous-sf.html> ([i915#11520]) +3 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> ([i915#9683]) +1 other test skip
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> ([i915#9683])
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@kms_psr2_su@page_flip-
>         p010.html> ([i915#4348])
>   *
> 
>     igt@kms_psr@fbc-psr-no-drrs:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-6/igt@kms_psr@fbc-psr-no-
>         drrs.html> ([i915#9732]) +22 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-4/igt@kms_psr@fbc-psr-sprite-
>         plane-onoff.html> ([i915#9688]) +16 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-basic:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_psr@fbc-psr2-
>         basic.html> ([i915#9732]) +13 other tests skip
>   *
> 
>     igt@kms_psr@pr-cursor-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_psr@pr-cursor-mmap-cpu.html>
>         ([i915#1072] / [i915#9732]) +16 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-blt:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_psr@psr-cursor-blt.html>
>         ([i915#1072] / [i915#9732]) +7 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-move:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-1/igt@kms_psr@psr-sprite-plane-
>         move.html> ([i915#1072] / [i915#9732]) +28 other tests skip
>   *
> 
>     igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_psr@psr2-sprite-mmap-
>         gtt.html> ([i915#1072] / [i915#9732]) +10 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/igt@kms_psr@psr2-sprite-mmap-
>         gtt.html> ([i915#4077] / [i915#9688]) +1 other test skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_psr_stress_test@flip-
>         primary-invalidate-overlay.html> ([i915#9685]) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-0.html> ([i915#5190])
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-4/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-0.html> ([i915#5289])
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_rotation_crc@primary-
>         yf-tiled-reflect-x-180.html> ([i915#5289])
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-15/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-270.html> ([i915#5289])
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-5/igt@kms_rotation_crc@sprite-
>         rotation-90-pos-100-0.html> ([i915#12755])
>   *
> 
>     igt@kms_selftest@drm_framebuffer:
> 
>       o shard-rkl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-rkl-5/
>         igt@kms_selftest@drm_framebuffer.html> ([i915#13179]) +1 other
>         test abort
>       o shard-snb: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-snb7/
>         igt@kms_selftest@drm_framebuffer.html> ([i915#13179]) +1 other
>         test abort
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/igt@kms_setmode@clone-
>         exclusive-crtc.html> ([i915#3555] / [i915#8809])
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-5/igt@kms_setmode@invalid-clone-
>         exclusive-crtc.html> ([i915#3555] / [i915#8809] / [i915#8823])
>   *
> 
>     igt@kms_sysfs_edid_timing:
> 
>       o shard-dg1: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-13/igt@kms_sysfs_edid_timing.html>
>         ([IGT#160] / [i915#6493])
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_tiled_display@basic-
>         test-pattern.html> ([i915#8623]) +1 other test skip
>       o shard-glk: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk3/igt@kms_tiled_display@basic-test-
>         pattern.html> ([i915#10959])
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-7/igt@kms_tiled_display@basic-test-
>         pattern.html> ([i915#8623]) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> ([i915#8623])
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-14/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> ([i915#8623])
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-3/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> ([i915#8623])
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-d-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-mtlp-6/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html>
>         ([i915#9196]) +1 other test fail
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-glk8/igt@kms_vblank@ts-
>         continuation-dpms-suspend@pipe-a-hdmi-a-2.html> ([i915#12276])
>         +1 other test incomplete
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-dg2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-2/igt@kms_vrr@max-min.html> ([i915#9906])
>       o shard-tglu-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-1/igt@kms_vrr@max-min.html>
>         ([i915#9906])
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-virtual:
> 
>       o shard-dg1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-17/igt@kms_vrr@seamless-rr-switch-
>         virtual.html> ([i915#9906])
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-vrr:
> 
>       o shard-tglu: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> ([i915#9906]) +1 other test skip
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-
>         vrr.html> ([i915#9906])
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-5/igt@kms_writeback@writeback-check-
>         output.html> ([i915#2437])
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-glk: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-glk2/igt@kms_writeback@writeback-fb-
>         id.html> ([i915#2437]) +2 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-6/igt@kms_writeback@writeback-pixel-
>         formats.html> ([i915#2437] / [i915#9412])
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@perf@gen8-unprivileged-
>         single-ctx-counters.html> ([i915#2436])
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-4/igt@perf@gen8-unprivileged-single-
>         ctx-counters.html> ([i915#2436])
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-mtlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-mtlp-6/igt@perf@mi-rpc.html> ([i915#2434])
>   *
> 
>     igt@perf@per-context-mode-unprivileged:
> 
>       o shard-rkl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-rkl-2/igt@perf@per-context-mode-
>         unprivileged.html> ([i915#2435])
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o shard-dg2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/drm-tip/IGTPW_12583/shard-dg2-11/igt@perf_pmu@module-
>         unload.html> ([i915#13520])
>   *
> 
>     igt@perf_pmu@rc6-all-gts:
> 
>       o shard-dg2-9: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         drm-tip/IGTPW_12583/shard-dg2-9/igt@perf_pmu@rc6-all-gts.html>
>         ([i915#8516])
>   *
> 
>     igt@perf_pmu@render-node-busy-idle:
> 
>       o shard-mtlp: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-mtlp-1/igt@perf_pmu@render-node-busy-
>         idle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12583/shard-mtlp-2/igt@perf_pmu@render-node-busy-
>         idle.html> ([i915#4349]) +4 other tests fail
>   *
> 
>     igt@perf_pmu@render-node-busy-idle@vcs1:
> 
>       o shard-dg2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg2-10/igt@perf_pmu@render-node-busy-
>         idle@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg2-6/igt@perf_pmu@render-node-busy-
>         idle@vcs1.html> ([i915#4349]) +3 other tests fail
>       o shard-dg1: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         CI_DRM_16125/shard-dg1-12/igt@perf_pmu@render-node-busy-
>         idle@vcs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12583/shard-dg1-19/igt@perf_pmu@render-node-busy-
>         idle@vcs1.html> ([i915#4349]) +2 other tests fail
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-rkl: NOTRUN -> SKIP <htt> ([i915#3291] / [i915#3708]) +1
>         other test skip
> 

