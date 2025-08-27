Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F53FCA0EFF
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 07:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0215010E725;
	Wed, 27 Aug 2025 07:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwMwO7F9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED8F10E725
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756279939; x=1787815939;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jmjMawgHmTyEnJjP3ZTE3Qw4vAgd9WmVTT06rsaCWp8=;
 b=RwMwO7F9oFED7SBMcUdBhVbYN+QcGRQ3i6qdWhi/4M5pq28qXbJ967OI
 4hV8006esztCtzJ+1Ui3Ht5wyBDpLNg8V8HTU4TNHM4AYOy17RC2S2mms
 yaJZlV76qAg5+992T5gHCXQQ3F+18ekISMJ1th8DdNijCGIq8C+9Z/o8f
 SvS9c4HbnSlkFEgi4MbdypK8R31jroXdooNwzGFtiAE0xyU3JdonN+ZJX
 iOpURJLjsM8pv0hxdRHwV6ht/F76k0Ti9MW2UNsLUNdTx9lcU07ahiVFI
 RRPF7w8bA1RaTp/DG0Df4EnC5SF1X2eVXgS+y07aWBOEfEWq3gMVgeGIA Q==;
X-CSE-ConnectionGUID: zBNl6Sj1RFqT2ZPOnM0UYA==
X-CSE-MsgGUID: raHMOJQlTvCKzu/IqHun9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61162970"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61162970"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 00:32:16 -0700
X-CSE-ConnectionGUID: 6GvaOZeqTDWFK11I1t02XQ==
X-CSE-MsgGUID: cKbL4J3/QpKd+s1SERh18Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174109665"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 00:32:13 -0700
Date: Wed, 27 Aug 2025 09:31:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] runner/executor: Abort if dmesg is flooded
Message-ID: <20250827073154.emqfpknun7it3fbm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250723160609.103140-1-kamil.konieczny@linux.intel.com>
 <02600808-da76-4681-99f6-73ab1711ad67@linux.intel.com>
 <945c23dd-6f1e-49cf-b212-9273995e7b5e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <945c23dd-6f1e-49cf-b212-9273995e7b5e@amd.com>
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

Hi Vitaly,
On 2025-08-26 at 20:28:25 -0400, vitaly prosyak wrote:
> Reviewed-by Vitaly Prosyak <vitaly.prosyak@amd.com>
> 

Could you look into v5? I fixed a reading loop there.
Thank you in advance!

Regards,
Kamil

> On 2025-07-24 07:55, Peter Senna Tschudin wrote:
> >
> > On 7/23/2025 6:06 PM, Kamil Konieczny wrote:
> >> Current disk limit triggers once when it is exceeded during test
> >> monitoring. After that happens executor no longer checks if
> >> kernel is still printing plenty of messages.
> >>
> >> Create a way to abort test in such scenarios with the help of
> >> measureing kernel kmsg activity before first test is executed
> >> and then also check it after exceeding disk limit.
> >>
> >> Also print info about it after each test ends.
> >>
> >> v2: fix error when kmsg open fails, fix reading proc (Kamil)
> >>   changed calculation of max bps (Peter)
> >> v3: abort only when disk limit was actually exceeded,
> >>   print info instead of aborting after every test (Kamil)
> >> v4: added abort at main monitoring loop, also cleaning up
> >>   printing messages (Kamil)
> >>
> >> Cc: Ewelina Musial <ewelina.musial@intel.com>
> >> Cc: Karol Krol <karol.krol@intel.com>
> >> Cc: Petri Latvala <adrinael@adrinael.net>
> >> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >> Cc: Ryszard Knop <ryszard.knop@intel.com>
> >> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> ---
> >>  runner/executor.c | 228 +++++++++++++++++++++++++++++++++++++++++++---
> >>  1 file changed, 214 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/runner/executor.c b/runner/executor.c
> >> index 847abe481..db2c05b03 100644
> >> --- a/runner/executor.c
> >> +++ b/runner/executor.c
> >> @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
> >>  	return "output-filename-index-error";
> >>  }
> >>  
> >> +static int open_kmsg_rdonly(void)
> >> +{
> >> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> >> +}
> >> +
> >>  /* Returns the number of bytes written to disk, or a negative number on error */
> >>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >>  {
> >> @@ -734,6 +739,95 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >>  	}
> >>  }
> >>  
> >> +/*
> >> + * Measure how many bytes appears in dmesg.
> >> + * This is the same as above dump_dmesg() but with reading only.
> >> + */
> >> +static unsigned long long read_dmesg2(int kmsgfd, unsigned long long size, int wrfd)
> >> +{
> >> +	bool underflow_once = false;
> >> +	int comparefd;
> >> +	char buf[2048];
> >> +	unsigned int flags;
> >> +	unsigned long long readed = 0;
> >> +	unsigned long long seq, cmpseq, usec;
> >> +	char cont;
> >> +	ssize_t r;
> >> +
> >> +	if (kmsgfd < 0)
> >> +		return 0;
> >> +
> >> +	if (wrfd < 0)
> >> +		wrfd = 0;
> >> +
> >> +	comparefd = open_kmsg_rdonly();
> >> +	if (comparefd < 0) {
> >> +		errf("Error opening another fd for /dev/kmsg\n");
> >> +		return 0;
> >> +	}
> >> +
> >> +	lseek(comparefd, 0, SEEK_END);
> >> +
> >> +	while (1) {
> >> +		if (comparefd >= 0) {
> >> +			r = read(comparefd, buf, sizeof(buf) - 1);
> >> +			if (r < 0) {
> >> +				if (errno != EAGAIN && errno != EPIPE) {
> >> +					errf("Warning: Error reading kmsg comparison record: %m\n");
> >> +					close(comparefd);
> >> +					return readed;
> >> +				}
> >> +			} else {
> >> +				buf[r] = '\0';
> >> +				if (sscanf(buf, "%u,%llu,%llu,%c;",
> >> +					   &flags, &cmpseq, &usec, &cont) == 4) {
> >> +					close(comparefd);
> >> +					comparefd = -1;
> >> +				}
> >> +			}
> >> +		}
> >> +
> >> +		r = read(kmsgfd, buf, sizeof(buf));
> >> +		if (r < 0) {
> >> +			if (errno == EPIPE) {
> >> +				if (!underflow_once) {
> >> +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> >> +					underflow_once = true;
> >> +				}
> >> +				continue;
> >> +			} else if (errno == EINVAL) {
> >> +				errf("Warning: Buffer too small for kernel log record, record lost.\n");
> >> +				continue;
> >> +			} else if (errno != EAGAIN) {
> >> +				errf("Error reading from kmsg: %m\n");
> >> +				return 0;
> >> +			}
> >> +
> >> +			/* EAGAIN, so we're done reading */
> >> +			close(comparefd);
> >> +
> >> +			return readed;
> >> +		}
> >> +
> >> +		readed += r;
> >> +		if (wrfd && r)
> >> +			write(wrfd, buf, r);
> >> +
> >> +		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> >> +					    &flags, &seq, &usec, &cont) == 4) {
> >> +			if (seq >= cmpseq)
> >> +				return readed;
> >> +		}
> >> +
> >> +		if (size && readed >= size) {
> >> +			if (comparefd >= 0)
> >> +				close(comparefd);
> >> +
> >> +			return readed;
> >> +		}
> >> +	} /* while(1) */
> >> +}
> >> +
> >>  static bool kill_child(int sig, pid_t child)
> >>  {
> >>  	/*
> >> @@ -948,6 +1042,78 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
> >>  	return dt != 0 ? dt : -1;
> >>  }
> >>  
> >> +/*
> >> + * Returns:
> >> + *  =>0.0 - Success, measured kmsg activity in bytes/second
> >> + *  -1.0 - Failure
> >> + */
> >> +static double measure_dmesg_bytes_per_sec(int wrfd)
> >> +{
> >> +	struct timespec time_beg, time_now, nsec_sleep;
> >> +	unsigned long long readed, rnow;
> >> +	double time, ratio;
> >> +	int kmsgfd, cnt, zero;
> >> +
> >> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> >> +		errf("Warning: Cannot open /dev/kmsg\n");
> >> +
> >> +		return -1.0;
> >> +	}
> >> +
> >> +	if (wrfd < 0)
> >> +		wrfd = 0;
> >> +
> >> +	lseek(kmsgfd, 0, SEEK_END);
> >> +	nsec_sleep.tv_sec = 0;
> >> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> >> +	runner_gettime(&time_beg);
> >> +	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
> >> +		if (zero)
> >> +			nanosleep(&nsec_sleep, NULL);
> >> +
> >> +		rnow = read_dmesg2(kmsgfd, 128 * 1024, wrfd); /* 64KB max */
> >> +		readed += rnow;
> >> +		runner_gettime(&time_now);
> >> +		time = igt_time_elapsed(&time_beg, &time_now);
> >> +		if (time <= 0.0) {
> >> +			errf("Warning: Time underflow\n");
> >> +
> >> +			return -1.0;
> >> +		}
> >> +
> >> +		if (rnow == 0)
> >> +			++zero;
> >> +		else
> >> +			zero = 0;
> >> +	}
> >> +
> >> +	runner_gettime(&time_now);
> >> +	time = igt_time_elapsed(&time_beg, &time_now);
> >> +	if (time <= 0.0) {
> >> +		errf("Warning: Time underflow\n");
> >> +
> >> +		return -1.0;
> >> +	}
> >> +
> >> +	ratio = (double)readed / time;
> >> +
> >> +	return ratio;
> >> +}
> >> +
> >> +/* Returns: true if ratio lower or equal than maxratio */
> >> +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
> >> +{
> >> +	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
> >> +
> >> +	if (log_level >= LOG_LEVEL_NORMAL) {
> >> +		outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
> >> +		if (sync)
> >> +			fflush(stdout);
> >> +	}
> >> +
> >> +	return new_dmesg_bps <= maxratio;
> >> +}
> >> +
> >>  /*
> >>   * Returns:
> >>   *  =0 - Success
> >> @@ -960,6 +1126,7 @@ static int monitor_output(pid_t child,
> >>  			  int *outputs,
> >>  			  double *time_spent,
> >>  			  struct settings *settings,
> >> +			  double max_dmesg_ratio,
> >>  			  char **abortreason,
> >>  			  bool *abort_already_written)
> >>  {
> >> @@ -1463,29 +1630,31 @@ static int monitor_output(pid_t child,
> >>  				 * exceeded the disk usage limit.
> >>  				 */
> >>  				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
> >> +					char killmsg[256];
> >> +
> >>  					timeoutresult = false;
> >> +					snprintf(killmsg, sizeof(killmsg),
> >> +						 "runner: This test was killed due to exceeding disk usage limit. "
> >> +						 "(Used %zd bytes, limit %zd)\n",
> >> +						 disk_usage,
> >> +						 settings->disk_usage_limit);
> >>  
> >>  					if (socket_comms_used) {
> >>  						struct runnerpacket *message;
> >> -						char killmsg[256];
> >>  
> >> -						snprintf(killmsg, sizeof(killmsg),
> >> -							 "runner: This test was killed due to exceeding disk usage limit. "
> >> -							 "(Used %zd bytes, limit %zd)\n",
> >> -							 disk_usage,
> >> -							 settings->disk_usage_limit);
> >>  						message = runnerpacket_log(STDOUT_FILENO, killmsg);
> >>  						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
> >>  						free(message);
> >>  					} else {
> >> -						dprintf(outputs[_F_OUT],
> >> -							"\nrunner: This test was killed due to exceeding disk usage limit. "
> >> -							"(Used %zd bytes, limit %zd)\n",
> >> -							disk_usage,
> >> -							settings->disk_usage_limit);
> >> +						dprintf(outputs[_F_OUT], "%s", killmsg);
> >>  						if (settings->sync)
> >>  							fdatasync(outputs[_F_OUT]);
> >>  					}
> >> +
> >> +					if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> >> +						asprintf(abortreason, "Dmesg ratio exceeded during test run.");
> >> +						aborting = true;
> >> +					}
> >>  				}
> >>  
> >>  				if (socket_comms_used) {
> >> @@ -1587,7 +1756,7 @@ static int monitor_output(pid_t child,
> >>  	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> >>  	if (settings->sync)
> >>  		fdatasync(outputs[_F_DMESG]);
> >> -	if (dmesgwritten > 0) {
> >> +	if (dmesgwritten > 0 && !aborting) {
> >>  		disk_usage += dmesgwritten;
> >>  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
> >>  			char disk[1024];
> >> @@ -1599,6 +1768,11 @@ static int monitor_output(pid_t child,
> >>  			} else if (killed) {
> >>  				errf("%s", disk);
> >>  			}
> >> +
> >> +			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> >> +				asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
> >> +				aborting = true;
> >> +			}
> >>  		}
> >>  	}
> >>  
> >> @@ -1766,6 +1940,7 @@ static int execute_next_entry(struct execute_state *state,
> >>  			      size_t total,
> >>  			      double *time_spent,
> >>  			      struct settings *settings,
> >> +			      double max_dmesg_ratio,
> >>  			      struct job_list_entry *entry,
> >>  			      int testdirfd, int resdirfd,
> >>  			      int sigfd, sigset_t *sigmask,
> >> @@ -1814,7 +1989,7 @@ static int execute_next_entry(struct execute_state *state,
> >>  		goto out_pipe;
> >>  	}
> >>  
> >> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> >> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> >>  		errf("Warning: Cannot open /dev/kmsg\n");
> >>  	} else {
> >>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> >> @@ -1885,7 +2060,7 @@ static int execute_next_entry(struct execute_state *state,
> >>  
> >>  	result = monitor_output(child, outfd, errfd, socketfd,
> >>  				kmsgfd, sigfd,
> >> -				outputs, time_spent, settings,
> >> +				outputs, time_spent, settings, max_dmesg_ratio,
> >>  				abortreason, abort_already_written);
> >>  
> >>  out_kmsgfd:
> >> @@ -2418,6 +2593,8 @@ bool execute(struct execute_state *state,
> >>  	     struct settings *settings,
> >>  	     struct job_list *job_list)
> >>  {
> >> +	static double dmesg_bps = -1.0;
> >> +	static double max_dmesg_bps = -1.0;
> >>  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
> >>  	struct environment_variable *env_var;
> >>  	struct utsname unamebuf;
> >> @@ -2560,6 +2737,26 @@ bool execute(struct execute_state *state,
> >>  		}
> >>  	}
> >>  
> >> +	if (max_dmesg_bps < 0.0) {
> >> +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
> >> +		double set_bps = 0.0;
> >> +
> >> +		dmesg_bps = measure_dmesg_bytes_per_sec(0);
> >> +
> >> +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
> >> +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
> >> +
> >> +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
> >> +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
> >> +
> >> +		if (set_bps > 0.0)
> >> +			max_dmesg_bps = set_bps;
> >> +		else
> >> +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
> >> +
> >> +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
> >> +	}
> >> +
> >>  	for (; state->next < job_list->size;
> >>  	     state->next++) {
> >>  		char *reason = NULL;
> >> @@ -2596,6 +2793,7 @@ bool execute(struct execute_state *state,
> >>  						    job_list->size,
> >>  						    &time_spent,
> >>  						    settings,
> >> +						    max_dmesg_bps,
> >>  						    &job_list->entries[state->next],
> >>  						    testdirfd, resdirfd,
> >>  						    sigfd, &sigmask,
> >> @@ -2651,6 +2849,8 @@ bool execute(struct execute_state *state,
> >>  			break;
> >>  		}
> >>  
> >> +		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
> >> +
> >>  		if (result > 0) {
> >>  			double time_left = state->time_left;
> >>  
