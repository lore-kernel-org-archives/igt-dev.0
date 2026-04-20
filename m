Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3401F5A8AA
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 18:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD0910E74C;
	Mon, 20 Apr 2026 18:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6RJNUJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFE810E74C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776709649; x=1808245649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EIufNJV/MLde2LtdIsVjam7MWBfLtcMC/Jm/fcfXYFQ=;
 b=l6RJNUJNt/+tVObr9ozWE7Y7WzOuHny3oJP6Ju/XRlUCztW2hjnvzCpy
 XUIT3/kBlWrRL6Buu0SwoIb0Fo89TV+AqOOtAu++8SaSnziN1GfJIC30Z
 3P2Cu0VNtapcycXlctITcqiQz7bG52ciSTRYNUe8+pGR5sFkmJmaHTKS3
 MzjATu2Y6VG1Flouw5w6/lxDh1U6v/jsJtfmbTP6RUDBb+kVqt7Q1uyzt
 b+CdP+mJTZ0tBFzJ+7KBB8g4KmxYqJ+lTmHcysk6UaVvnlgLn+9Ub/n8K
 lq/J1Pl1Q/ia6WVJZtEEGTy53rVkepO+TvbhrxKmgIdzWlscglCW2TY5F w==;
X-CSE-ConnectionGUID: LNsOadzZT8mhFPHl4QHmvQ==
X-CSE-MsgGUID: s5bQeJzoSuGsqXWEV3xADA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88251746"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="88251746"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 11:27:28 -0700
X-CSE-ConnectionGUID: ET4Z1nF1Qw25/YEzmxpRIg==
X-CSE-MsgGUID: Cuy9DSqfSpmupHULBpg9ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="255266409"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 11:27:25 -0700
Date: Mon, 20 Apr 2026 20:27:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com
Subject: Re: [PATCH i-g-t 1/3] tools/vmtb: Define IGT tests used as VF
 migration workloads
Message-ID: <20260420182723.jlgmzn2pjizesoyg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com
References: <20260416083544.2441874-1-adam.miszczak@linux.intel.com>
 <20260416083544.2441874-2-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416083544.2441874-2-adam.miszczak@linux.intel.com>
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

Hi Adam,
On 2026-04-16 at 10:35:42 +0200, Adam Miszczak wrote:
> New VF busy migration scenarios are expected to utilize IGT tests as workloads,
> specifically several subtests from 'xe_exec_reset', 'xe_exec_threads', 'xe_ccs'
> and 'xe_compute_preempt'.
> Extend IgtExecutor support for relevant IGTs (IgtType definitions and mappings).
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>

For a series
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/vmtb/bench/executors/igt.py | 96 +++++++++++++++++++++++++++++--
>  1 file changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
> index a08f71d54..f443fb99e 100644
> --- a/tools/vmtb/bench/executors/igt.py
> +++ b/tools/vmtb/bench/executors/igt.py
> @@ -17,17 +17,101 @@ logger = logging.getLogger('IgtExecutor')
>  
>  
>  class IgtType(enum.Enum):
> -    EXEC_BASIC = 1
> -    EXEC_STORE = 2
> -    SPIN_BATCH = 3
> +    # Basic/generic IGT tests:
> +    EXEC_BASIC = enum.auto()
> +    EXEC_STORE = enum.auto()
> +    SPIN_BATCH = enum.auto()
> +    # VF migration workloads - xe_exec_reset/long_spin subtests:
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS = enum.auto()
> +    # VF migration workloads - xe_exec_reset/cancel subtests:
> +    EXEC_RESET_CANCEL = enum.auto()
> +    EXEC_RESET_CANCEL_PREEMPT = enum.auto()
> +    EXEC_RESET_CANCEL_TIMESLICE_PREEMPT = enum.auto()
> +    EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT = enum.auto()
> +    # VF migration workloads - xe_exec_threads subtests:
> +    EXEC_THREADS_BASIC = enum.auto()
> +    EXEC_THREADS_BAL_BASIC = enum.auto()
> +    EXEC_THREADS_CM_USERPTR_INVALIDATE = enum.auto()
> +    EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE = enum.auto()
> +    EXEC_THREADS_MANY_QUEUES = enum.auto()
> +    # VF migration workloads - xe_ccs subtest:
> +    CCS_BLOCK_COPY_COMPRESSED = enum.auto()
> +    # VF migration workloads - xe_compute_preempt subtest:
> +    COMPUTE_PREEMPT_MANY = enum.auto()
>  
>  
>  # Mappings of driver specific (i915/xe) IGT instances:
>  # {IGT type: (i915 IGT name, xe IGT name)}
>  igt_tests: typing.Dict[IgtType, typing.Tuple[str, str]] = {
> -    IgtType.EXEC_BASIC: ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
> -    IgtType.EXEC_STORE: ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
> -    IgtType.SPIN_BATCH: ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic')
> +    # Basic/generic IGT tests:
> +    IgtType.EXEC_BASIC:
> +      ('igt@gem_exec_basic@basic', 'igt@xe_exec_basic@once-basic'),
> +    IgtType.EXEC_STORE:
> +      ('igt@gem_exec_store@dword', 'igt@xe_exec_store@basic-store'),
> +    IgtType.SPIN_BATCH:
> +      ('igt@gem_spin_batch@legacy', 'igt@xe_spin_batch@spin-basic'),
> +    # VF migration workloads - xe_exec_reset/long_spin subtests:
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_MEDIA:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-media'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT0_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt0-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_MANY_PREEMPT_GT1_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-many-preempt-gt1-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_MEDIA:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-media'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT0_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_REUSE_MANY_PREEMPT_GT1_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_SYS_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads'),
> +    IgtType.EXEC_RESET_LONG_SPIN_COMP_REUSE_MANY_PREEMPT_THREADS:
> +      ('n/a', 'igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads'),
> +    # VF migration workloads - xe_exec_reset/cancel subtests:
> +    IgtType.EXEC_RESET_CANCEL:
> +      ('n/a', 'igt@xe_exec_reset@cancel'),
> +    IgtType.EXEC_RESET_CANCEL_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-preempt'),
> +    IgtType.EXEC_RESET_CANCEL_TIMESLICE_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-preempt'),
> +    IgtType.EXEC_RESET_CANCEL_TIMESLICE_MANY_PREEMPT:
> +      ('n/a', 'igt@xe_exec_reset@cancel-timeslice-many-preempt'),
> +    # VF migration workloads - xe_exec_threads subtests:
> +    IgtType.EXEC_THREADS_BASIC:
> +      ('n/a', 'igt@xe_exec_threads@threads-basic'),
> +    IgtType.EXEC_THREADS_BAL_BASIC:
> +      ('n/a', 'igt@xe_exec_threads@threads-bal-basic'),
> +    IgtType.EXEC_THREADS_CM_USERPTR_INVALIDATE:
> +      ('n/a', 'igt@xe_exec_threads@threads-cm-userptr-invalidate'),
> +    IgtType.EXEC_THREADS_BAL_MIXED_USERPTR_INVALIDATE:
> +      ('n/a', 'igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate'),
> +    IgtType.EXEC_THREADS_MANY_QUEUES:
> +      ('n/a', 'igt@xe_exec_threads@threads-many-queues'),
> +    # VF migration workloads - xe_ccs subtest:
> +    IgtType.CCS_BLOCK_COPY_COMPRESSED:
> +      ('n/a', 'igt@xe_ccs@block-copy-compressed'),
> +    # VF migration workloads - xe_compute_preempt subtest:
> +    IgtType.COMPUTE_PREEMPT_MANY:
> +      ('n/a', 'igt@xe_compute_preempt@compute-preempt-many')
>      }
>  
>  
> -- 
> 2.39.1
> 
