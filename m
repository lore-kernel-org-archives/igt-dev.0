Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F8ECAC5B8
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 09:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D14010E2A2;
	Tue, 30 Sep 2025 09:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrZ6d+8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF63B10E2A2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759224943; x=1790760943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LK/WM+ZyeLJzDaY+H40cMRFmHclQ4N6GltS4spa2x1s=;
 b=VrZ6d+8LnLKIzmb7lW9l9mvluzYcT5syIWJT2BMSe+cFfrFivNgHvmR7
 oIZVHMLWYCH8RNtut/o2RlC7qZA+KGbUHpaFlN3galwQm/3gRD5HxVMLD
 UrryzvIYaAscakMfM59pI6Zip5+LfPOfCdI7LFL5MqlHKs7evOV8/elZp
 vKGhDnCapNufNXTPoZgUssE+wqOTtsocBZpoI3cQ3imX8hCMwERiTix/j
 1y8TQqenhG8wu/5Ivo9CRuv8zQgnolcw4UNhwbq+9X8Bb8XHCT5S3os+L
 3to7LwL42vZi4nTxEagnScVuYWZ4f+7buOjlz2l+jy3JROAZ84hKs4cem A==;
X-CSE-ConnectionGUID: e4fhvNU2QN2aQOZvLb5yAw==
X-CSE-MsgGUID: J/A1SjZEQLa3DHeVyxggPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72900475"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72900475"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 02:35:42 -0700
X-CSE-ConnectionGUID: 9FjB8uh5T8OpwLuFaAaJNg==
X-CSE-MsgGUID: dgwOKTpWS4Gd+vCRJRv6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182490835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 02:35:41 -0700
Date: Tue, 30 Sep 2025 11:35:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <20250930093522.5dlj4pq6sz3wgjxa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
 <24778384.ouqheUzb2q@jkrzyszt-mobl2.ger.corp.intel.com>
 <ca7jri4wuvcjs74x6zz43maq2m7mnluzwaizgpric7k7hjtnuh@tf7rwypn4mmn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca7jri4wuvcjs74x6zz43maq2m7mnluzwaizgpric7k7hjtnuh@tf7rwypn4mmn>
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

Hi Krzysztof,
On 2025-09-29 at 15:29:38 +0200, Krzysztof Niemiec wrote:
> On 2025-09-29 at 10:44:01 GMT, Janusz Krzysztofik wrote:
> > Hi Krzysztof,
> > 
> > On Friday, 26 September 2025 20:03:03 CEST Krzysztof Niemiec wrote:
> > > Move the interrupt timer from the parent thread to the child thread as
> > > an explicit signal raise, and make sure the order of execution between
> > > them is always the same. This reduces nondeterminism in the test, fixing
> > > bugs like [1], where the child is starved out of CPU time up until the
> > > parent gets signalled and monopolizes the CPU before the child could
> > > submit its own execbuf, failing the test.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> > 
> > If this patch resolves the issue then that link is a good candidate for a 
> > Closes: tag.
> > 
> > Thanks,
> > Janusz
> > 
> 
> I guess that would be good, should I send in v3 or can this be added
> during merge? (cc'ed Kamil)
> 
> Thanks
> Krzysztof
> 

No need for resend, it could be done at merge time. Before merge
please reply to CI failures (if any) with Cc to ci (e-mail is in
report).

Regards,
Kamil

> > > 
> > > v2: make the sync variable actually work (Zbigniew)
> > > 
> > > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > > ---
> > >  tests/intel/gem_exec_schedule.c | 19 ++++++++++++++-----
> > >  1 file changed, 14 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> > > index 84219b4cf..2f3958723 100644
> > > --- a/tests/intel/gem_exec_schedule.c
> > > +++ b/tests/intel/gem_exec_schedule.c
> > > @@ -2447,6 +2447,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> > >  	struct itimerval itv;
> > >  	IGT_CORK_HANDLE(c);
> > >  	bool *result;
> > > +	bool *sync;
> > >  
> > >  	/*
> > >  	 * We start simple. A low priority client should never prevent a high
> > > @@ -2469,6 +2470,8 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> > >  	result = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >  	igt_assert(result != MAP_FAILED);
> > >  
> > > +	sync = result + 0x100;
> > > +
> > >  	memset(&execbuf, 0, sizeof(execbuf));
> > >  	memset(&obj, 0, sizeof(obj));
> > >  
> > > @@ -2528,10 +2531,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> > >  
> > >  	/* both parent + child on the same cpu, only parent is RT */
> > >  	bind_to_cpu(0);
> > > +	*sync = 0;
> > >  
> > >  	igt_fork(child, 1) {
> > >  		int err;
> > >  
> > > +		/* We want the parent to always go first */
> > > +		while (!*sync)
> > > +			sched_yield();
> > > +
> > >  		/* Replace our batch to avoid conflicts over shared resources? */
> > >  		if (!(flags & SHARED)) {
> > >  			obj[1].handle = gem_create(fd, 4096);
> > > @@ -2542,7 +2550,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> > >  
> > >  		igt_debug("Waking parent\n");
> > >  		kill(getppid(), SIGALRM);
> > > -		sched_yield();
> > >  		result[1] = true;
> > >  
> > >  		sigaction(SIGALRM, &sa, NULL);
> > > @@ -2566,17 +2573,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> > >  
> > >  		if (!(flags & SHARED))
> > >  			gem_close(fd, obj[1].handle);
> > > +
> > > +		/* Interrupt parent's execbuf now that the child is done */
> > > +		kill(getppid(), SIGALRM);
> > >  	}
> > >  
> > > +	*sync = 1;
> > > +
> > >  	/* Relinquish CPU just to allow child to create a context */
> > > -	sleep(1);
> > > +	pause();
> > >  	igt_assert_f(result[0], "HP context (child) not created\n");
> > >  	igt_assert_f(!result[1], "Child released too early!\n");
> > >  
> > >  	/* Parent sleeps waiting for ringspace, releasing child */
> > > -	itv.it_value.tv_sec = 0;
> > > -	itv.it_value.tv_usec = 50000;
> > > -	setitimer(ITIMER_REAL, &itv, NULL);
> > >  	igt_debug("LP parent executing\n");
> > >  	igt_assert_eq(__execbuf(fd, &execbuf), -EINTR);
> > >  	igt_assert_f(result[1], "Child was not released!\n");
> > > 
> > 
> > 
> > 
> > 
