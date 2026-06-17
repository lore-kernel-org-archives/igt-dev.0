Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADA2CD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 10:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B08889304;
	Wed, 17 Jun 2026 10:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFmlT6id";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C587E10EF0B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781690623; x=1813226623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l0/PL8Td6dHGPO2JCR3KjVR9O1BxcoQF5bT9k6cBMmc=;
 b=SFmlT6id18nWTfCiQw0bN6RVx3wk0Tixv+1g8OmK7B1YTVHw1za9XV7V
 UpplogUDzuvnxCcZT4QdBgYdVijavT2S1IQHZahy5nrTx5rqQHUygDtED
 qP5f1Qicb5im8/OUzQCfLBc/rJNP6MrJyjm8OCMpgo0HDL6nYxbEhrCw+
 2b9ObZ9bNB5KWZDrt/4AI61j2o3rNDA1jd9iN5YYZ3VZZNXT7MaAoLUZI
 p4KvYfaxFuvCeIWxAZEMqyeKgL/SN0H1UcbD3VM3wKfr1Mv14BKWNca6r
 WlSvvJwYcvFBamAXOFBp7ZQRpBb4A0Z+ix6qYqt54xS3FHNcRgkqc4R+I w==;
X-CSE-ConnectionGUID: r9SgtoUzSLCJqJundgtEew==
X-CSE-MsgGUID: P+SwM81TTPybQQ3BxAZTCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82377679"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82377679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:03:43 -0700
X-CSE-ConnectionGUID: LduNkNOpRzG3zbGdsUjh9Q==
X-CSE-MsgGUID: cxR3bJ+KRWOiYv8S/EPAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="246890760"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.43])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:03:41 -0700
Date: Wed, 17 Jun 2026 12:03:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com, 
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v6] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Message-ID: <cirge2ijncdh6ieeqpzazb5zr6ljx7btkzux2qdbc6at5efr5l@2znsrse5ztxl>
References: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
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

On Wed, Jun 17, 2026 at 03:12:35PM +0530, Venkateswara Rao Muppidi wrote:
> Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter, fault_mode,multi_queue tests to fastfeedback list
> 
> v2: add eu-fault-2m-range-device-host test (Francois)
> v3: corrected s-o-b and From
> v4: Refine SVM tests by removing the race test, adding remaining SVM tests,
> and organizing all entries in alphabetical order.
> v6: Remove twice.* tests and add a new set of SVM tests (Francois)
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 38 ++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..c3a400bf8 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -69,7 +69,11 @@ igt@kms_psr@psr-cursor-plane-move
>  igt@kms_psr@psr-sprite-plane-onoff
>  igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
>  igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
> +igt@xe_ccs@block-copy-compressed
> +igt@xe_ccs@ctrl-surf-copy
>  igt@xe_compute@compute-square
> +igt@xe_compute_preempt@compute-preempt
> +igt@xe_compute_preempt@compute-threadgroup-preempt

Above 4 are fine.

>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
>  igt@xe_create@create-invalid-mbz
> @@ -129,11 +133,43 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
>  igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
> +igt@xe_exec_fault_mode@invalid-va
> +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
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
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
>  igt@xe_exec_queue_property@invalid-property
>  igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
>  igt@xe_exec_store@basic-store
> +igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
> +igt@xe_exec_system_allocator@fault
> +igt@xe_exec_system_allocator@madvise-atomic-inc
> +igt@xe_exec_system_allocator@many-execqueues-free
> +igt@xe_exec_system_allocator@many-execqueues-malloc
> +igt@xe_exec_system_allocator@once-malloc
> +igt@xe_exec_system_allocator@once-mmap
> +igt@xe_exec_system_allocator@partial-munmap-cpu-fault
> +igt@xe_exec_system_allocator@process-many-malloc
> +igt@xe_exec_system_allocator@threads-many-malloc
> +igt@xe_exec_system_allocator@threads-shared-vm-many-malloc
> +igt@xe_exec_system_allocator@twice-free
> +igt@xe_exercise_blt@fast-copy
>  igt@xe_gpgpu_fill@basic
>  igt@xe_gt_freq@freq_basic_api
>  igt@xe_gt_freq@freq_fixed_idle
> @@ -176,6 +212,7 @@ igt@xe_query@query-topology
>  igt@xe_query@query-invalid-extension
>  igt@xe_query@query-invalid-query
>  igt@xe_query@query-invalid-size
> +igt@xe_render_copy@render-square

And above 2 (xe_exercise_blt + xe_render_copy) are fine.

Collect more than my r-b from interested parties.

But for these 6 tests:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  igt@xe_spin_batch@spin-basic
>  igt@xe_spin_batch@spin-batch
>  igt@xe_sriov_flr@flr-vf1-clear
> @@ -215,6 +252,7 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +
>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
