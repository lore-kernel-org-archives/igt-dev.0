Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A7CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D7910ECB6;
	Thu, 18 Jun 2026 06:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vas6F9d3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC7610ECB6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764697; x=1813300697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sLSdUZpSq71X6Q4VKn3JDJz8ws1zLwbqiMLSz8uSiUY=;
 b=Vas6F9d3GAHjl4st8ZiB7H17p0AfaaYigARQ2eWvB3lSOltkUBnVuxy4
 ac3GX99DtCh733DzKeLnz7snNbvkCkv4OCYxhAE3FzTXELFP6OlVHu09/
 J8WnO/FejodtPDxAfwDvfX1q791/HhP26vKdk3X/oC6YtdBK7mwv1yeUh
 cG5n9B2hZTo+fNnYUOrWOh0T7ChaypPTHJsP/sFrbcS5vsQjq7qitV8hr
 d1C9Zra4PXQjfEi7aYIr9J+na3HFfs/UPVF/VhSOBmMMrWyDWPNkkAXWx
 5/3ndueeljaESq+piCg+S47iPgiOruEZLDymXTrmp7p1Gd+tnRbd6NX// A==;
X-CSE-ConnectionGUID: oOMBBbEOQ+SG4Yl5LvCeRA==
X-CSE-MsgGUID: r6MAh4DmSK+wA0DvBjzY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82683839"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82683839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:38:16 -0700
X-CSE-ConnectionGUID: cQUtW5jsQ2ShG27kFBuF5w==
X-CSE-MsgGUID: hFzb9O90QbOn12qpJSF8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="248156522"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:38:15 -0700
Date: Thu, 18 Jun 2026 08:38:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com, 
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v8] intel-ci: Add SVM,multi_queue tests to Xe
 fastfeedback
Message-ID: <qz4qzlksbyk33bwfvfkx6msx4sdtreqdtq4ckmnrkjlobs3v6j@jmtleqwuhs7z>
References: <20260618051522.7910-1-venkateswara.rao.muppidi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618051522.7910-1-venkateswara.rao.muppidi@intel.com>
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

On Thu, Jun 18, 2026 at 10:45:22AM +0530, Venkateswara Rao Muppidi wrote:
> Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> access_counter, fault_mode,multi_queue tests to fastfeedback list
> 
> v2: add eu-fault-2m-range-device-host test (Francois)
> v3: corrected s-o-b and From
> v4: Refine SVM tests by removing the race test, adding remaining SVM tests,
> and organizing all entries in alphabetical order.
> v6: Remove twice.* tests and add a new set of SVM tests (Francois)
> v8: Remove few-execs-dyn-priority and add priority tests for
> multi_queue (Niranjana)
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>

If I'm not wrong Francois, Priyanka and Niranjana and me already
accepted/reviewed these change so you could add a-b/r-b while
sending this patch. Anyway, I'll add them before merging this patch.

--
Zbigniew


> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 37 ++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..c47db8c43 100644
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
> +igt@xe_exec_multi_queue@priority
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
> -- 
> 2.43.0
> 
