Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D5CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DEB10E6B6;
	Wed,  1 Oct 2025 11:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcBeThts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F8410E6C8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319754; x=1790855754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AtVc8P1WDZSy/vuQHyRe6BlKGoE0MT5BSLdddNwehrk=;
 b=QcBeThts85EzwIlY6BVUC75Bd77jQ0PCJtbX3MKeZ8v5RK1a5Djkwlem
 nmfPsF6KTKDQGOOhSIhl0aLS4ohPnmvbkpYFu32lHf4TwwoFlFcyXQaQ3
 kyRanhdvwZdVds2AdXWSiN8L8PQrZBXYDgSyQG8yWXp8+EaDdAx6T87Ig
 EKEfT3cfKzi1tjrsOWSQ8OWcM2BYEFlbDo4eA5W6nTTSE4CkorOAAw0XR
 jKkqnIZOmSsLx0qrd26b+9HAsXiKOhV2ha1JfuinAs/quJRpCYcbIpYGM
 Eet1VIVCGDFTuoFxeOWxzpoFDEPt8keFfTUxkNFs4KzRx0t8xW91rPMJb w==;
X-CSE-ConnectionGUID: /bUx/zKdQcSQA7FUyqUuSA==
X-CSE-MsgGUID: 8aZ2QVqwQgiYi+YuKXAcOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49146718"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="49146718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:54 -0700
X-CSE-ConnectionGUID: CanwVsyXQ76V1P00eCuYrQ==
X-CSE-MsgGUID: K5RTyG/IQ26oc3JFYvvgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178379032"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 04:55:53 -0700
Date: Wed, 1 Oct 2025 13:55:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
Message-ID: <20251001115550.elpg7733m2jnuzul@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <20250930173536.ixuthzbjqxjsboxf@kamilkon-DESK.igk.intel.com>
 <aNyPezbV8CJoz2Nk@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNyPezbV8CJoz2Nk@lstrano-desk.jf.intel.com>
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

Hi Matthew,
On 2025-09-30 at 19:18:35 -0700, Matthew Brost wrote:
> On Tue, Sep 30, 2025 at 07:35:36PM +0200, Kamil Konieczny wrote:
> > Hi Matthew,
> > On 2025-09-23 at 14:13:33 -0700, Matthew Brost wrote:
> > > Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
> > > memory can be used during this test. Useful to test VF migration.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > +cc Zbigniew and Marcin
> > 
> > > ---
> > >  lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
> > >  tests/intel/xe_exec_reset.c |  8 ++++++++
> > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> > > index cb53a8cfc8..74432a4b3a 100644
> > > --- a/lib/xe/xe_legacy.c
> > > +++ b/lib/xe/xe_legacy.c
> > > @@ -9,9 +9,11 @@
> > >  #include "xe/xe_ioctl.h"
> > >  #include "xe/xe_legacy.h"
> > >  #include "xe/xe_spin.h"
> > > +#include "intel_pat.h"
> > 
> > Please move it up so igt headers will be sorted alphabetically.
> > 
> 
> Will do? Can I just fixup when merging?

Yes if no other changes will be there.

Regards,
Kamil

> 
> Matt
> 
> > Regards,
> > Kamil
> > 
> > >  
> > >  /* Batch buffer element count, in number of dwords(u32) */
> > >  #define BATCH_DW_COUNT			16
> > > +#define COMPRESSION			(0x1 << 13)
> > >  #define SYSTEM				(0x1 << 12)
> > >  #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> > >  #define LONG_SPIN			(0x1 << 8)
> > > @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >  
> > >  	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> > >  
> > > +	if (flags & COMPRESSION)
> > > +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
> > > +
> > >  	if (flags & CLOSE_FD)
> > >  		fd = drm_open_driver(DRIVER_XE);
> > >  
> > > @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >  	bo_size = sizeof(*data) * (n_execs + extra_execs);
> > >  	bo_size = xe_bb_size(fd, bo_size);
> > >  
> > > -	bo = xe_bo_create(fd, vm, bo_size,
> > > -			  flags & SYSTEM ?
> > > -			  system_memory(fd) :
> > > -			  vram_if_possible(fd, eci->gt_id),
> > > -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	if (flags & COMPRESSION) {
> > > +		bo = xe_bo_create_caching(fd, vm, bo_size,
> > > +					  flags & SYSTEM ?
> > > +					  system_memory(fd) :
> > > +					  vram_if_possible(fd, eci->gt_id),
> > > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> > > +					  DRM_XE_GEM_CPU_CACHING_WC);
> > > +	} else {
> > > +		bo = xe_bo_create(fd, vm, bo_size,
> > > +				  flags & SYSTEM ?
> > > +				  system_memory(fd) :
> > > +				  vram_if_possible(fd, eci->gt_id),
> > > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	}
> > >  	data = xe_bo_map(fd, bo, bo_size);
> > >  
> > >  	for (i = 0; i < n_exec_queues; i++) {
> > > @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >  	sync[0].handle = syncobj_create(fd, 0);
> > >  
> > >  	/* Binding mechanism based on use_capture_mode */
> > > -	if (use_capture_mode) {
> > > +	if (flags & COMPRESSION) {
> > > +		int ret;
> > > +
> > > +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
> > > +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
> > > +				   intel_get_pat_idx_uc_comp(fd), 0);
> > > +		igt_assert(!ret);
> > > +	} else if (use_capture_mode) {
> > >  		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> > >  				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
> > >  	} else {
> > > @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >  
> > >  		xe_exec(fd, &exec);
> > >  
> > > -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
> > > +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
> > > +		    !(flags & COMPRESSION))
> > >  			xe_spin_wait_started(&data[i].spin);
> > >  	}
> > >  
> > > @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > >  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > >  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > >  
> > > -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
> > > +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
> > >  		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> > >  		     i < n_execs + extra_execs; i++)
> > >  			igt_assert_eq(data[i].data, 0xc0ffee);
> > > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > > index 113ceb2178..f5db1ff8ba 100644
> > > --- a/tests/intel/xe_exec_reset.c
> > > +++ b/tests/intel/xe_exec_reset.c
> > > @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> > >  #define GT1				(0x1 << 10)
> > >  #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> > >  #define SYSTEM				(0x1 << 12)
> > > +#define COMPRESSION			(0x1 << 13)
> > >  
> > >  /**
> > >   * SUBTEST: %s-cat-error
> > > @@ -702,6 +703,9 @@ static void *thread(void *data)
> > >   * SUBTEST: long-spin-sys-reuse-many-preempt-threads
> > >   * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
> > >   *
> > > + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
> > > + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
> > > + *
> > >   * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
> > >   * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
> > >   *
> > > @@ -878,6 +882,10 @@ igt_main
> > >  		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
> > >  			LONG_SPIN_REUSE_QUEUE);
> > >  
> > > +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
> > > +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
> > > +			LONG_SPIN_REUSE_QUEUE);
> > > +
> > >  	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
> > >  		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
> > >  			LONG_SPIN_REUSE_QUEUE);
> > > -- 
> > > 2.34.1
> > > 
