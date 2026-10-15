Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A67CC6B3A
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1582810E304;
	Thu, 15 Oct 2026 15:46:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55110E304
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079163; x=1823615163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AjPil/gmCFvJvCHb8XlAfqCLiIVHiV6bkTI7e2hPso0=;
 b=FhTU4j62bfTufLNHSeOD/FRI9Aa2YHu9xX3AgLYWuTGgZYLOteh7jMN1
 rluDR0BUjZQ1i2Eg6+N+0e1DyCbeEfihDR/oxtvLITzIituMLBCqFGzj3
 WNW2W9izg51F/CJPMiQAtphSbHTpgPsYn5WUChYl5A7tqrli4wmjflnZY
 S7aZdacWfsTlj7PQAL1xPBFRcWlt/zH9vILjiotZKSK4YMLE7WdzxwIpN
 8sfmy5oWR+ij7ffq1RNYa4nxVY+AmC7b4gy4o3qfBt3rJ1jW4A+iBSquQ
 WuSJ9cz+2aFiCfYLVD15BuX8+d6Gj0TOoTsrGBPfFAfpzrxPhicyUH7mQ w==;
X-CSE-ConnectionGUID: SR/kDAeXQQ+FcK5Qkm8TBw==
X-CSE-MsgGUID: UIku099ARICOdiL31afVDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="886847"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="886847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:03 -0700
X-CSE-ConnectionGUID: pOq/6bIORRu0DCWMIUQODw==
X-CSE-MsgGUID: ISob5musSf2a4TcOvFG8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1780480"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:01 -0700
Date: Thu, 15 Oct 2026 17:45:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
	igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t] tests/intel/xe_sync_file: Fix driver_name expectation in
 sync_file_race
Message-ID: <20261015154559.cqvwn2lujl5r7dym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
 <35594202-7315-4c82-9e52-337ee12361aa@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35594202-7315-4c82-9e52-337ee12361aa@igalia.com>
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

Hi Tvrtko,
On 2026-10-15 at 11:06:47 +0100, Tvrtko Ursulin wrote:
> 
> On 14/10/2026 07:11, Tejas Upadhyay wrote:
> > sync_file_get_status() is checked right after confirming the exported
> > sync file's status is already signaled (status == 1). At that point,
> > dma_fence_driver_name() has already taken its signaled-fence path and
> > will unconditionally return "detached-driver" - it never calls back
> > into the driver's own get_driver_name() once a fence is observed
> > signaled.
> 
> I don't quite understand how this slipped through because I am pretty sure I
> tested it locally both without and with the kernel fix
> 3ed11c671ff7 ("dma-buf/dma-fence: fix checking signaling bit for timeline
> and driver name v3").
> 
> For what CI results are concerned I *think* I misattributed the fail to the
> above fix not having landed yet (at the time). But again for local testing I
> don't know how I got the pass.
> 
> Anyway, the fix is good, thanks for making it!
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Regards,
> 
> Tvrtko
> 
> 

Applied, thanks!

Regards,
Kamil


> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >   tests/intel/xe_sync_file.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_sync_file.c b/tests/intel/xe_sync_file.c
> > index 842c3856a..578b2b1ea 100644
> > --- a/tests/intel/xe_sync_file.c
> > +++ b/tests/intel/xe_sync_file.c
> > @@ -100,7 +100,7 @@ static void test_race(int xe, struct drm_xe_engine_class_instance *eci)
> >   	driver_name = NULL;
> >   	igt_assert_eq(sync_file_get_status(sync_fence, &driver_name), 1);
> >   	igt_assert(driver_name);
> > -	igt_assert(!strcmp(driver_name, "drm_sched"));
> > +	igt_assert(!strcmp(driver_name, "detached-driver"));
> >   	free(driver_name);
> >   	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> 
