Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CBECD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CF210F54F;
	Fri, 12 Jun 2026 14:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBkJ5MQR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D960910F54F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781274448; x=1812810448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hH/AKrIN9mvSE4zRNSaNHKctH8wTquEoPAKl0l/06bA=;
 b=TBkJ5MQR2FpTpvzhC7gkM+HfUPYqbgwubWkyrgtgm5avSMA/nDwGcsdD
 XvS/6UPQjdrUtC68VIhVr1zzuWv/9W7BO8if8y5rnGjfkk+K22R/AthNQ
 vjXXowz2kUotwGnmMMcytk8qJpiEfm+N+Up8HJXyDLQO4FrA1EigNyfgX
 jvPmluJS48dHjxGuYpX0p7A210PNSY07oHsxP2nXBiGvYpH907CPjYaaj
 5j1nvI1sYPhxPYwnr37W9fnQQx8CtUZz6gtYIPbepYnhQaz4RbittbMQs
 2zz4nS3cU2A9rJgqCVDZfAFoJkFtwiDnWgeR8c8FZrj8PpU9xgZ6NfahQ A==;
X-CSE-ConnectionGUID: Ke9ggCS6SquffWbqeolZdg==
X-CSE-MsgGUID: M4dHbPO8S0KWUqbxmRl4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92426757"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="92426757"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:27:27 -0700
X-CSE-ConnectionGUID: pQiPEVY5R767d15R+ZVInw==
X-CSE-MsgGUID: SzIMe+o1QsSEdzIzYxrnHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250758071"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:27:26 -0700
Date: Fri, 12 Jun 2026 16:27:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to
 xe.fastfeedback.testlist.
Message-ID: <20260612142723.jldosnwntifco5h7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
References: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
 <aiwH5qdwccT780lH@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiwH5qdwccT780lH@fdugast-desk>
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

Hi Francois,
On 2026-06-12 at 15:21:42 +0200, Francois Dugast wrote:
> On Fri, Jun 12, 2026 at 06:36:59PM +0530, Muppidi, Venkateswara Rao wrote:

I do not see this change in patchwork nor on ML, please resend
with corrections.

> > Add SVM,render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> > access_counter,fault_mode,multi_queue tests to xe.fastfeedback.testlist
> > 
> > Signed-off-by: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>

s-o-b is incorrect, should be:

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>

Please configure your git, it will make it for you. For example,
in my global .gitconfig I have:

[user]
	email = kamil.konieczny@linux.intel.com
	name = Kamil Konieczny


> > ---
> >  tests/intel-ci/xe.fast-feedback.testlist | 36 ++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> > index acff025fa..de71cacef 100644
> > --- a/tests/intel-ci/xe.fast-feedback.testlist
> > +++ b/tests/intel-ci/xe.fast-feedback.testlist
> > @@ -215,6 +215,42 @@ igt@xe_waitfence@abstime
> >  igt@xe_waitfence@engine
> >  igt@xe_waitfence@reltime
> >  
> > +igt@xe_exec_system_allocator@twice-free
> > +igt@xe_exec_system_allocator@twice-malloc-fork-read
> > +igt@xe_exec_system_allocator@twice-malloc-mlock
> > +igt@xe_exec_system_allocator@twice-malloc-prefetch
> > +igt@xe_exec_system_allocator@twice-mmap-new-nomemset
> > +igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
> > +igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck
> > +igt@xe_exec_system_allocator@twice-mmap-free-madvise
> > +igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
> > +igt@xe_exec_system_allocator@many-execqueues-free
> 
> Could we include one of the eu-fault_* tests, such as
> eu-fault-2m-range-device-host ?
> 
> Thanks,
> Francois
> 
> > +igt@xe_render_copy@render-square
> > +igt@xe_ccs@block-copy-compressed
> > +igt@xe_ccs@ctrl-surf-copy
> > +igt@xe_compute_preempt@compute-preempt
> > +igt@xe_compute_preempt@compute-threadgroup-preempt
> > +igt@xe_exercise_blt@fast-copy
> > +igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
> > +igt@xe_exec_mix_modes@exec-simple-batch-store-lr
> > +igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
> > +igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
> > +igt@xe_exec_fault_mode@invalid-va
> > +igt@xe_exec_multi_queue@sanity
> > +igt@xe_exec_multi_queue@exec-sanity
> > +igt@xe_exec_multi_queue@few-execs-dyn-priority
> > +igt@xe_exec_multi_queue@many-queues-basic
> > +igt@xe_exec_multi_queue@many-queues-basic-smem
> > +igt@xe_exec_multi_queue@many-queues-userptr
> > +igt@xe_exec_multi_queue@many-queues-userptr-invalidate
> > +igt@xe_exec_multi_queue@many-queues-priority
> > +igt@xe_exec_multi_queue@many-queues-close-fd
> > +igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
> > +igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
> > +igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
> > +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
> > +igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate

Can we split this into compute and multi-queue change?

Regards,
Kamil

> > +
> >  # All tests that do module unloading and reloading are executed last.
> >  # They will sometimes reveal issues of earlier tests leaving the
> >  # driver in a broken state that is not otherwise noticed in that test.
> > -- 
> > 2.43.0
> > 
