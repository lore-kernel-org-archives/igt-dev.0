Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74616C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 16:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D8E10EA8A;
	Thu, 27 Aug 2026 16:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTvV2Rkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B0110EA8A
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849271; x=1819385271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LeHNZt6hSGQkE+i5cEdZVRc3VhaLtZHhHZjtIWc99RE=;
 b=NTvV2Rkznhua4eByhzXiFhWoJvs7T6u2KyUDX7zFRAi+pLwjKf/+fgdZ
 rv1NXWrm4NdZml9HjIPtfLLbh/bbkoNQt9Xafz0UQbhw01U640mUFOIMz
 GEJYQyVT5klI1rxSdMZUM7lKD9OFEVU83sV+hch+msCOsvGg0o7Gdcs50
 hJsi0MXZXUi/OJT05RJIf0ecSdAP9Zj6Tt0JCXiQoQjWynVDk0CUx6Re1
 L453d6cPq/Gp28wNYZeIIDC1nDOaqjmkt+jdcaKv4DsLZcSB/yk+BEF1I
 f53EultSPn7zpntt+bPhHY4N0n836O21nS+jhPjDBhZxkjg5LAnCgzhug g==;
X-CSE-ConnectionGUID: jYmirCaNR6Ot+RV4WVS5iQ==
X-CSE-MsgGUID: Z16J3H0ySJ+XHshdvW0i3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92214124"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92214124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:47:50 -0700
X-CSE-ConnectionGUID: 0h6pGOi+SZqe47ZrLyuQwg==
X-CSE-MsgGUID: RASRiMy0SvWy/koqVw2wpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="297807239"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 09:47:49 -0700
Date: Thu, 27 Aug 2026 18:47:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,v1,2/2] runner: Create new option for incremental results
Message-ID: <20260827164747.tsexqeiwsysoaxie@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260720161526.64709-3-kamil.konieczny@linux.intel.com>
 <ab3f212acab766cd62f3ab5d84489cc387653563.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab3f212acab766cd62f3ab5d84489cc387653563.camel@intel.com>
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
On 2026-07-21 at 13:20:02 +0000, Knop, Ryszard wrote:
> On Mon, 2026-07-20 at 18:15 +0200, Kamil Konieczny wrote:
> > Create new option --inc-results which will make results.json
> > after each test was run, not only after last one.
> > 
> > Please note that this could be somewhat misleading when a kernel
> > panic happens during an execution, as a real test causing this
> > will not be there. In such cases one still needs to run
> > igt_results to add that last one to results.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c | 19 +++++++++++++------
> >  runner/settings.c |  8 ++++++++
> >  runner/settings.h |  1 +
> >  3 files changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index b204fdffc..7c923bed3 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -2045,6 +2045,11 @@ static bool clear_old_results(char *path)
> >  		return false;
> >  	}
> >  
> > +	if (remove_file(dirfd, "results.old")) {
> > +		errf("Error clearing results.old : %m\n");
> > +		return false;
> > +	}
> > +
> >  	for (i = 0; true; i++) {
> >  		struct stat st;
> >  
> > @@ -2484,6 +2489,9 @@ static bool generate_results_with_endtime(int resdirfd, struct settings *setting
> >  	double end_time;
> >  	bool ret;
> >  
> > +	if (!settings->inc_results)
> > +		return true;
> > +
> >  	remove_file(resdirfd, "results.bak");
> >  	renameat(resdirfd, "results.json", resdirfd, "results.bak");
> >  
> > @@ -2758,12 +2766,11 @@ bool execute(struct execute_state *state,
> >  				return false;
> >  
> >  			return execute(state, settings, job_list);
> > -		}
> > -
> > -		/* it should check option, also measure time taken */
> > -		if (!generate_results_with_endtime(resdirfd, settings)) {
> > -			status = false;
> > -			break;
> > +		} else {
> > +			if (!generate_results_with_endtime(resdirfd, settings)) {
> > +				status = false;
> > +				break;
> > +			}
> >  		}
> >  	}
> >  
> > diff --git a/runner/settings.c b/runner/settings.c
> > index 3ccf71870..c52fed92b 100644
> > --- a/runner/settings.c
> > +++ b/runner/settings.c
> > @@ -23,6 +23,7 @@ enum {
> >  	OPT_DISK_USAGE_LIMIT,
> >  	OPT_TEST_LIST,
> >  	OPT_IGNORE_MISSING,
> > +	OPT_INC_RESULTS,
> >  	OPT_PIGLIT_DMESG,
> >  	OPT_DMESG_WARN_LEVEL,
> >  	OPT_OVERALL_TIMEOUT,
> > @@ -309,6 +310,7 @@ static const char *usage_str =
> >  	"                        Set an environment variable for the test process.\n"
> >  	"                        If only the key is provided, the current value is read\n"
> >  	"                        from the runner's environment (and saved for resumes).\n"
> > +	"  --inc-results         Save results incrementally after each test was run\n"
> 
> Can this be named something like "--save-results-after-each-test" or
> something like that? It's not really "incremental", the entire
> results.json is getting generated from scratch on each run, and a
> longer name is a bit more descriptive.
> 

Yes, it makes sense, I will rename it.



Regards,
Kamil

> >  	"  -L, --list-all        List all matching subtests instead of running\n"
> >  	"  --collect-code-cov    Enables gcov-based collect of code coverage for tests.\n"
> >  	"                        Requires --collect-script FILENAME\n"
> > @@ -693,6 +695,7 @@ bool parse_options(int argc, char **argv,
> >  		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
> >  		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
> >  		{"facts", no_argument, NULL, OPT_FACTS},
> > +		{"inc-results", no_argument, NULL, OPT_INC_RESULTS},
> >  		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
> >  		{"sync", no_argument, NULL, OPT_SYNC},
> >  		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
> > @@ -768,6 +771,9 @@ bool parse_options(int argc, char **argv,
> >  		case OPT_FACTS:
> >  			settings->facts = true;
> >  			break;
> > +		case OPT_INC_RESULTS:
> > +			settings->inc_results = true;
> > +			break;
> >  		case OPT_KMEMLEAK:
> >  			/* The default is once */
> >  			settings->kmemleak = true;
> > @@ -1235,6 +1241,7 @@ bool serialize_settings(struct settings *settings)
> >  	SERIALIZE_INT(f, settings, dry_run);
> >  	SERIALIZE_INT(f, settings, allow_non_root);
> >  	SERIALIZE_INT(f, settings, facts);
> > +	SERIALIZE_INT(f, settings, inc_results);
> >  	SERIALIZE_INT(f, settings, kmemleak);
> >  	SERIALIZE_INT(f, settings, kmemleak_each);
> >  	SERIALIZE_INT(f, settings, sync);
> > @@ -1353,6 +1360,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
> >  		PARSE_INT(settings, name, val, dry_run);
> >  		PARSE_INT(settings, name, val, allow_non_root);
> >  		PARSE_INT(settings, name, val, facts);
> > +		PARSE_INT(settings, name, val, inc_results);
> >  		PARSE_INT(settings, name, val, kmemleak);
> >  		PARSE_INT(settings, name, val, kmemleak_each);
> >  		PARSE_INT(settings, name, val, sync);
> > diff --git a/runner/settings.h b/runner/settings.h
> > index 6c58c3282..10f95f286 100644
> > --- a/runner/settings.h
> > +++ b/runner/settings.h
> > @@ -62,6 +62,7 @@ struct settings {
> >  	struct igt_list_head env_vars;
> >  	struct igt_vec hook_strs;
> >  	bool facts;
> > +	bool inc_results;
> >  	bool kmemleak;
> >  	bool kmemleak_each;
> >  	bool sync;
> 
> Thanks, Ryszard
