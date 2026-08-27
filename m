Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4B2C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 16:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9BC10EA8A;
	Thu, 27 Aug 2026 16:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkwXXqpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA4C10EA8A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849184; x=1819385184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EczE7NJHBR05hv2lI/yqccxf6aYzgVcCbQtlj1p5lH0=;
 b=AkwXXqpBbAkGQsJoiLgsrbFlBHENpPigJ30n9baFD6qUv+84Ouows8E5
 RGVGfIjSryc61KsAlcqNOtSSD5Vv1sQ12hMMvOT+Fv+qN5g3joQ/xvc8t
 AVMBS0BbDoZqdoM5q1KuijjzQvCQPkEo0Bu/Jsx6EwJJsj6egRB34rPDs
 UWXL/Hfu0WccM+9LsL1/8ZdwuyG/xDCgRG/3dad9cEeW8xt39S8fi63Ru
 /RY/UOpxDl12AiiTLXNbJClmJJCQi4GCXO4oHdSFk+2uIo7LKkk+dmoi8
 R7DOt0lHQX2Vi65PPefkOvPq4Y71bHYVEkuXGWUmN7i0XPV8fI7ytV2Nv A==;
X-CSE-ConnectionGUID: 6PRiAZUzT4mCB9zxr0qrJg==
X-CSE-MsgGUID: HvbZaYO8Ru+/o4w6RtcJ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90869552"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="90869552"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:46:24 -0700
X-CSE-ConnectionGUID: agEdUrEyT5qPEfBZuovyTw==
X-CSE-MsgGUID: NQS7GglGT8CJybitt+Mr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="292743656"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:46:23 -0700
Date: Thu, 27 Aug 2026 18:46:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,v1,1/2] runner: Create results after each tests end
Message-ID: <20260827164619.jxlgkm5r2oksmlmj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260720161526.64709-2-kamil.konieczny@linux.intel.com>
 <346684ec5c04e8e04eaf059c13b375f30828e90c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <346684ec5c04e8e04eaf059c13b375f30828e90c.camel@intel.com>
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

Hi Knop,,
On 2026-07-21 at 13:17:59 +0000, Knop, Ryszard wrote:
> On Mon, 2026-07-20 at 18:15 +0200, Kamil Konieczny wrote:
> > Sometimes it is desireable to have results present after an
> > execution of each test, so if any unexpected reboot happen, there
> > is at least result with already executed ones. Before creating
> > new results.json, previous one from test before is saved into
> > results.old file.
> > 
> > This will have one drawback of not containing any info about last
> > test which causes sudden machine reboot.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++----
> >  runner/resultgen.c |  6 +++++-
> >  2 files changed, 51 insertions(+), 5 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index a8907c575..b204fdffc 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -41,6 +41,7 @@
> >  #include "executor.h"
> >  #include "kmemleak.h"
> >  #include "output_strings.h"
> > +#include "resultgen.h"
> >  #include "runnercomms.h"
> >  
> >  #define KMSG_HEADER "[IGT] "
> > @@ -2466,6 +2467,40 @@ static int open_comms_if_valid(int resdirfd, size_t testidx)
> >  	return -1;
> >  }
> >  
> > +static void write_endtime(int resdirfd, double a_time)
> > +{
> > +	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666);
> > +
> > +	if (timefd >= 0) {
> > +		dprintf(timefd, "%f\n", a_time);
> > +		close(timefd);
> > +	}
> > +}
> > +
> > +static bool generate_results_with_endtime(int resdirfd, struct settings *settings)
> 
> The real purpose of this function is to regenerate results after each
> individual tests on the next patch - how about renaming this to
> generate_results_post_test or something like that?

Yes, what you think about generate_partial_results()?


> (End times could be written in all result generation paths except dry
> runs.)
> 

I do not intend to use it with dry-run option.

Regards,
Kamil

> > +{
> > +	char *results_path = settings->results_path;
> > +	double beg_time = timeofday_double();
> > +	double end_time;
> > +	bool ret;
> > +
> > +	remove_file(resdirfd, "results.bak");
> > +	renameat(resdirfd, "results.json", resdirfd, "results.bak");
> > +
> > +	write_endtime(resdirfd, beg_time);
> > +	ret = generate_results_path(results_path);
> > +	if (settings->sync)
> > +		fsync(resdirfd);
> > +
> > +	end_time = timeofday_double();
> > +	if (settings->log_level >= LOG_LEVEL_NORMAL) {
> > +		outf("generating results took: %.6ffs\n", end_time - beg_time);
> > +		fflush(stdout);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  bool execute(struct execute_state *state,
> >  	     struct settings *settings,
> >  	     struct job_list *job_list)
> > @@ -2718,8 +2753,18 @@ bool execute(struct execute_state *state,
> >  			if (!initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
> >  				return false;
> >  			state->time_left = time_left;
> > +			/* it should check option, also measure time taken */
> > +			if (!generate_results_with_endtime(resdirfd, settings))
> > +				return false;
> > +
> >  			return execute(state, settings, job_list);
> >  		}
> > +
> > +		/* it should check option, also measure time taken */
> > +		if (!generate_results_with_endtime(resdirfd, settings)) {
> > +			status = false;
> > +			break;
> > +		}
> >  	}
> >  
> >  	/* Collect facts after the last test runs */
> > @@ -2731,10 +2776,7 @@ bool execute(struct execute_state *state,
> >  				     settings->kmemleak_each, settings->sync))
> >  			errf("Failed to collect kmemleak logs after the last test\n");
> >  
> > -	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
> > -		dprintf(timefd, "%f\n", timeofday_double());
> > -		close(timefd);
> > -	}
> > +	write_endtime(resdirfd, timeofday_double());
> >  
> >   end:
> >  	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index 1ee167fb0..f5a91f542 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -2555,9 +2555,13 @@ bool generate_results(int dirfd)
> >  bool generate_results_path(char *resultspath)
> >  {
> >  	int dirfd = open(resultspath, O_DIRECTORY | O_RDONLY);
> > +	bool ret;
> >  
> >  	if (dirfd < 0)
> >  		return false;
> >  
> > -	return generate_results(dirfd);
> > +	ret = generate_results(dirfd);
> > +	close(dirfd);
> > +
> > +	return ret;
> >  }
> 
> Thanks, Ryszard
