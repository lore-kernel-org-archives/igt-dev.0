Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E18CD98E3
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 15:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FDA10E595;
	Tue, 16 Jun 2026 15:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMZJRiyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8A410E595
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 15:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781623320; x=1813159320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oSJZ+Sr1LXrrQhJprsy4ih5wEtaSN0+zjdhcQAr2SXA=;
 b=aMZJRiyZuMcGhMP7dYkXH4dqebMoCzI6MOWZaS7iiVoLpBmkzYUmVLUy
 MevTWsOb8hatc+CsaYBdSKDuz48cI5fSMzT7t7bjKrUSJ9aovMMfiKJlx
 b9NpcAahdMOj/4uarq4TsFbHRh0iLb9QE9wTrsaq2+uV9Flplr/ExQCFa
 uy7esf0OsgeRpnfUVn/rNbcourWXsC9xdHUGU1T6rO9vAi/IMXfuPT6Vl
 HbtO5S0h/z4h4eE8qFbMF4BOI6ZK1jomecps7+vSbEySUiZCPcBNj+auH
 OhhRPn27a6uqQos+Sq0OQ0u5AbYCvkPY5Q5zLreGwOdubTKL4aBd9wLDE A==;
X-CSE-ConnectionGUID: AjsEohJYSUS0PpJsGMdB6Q==
X-CSE-MsgGUID: 9nOFFC8mR8asTUj0jDB7EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82295117"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82295117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 08:21:59 -0700
X-CSE-ConnectionGUID: S3jqIlHZRZipIHP1L0mTXg==
X-CSE-MsgGUID: wvmyaeW3QOScMKQUkgCExg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="251722176"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 08:21:58 -0700
Date: Tue, 16 Jun 2026 17:21:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v3] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Message-ID: <20260616152155.54hlofblt3c3hl4p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
References: <20260616093542.2510-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616093542.2510-1-venkateswara.rao.muppidi@intel.com>
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

Hi Venkateswara,
On 2026-06-16 at 15:05:42 +0530, Venkateswara Rao Muppidi wrote:
> Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter, fault_mode,multi_queue tests to fastfeedback list
> 
> V2: add eu-fault-2m-range-device-host test (Francois)
> v3: corrected s-o-b and From

This v3 change bring nothing to description, should be removed at merge.

> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..e3b3f21cc 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -215,6 +215,41 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
> +igt@xe_exec_system_allocator@many-execqueues-free
> +igt@xe_exec_system_allocator@many-execqueues-free-race
> +igt@xe_exec_system_allocator@once-free-race
> +igt@xe_exec_system_allocator@process-many-execqueues-free-race
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exec_system_allocator@twice-free-race
> +igt@xe_render_copy@render-square
> +igt@xe_ccs@block-copy-compressed
> +igt@xe_ccs@ctrl-surf-copy
> +igt@xe_compute_preempt@compute-preempt
> +igt@xe_compute_preempt@compute-threadgroup-preempt
> +igt@xe_exercise_blt@fast-copy
> +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
> +igt@xe_exec_fault_mode@invalid-va
> +igt@xe_exec_multi_queue@sanity
> +igt@xe_exec_multi_queue@exec-sanity
> +igt@xe_exec_multi_queue@few-execs-dyn-priority
> +igt@xe_exec_multi_queue@many-queues-basic
> +igt@xe_exec_multi_queue@many-queues-basic-smem
> +igt@xe_exec_multi_queue@many-queues-userptr
> +igt@xe_exec_multi_queue@many-queues-userptr-invalidate
> +igt@xe_exec_multi_queue@many-queues-priority
> +igt@xe_exec_multi_queue@many-queues-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate

Please move these tests to proper place so list will be sorted
alphabetically.

Regards,
Kamil

> +
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
