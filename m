Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D5AC369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 11:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48110E70D;
	Thu, 24 Apr 2025 11:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ua/TxM6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA13410E70D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745493876; x=1777029876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g4tmDtH121Rt59URY+NEdLATl07VjmXg64nkNxY5MbQ=;
 b=Ua/TxM6NjDCYNLiKXC3b3GYaEBP2Q7HvmFndtcg+mu0pJmv2BwNi1/0N
 H7qCCkNj2ixWP0W+x6oRbDGIl5Y6fFwuQoiFfBAAwUm5/DRu1yS2gBZKP
 F8ImldCh3mQguZ8JoonOy8XReeCiW4z+HJ3utaJFc8OQiPO+oYlfQt/iu
 dBXoc5Td3LDUh4KbRpLk47+NDpkIWE5Pm987VaL8yRowdL7B4fAvj5//u
 wAF/a8J7G+bVyP6AedB3m4PrFjNircDZElewyLnHN+iTd4qcvdLfARKVu
 gZj/Lw6QZjSAbdZ3p3EKMmXxeRkkdzFjju4J2jTuSdJDsnGSLySMNWq9j w==;
X-CSE-ConnectionGUID: xCUjzp36TNuwY/nDcS5hoQ==
X-CSE-MsgGUID: 98jUqxRySVWk2NYICt37sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64531081"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="64531081"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 04:24:36 -0700
X-CSE-ConnectionGUID: ZIa+R7SKTcKhdKBiJL4TXQ==
X-CSE-MsgGUID: So3wQzDKQy6ojTVwN8F/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132328008"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:24:35 -0700
Date: Thu, 24 Apr 2025 13:24:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_pxp: Terminate PXP on exit
Message-ID: <20250424112431.sabgltn3tdxgl72u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250417235720.1379479-1-daniele.ceraolospurio@intel.com>
 <20250418145447.h4kpkferveojdrvx@kamilkon-DESK.igk.intel.com>
 <1936bed7-a7cc-4483-a9d1-db9aefa515c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1936bed7-a7cc-4483-a9d1-db9aefa515c7@intel.com>
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

Hi Daniele,
On 2025-04-18 at 09:53:42 -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 4/18/2025 7:54 AM, Kamil Konieczny wrote:
> > Hi Daniele,
> > On 2025-04-17 at 16:57:19 -0700, Daniele Ceraolo Spurio wrote:
> > > Most of out tests expect to start their execution from a clean GPU state.
> > > However, the PXP tests currently leave a PXP session running when they
> > > complete, so follow up tests will not have a clean starting state; given
> > > that PXP can impact the timing of some operations (e.g. suspend/resume),
> > What kind of problems could occur? Is it longer wakeup or refusing
> > to enter sleep?
> 
> PXP can delay the suspend flow or, in some unlikely error cases, cause the
> driver to abort the suspend attempt. AFAIU it can also delay idleness for
> the media GT.
> 

Thank you for explaining this, I spotted one nit, see below.

> > 
> > > this could pollute the results of those tests. Therefore, let's make
> > > sure that PXP is de-activated before we exit.
> > > 
> > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >   tests/intel/xe_pxp.c | 21 +++++++++++++++++----
> > >   1 file changed, 17 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> > > index 458d32322..3442396b2 100644
> > > --- a/tests/intel/xe_pxp.c
> > > +++ b/tests/intel/xe_pxp.c
> > > @@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
> > >   		}
> > >   }
> > > +int xe_fd = -1;
> > > +
> > > +static void exit_handler(int sig)
> > > +{
> > > +	/*
> > > +	 * PXP can interact with some operations (e.g. suspend/resume), which
> > > +	 * could impact the behavior of other tests if they unknowingly start
> > > +	 * when PXP is already active. Therefore, let's make sure PXP is
> > > +	 * de-activated before we exit.
> > > +	 */
> > > +	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
> > > +	drm_close_driver(xe_fd);
> > > +	usleep(50 * 1000); /* give time for the termination to be processed */
> > > +}
> > > +
> > >   igt_main
> > >   {
> > > -	int xe_fd = -1;
> > >   	bool pxp_supported = true;
> > >   	drmModeResPtr res;
> > > @@ -1151,6 +1165,7 @@ igt_main
> > >   		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
> > >   		pxp_supported = is_pxp_hw_supported(xe_fd);
> > >   		res = drmModeGetResources(xe_fd);
> > > +		igt_install_exit_handler(exit_handler);

Now I read it 2nd time and imho this should be done for pxp supported, so

   		if (pxp_supported)
			igt_install_exit_handler(exit_handler);

> > >   	}
> > >   	igt_subtest_group {
> > > @@ -1213,8 +1228,6 @@ igt_main
> > >   		}
> > >   	}
> > > -	igt_fixture {
> > > +	igt_fixture
> > >   		drmModeFreeResources(res);
> > > -		close(xe_fd);

If we go with above change, fixture here should be:
	igt_fixture {
		drmModeFreeResources(res);
		if (!pxp_supported)
			drm_close_driver(xe_fd);
	}

Regards,
Kamil

> > Looks like you are fixing a bug here, it should be
> > drm_close_driver(xe_fd);
> > 
> > LGTM,
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks!
> 
> Daniele
> 
> > 
> > 
> > > -	}
> > >   }
> > > -- 
> > > 2.43.0
> > > 
> 
