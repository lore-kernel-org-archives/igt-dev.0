Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBD8C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC1610E6ED;
	Tue, 11 Jun 2024 16:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fI7OeXem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0A10E6ED
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718125013; x=1749661013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uJ9t4BQvVi+zsbjNFYMJ1mkD2RCrsK708gleWZ5L+7I=;
 b=fI7OeXemx90ewjYS4squJT9VtlJlrvy0VV5T8QkDj/guBqZGFAv3svhj
 kEJQzxn9AJnrM8wwxtyYSMvX51/jzy5YFlme84vgiKyMJKJ6HVYq7PI4P
 3dzsCKjo5T2wMq9jw2iOtkC0192bDI1gbFPj1RPGz6RclKVJuWWinTIVD
 vP1bMK24hVZys/P7+LyqYHDAaJoWEZIR3YDCmZY/3edmJaXr4R9CO2DeJ
 GQCWkp0wgERQSHZc9iTeWIRUh7B2FgfpX5SReDt4t9qubmDrp0amglqi5
 gm7Yh8wSkQPHODF7xBpT0RTwkyGfEhZamyXM/1vOv9bJwftFcALIGR2Mv w==;
X-CSE-ConnectionGUID: 7ocihx4kTg6/40OSQaUFew==
X-CSE-MsgGUID: 749XY9vqRaC7cKbIVPF9Ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="17773926"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="17773926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:56:53 -0700
X-CSE-ConnectionGUID: aJqZelKMSJeBo2zGpYfgEQ==
X-CSE-MsgGUID: znKTcnFPRnOke3kLTmygkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="43928128"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:56:53 -0700
Date: Tue, 11 Jun 2024 18:56:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: =?utf-8?B?4pyX?= CI.xeFULL: failure for IGT cleanup (rev10)
Message-ID: <20240611165649.cw43ry7vzxb4ozqd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nidhi Gupta <nidhi1.gupta@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
 <171801516514.31115.3116636002385878390@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171801516514.31115.3116636002385878390@a6498e030952>
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

Hi igt-dev,
On 2024-06-10 at 10:26:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: IGT cleanup (rev10)
> URL   : https://patchwork.freedesktop.org/series/100801/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7880_full -> XEIGTPW_11243_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11243_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11243_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 2)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11243_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

This kms bug is unrelated.

> 
>   * {igt@msm/msm_shrink@copy-mmap-madvise-32} (NEW):
>     - {shard-lnl}:        NOTRUN -> [SKIP][2] +62 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-lnl-7/igt@msm/msm_shrink@copy-mmap-madvise-32.html
> 
>   * igt@vc4/vc4_create_bo@create-bo-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] +22 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-dg2-432/igt@vc4/vc4_create_bo@create-bo-0.html
> 

Bhanu: looks like those blocklisting rules for msm and vc4
do not worked, see also below into skips for panfrost, vmwgfx.

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - {shard-lnl}:        NOTRUN -> [FAIL][4] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-lnl}:        [FAIL][5] ([Intel XE#2028]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7880/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@v3d/v3d_wait_bo@map-bo-1ns:
>     - {shard-lnl}:        NOTRUN -> [SKIP][7] +87 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-lnl-4/igt@v3d/v3d_wait_bo@map-bo-1ns.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        NOTRUN -> [ABORT][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_7880_full and XEIGTPW_11243_full:
> 
> ### New IGT tests (81) ###
> 
>   * igt@msm/msm_mapping@ring:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_mapping@shadow:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_mapping@sqefw:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_recovery@gpu-fault:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_recovery@gpu-fault-parallel:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_recovery@hangcheck:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_recovery@iova-fault:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-8:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-madvise-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-madvise-8:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-oom-32:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-oom-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-sanitycheck-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-gpu-sanitycheck-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-8:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-madvise-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-madvise-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-oom-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-oom-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-sanitycheck-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-dmabuf-sanitycheck-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-madvise-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-madvise-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-oom-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-oom-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-sanitycheck-32:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_shrink@copy-mmap-sanitycheck-8:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@empty-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-cmd-idx-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-cmd-type-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-duplicate-bo-submit:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-flags-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-in-fence-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@invalid-queue-submit:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submit@valid-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-10-bos:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-10-bos-no-implicit-sync:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-100-bos:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-100-bos-no-implicit-sync:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-1000-bos:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-1000-bos-no-implicit-sync:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-250-bos:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-250-bos-no-implicit-sync:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-500-bos:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@msm/msm_submitoverhead@submitbench-500-bos-no-implicit-sync:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_gem_new@gem-new-0:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_gem_new@gem-new-4096:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_gem_new@gem-new-zeroed:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_get_param@base-params:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_get_param@get-bad-padding:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_get_param@get-bad-param:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_prime@gem-prime-import:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-reset:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-and-close:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-error-bad-bo-handles:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-error-bad-in-syncs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-error-bad-out-sync:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-error-bad-requirements:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@panfrost/panfrost_submit@pan-submit-error-no-jc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@panfrost/panfrost_submit@pan-unhandled-pagefault:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_execution_buffer@buffer-create:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_execution_buffer@execution-buffer-submit-sync:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_execution_buffer@mob-create-map:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_mob_stress@max_mob_mem_stress:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@mob_repeated_unref:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_alloc_ref_unref:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_explicit_mob:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_fd_dup:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_implicit_mob:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_two_surfaces:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_ref_count@surface_repeated_unref:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_surface_copy@test_invalid_copies:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_surface_copy@test_invalid_copies_3d:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_tri@tri:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@vmwgfx/vmw_tri@tri-no-sync-coherent:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11243_full that come from known issues:
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7880 -> IGTPW_11243
>   * Linux: xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c -> xe-1429-c410bb641ea861fdd70c14ed8cc30d0d9a2ef587
> 
>   IGTPW_11243: 11243
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1413-cb97aa28be4f4b914c751ed27bae7782e027826c: cb97aa28be4f4b914c751ed27bae7782e027826c
>   xe-1429-c410bb641ea861fdd70c14ed8cc30d0d9a2ef587: c410bb641ea861fdd70c14ed8cc30d0d9a2ef587
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11243/index.html
