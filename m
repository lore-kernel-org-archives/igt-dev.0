Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F447CAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 09:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5858110EA64;
	Thu, 11 Sep 2025 09:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRLh0a44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1410EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757582474; x=1789118474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UieIObnousH3hbG+S6gTTZUhgYpOZykYit8SqiL52ag=;
 b=VRLh0a44sw7mqhR92O0FrBpfFwrZQMjR7b7ZHusUoc7KgcVQ1bW2VV5z
 ovNqR7jY1DsyVds3SVrHiXvJSoG22eFyJCxuSt1XBpRWn82W4UdDhHJRe
 KS8kgwbGvJ5JcAPtnDkwzzJ0tlYcqGkRl/7QKrE5DdF/yW54P1BTzNZM2
 KuhQFV27dGi9BcZk/5rtMiYhASYS8gLA+XCIzajUHiN7QFLXxxsoWQJ6n
 YOB8XxACo6QUSv514yzyBYEVxQXWMMB46YRRVwDmWP4rpH08WXUuHgV0d
 tEsMpcv0CquNOqHtMa/0GOlglbo5I0PAhtylNTGMNYT5Ov4EkO8FciZp8 Q==;
X-CSE-ConnectionGUID: 5FeJW9lwQCu7hPu/jnE+zg==
X-CSE-MsgGUID: 3j6pTk/5SxOe+ASVbBrdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77360859"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="77360859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:21:14 -0700
X-CSE-ConnectionGUID: /NtAwyVRTfSay028imFphA==
X-CSE-MsgGUID: YYVkuSmES3Kg4XbMUgHD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="172931334"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:21:12 -0700
Date: Thu, 11 Sep 2025 11:21:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
Message-ID: <rw5nglc35bvoskf3qcrnp4erb2zocj4ofyzwa2kp6slejfvrtn@drg7qcsrsupj>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-3-dominik.karol.piatkowski@intel.com>
 <ldkqnliynzdrqu3ycge6qba7z5m336e4gk7xbacfcs76afqxo7@uvmgnhz3icxc>
 <DS0PR11MB726453762DD87F67353F4B69D90EA@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB726453762DD87F67353F4B69D90EA@DS0PR11MB7264.namprd11.prod.outlook.com>
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

On Wed, Sep 10, 2025 at 10:04:25AM +0200, Piatkowski, Dominik Karol wrote:
> Hi Zbigniew,
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Wednesday, September 10, 2025 8:09 AM
> > To: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Mika Kuoppala
> > <mika.kuoppala@linux.intel.com>
> > Subject: Re: [PATCH v2 i-g-t 2/4] lib/igt_core: Block SIGINT during igt_vlog
> > 
> > On Mon, Sep 08, 2025 at 02:54:46PM +0200, Dominik Karol Piątkowski
> > wrote:
> > > Block SIGINT during igt_vlog to avoid deadlocks in multi-threaded SIGINT
> > > scenarios.
> > >
> > > Signed-off-by: Dominik Karol Piątkowski
> > <dominik.karol.piatkowski@intel.com>
> > > ---
> > >  lib/igt_core.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index 4477cfef1..414fd9bce 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -3198,6 +3198,11 @@ void igt_vlog(const char *domain, enum
> > igt_log_level level, const char *format,
> > >  		"CRITICAL",
> > >  		"NONE"
> > >  	};
> > > +	sigset_t set, oldset;
> > > +
> > 
> > I think this part deserves for a comment explaining why we need this,
> > because this is heavy hammer.
> 
> I agree, it is quite a heavy hammer. I'll try to explain it more.

I experimented with this yesterday trying to reproduce this with
thread/fork scenario but without success. I took a look to previously
captured callstack (only interesting part):

__GI___lll_lock_wait_private()
__malloc_fork_lock_parent()
__libc_fork()
__igt_fork()

This means we have glibc main arena locked, and then we call fork().

I think line which creates the problem is:

igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);

If thread is calling malloc which in turn grabs the main arena lock,
killing it will cause deadlock in any consecutive mallocs() which
are touching main arena.

So shooting to worker_thread is really bad idea as it shares vm space
with other threads / main process. IMO we have design which forbids
killing pthread (we're not aware when it grabs common lock).

--
Zbigniew

> 
> > 
> > I also wonder shouldn't we have some global variable which we turn
> > on only in eudebug case. I mean in the test fixture:
> > 
> > igt_block_signals_in_print(true);
> > 
> > then in ending fixture:
> > 
> > igt_block_signals_in_print(false);
> > 
> > 
> > > +	sigemptyset(&set);
> > > +	sigaddset(&set, SIGINT);
> > > +	sigprocmask(SIG_BLOCK, &set, &oldset);
> > 
> > And this would be:
> > 
> > if (do_block_signals_in_print())
> >     ...
> 
> That's a nice idea, thanks!
> 
> Dominik Karol
> 
> > 
> > Anyway - definitely we have to protect igt_vlog(), we don't
> > know when fork will be done with print_mutex locked.
> > 
> > --
> > Zbigniew
> > 
> > 
> > >
> > >  	assert(format);
> > >
> > > @@ -3276,6 +3281,7 @@ void igt_vlog(const char *domain, enum
> > igt_log_level level, const char *format,
> > >  	pthread_mutex_unlock(&print_mutex);
> > >
> > >  out:
> > > +	sigprocmask(SIG_SETMASK, &oldset, NULL);
> > >  	free(line);
> > >  	free(thread_id);
> > >  }
> > > --
> > > 2.34.1
> > >
