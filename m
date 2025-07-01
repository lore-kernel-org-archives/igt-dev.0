Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ADBC8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 10:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC6D10E042;
	Tue,  1 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3sow/LO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0D10E042
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751365538; x=1782901538;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mbBEm1etyhH8B0qjwWQ9zuilDnSbq+ljGKZkkNINjkY=;
 b=W3sow/LOnsGHiwTVWigPgQFS4KRNqbU6aLZPHoWxI0sSBF/ilP9w+UKR
 0Z+GM8GBmcFK8eOEe18lBK6ZmslO2Id2MXabWmnFfAqa4uXnCgN8FI/Sg
 jZ2JFzewKryYRXgogMiDrL9nXC97lLc35kUv6YkSmio143rIgZzDIBdHM
 A0tczxJYRsoK5itbLnREp/TBBmemfDYbMO2m90KK8hYUQLkOOcZRk1bfe
 vyIPKgsDFhz3NLem+fKseCg65WQF6j3ExPHcRoyULFNIoD7YF4/tyLfKL
 5pUF4U/4bafnJrl388cnXFTyWhNNfVlSKbEV23Kr7pk/q3MyHBjYm7yoO w==;
X-CSE-ConnectionGUID: SlA0yddHRYqv2lIFNhlG4A==
X-CSE-MsgGUID: To30AiR4Si2zsqR3fjr6jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71052014"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="71052014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:25:38 -0700
X-CSE-ConnectionGUID: jLz/nWF8SUacQ1qEQTOhfA==
X-CSE-MsgGUID: CfZ3z2F9SF2SJ8z4pTN2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154224093"
Received: from glewando-mobl1.ger.corp.intel.com (HELO [10.245.80.17])
 ([10.245.80.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:25:36 -0700
Message-ID: <f22d13a2-5055-4593-aafa-b2801a5a2ca9@linux.intel.com>
Date: Tue, 1 Jul 2025 12:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] runner/executor: Abort if dmesg is flooded
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250630190222.209723-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250630190222.209723-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 6/30/2025 9:02 PM, Kamil Konieczny wrote:
> Current disk limit triggers once when it is exceeded during test
> monitoring. After that happens executor no longer checks if
> kernel is still printing plenty of messages.
> 
> Create a way to abort test in such scenarios with the help of
> measureing kernel kmsg activity before first test is executed
> and then also check it twice, first time after exceeding disk
> limit and second time after each test ends.
> 
> v2: fix error when kmsg open fails, fix reading proc (Kamil)
>   changed calculation of max bps (Peter)

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>


> 
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Karol Krol <karol.krol@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 206 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 204 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 13180a0a4..c50e2ca7e 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
>  	return "output-filename-index-error";
>  }
>  
> +static int open_kmsg_rdonly(void)
> +{
> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> +}
> +
>  /* Returns the number of bytes written to disk, or a negative number on error */
>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  {
> @@ -734,6 +739,90 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  	}
>  }
>  
> +/*
> + * Measure how many bytes appears in dmesg.
> + * This is the same as above dump_dmesg() but with reading only.
> + */
> +static unsigned long long read_dmesg_to_null(int kmsgfd, unsigned long long size)
> +{
> +	bool underflow_once = false;
> +	int comparefd;
> +	char buf[2048];
> +	unsigned int flags;
> +	unsigned long long readed = 0;
> +	unsigned long long seq, cmpseq, usec;
> +	char cont;
> +	ssize_t r;
> +
> +	if (kmsgfd < 0)
> +		return 0;
> +
> +	comparefd = open_kmsg_rdonly();
> +	if (comparefd < 0) {
> +		errf("Error opening another fd for /dev/kmsg\n");
> +		return 0;
> +	}
> +
> +	lseek(comparefd, 0, SEEK_END);
> +
> +	while (1) {
> +		if (comparefd >= 0) {
> +			r = read(comparefd, buf, sizeof(buf) - 1);
> +			if (r < 0) {
> +				if (errno != EAGAIN && errno != EPIPE) {
> +					errf("Warning: Error reading kmsg comparison record: %m\n");
> +					close(comparefd);
> +					return readed;
> +				}
> +			} else {
> +				buf[r] = '\0';
> +				if (sscanf(buf, "%u,%llu,%llu,%c;",
> +					   &flags, &cmpseq, &usec, &cont) == 4) {
> +					close(comparefd);
> +					comparefd = -1;
> +				}
> +			}
> +		}
> +
> +		r = read(kmsgfd, buf, sizeof(buf));
> +		if (r < 0) {
> +			if (errno == EPIPE) {
> +				if (!underflow_once) {
> +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> +					underflow_once = true;
> +				}
> +				continue;
> +			} else if (errno == EINVAL) {
> +				errf("Warning: Buffer too small for kernel log record, record lost.\n");
> +				continue;
> +			} else if (errno != EAGAIN) {
> +				errf("Error reading from kmsg: %m\n");
> +				return 0;
> +			}
> +
> +			/* EAGAIN, so we're done reading */
> +			close(comparefd);
> +
> +			return readed;
> +		}
> +
> +		readed += r;
> +
> +		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> +					    &flags, &seq, &usec, &cont) == 4) {
> +			if (seq >= cmpseq)
> +				return readed;
> +		}
> +
> +		if (size && readed >= size) {
> +			if (comparefd >= 0)
> +				close(comparefd);
> +
> +			return readed;
> +		}
> +	} /* while(1) */
> +}
> +
>  static bool kill_child(int sig, pid_t child)
>  {
>  	/*
> @@ -943,6 +1032,86 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>  	return dt != 0 ? dt : -1;
>  }
>  
> +/*
> + * Returns:
> + *  =>0.0 - Success, measured kmsg activity in bytes/second
> + *  -1.0 - Failure
> + */
> +static double measure_dmesg_bytes_per_sec(void)
> +{
> +	struct timespec time_beg, time_now, nsec_sleep;
> +	unsigned long long readed, rnow;
> +	double time;
> +	int kmsgfd, cnt, zero;
> +
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> +		errf("Warning: Cannot open /dev/kmsg\n");
> +
> +		return -1.0;
> +	}
> +
> +	lseek(kmsgfd, 0, SEEK_END);
> +	nsec_sleep.tv_sec = 0;
> +	nsec_sleep.tv_nsec = 1000ULL * 1000ULL; /* 10^6 nanoseconds = 10^-3 sec */
> +	runner_gettime(&time_beg);
> +	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
> +		if (zero && !nanosleep(&nsec_sleep, NULL))
> +			break;
> +
> +		rnow = read_dmesg_to_null(kmsgfd, 128 * 1024); /* 64KB max */
> +		readed += rnow;
> +		runner_gettime(&time_now);
> +		time = igt_time_elapsed(&time_beg, &time_now);
> +		if (time <= 0.0) {
> +			errf("Warning: Time underflow\n");
> +
> +			return -1.0;
> +		}
> +
> +		if (rnow == 0.0)
> +			++zero;
> +		else
> +			zero = 0;
> +
> +		if (zero > 2)
> +			return 0.0;
> +	}
> +
> +	runner_gettime(&time_now);
> +	time = igt_time_elapsed(&time_beg, &time_now);
> +	if (time <= 0.0) {
> +		errf("Warning: Time underflow\n");
> +
> +		return -1.0;
> +	}
> +
> +	return (double)readed / time;
> +}
> +
> +/* Returns: true if ratio lower than maxratio */
> +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync)
> +{
> +	double new_dmesg_bps = measure_dmesg_bytes_per_sec();
> +
> +	if (new_dmesg_bps > maxratio) {
> +		char msg[1024];
> +
> +		snprintf(msg, sizeof(msg), "Dmesg rate overflow %0.3fKB/s > %0.3fKB/s, stopping.\n",
> +			 new_dmesg_bps / 1024, maxratio / 1024);
> +		if (log_level >= LOG_LEVEL_NORMAL) {
> +			outf("%s", msg);
> +			if (sync)
> +				fflush(stdout);
> +		}
> +
> +		errf("%s", msg);
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Returns:
>   *  =0 - Success
> @@ -955,6 +1124,7 @@ static int monitor_output(pid_t child,
>  			  int *outputs,
>  			  double *time_spent,
>  			  struct settings *settings,
> +			  double max_dmesg_ratio,
>  			  char **abortreason,
>  			  bool *abort_already_written)
>  {
> @@ -1596,6 +1766,11 @@ static int monitor_output(pid_t child,
>  		}
>  	}
>  
> +	if (!aborting && !check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync)) {
> +		asprintf(abortreason, "Dmesg ratio exceeded.");
> +		aborting = true;
> +	}
> +
>  	free(buf);
>  	free(outbuf);
>  	close(outfd);
> @@ -1760,6 +1935,7 @@ static int execute_next_entry(struct execute_state *state,
>  			      size_t total,
>  			      double *time_spent,
>  			      struct settings *settings,
> +			      double max_dmesg_ratio,
>  			      struct job_list_entry *entry,
>  			      int testdirfd, int resdirfd,
>  			      int sigfd, sigset_t *sigmask,
> @@ -1808,7 +1984,7 @@ static int execute_next_entry(struct execute_state *state,
>  		goto out_pipe;
>  	}
>  
> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>  		errf("Warning: Cannot open /dev/kmsg\n");
>  	} else {
>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> @@ -1879,7 +2055,7 @@ static int execute_next_entry(struct execute_state *state,
>  
>  	result = monitor_output(child, outfd, errfd, socketfd,
>  				kmsgfd, sigfd,
> -				outputs, time_spent, settings,
> +				outputs, time_spent, settings, max_dmesg_ratio,
>  				abortreason, abort_already_written);
>  
>  out_kmsgfd:
> @@ -2412,6 +2588,8 @@ bool execute(struct execute_state *state,
>  	     struct settings *settings,
>  	     struct job_list *job_list)
>  {
> +	static double dmesg_bps = -1.0;
> +	static double max_dmesg_bps = -1.0;
>  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
>  	struct environment_variable *env_var;
>  	struct utsname unamebuf;
> @@ -2554,6 +2732,26 @@ bool execute(struct execute_state *state,
>  		}
>  	}
>  
> +	if (max_dmesg_bps < 0.0) {
> +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
> +		double set_bps = 0.0;
> +
> +		dmesg_bps = measure_dmesg_bytes_per_sec();
> +
> +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
> +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
> +
> +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
> +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
> +
> +		if (set_bps > 0.0)
> +			max_dmesg_bps = set_bps;
> +		else
> +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
> +
> +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
> +	}
> +
>  	for (; state->next < job_list->size;
>  	     state->next++) {
>  		char *reason = NULL;
> @@ -2590,6 +2788,7 @@ bool execute(struct execute_state *state,
>  						    job_list->size,
>  						    &time_spent,
>  						    settings,
> +						    max_dmesg_bps,
>  						    &job_list->entries[state->next],
>  						    testdirfd, resdirfd,
>  						    sigfd, &sigmask,
> @@ -2645,6 +2844,9 @@ bool execute(struct execute_state *state,
>  			break;
>  		}
>  
> +		if (!check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync))
> +			break;
> +
>  		if (result > 0) {
>  			double time_left = state->time_left;
>  

