Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDBCD98F2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 18:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21D110EADB;
	Wed, 17 Jun 2026 18:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7Va8kez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A5A10EADB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781721453; x=1813257453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vHG0pIv6XGjTTVt61bBsMku6ktF90buKCVrzDYC5iUE=;
 b=i7Va8kezfmHXtKhsAlx7CZHB5ue5YYdjyJ8Z38wWLsB0ew3HDtT8fMgt
 tHyDVyq17TJhzccitsck6Q0H4s4ugbQ2KtbPROaKghu/3UnBL01HxTotQ
 PlpX6vwITJz0OmOcVliGaClYkKymaZCyd1lv/hEMr2XGCkimb6alUGTno
 VYCfggrhqqatQTMd/oy13oaw2/WUvhlA+OOHuVtbti2cZbvkLzgJufAXZ
 IpB37gY4AHH0z+rDK+QuVg/DY/B6f4scHIj04rsid7DK2rZB7iF2sY1ej
 zryD5BHwveASalHRti7E2IaNuo286pfXA9fejf+xPwfnb0+/gRQjc79ul g==;
X-CSE-ConnectionGUID: IcyxPDjSQsKiRhyvkK4yRg==
X-CSE-MsgGUID: zlkio0twRfyvgBOwm04iaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="108044679"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="108044679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 11:37:33 -0700
X-CSE-ConnectionGUID: a3nknbM2Ssev5z2uTPqIkg==
X-CSE-MsgGUID: I/GD2Bp8T4qRgXeRajYrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="286248820"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 11:37:32 -0700
Date: Wed, 17 Jun 2026 20:37:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v6] intel-ci: Add SVM, multi_queue tests to Xe
 fastfeedback
Message-ID: <20260617183727.njdquitdevid4dsq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, francois.dugast@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 niranjana.vishwanathapura@intel.com
References: <20260617094235.3017-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi Venkateswara,
On 2026-06-17 at 15:12:35 +0530, Venkateswara Rao Muppidi wrote:
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
>  igt@xe_spin_batch@spin-basic
>  igt@xe_spin_batch@spin-batch
>  igt@xe_sriov_flr@flr-vf1-clear
> @@ -215,6 +252,7 @@ igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
>  
> +

Please remove this added newline.


Regards,
Kamil

>  # All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the
>  # driver in a broken state that is not otherwise noticed in that test.
> -- 
> 2.43.0
> 
