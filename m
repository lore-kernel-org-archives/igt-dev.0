Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25819C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 07:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9DD10E106;
	Mon,  5 Aug 2024 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cn0kw2LY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A2710E106
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722841976; x=1754377976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mDcLPHJqSb//TnwUUl3Dh74RX9I8QcPhlmYUXkqBKEk=;
 b=Cn0kw2LYlMowl5kgvZ/QyA0w503AGzyOQQK4fZ39cKyF0Oj17U+NLkQT
 DEAJDlzarsB8qrjIIBTuQ8uqSbXX6wtouCt1BxBN3Te58Q1EhHJBeKJHu
 aKqbcTwSLkzGY1tpUoooa0ISRH9ndjTgHIiXHmIj9Kt2hb7eHA+qxl3qQ
 3+JrCRlYEH5wmoQeQWr7ypxST2tKfv7sjSYw7ScI8z2OM75yz8lof6GV1
 PiKmoAS98b/yFOl+Wrf5ttT/OuCBU9bR9NkkRlaYGwhyyfXU0Y7+w6muO
 2vEg1hcYJbmj+5YAmEdSTWtf5cYy6tclfCHEH1Ce+na0QRBHWKQuUBzlP w==;
X-CSE-ConnectionGUID: oK+af4rdSRK022z7vq0bkg==
X-CSE-MsgGUID: KMl2HZPcRV6vL2O1RB2pnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20363635"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20363635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:12:56 -0700
X-CSE-ConnectionGUID: dkhn2j4QQm+0QGbcuIC4AQ==
X-CSE-MsgGUID: z6jO+ROCSSW6KteRAXfklA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56275799"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:12:54 -0700
Date: Mon, 5 Aug 2024 09:12:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_create: Remove the elapsed time validation
Message-ID: <20240805071250.g3vszflk6vhp7fx7@zkempczy-mobl2>
References: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
 <20240802051206.7qkzsh7pdfbc56zl@zkempczy-mobl2>
 <ZqyjJUUV_dI-n2jm@bvivekan-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqyjJUUV_dI-n2jm@bvivekan-mobl2>
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

On Fri, Aug 02, 2024 at 02:43:09PM +0530, Vivekanandan, Balasubramani wrote:
> On 02.08.2024 07:12, Zbigniew Kempczyński wrote:
> > On Thu, Aug 01, 2024 at 06:03:12PM +0530, Balasubramani Vivekanandan wrote:
> > > Time check used is incorrect. Time limit used for validation is
> > > arbitrarily chosen as 5 seconds with no real resoning behind it.
> > > With different execution environments taking different execution times,
> > > limit can't be fixed and leads to unnecessary hacks.
> > > So remove this time check completely.
> > 
> > MAXTIME picked in the past was chosen as a fraction of created/destroyed
> > exec queues in some (safe) time period. Up to relatively small number
> > of exec queues (up to 512) there was no issue observed. But with larger
> > number of exec queues we noticed kernel lockup (iirc guc related).
> 
> Time limit of 5 seconds is not fitting all platforms and execution
> environments. I would like to avoid hacks to workaround those.
> We can validate the test case by ensuring there were no GPU hangs or wait
> timeouts instead of checking the time taken.
> Measuring the time is more a performance validation rather than
> functionality validation. Better to isolate performance tests from
> functionality tests.
> 
> > 
> > I think keeping some time regime for those operations is good idea, we
> > may notice performance / stability drop if something unexpected will
> > happen in kmd/guc. MAXTIME/MAXEXECQUEUES were chosen as safe values
> > which should be easily handled. If you're removing this check you may
> > delete subtest as well.
> 
> Keeping subtest without time check will ensure the use case works fine
> without causing GPU hangs, kernel lockups or even dmesg warnings.

Agree, you've conviced me. Pick my r-b:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Regards,
> Bala
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >  tests/intel/xe_create.c | 17 +----------------
> > >  1 file changed, 1 insertion(+), 16 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > > index 76ffdcef2..80de07789 100644
> > > --- a/tests/intel/xe_create.c
> > > +++ b/tests/intel/xe_create.c
> > > @@ -157,7 +157,6 @@ enum vm_count {
> > >  };
> > >  
> > >  #define MAXEXECQUEUES 2048
> > > -#define MAXTIME 5
> > >  
> > >  /**
> > >   * SUBTEST: create-execqueues-%s
> > > @@ -175,10 +174,8 @@ enum vm_count {
> > >  static void create_execqueues(int fd, enum exec_queue_destroy ed,
> > >  			      enum vm_count vc)
> > >  {
> > > -	struct timespec tv = { };
> > >  	uint32_t num_engines, exec_queues_per_process, vm;
> > > -	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> > > -	int real_timeout = MAXTIME * (vc == SHARED ? 4 : 1);
> > > +	int nproc = sysconf(_SC_NPROCESSORS_ONLN);
> > >  
> > >  	if (vc == SHARED) {
> > >  		fd = drm_reopen_driver(fd);
> > > @@ -189,8 +186,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
> > >  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
> > >  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> > >  
> > > -	igt_nsec_elapsed(&tv);
> > > -
> > >  	igt_fork(n, nproc) {
> > >  		struct drm_xe_engine *engine;
> > >  		uint32_t exec_queue, exec_queues[exec_queues_per_process];
> > > @@ -236,16 +231,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
> > >  		xe_vm_destroy(fd, vm);
> > >  		drm_close_driver(fd);
> > >  	}
> > > -
> > > -	seconds = igt_seconds_elapsed(&tv);
> > > -	if (seconds > real_timeout) {
> > > -		if (igt_run_in_simulation())
> > > -			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> > > -				 MAXEXECQUEUES, seconds, real_timeout);
> > > -		else
> > > -			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> > > -				     MAXEXECQUEUES, seconds, real_timeout);
> > > -	}
> > >  }
> > >  
> > >  /**
> > > -- 
> > > 2.34.1
> > > 
