Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6BEA3C4E
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 13:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9E10E7F9;
	Thu,  9 Apr 2026 13:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQzjdUZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6330F10E7F9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775742096; x=1807278096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aZyT69qyYAFkUpzxH3L0LuGLmT2oB4MLTX0+TBMKtbM=;
 b=nQzjdUZ0LvpVMueccpE725WBW5BMzUCo/3ZK2kY7fsPKLDA2tuSCf/xg
 bj8oG1YwLN/lQltQFMxLC3zKKNoAXKWcbcQhKTxbw5C2yChBFMh0zqB6d
 UUP+jKlnNY7DAckJubmXuMYTYy0i2CXv8JpptrE2IBbpBWjZIfI4KibK3
 YIsgLe8SPDzWKmPISUqDrA67pbySSEDXML69lYp+pM5PUmcaf0/rUIKoQ
 wZZMg2XkR4U+DXF8Tsyb7y85n+Rd1o3QAC4OUiKkrAoSWEkFlZ4Lqz08J
 3WPcWOz+jUmZu9vbU0TCGxBCG4OUrZXfwmx8wI5iEFtH+6+hGkJc7M+/K A==;
X-CSE-ConnectionGUID: JAKFq40zTcqEIsZxIfm0Rw==
X-CSE-MsgGUID: bDi/2q4aSSG0yBQ9g24Jgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64285458"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="64285458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 06:41:36 -0700
X-CSE-ConnectionGUID: F8HFBt2vQcWwH+bWqR+ZMg==
X-CSE-MsgGUID: pn9RAqWTSeW8zCBO27Jn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="227927105"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:34 -0700
Date: Thu, 9 Apr 2026 15:41:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Charles <daniel.charles@intel.com>
Cc: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: tests/intel: only check multi-LRC support for parallel
 submission paths
Message-ID: <20260409134130.vywlskcgme2hy4z3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Charles <daniel.charles@intel.com>,
 Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
References: <20260408071416.808087-1-x.wang@intel.com>
 <e526ec30-e249-45c1-9261-e3040b2d7b2b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e526ec30-e249-45c1-9261-e3040b2d7b2b@intel.com>
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

Hi Daniel,
On 2026-04-08 at 10:27:11 -0700, Daniel Charles wrote:
> 
> On 4/8/2026 12:14 AM, Xin Wang wrote:
> > The previous commit "tests/intel: skip or adjust tests for non-multi-LRC
> > engine classes" unconditionally guarded balancer test functions with
> > xe_engine_class_supports_multi_lrc(), causing virtual (non-parallel)
> > subtests to be skipped on engine classes that have multiple placements
> > but do not support multi-LRC.
> > 
> > Only parallel submission requires multi-LRC support; virtual balancer
> > tests should still run whenever num_placements >= 2 regardless of
> > multi-LRC capability.
> > 
> > Fix this by making the multi-LRC check conditional on the PARALLEL flag
> > in test_exec(), test_cm(), test_balancer(), and utilization_multi().
> > Remove the check entirely from test_all_active() which is a pure virtual
> > test.  In xe_exec_threads, move the filter into the caller threads() so
> > that VIRTUAL threads are still spawned while PARALLEL threads are skipped
> > for non-multi-LRC classes.
> > 
> > Fixes: 09d91fcf2961 ("tests/intel: skip or adjust tests for non-multi-LRC engine classes")
> > Cc: Daniel Charles <daniel.charles@intel.com>
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >   tests/intel/xe_drm_fdinfo.c    | 3 ++-
> >   tests/intel/xe_exec_balancer.c | 8 +++++---
> >   tests/intel/xe_exec_reset.c    | 3 ++-
> >   tests/intel/xe_exec_threads.c  | 7 ++++++-
> >   4 files changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> > index 3c113ed5d..8449a4f17 100644
> > --- a/tests/intel/xe_drm_fdinfo.c
> > +++ b/tests/intel/xe_drm_fdinfo.c
> > @@ -673,7 +673,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
> >   	igt_assert(virtual ^ parallel);
> >   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> > -	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
> > +	if (num_placements < 2 ||
> > +	    (parallel && !xe_engine_class_supports_multi_lrc(fd, class)))
> >   		return;
> >   	igt_debug("Target class: %s\n", engine_map[class]);
[cut]
> > +					if ((*data_flags & PARALLEL) &&
> > +					    !xe_engine_class_supports_multi_lrc(fd, class)) {
> > +						data_flags++;
> > +						continue;
> > +					}
> > +
> >   					threads_data[i].mutex = &mutex;
> >   					threads_data[i].cond = &cond;
> >   					if (flags & SHARED_VM)
> Reviewed-by: Daniel Charles <daniel.charles@intel.com>

Thank you all, pushed.

Regards,
Kamil 

