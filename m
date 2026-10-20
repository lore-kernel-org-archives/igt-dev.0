Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DDB606A31B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XYqWjSLY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E23510E4E0;
	Tue, 20 Oct 2026 11:00:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2610E1BA
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792493993; x=1824029993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jbULNwQI3LC1ykea5cxh2H1SDLL3VmBDAUwBkOuX8Xs=;
 b=XYqWjSLY/cAJTn2a6ixbq/Vjzxv/LBoudxCAGPTnwFxallWEFPPHJbaY
 xY2xOAae0iIGow2rSnvkkp4/j6ombrniiIT/rezHCDJPichVYO7wH1Djl
 Mncp6i6rU2ZF9m3O9smc206R54JowFvd/AMRwpWlSdFMF5TaramFDv4Y7
 bLsFxgC5tPGvBLD7Q27jm2bBcCoYXt+/jFegqyNJ+iuJ58rTk3jL6W4Pq
 soiWlB9sqAgr++UVu7Lj6BIr9e7BP4TKgaVDf0B//4YgSCVS8FI4KXteq
 0V2ppB6wkDeBZTCJEKM8zlnep+Ajw7XF82+waDc8wkC8aAeXKLkzN5xrU Q==;
X-CSE-ConnectionGUID: pTqpRnEWSHmNVmh7uQJgbw==
X-CSE-MsgGUID: UUPVsVGUTnWrrrXu3hNFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1204118"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1204118"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:59:53 -0700
X-CSE-ConnectionGUID: qfgX+p2ERyqYuRfuiHRRIQ==
X-CSE-MsgGUID: GZKBxCDVSraGQFcasjIehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3240681"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:59:52 -0700
Date: Tue, 20 Oct 2026 12:59:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 peter.senna@linux.intel.com, stuart.summers@intel.com
Subject: Re: [i-g-t, v2] tests/intel/xe_vm: cover single-op binds reserving
 unused pgtable ops
Message-ID: <20261020105949.pjzdwsijfwdrw3rh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 peter.senna@linux.intel.com, stuart.summers@intel.com
References: <20261019194557.10403-1-jagmeet.randhawa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019194557.10403-1-jagmeet.randhawa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jagmeet,
On 2026-10-19 at 19:45:57 +0000, Jagmeet Randhawa wrote:
> xe_vma_ops_alloc() sizes the page table update ops array with the number
> of ops reserved while parsing a VM_BIND, and allocates it without zeroing
> it. Only the ops that xe_pt_update_ops_prepare() goes on to populate are
> valid, so a kernel loop bounded by the reserved count instead of the
> populated one walks into never initialised slab memory, reads a garbage
> pointer out of it and dereferences it.
> 
> Syzkaller hit exactly that: xe_migrate.c iterated num_ops while xe_pt.c
> iterated current_op.
> 
> Add three subtests which reserve more ops than they populate out of a
> single (num_binds == 1) VM_BIND, so that the mismatch is reached without
> an array of binds. They cover the three independent ways
> vm_bind_ioctl_ops_parse() can count an op that op_prepare() then skips:
> 
> - single-op-unmap-partly-bound: an UNMAP covering a bound and an unbound
>   VMA parses two UNMAP ops, and unbinding the VMA that was never bound
>   is skipped.
> - single-op-remap-unbound: a partial UNMAP of an unbound VMA parses a
>   REMAP, and unbinding the original VMA is skipped while binding the
>   remainder is not.
> - single-op-map-mirror-over-bound: a CPU_ADDR_MIRROR MAP over a bound
>   VMA parses an UNMAP plus a MAP, and binding a CPU address mirror VMA
>   is skipped.
> 
> An unbound VMA here is one created by a non IMMEDIATE MAP in a fault
> mode VM, which defers the bind to the first GPU page fault. A fault mode
> VM is in long running mode, so the binds signal user fences rather than
> syncobjs. Every iteration first populates and frees an equally sized ops
> array so that the VM_BIND under test is likely to recycle a slab object
> still holding stale pointers rather than freshly zeroed memory, and the
> sequence is repeated so that one quiet iteration does not pass for
> coverage.
> 
> Originally validated on a BMG DUT with CONFIG_KASAN=y,
> CONFIG_UBSAN_BOOL=y and CONFIG_SLUB_DEBUG_ON=y, which poisons the freed
> ops array to 0x6b. On a kernel still carrying the mismatch each subtest
> faulted within 90ms of starting:
> 
>   UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
>   load of value 107 is not a valid value for type '_Bool'
>   Oops: general protection fault, probably for non-canonical address
>         0xed6d696d6d6d6d6e
>   RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]
> 
> Those loops have since been removed: commit f5708e761ed6 ("drm/xe: Add
> CPU bind layer") moved the page table update path out of xe_migrate.c
> into xe_cpu_bind.c, and the ops array now lives in struct xe_pt_job_ops
> with every consumer bounded by current_op. Re-ran on drm-xe-next with
> that series applied and the same debug config: 20 iterations of each
> subtest, 60 of 60 pass, no UBSAN or KASAN splat. The subtests stand as
> regression coverage for the reserved versus populated op mismatch, which
> the bind paths can still construct.
> 
> Suggested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
> v2:
> - Drop the Link to the kernel fix. The loops it bounded were removed by
>   commit f5708e761ed6 ("drm/xe: Add CPU bind layer"), so the reference no
>   longer points at anything that exists.
> - Rework the validation paragraph: retested on drm-xe-next carrying the CPU
>   bind rewrite, 20 iterations of each subtest, 60 of 60 pass, dmesg clean
>   with KASAN/UBSAN/SLUB_DEBUG_ON.
> - Rebase onto current master.
> - Add Jonathan's Reviewed-by.
> 

Applied, thanks!


Regards,
Kamil

>  tests/intel/xe_vm.c | 204 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 204 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index d1157803d..1408cace6 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -309,6 +309,204 @@ static void test_partial_unbinds(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +/**
> + * SUBTEST: single-op-unmap-partly-bound
> + * Functionality: unbind
> + * Description:
> + *	Single VM_BIND UNMAP spanning a bound and an unbound VMA, so that the
> + *	unbound VMA reserves a page table update op which is never populated
> + * Test category: functionality test
> + *
> + * SUBTEST: single-op-remap-unbound
> + * Functionality: unbind
> + * Description:
> + *	Single VM_BIND UNMAP splitting an unbound VMA, so that unbinding the
> + *	original VMA reserves a page table update op which is never populated
> + * Test category: functionality test
> + *
> + * SUBTEST: single-op-map-mirror-over-bound
> + * Functionality: bind
> + * Description:
> + *	Single VM_BIND MAP with CPU_ADDR_MIRROR replacing a bound VMA in a
> + *	scratch page fault mode VM, so that the map reserves a page table
> + *	update op which is never populated
> + * Test category: functionality test
> + */
> +
[cut]
