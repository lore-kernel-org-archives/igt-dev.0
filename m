Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34A2CA0FF2
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 09:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC7110E94D;
	Thu, 28 Aug 2025 09:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ii9DJD7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7612810E94D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756372608; x=1787908608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eMnXzVeU2JjnQpPqerlrRETICiWsD9DRpPpvg2ypC9M=;
 b=Ii9DJD7+KykAcd2ZVeLuQ5QavGvGybcWMucaWEc484ShRtq7nnmZRKaq
 LNsH7Hio7RcSnYmpOVYXlYTF33cSujTlmHIvwK402JmBjYFUbg3i7OO5W
 +qsAgiOYYj0o4THNbszW9dVu7fJRV2DksFIaNBgq1fI0vs9wJ+X/pNNcT
 NNZBYMvVGMxlATSupjJMn54M+nzrYjkricLwGNhFyf1VE6q4R0C4DcoqI
 jSBqcxqk6bm6eGkSa9ZxCgCgzuAFeec4UsDSiqXbiZYAfoiTxLblKKlV6
 74tTjDsHJZzp9Nl5w4cWESa0YXzXxF9ug/+VeJUeoZT3ajCMV6j9wN64d w==;
X-CSE-ConnectionGUID: IzSQOA21SRi5YVHS+nuWQA==
X-CSE-MsgGUID: eWO1rKXHSQOgeq/Rr5TdHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57661314"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57661314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 02:16:48 -0700
X-CSE-ConnectionGUID: c6EOLjLZR+yzJto2RbpUBw==
X-CSE-MsgGUID: aYBggzADR8qGY6M+33O5bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174402100"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 02:16:46 -0700
Date: Thu, 28 Aug 2025 11:16:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] runner/executor: Abort if dmesg is flooded
Message-ID: <20250828091643.mwes23etokiwaala@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>, igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250826125329.109160-1-kamil.konieczny@linux.intel.com>
 <4109a6fd-f3a9-41e3-b033-7d1db03cdf0e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4109a6fd-f3a9-41e3-b033-7d1db03cdf0e@amd.com>
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

Hi vitaly,
On 2025-08-27 at 22:02:41 -0400, vitaly prosyak wrote:
> The change looks good to me. Reviewed-by  Vitaly Prosyak <vitaly.prosyak@amd.com>
> 

Thank you!

> Just small correction below for edge case.
> 
> On 2025-08-26 08:53, Kamil Konieczny wrote:
> > Current disk limit triggers once when it is exceeded during test
> > monitoring. After that happens executor no longer checks if
> > kernel is still printing plenty of messages.
> >
> > Create a way to abort test in such scenarios with the help of
> > measuring kernel kmsg activity before first test is executed
> > and then also check it after exceeding disk limit.
> >
> > Also print info about it after each test ends.
> >
> > v2: fix error when kmsg open fails, fix reading proc (Kamil)
> >   changed calculation of max bps (Peter)
> > v3: abort only when disk limit was actually exceeded,
> >   print info instead of aborting after every test (Kamil)
> > v4: added abort at main monitoring loop, also cleaning up
> >   printing messages (Kamil)
> > v5: fix typo, use less vars in a loop  (Krzysztof)
> >   reused existing dmesg reading function (Kamil)
> >
> > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > Cc: Karol Krol <karol.krol@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c | 143 +++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 128 insertions(+), 15 deletions(-)
> >
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 847abe481..b11381f39 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
> >  	return "output-filename-index-error";
> >  }
> >  
> > +static int open_kmsg_rdonly(void)
> > +{
> > +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> > +}
> > +
> >  /* Returns the number of bytes written to disk, or a negative number on error */
> >  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  {
> > @@ -646,6 +651,8 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
> >  	 * so we need to use a second fd to read a message to
> >  	 *  match against, or stop when we reach EAGAIN.
> > +	 * If outfd==0 it will not write anything but still count
> > +	 * how many bytes was readed from dmesg.
> >  	 */
> >  
> >  	int comparefd;
> > @@ -711,7 +718,9 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  			return written;
> >  		}
> >  
> > -		write(outfd, buf, r);
> > +		if (outfd)
> > +			write(outfd, buf, r);
> > +
> >  		written += r;
> >  
> >  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> > @@ -948,6 +957,76 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
> >  	return dt != 0 ? dt : -1;
> >  }
> >  
> > +/*
> > + * Tries to read from dmesg for 0.1 seconds
> > + *
> > + * Returns:
> > + *  =>0.0 - Success, measured kmsg activity in bytes/second
> > + *  -1.0 - Failure
> > + */
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
> > +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
> > +{
> > +	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
> > +
> In the current patch, if /dev/kmsg can’t be opened, measure_dmesg_bytes_per_sec() 
> returns -1.0, but later code still compares it against max_dmesg_ratio. That 
> means a negative value could accidentally be treated as “ok” and cause misleading 
> results.
> 
> The safe fix is to short-circuit inside check_dmesg_ratio() whenever 
> measure_dmesg_bytes_per_sec() returns a negative number. For example:
> 
> static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
> {
>     double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
> 
>     if (new_dmesg_bps < 0.0) {

You are right, without this it will print -1/1024 as a bps ratio,
I will correct it according to your suggestion.

Regards,
Kamil

>         if (log_level >= LOG_LEVEL_NORMAL) {
>             outf("Dmesg ratio: unavailable (no /dev/kmsg)\n");
>             if (sync)
>                 fflush(stdout);
>         }
>         return true; /* don’t gate on missing measurement */
>     }
> 
>     if (log_level >= LOG_LEVEL_NORMAL) {
>         outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
>         if (sync)
>             fflush(stdout);
>     }
> 
>     return new_dmesg_bps <= maxratio;
> }
> 
> > +	if (log_level >= LOG_LEVEL_NORMAL) {
> > +		outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
> > +		if (sync)
> > +			fflush(stdout);
> > +	}
> > +
> > +	return new_dmesg_bps <= maxratio;
> > +}
> > +
> >  /*
> >   * Returns:
> >   *  =0 - Success
> > @@ -960,6 +1039,7 @@ static int monitor_output(pid_t child,
> >  			  int *outputs,
> >  			  double *time_spent,
> >  			  struct settings *settings,
> > +			  double max_dmesg_ratio,
> >  			  char **abortreason,
> >  			  bool *abort_already_written)
> >  {
> > @@ -1463,29 +1543,31 @@ static int monitor_output(pid_t child,
> >  				 * exceeded the disk usage limit.
> >  				 */
> >  				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
> > +					char killmsg[256];
> > +
> >  					timeoutresult = false;
> > +					snprintf(killmsg, sizeof(killmsg),
> > +						 "runner: This test was killed due to exceeding disk usage limit. "
> > +						 "(Used %zd bytes, limit %zd)\n",
> > +						 disk_usage,
> > +						 settings->disk_usage_limit);
> >  
> >  					if (socket_comms_used) {
> >  						struct runnerpacket *message;
> > -						char killmsg[256];
> >  
> > -						snprintf(killmsg, sizeof(killmsg),
> > -							 "runner: This test was killed due to exceeding disk usage limit. "
> > -							 "(Used %zd bytes, limit %zd)\n",
> > -							 disk_usage,
> > -							 settings->disk_usage_limit);
> >  						message = runnerpacket_log(STDOUT_FILENO, killmsg);
> >  						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
> >  						free(message);
> >  					} else {
> > -						dprintf(outputs[_F_OUT],
> > -							"\nrunner: This test was killed due to exceeding disk usage limit. "
> > -							"(Used %zd bytes, limit %zd)\n",
> > -							disk_usage,
> > -							settings->disk_usage_limit);
> > +						dprintf(outputs[_F_OUT], "%s", killmsg);
> >  						if (settings->sync)
> >  							fdatasync(outputs[_F_OUT]);
> >  					}
> > +
> > +					if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> > +						asprintf(abortreason, "Dmesg ratio exceeded during test run.");
> > +						aborting = true;
> > +					}
> >  				}
> >  
> >  				if (socket_comms_used) {
> > @@ -1587,7 +1669,7 @@ static int monitor_output(pid_t child,
> >  	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> >  	if (settings->sync)
> >  		fdatasync(outputs[_F_DMESG]);
> > -	if (dmesgwritten > 0) {
> > +	if (dmesgwritten > 0 && !aborting) {
> >  		disk_usage += dmesgwritten;
> >  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
> >  			char disk[1024];
> > @@ -1599,6 +1681,11 @@ static int monitor_output(pid_t child,
> >  			} else if (killed) {
> >  				errf("%s", disk);
> >  			}
> > +
> > +			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> > +				asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
> > +				aborting = true;
> > +			}
> >  		}
> >  	}
> >  
> > @@ -1766,6 +1853,7 @@ static int execute_next_entry(struct execute_state *state,
> >  			      size_t total,
> >  			      double *time_spent,
> >  			      struct settings *settings,
> > +			      double max_dmesg_ratio,
> >  			      struct job_list_entry *entry,
> >  			      int testdirfd, int resdirfd,
> >  			      int sigfd, sigset_t *sigmask,
> > @@ -1814,7 +1902,7 @@ static int execute_next_entry(struct execute_state *state,
> >  		goto out_pipe;
> >  	}
> >  
> > -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> > +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> >  		errf("Warning: Cannot open /dev/kmsg\n");
> >  	} else {
> >  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> > @@ -1885,7 +1973,7 @@ static int execute_next_entry(struct execute_state *state,
> >  
> >  	result = monitor_output(child, outfd, errfd, socketfd,
> >  				kmsgfd, sigfd,
> > -				outputs, time_spent, settings,
> > +				outputs, time_spent, settings, max_dmesg_ratio,
> >  				abortreason, abort_already_written);
> >  
> >  out_kmsgfd:
> > @@ -2418,6 +2506,8 @@ bool execute(struct execute_state *state,
> >  	     struct settings *settings,
> >  	     struct job_list *job_list)
> >  {
> > +	static double dmesg_bps = -1.0;
> > +	static double max_dmesg_bps = -1.0;
> >  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
> >  	struct environment_variable *env_var;
> >  	struct utsname unamebuf;
> > @@ -2560,6 +2650,26 @@ bool execute(struct execute_state *state,
> >  		}
> >  	}
> >  
> > +	if (max_dmesg_bps < 0.0) {
> > +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
> > +		double set_bps = 0.0;
> > +
> > +		dmesg_bps = measure_dmesg_bytes_per_sec(0);
> > +
> > +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
> > +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
> > +
> > +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
> > +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
> > +
> > +		if (set_bps > 0.0)
> > +			max_dmesg_bps = set_bps;
> > +		else
> > +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
> > +
> > +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
> > +	}
> > +
> >  	for (; state->next < job_list->size;
> >  	     state->next++) {
> >  		char *reason = NULL;
> > @@ -2596,6 +2706,7 @@ bool execute(struct execute_state *state,
> >  						    job_list->size,
> >  						    &time_spent,
> >  						    settings,
> > +						    max_dmesg_bps,
> >  						    &job_list->entries[state->next],
> >  						    testdirfd, resdirfd,
> >  						    sigfd, &sigmask,
> > @@ -2651,6 +2762,8 @@ bool execute(struct execute_state *state,
> >  			break;
> >  		}
> >  
> > +		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
> > +
> >  		if (result > 0) {
> >  			double time_left = state->time_left;
> >  
