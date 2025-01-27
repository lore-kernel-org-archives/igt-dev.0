Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FD4C0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 04:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318FE10E194;
	Mon, 27 Jan 2025 04:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xd7ck5TB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D25F10E194;
 Mon, 27 Jan 2025 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737953963; x=1769489963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h785C7AGNJBCzhSWFkePHovqGljWK1NIBJ2z+6wuWQw=;
 b=Xd7ck5TBWsUECb3EwjAIFKw5Ob+Vg/GCmToCHyAOy2e9XfLnvJrOmil8
 8Gc8NnSwk+sL9yE1HScHkA17WqaYhTszrOaA6QGkJSUDDgzxRAiSvESdM
 xKaK9MQ7ag9ViSoSZa7FCmqdy99wIiCOoiHNZYRc5jKdhi80fvsq3Wwoz
 HscACnBlhj61XAU7LJjaTWjPWy/LoF/FgryTTKqEvokIuM1SiOFPbUOCo
 QhVuHM2fO/O1DGMS7l0+AhYDVFBUXPS53gKU4FfN60S/c5/sOj4QtPVXA
 vGPezOgBfnnIWJ70HaZV1HGsQ3sDchdcTuLiKbFBM4IjkTWcsL4L9Mavm A==;
X-CSE-ConnectionGUID: HtHxNrRaQnWHfgjZgu8PNQ==
X-CSE-MsgGUID: 00d/HQaDRm++kYCbZP5Qeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="48997508"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="48997508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:59:23 -0800
X-CSE-ConnectionGUID: NTtsu4w9RK2KpLdtFwnKWQ==
X-CSE-MsgGUID: Op6KISNsR5OfqWVtSpA77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131630450"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:59:21 -0800
Date: Mon, 27 Jan 2025 05:59:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Drop device scan cache logic (rev2)
Message-ID: <20250127045917.yfigrosotywstk67@zkempczy-mobl2>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <173768939395.3837267.711645832011424890@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173768939395.3837267.711645832011424890@b555e5b46a47>
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

On Fri, Jan 24, 2025 at 03:29:53AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Drop device scan cache logic (rev2)                             
>    URL:     https://patchwork.freedesktop.org/series/143880/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12487/index.html 
> 
>         CI Bug Log - changes from CI_DRM_16005_full -> IGTPW_12487_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_12487_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12487_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12487/index.html
> 
> Participating hosts (11 -> 10)
> 
>    Missing (1): shard-glk-0
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_12487_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_eio@in-flight-contexts-1us:
> 
>           * shard-mtlp: PASS -> ABORT
>      * igt@gem_workarounds@suspend-resume-context:
> 
>           * shard-dg1: NOTRUN -> ABORT
>      * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: PASS -> FAIL +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-tglu: NOTRUN -> FAIL +1 other test fail
>      * igt@kms_plane_cursor@viewport:
> 
>           * shard-mtlp: PASS -> DMESG-WARN

Series don't have any relation to these failures.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_16005_full and
>    IGTPW_12487_full:
> 
>   New IGT tests (154)
> 
>      * igt@gem_exec_schedule@noreorder:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.34, 0.41] s
>      * igt@gem_exec_schedule@noreorder-corked:
> 
>           * Statuses : 6 pass(s) 1 skip(s)
>           * Exec time: [0.0, 8.07] s
>      * igt@gem_exec_schedule@noreorder-corked@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [1.10, 1.13] s
>      * igt@gem_exec_schedule@noreorder-corked@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.11, 1.16] s
>      * igt@gem_exec_schedule@noreorder-corked@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.11, 1.68] s
>      * igt@gem_exec_schedule@noreorder-corked@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [1.13, 2.08] s
>      * igt@gem_exec_schedule@noreorder-corked@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.10, 1.99] s
>      * igt@gem_exec_schedule@noreorder-priority:
> 
>           * Statuses : 6 pass(s) 1 skip(s)
>           * Exec time: [0.0, 8.33] s
>      * igt@gem_exec_schedule@noreorder-priority@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [1.11, 1.14] s
>      * igt@gem_exec_schedule@noreorder-priority@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.11, 1.19] s
>      * igt@gem_exec_schedule@noreorder-priority@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.11, 2.01] s
>      * igt@gem_exec_schedule@noreorder-priority@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [1.12, 1.99] s
>      * igt@gem_exec_schedule@noreorder-priority@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.11, 1.99] s
>      * igt@gem_exec_schedule@noreorder@bcs0:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.07, 0.08] s
>      * igt@gem_exec_schedule@noreorder@rcs0:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.07] s
>      * igt@gem_exec_schedule@noreorder@vcs0:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.09] s
>      * igt@gem_exec_schedule@noreorder@vcs1:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.05, 0.08] s
>      * igt@gem_exec_schedule@noreorder@vecs0:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.07, 0.08] s
>      * igt@gem_exercise_blt@fast-copy:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.08, 0.65] s
>      * igt@gem_exercise_blt@fast-copy-emit:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.94] s
>      * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.09] s
>      * igt@gem_exercise_blt@fast-copy-emit@linear-lmem0-smem-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.09] s
>      * igt@gem_exercise_blt@fast-copy-emit@linear-smem-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy-emit@linear-smem-smem-emit:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.02, 0.05] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.10] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile4-lmem0-smem-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.10] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile4-smem-smem-emit:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.01, 0.02] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.11] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile64-lmem0-smem-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.06, 0.10] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-lmem0-emit:
> 
>           * Statuses : 2 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy-emit@tile64-smem-smem-emit:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@gem_exercise_blt@fast-copy-emit@yfmajor-smem-smem-emit:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.04] s
>      * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-lmem0-emit:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy-emit@ymajor-lmem0-smem-emit:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-lmem0-emit:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy-emit@ymajor-smem-smem-emit:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@gem_exercise_blt@fast-copy@linear-lmem0-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@linear-lmem0-smem:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@linear-smem-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_exercise_blt@fast-copy@linear-smem-smem:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.02, 0.05] s
>      * igt@gem_exercise_blt@fast-copy@tile4-lmem0-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@tile4-lmem0-smem:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@tile4-smem-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy@tile4-smem-smem:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.02] s
>      * igt@gem_exercise_blt@fast-copy@tile64-lmem0-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@tile64-lmem0-smem:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@tile64-smem-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy@tile64-smem-smem:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.02, 0.04] s
>      * igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@ymajor-lmem0-smem:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.06] s
>      * igt@gem_exercise_blt@fast-copy@ymajor-smem-lmem0:
> 
>           * Statuses : 1 pass(s)
>           * Exec time: [0.01] s
>      * igt@gem_exercise_blt@fast-copy@ymajor-smem-smem:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.02, 0.07] s
>      * igt@gem_spin_batch@engines:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [9.94, 22.68] s
>      * igt@gem_spin_batch@engines@bcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@engines@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@engines@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.23, 3.33] s
>      * igt@gem_spin_batch@engines@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@engines@vecs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [3.23, 3.33] s
>      * igt@gem_spin_batch@legacy:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [16.56, 23.24] s
>      * igt@gem_spin_batch@legacy-resubmit:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@gem_spin_batch@legacy-resubmit-new:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.06] s
>      * igt@gem_spin_batch@legacy-resubmit-new@blt:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@legacy-resubmit-new@bsd:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@legacy-resubmit-new@bsd1:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@legacy-resubmit-new@bsd2:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit-new@default:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@gem_spin_batch@legacy-resubmit-new@render:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@legacy-resubmit-new@vebox:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@legacy-resubmit@blt:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit@bsd:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit@bsd1:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit@bsd2:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit@default:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@gem_spin_batch@legacy-resubmit@render:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy-resubmit@vebox:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@legacy@blt:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@bsd:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@bsd1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@bsd2:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@default:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@render:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@legacy@vebox:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [3.23, 3.32] s
>      * igt@gem_spin_batch@resubmit:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@gem_spin_batch@resubmit-all:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.05] s
>      * igt@gem_spin_batch@resubmit-all@bcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.02] s
>      * igt@gem_spin_batch@resubmit-all@rcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.04] s
>      * igt@gem_spin_batch@resubmit-all@vcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-all@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit-all@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.01, 0.06] s
>      * igt@gem_spin_batch@resubmit-new-all:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.08] s
>      * igt@gem_spin_batch@resubmit-new-all@bcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new-all@rcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@gem_spin_batch@resubmit-new-all@vcs0:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new-all@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new-all@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit-new@rcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@gem_spin_batch@resubmit-new@vcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@gem_spin_batch@resubmit-new@vcs1:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit-new@vecs0:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit@bcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.03] s
>      * igt@gem_spin_batch@resubmit@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@resubmit@vecs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.00] s
>      * igt@gem_spin_batch@spin-all:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.04] s
>      * igt@gem_spin_batch@spin-all-new:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.05] s
>      * igt@gem_spin_batch@spin-each:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.34, 3.40] s
>      * igt@gem_spin_batch@user-each:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [3.27, 3.42] s
>      * igt@i915_hangman@detector:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [48.89, 71.71] s
>      * igt@i915_hangman@detector@bcs0:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [9.95, 12.03] s
>      * igt@i915_hangman@detector@rcs0:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [8.88, 11.74] s
>      * igt@i915_hangman@detector@vcs0:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [10.04, 11.97] s
>      * igt@i915_hangman@detector@vcs1:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [9.97, 11.96] s
>      * igt@i915_hangman@detector@vecs0:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [9.98, 12.03] s
>      * igt@i915_hangman@engine-engine-error:
> 
>           * Statuses : 6 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.11] s
>      * igt@i915_hangman@engine-engine-error@bcs0:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.00, 1.98] s
>      * igt@i915_hangman@engine-engine-error@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 1.06] s
>      * igt@i915_hangman@engine-engine-error@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 2.05] s
>      * igt@i915_hangman@engine-engine-error@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.08, 1.98] s
>      * igt@i915_hangman@engine-engine-error@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 1.98] s
>      * igt@i915_hangman@engine-engine-hang:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.51] s
>      * igt@i915_hangman@engine-engine-hang@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.58, 1.98] s
>      * igt@i915_hangman@engine-engine-hang@rcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.59, 1.53] s
>      * igt@i915_hangman@engine-engine-hang@vcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.57, 1.98] s
>      * igt@i915_hangman@engine-engine-hang@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.58, 1.98] s
>      * igt@i915_hangman@engine-engine-hang@vecs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.57, 2.05] s
>      * igt@i915_hangman@engine-error-state-capture:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [16.20, 32.73] s
>      * igt@i915_hangman@engine-error-state-capture@bcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.96, 5.95] s
>      * igt@i915_hangman@engine-error-state-capture@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [1.80, 4.58] s
>      * igt@i915_hangman@engine-error-state-capture@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.03, 5.05] s
>      * igt@i915_hangman@engine-error-state-capture@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [3.97, 6.02] s
>      * igt@i915_hangman@engine-error-state-capture@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [3.95, 5.95] s
>      * igt@i915_hangman@gt-engine-error:
> 
>           * Statuses : 6 pass(s) 1 skip(s)
>           * Exec time: [0.0, 11.36] s
>      * igt@i915_hangman@gt-engine-error@bcs0:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.00, 2.08] s
>      * igt@i915_hangman@gt-engine-error@rcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.06, 1.20] s
>      * igt@i915_hangman@gt-engine-error@vcs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.07, 2.01] s
>      * igt@i915_hangman@gt-engine-error@vcs1:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [0.07, 2.00] s
>      * igt@i915_hangman@gt-engine-error@vecs0:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.08, 2.00] s
>      * igt@i915_hangman@gt-engine-hang:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 5.23] s
>      * igt@i915_hangman@gt-engine-hang@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.57, 0.72] s
>      * igt@i915_hangman@gt-engine-hang@rcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.58, 0.82] s
>      * igt@i915_hangman@gt-engine-hang@vcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.57, 0.74] s
>      * igt@i915_hangman@gt-engine-hang@vcs1:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [0.59, 0.73] s
>      * igt@i915_hangman@gt-engine-hang@vecs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [0.57, 0.71] s
>      * igt@i915_hangman@gt-error-state-capture:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [11.68, 68.53] s
>      * igt@i915_hangman@gt-error-state-capture@bcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [3.97, 10.01] s
>      * igt@i915_hangman@gt-error-state-capture@rcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [3.69, 9.91] s
>      * igt@i915_hangman@gt-error-state-capture@vcs0:
> 
>           * Statuses : 5 pass(s)
>           * Exec time: [4.02, 10.01] s
>      * igt@i915_hangman@gt-error-state-capture@vcs1:
> 
>           * Statuses : 3 pass(s)
>           * Exec time: [9.97, 10.04] s
>      * igt@i915_hangman@gt-error-state-capture@vecs0:
> 
>           * Statuses : 4 pass(s)
>           * Exec time: [9.04, 9.99] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_12487_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@crc32:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6230])
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8411])
>      * igt@drm_fdinfo@busy-hang@bcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8414]) +9 other tests skip
>      * igt@drm_fdinfo@busy-hang@rcs0:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8414]) +7 other tests skip
>      * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8414]) +13 other tests skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3936])
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@block-multicopy-inplace:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#9323]) +1 other
>             test skip
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#9323])
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9323])
>      * igt@gem_ccs@large-ctrl-surf-copy:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#13008])
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#7697])
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6335])
>           * shard-rkl: NOTRUN -> SKIP ([i915#6335])
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8555])
>           * shard-dg1: NOTRUN -> SKIP ([i915#8555])
>      * igt@gem_ctx_persistence@smoketest:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#1099])
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#280])
>      * igt@gem_eio@hibernate:
> 
>           * shard-dg1: NOTRUN -> ABORT ([i915#7975] / [i915#8213])
>           * shard-dg2: NOTRUN -> ABORT ([i915#10030] / [i915#7975] /
>             [i915#8213])
>      * igt@gem_eio@kms:
> 
>           * shard-dg1: PASS -> FAIL ([i915#5784])
>      * igt@gem_eio@unwedge-stress:
> 
>           * shard-mtlp: PASS -> ABORT ([i915#13193]) +1 other test abort
>           * shard-dg1: PASS -> FAIL ([i915#12714] / [i915#5784])
>      * igt@gem_exec_balancer@bonded-semaphore:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4812])
>      * igt@gem_exec_balancer@bonded-sync:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4771]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#4771])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4771])
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4525]) +4 other tests skip
>      * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4525])
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6334]) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#6334]) +1 other test skip
>      * igt@gem_exec_fence@syncobj-channel:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#118])
>      * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3539] / [i915#4852]) +4 other
>             tests skip
>      * igt@gem_exec_reloc@basic-cpu-read:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281]) +8 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281]) +10 other tests skip
>      * igt@gem_exec_reloc@basic-range:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3281]) +2 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3281]) +7 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-contexts:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4812]) +1 other test skip
>      * igt@gem_exec_schedule@preempt-queue-contexts-chain:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4537] / [i915#4812])
>      * igt@gem_exec_suspend@basic-s3@smem:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#13196]) +1 other test
>             incomplete
>      * igt@gem_exec_suspend@basic-s4-devices:
> 
>           * shard-rkl: NOTRUN -> ABORT ([i915#7975] / [i915#8213]) +2 other
>             tests abort
>      * igt@gem_fence_thrash@bo-write-verify-none:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4860]) +2 other tests skip
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4860]) +1 other test skip
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613] / [i915#7582])
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#4613]) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4613])
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4613]) +2 other tests skip
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#4613]) +6 other tests skip
>      * igt@gem_lmem_swapping@verify-random-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12193])
>      * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4565])
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8289])
>      * igt@gem_media_vme:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#284])
>      * igt@gem_mmap_gtt@big-bo-tiledx:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4077]) +6 other tests skip
>      * igt@gem_mmap_gtt@coherency:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4077]) +12 other tests skip
>      * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4077]) +3 other tests skip
>      * igt@gem_mmap_wc@write:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4083]) +2 other tests skip
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4083]) +6 other tests skip
>      * igt@gem_mmap_wc@write-wc-read-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4083]) +3 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282]) +3 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3282]) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#3282]) +6 other tests skip
>           * shard-snb: NOTRUN -> WARN ([i915#2658])
>      * igt@gem_pxp@display-protected-crc:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12917] / [i915#12964]) +3
>             other tests timeout
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>           * shard-rkl: NOTRUN -> TIMEOUT ([i915#12964]) +1 other test timeout
>           * shard-dg1: NOTRUN -> SKIP ([i915#4270]) +3 other tests skip
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#13398])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13398])
>      * igt@gem_readwrite@new-obj:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3282]) +4 other tests skip
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8428]) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190] / [i915#8428]) +4 other
>             tests skip
>      * igt@gem_set_tiling_vs_gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4079]) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4079])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4079])
>      * igt@gem_tiled_swapping@non-threaded:
> 
>           * shard-tglu: PASS -> FAIL ([i915#13557])
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3297]) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP ([i915#3297])
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3282] / [i915#3297])
>      * igt@gem_userptr_blits@map-fixed-invalidate:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4880])
>      * igt@gem_userptr_blits@readonly-unsync:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297]) +2 other tests skip
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3281] / [i915#3297])
>           * shard-rkl: NOTRUN -> SKIP ([i915#3281] / [i915#3297])
>      * igt@gem_userptr_blits@sd-probe:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3297] / [i915#4958])
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3297])
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2527]) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#2527]) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2856]) +1 other test skip
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2527] / [i915#2856])
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2856]) +2 other tests skip
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2527] / [i915#2856]) +3 other
>             tests skip
>      * igt@i915_fb_tiling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4881])
>           * shard-dg1: NOTRUN -> SKIP ([i915#4881])
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-snb: PASS -> ABORT ([i915#9820])
>           * shard-dg1: NOTRUN -> ABORT ([i915#13493] / [i915#9820])
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6412])
>      * igt@i915_pm_freq_api@freq-reset:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8399])
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: PASS -> INCOMPLETE ([i915#12455]) +1 other test
>             incomplete
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-rkl: PASS -> FAIL ([i915#12942]) +1 other test fail
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11681] / [i915#6621])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11681] / [i915#6621])
>      * igt@i915_pm_rps@thresholds-park:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11681])
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4387])
>      * igt@i915_query@hwconfig_table:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6245])
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6188])
>           * shard-dg2: NOTRUN -> SKIP ([i915#6188])
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-mtlp: PASS -> DMESG-FAIL ([i915#12061]) +1 other test
>             dmesg-fail
>      * igt@i915_selftest@mock:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#1982] / [i915#9311])
>      * igt@i915_selftest@mock@memory_region:
> 
>           * shard-glk: NOTRUN -> DMESG-WARN ([i915#9311])
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4817])
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-glk: PASS -> INCOMPLETE ([i915#4817])
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#7707])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#7707])
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4212])
>      * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4212]) +1 other test skip
>      * igt@kms_async_flips@async-flip-suspend-resume:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12761] / [i915#1982]) +1
>             other test incomplete
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8709]) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8709]) +7 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#8709]) +3 other tests skip
>      * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#8709]) +3 other tests skip
>      * igt@kms_atomic_transition@modeset-transition-fencing:
> 
>           * shard-glk: PASS -> FAIL ([i915#12238])
>      * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
> 
>           * shard-glk: PASS -> FAIL ([i915#11859])
>      * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> 
>           * shard-tglu: PASS -> FAIL ([i915#11808]) +1 other test fail
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#1769] / [i915#3555])
>           * shard-glk: NOTRUN -> SKIP ([i915#1769])
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#5286]) +1 other test skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5286]) +6 other tests skip
>      * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#5286]) +8 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP +9 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538] / [i915#5286]) +6 other
>             tests skip
>      * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#5286])
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#5138])
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3638]) +4 other tests skip
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4538] / [i915#5190]) +7 other
>             tests skip
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3638]) +5 other tests skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4538]) +6 other tests skip
>      * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5190])
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#6095]) +177 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#10434] /
>             [i915#6095]) +1 other test skip
>      * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6095]) +49 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12313])
>      * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6095]) +49 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12313]) +2 other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#6095]) +24 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12805])
>           * shard-tglu: NOTRUN -> SKIP ([i915#12805])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12805])
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6095]) +78 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#6095]) +21 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12796])
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#10307] / [i915#6095]) +132 other
>             tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#4423] / [i915#6095]) +1 other
>             test skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12313]) +1 other test skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3742])
>      * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#4087]) +3 other tests skip
>      * igt@kms_chamelium_edid@vga-edid-read:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +2 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +6 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-single:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +2
>             other tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +11 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +8 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#11151] / [i915#7828]) +10 other
>             tests skip
>      * igt@kms_content_protection@atomic@pipe-a-dp-4:
> 
>           * shard-dg2: NOTRUN -> TIMEOUT ([i915#7173])
>      * igt@kms_content_protection@content-type-change:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6944] / [i915#9424])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#6944] / [i915#9424])
>           * shard-dg2: NOTRUN -> SKIP ([i915#9424])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9424])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9424])
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9433])
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#7116] / [i915#9424])
>      * igt@kms_cursor_crc@cursor-offscreen-32x32:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3555]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#13049])
>           * shard-rkl: NOTRUN -> SKIP ([i915#13049])
>           * shard-dg1: NOTRUN -> SKIP ([i915#13049])
>      * igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>           * shard-rkl: PASS -> FAIL ([i915#13566])
>      * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> FAIL ([i915#13566]) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3555] / [i915#8814]) +1 other
>             test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555]) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-snb: NOTRUN -> SKIP +194 other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3555]) +7 other tests skip
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8814])
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#13049]) +3 other tests skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#4103])
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#13046] / [i915#5354]) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9809]) +3 other tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: PASS -> FAIL ([i915#2346])
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#2346])
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9067])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4213])
>           * shard-dg2: NOTRUN -> SKIP ([i915#4103] / [i915#4213])
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4103]) +1 other test skip
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9723])
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9723])
>      * igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12402])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12402])
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12402])
>      * igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8812])
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3840])
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#3840])
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3840] / [i915#9053])
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#9878])
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3469])
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2065] / [i915#4854])
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#1839])
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1839])
>           * shard-dg1: NOTRUN -> SKIP ([i915#1839]) +1 other test skip
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9337])
>           * shard-dg1: NOTRUN -> SKIP ([i915#9337])
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#658])
>      * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3637]) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#3637]) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#9934]) +7 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#3637]) +3 other tests skip
>      * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#4839])
>      * igt@kms_flip@2x-flip-vs-wf_vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9934]) +1 other test skip
>      * igt@kms_flip@2x-plain-flip-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9934]) +7 other tests skip
>      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>           * shard-snb: PASS -> FAIL ([i915#11989]) +5 other tests fail
>      * igt@kms_flip@flip-vs-expired-vblank:
> 
>           * shard-dg2: PASS -> FAIL ([i915#13027])
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
> 
>           * shard-tglu: NOTRUN -> FAIL ([i915#13027]) +1 other test fail
>      * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#13027])
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745] / [i915#4839]) +1
>             other test incomplete
>      * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE ([i915#12745])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2672] / [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#2672]) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#3555] /
>             [i915#8813]) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#2587] / [i915#2672] /
>             [i915#3555])
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +3 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +6 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#2672] / [i915#8813])
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#2587] / [i915#2672]) +4 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +6 other
>             tests skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#2672] / [i915#3555]) +5 other
>             tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#2672]) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#1825]) +35 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-snb: PASS -> SKIP +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> FAIL ([i915#6880])
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#3458]) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +46 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#1825]) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3458]) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5439])
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3023]) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#8708]) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
> 
>           * shard-tglu: NOTRUN -> SKIP +78 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#5354]) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +37 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#8708]) +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +6 other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12713])
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +1 other
>             test skip
>      * igt@kms_hdr@static-toggle-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3555] / [i915#8228]) +2 other
>             tests skip
>      * igt@kms_joiner@basic-force-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12388])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12388])
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12388])
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12339])
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#13522])
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#4816])
>           * shard-rkl: NOTRUN -> SKIP ([i915#4070] / [i915#4816])
>           * shard-tglu: NOTRUN -> SKIP ([i915#1839]) +1 other test skip
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#6301])
>           * shard-rkl: NOTRUN -> SKIP ([i915#6301])
>           * shard-dg1: NOTRUN -> SKIP ([i915#6301])
>      * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
> 
>           * shard-rkl: NOTRUN -> DMESG-FAIL ([i915#12964]) +1 other test
>             dmesg-fail
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647] / [i915#12177])
>      * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: PASS -> DMESG-WARN ([i915#12964]) +37 other tests
>             dmesg-warn
>      * igt@kms_plane_alpha_blend@constant-alpha-max:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647] / [i915#12169])
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL ([i915#10647]) +3 other tests fail
>      * igt@kms_plane_cursor@viewport@pipe-d-edp-1-size-256:
> 
>           * shard-mtlp: PASS -> DMESG-WARN ([i915#1982])
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#12247]) +8 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#12247]) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12247]) +2 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#3555] /
>             [i915#6953])
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247]) +12 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
> 
>           * shard-mtlp: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#6953] /
>             [i915#9423])
>           * shard-tglu: NOTRUN -> SKIP ([i915#12247] / [i915#6953])
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247]) +7 other tests skip
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#12247]) +8 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#12247] / [i915#3555] /
>             [i915#9423])
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#12343])
>           * shard-dg1: NOTRUN -> SKIP ([i915#12343])
>           * shard-tglu: NOTRUN -> SKIP ([i915#12343])
>           * shard-dg2: NOTRUN -> SKIP ([i915#12343])
>      * igt@kms_pm_backlight@fade:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9812])
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#5354]) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP ([i915#5354]) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP ([i915#9812])
>      * igt@kms_pm_dc@dc5-psr:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9685])
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3828])
>      * igt@kms_pm_dc@dc6-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#3361])
>           * shard-tglu: PASS -> FAIL ([i915#9295])
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-mtlp: PASS -> FAIL ([i915#12912])
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#4281])
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-rkl: PASS -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#9519])
>           * shard-rkl: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#9519]) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP ([i915#9519]) +1 other test skip
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#9519])
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: NOTRUN -> SKIP ([i915#6524])
>           * shard-dg1: NOTRUN -> SKIP ([i915#6524]) +1 other test skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> 
>           * shard-snb: NOTRUN -> SKIP ([i915#11520]) +7 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP ([i915#11520]) +10 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>           * shard-glk: NOTRUN -> SKIP ([i915#11520]) +15 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP ([i915#11520]) +4 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP ([i915#11520]) +5 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP ([i915#11520]) +3 other tests skip
