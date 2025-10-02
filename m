Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F74CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 15:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B792D10E37C;
	Thu,  2 Oct 2025 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASsW344P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773810E803
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759419912; x=1790955912;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mnDAZ2UytOZh/SpDaorBoUW5asBwjlYovg511ObM1G4=;
 b=ASsW344P5TPGY/iSuO4QtGR7l7U3MrvQ3BXVjxWSgFgtmRP0unmwi9hS
 sKTQ4jYNF66aVr+ePRUXbaOEItKMhNacz8kXQLWgMCAMe+86iih966YSS
 E4BoMqB/XULSNnb0IpupfwnhA10Xrv76ypblKJJkBdfrb4QAPDkC7sKSO
 PYqx2X6KTtKetlglIKpC7ECz5l0hyj4/MywECdHTYxGG5kPYp1bhqJ41r
 F0uKH1y4I4glDMG5Ww7jizsZtDe1kmUCUEz6q+hwoSoERCvweE0pp8jgz
 f5lpf7t/lKTJl4HsFAB6sCZ3ygsZ5S1h4NuWfSUU+cPW+0i+bra48zsyb w==;
X-CSE-ConnectionGUID: EB24WsvgRwCer1oBWzMG6A==
X-CSE-MsgGUID: fFWzm6q6Rv6FcM3nZQqzCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72381362"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="72381362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:45:12 -0700
X-CSE-ConnectionGUID: XRg+j9wLT/miV2MyYHqMZg==
X-CSE-MsgGUID: erTY0thwRhe77eD4UBrW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178675758"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:45:09 -0700
Date: Thu, 2 Oct 2025 17:45:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v7 1/2] runner: Abort if dmesg is flooded
Message-ID: <20251002154506.wlwb3yguwx7p5n37@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250924195453.92680-1-kamil.konieczny@linux.intel.com>
 <20250924195453.92680-2-kamil.konieczny@linux.intel.com>
 <a3f3b62yflwamvezb3zetpfgmaggmkltlunft5u4ijjv7luloq@ct5xwephsvsm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3f3b62yflwamvezb3zetpfgmaggmkltlunft5u4ijjv7luloq@ct5xwephsvsm>
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
On 2025-09-25 at 07:42:13 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> [...]
> > +static double measure_dmesg_bytes_per_sec(int wrfd)
> > +{
> > +	struct timespec time_beg, time_now, nsec_sleep;
> > +	unsigned long long dmsg_read, rnow;
> > +	double time;
> > +	int kmsgfd;
> > +
> > +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> > +		errf("Warning: Cannot open /dev/kmsg\n");
> > +
> > +		return -1.0;
> > +	}
> > +
> > +	lseek(kmsgfd, 0, SEEK_END);
> > +	nsec_sleep.tv_sec = 0;
> > +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> > +	runner_gettime(&time_beg);
> > +	time = 0.0;
> > +	dmsg_read = 0.0;
> > +	while (1) {
> > +		rnow = dump_dmesg(kmsgfd, wrfd, 64 * 4096); /* 64KB max */
> > +		if (rnow > 0)
> > +			dmsg_read += rnow;
> I think you could just skip the `if` here. Adding 0 to dmsg_read
> should not change its value.
> 

dump_dmesg() could also return -1. I will make it
other way, just return early with zero on error:

		if (rnow < 0)
			return 0;

> > +
> > +		runner_gettime(&time_now);
> > +		time = igt_time_elapsed(&time_beg, &time_now);
> > +		if (time <= 0.0) {
> > +			errf("Warning: Time underflow\n");
> > +			return -1.0;
> > +		}
> > +
> > +		if (time >= 0.1)
> > +			break;
> > +
> > +		if (rnow == 0)
> > +			nanosleep(&nsec_sleep, NULL);
> > +	}
> > +
> > +	runner_gettime(&time_now);
> > +	time = igt_time_elapsed(&time_beg, &time_now);
> The while loop matches one dmesg measurement with one time
> measurement, so adding another time measurement will always
> lower the ratio. Did you intend to do this? If you are worried
> about time underflows, then you could check igt_time_elapsed()
> return value directly. Unless, this is all planned, then
> disregard this comment :)

Good point, it will remove some repeated code, also below
underflow check.

> 
> > +	if (time <= 0.0) {
> > +		errf("Warning: Time underflow\n");
> > +
> > +		return -1.0;
> > +	}
> > +
> > +	return (double)dmsg_read / time;
> > +}
> > +
> > +/* Returns: true if ratio lower or equal than maxratio */
> I observed a number of sytles used for commenting function
> returns in this file, so a cleanup might be due in the near
> future. However, this is not a topic for this patch.
> 

Yes, something for later cleanup.

> [...]
> > -				errf("%s", disk);
> > -			}
> > +	if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
> > +		char disk[1024];
> > +
> > +		snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded %zu > %zu\n", disk_usage, settings->disk_usage_limit);
> This line is a bit long, could you break it?
> 

Yes.

> > +		if (settings->log_level >= LOG_LEVEL_NORMAL) {
> > +			outf("%s", disk);
> > +			fflush(stdout);
> > +		} else if (killed) {
> > +			errf("%s", disk);
> > +		}
> > +
> > +		if (!aborting && settings->dmsg_ratio_limit >= 0 &&
> > +		    !check_dmesg_ratio(settings->dmsg_ratio_limit, settings->log_level,
> > +				       settings->sync, outputs[_F_DMESG])) {
> > +			asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
> > +			aborting = true;
> >  		}
> >  	}
> >  
> > @@ -1814,7 +1908,7 @@ static int execute_next_entry(struct execute_state *state,
> >  		goto out_pipe;
> >  	}
> >  
> > -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> > +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> This is not related to the topic of this patch, so mention it in
> the commit message explicitly.
> 

Hmm, on second reading I will revert back to just calling open()
Thx for pointing this.

> >  		errf("Warning: Cannot open /dev/kmsg\n");
> >  	} else {
> >  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> > @@ -2560,6 +2654,11 @@ bool execute(struct execute_state *state,
> >  		}
> >  	}
> >  
> > +	if (settings->dmsg_ratio_limit >= 0 &&
> > +	    settings->log_level >= LOG_LEVEL_NORMAL)
> > +		outf("Using dmesg ratio limit %zdKB/s\n",
> > +		     settings->dmsg_ratio_limit / 1024);
> > +
> >  	for (; state->next < job_list->size;
> >  	     state->next++) {
> >  		char *reason = NULL;
> > @@ -2651,6 +2750,8 @@ bool execute(struct execute_state *state,
> >  			break;
> >  		}
> >  
> > +		check_dmesg_ratio(settings->dmsg_ratio_limit, settings->log_level, settings->sync, 0);
> Could you explain a bit more why you call this without checking the return value?

I want to have some insight in CI runs here but you are right,
it needs some comment.
imho I will change it and it will report only ratios > 0.

> > +
> >  		if (result > 0) {
> >  			double time_left = state->time_left;
> >  
> > diff --git a/runner/settings.c b/runner/settings.c
> > index 3ccf71870..7b0f8ad51 100644
> > --- a/runner/settings.c
> > +++ b/runner/settings.c
> > @@ -21,6 +21,7 @@
> >  enum {
> >  	OPT_ABORT_ON_ERROR,
> >  	OPT_DISK_USAGE_LIMIT,
> > +	OPT_DMSG_RATIO_LIMIT,
> >  	OPT_TEST_LIST,
> >  	OPT_IGNORE_MISSING,
> >  	OPT_PIGLIT_DMESG,
> > @@ -90,6 +91,8 @@ static const char settings_filename[] = "metadata.txt";
> >  static const char env_filename[] = "environment.txt";
> >  static const char hooks_filename[] = "hooks.txt";
> >  
> > +static const ssize_t default_opt_dmsg_ratio_limit = -1;
> > +
> >  static bool set_log_level(struct settings* settings, const char *level)
> >  {
> >  	typeof(*log_levels) *it;
> > @@ -185,7 +188,7 @@ static size_t char_to_multiplier(char c)
> >  	return 0;
> >  }
> >  
> > -static bool parse_usage_limit(struct settings *settings, const char *optarg)
> You are making this function more univeresal, am I correct?
> Then this should probably be a separate patch before this one.
> 

You are right, I will make it, see below.

> > +static bool parse_ulong(size_t *dest, const char *optarg)
> >  {
> >  	size_t value;
> >  	char *endptr = NULL;
> > @@ -193,6 +196,9 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
> >  	if (!optarg)
> >  		return false;
> >  
> > +	if (!dest)
> > +		return false;
> > +
> >  	value = strtoul(optarg, &endptr, 10);
> >  
> >  	if (*endptr) {
> > @@ -204,7 +210,33 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
> >  		value *= multiplier;
> >  	}
> >  
> > -	settings->disk_usage_limit = value;
> > +	*dest = value;
> > +	return true;
> > +}
> > +
> > +static bool parse_slong(ssize_t *dest, const char *optarg)
> Here too - you introduced a new function, which deserves to be a part of a separate patch.

Ok, I will make a separate change for new option and small refactor.

Regards,
Kamil

> 
> [...]
> -- 
> Best Regards,
> Krzysztof
