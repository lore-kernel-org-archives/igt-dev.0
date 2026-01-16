Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D2FC982DB
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 16:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7268C10E8E3;
	Fri, 16 Jan 2026 16:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V27Bt/61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F276A10E8E3
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768581247; x=1800117247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oGXvtZgRmxXssPjBkm1jKc4Bes2+uT8Js+e3Xmyy/JQ=;
 b=V27Bt/61b6kBLEzyvIgTTE0xZCNFx6AHH78HjQ+FSvsKDo2BsyoiT4g2
 8ho9jNXIAHra1CUZ6aevwjMsWcpFeKvvLD+G6eOnGGxG7dpAKeZ63ZwMM
 3Bukh2sh9/IY4vmBrUZbrsAicl/3/Kjj0xv3EHx43lS6MK8/6tkFxBL1K
 oh3O1ySSNh53MFH6eSw0fNtAn2TLIWpgZQDk/7k9nfLYzyh3JPLStKKkX
 wadPTTG1SSKS+FSR3NCcoeuX/3NkXulg9x7TXCHRB6sDd3iyl80k87spK
 otgBmStvByAHj1E0qBqYmLl7xWXrw9C8urb1do2Jo0KRBKdynMm6UXy3s w==;
X-CSE-ConnectionGUID: v4YEK49JSqqoAEw4MrjL9Q==
X-CSE-MsgGUID: zJCiJlGuTQi5SETVk0F17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80619320"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="80619320"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 08:34:06 -0800
X-CSE-ConnectionGUID: +pG/HeptTBaSRA7F9QoIyw==
X-CSE-MsgGUID: A4Y3ZVFgRGSjDe7e5ZD+HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="205073730"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:34:05 -0800
Date: Fri, 16 Jan 2026 17:34:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t 1/1] runner/executor: Adaptive dmesg disk write
Message-ID: <20260116163403.6iyopjzlimir3tdt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20260113080625.208986-1-sobin.thomas@intel.com>
 <20260113080625.208986-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113080625.208986-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-01-13 at 08:06:25 +0000, Sobin Thomas wrote:
> In current scenario  when disk usage limit is exceeded during a test, in
> batch mode the test exits abruptly.  Implement a logging suppression
> mechanism that drains kernel messages without writing to disk, allowing
> the test to complete.
> 
> - Add suppress parameter to dump_dmesg() to control disk write
> - Return 0 bytes written when suppression enabled (prevents disk writes)
> - Write status message when limit is reached, then continue test

NACK

I would not cut dmesg, especially during dmesg gathering as
this could lead to losing it in other tests.

What could be done is tell runner just before running a test
(or just after test starts) that you accept it growing few times
disk limit but later on, when reporting, it could be cut to fit
it.

Regards,
Kamil

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  runner/executor.c | 65 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 54 insertions(+), 11 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 847abe481..9fc148d4b 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -638,7 +638,7 @@ const char *get_out_filename(int fid)
>  }
>  
>  /* Returns the number of bytes written to disk, or a negative number on error */
> -static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> +static long dump_dmesg(int kmsgfd, int outfd, ssize_t size, bool suppress)
>  {
>  	/*
>  	 * Write kernel messages to the log file until we reach
> @@ -656,6 +656,7 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  	char buf[2048];
>  	ssize_t r;
>  	long written = 0;
> +	long drained = 0;
>  
>  	if (kmsgfd < 0)
>  		return 0;
> @@ -703,16 +704,23 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  				continue;
>  			} else if (errno != EAGAIN) {
>  				errf("Error reading from kmsg: %m\n");
> +				if (comparefd >= 0)
> +					close(comparefd);
>  				return -errno;
>  			}
>  
>  			/* EAGAIN, so we're done dumping */
> -			close(comparefd);
> -			return written;
> +			if (comparefd >= 0)
> +				close(comparefd);
> +			return suppress ? 0 : written;
>  		}
>  
> -		write(outfd, buf, r);
> -		written += r;
> +		if (!suppress) {
> +			write(outfd, buf, r);
> +			written += r;
> +		} else {
> +			drained += r;
> +		}
>  
>  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>  					    &flags, &seq, &usec, &cont) == 4) {
> @@ -722,15 +730,20 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  			 * enough.
>  			 */
>  			if (seq >= cmpseq)
> -				return written;
> +				return suppress ? 0 : written;
>  		}
>  
> -		if (size && written >= size) {
> +		if (!suppress && size && written >= size) {
>  			if (comparefd >= 0)
>  				close(comparefd);
>  
>  			return written;
>  		}
> +		if (suppress && size && drained >= size) {
> +			if (comparefd >= 0)
> +				close(comparefd);
> +			return 0;
> +		}
>  	}
>  }
>  
> @@ -984,6 +997,8 @@ static int monitor_output(pid_t child,
>  	long dmesgwritten;
>  	bool socket_comms_used = false; /* whether the test actually uses comms */
>  	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
> +	bool logging_disabled = false;
> +	bool suppress_logging = false;
>  
>  	runner_gettime(&time_beg);
>  	time_last_activity = time_last_subtest = time_killed = time_beg;
> @@ -1309,7 +1324,8 @@ static int monitor_output(pid_t child,
>  		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
>  			time_last_activity = time_now;
>  
> -			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> +			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size,
> +						  suppress_logging);
>  			if (settings->sync)
>  				fdatasync(outputs[_F_DMESG]);
>  
> @@ -1321,6 +1337,32 @@ static int monitor_output(pid_t child,
>  			}
>  		}
>  
> +		/* Check if we need to disable logging due to disk usage limit */
> +
> +		if (!logging_disabled && disk_usage_limit_exceeded(settings, disk_usage)) {
> +			char msg[256];
> +
> +			suppress_logging = true;
> +			logging_disabled = true;
> +
> +			/* Write warning message to output files */
> +			snprintf(msg, sizeof(msg),
> +				 "\n[RUNNER] Disk usage limit reached (%zu/%zu bytes). "
> +				 "Disabling further logging and DRM debug. Test continues.\n ",
> +				 disk_usage, settings->disk_usage_limit);
> +
> +			write(outputs[_F_OUT], msg, strlen(msg));
> +			write(outputs[_F_ERR], msg, strlen(msg));
> +
> +			if (settings->log_level >= LOG_LEVEL_NORMAL)
> +				fprintf(stderr, "%s", msg);
> +
> +			if (settings->sync) {
> +				fdatasync(outputs[_F_OUT]);
> +				fdatasync(outputs[_F_ERR]);
> +			}
> +		}
> +
>  		if (sigfd >= 0 && FD_ISSET(sigfd, &set)) {
>  			double time;
>  
> @@ -1539,7 +1581,7 @@ static int monitor_output(pid_t child,
>  						 igt_time_elapsed(&time_killed, &time_now),
>  						 disk_usage);
>  
> -		if (timeout_reason) {
> +		if (timeout_reason && !suppress_logging) {
>  			if (killed == SIGKILL) {
>  				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
>  
> @@ -1553,7 +1595,8 @@ static int monitor_output(pid_t child,
>  				}
>  
>  				dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
> -				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> +				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size,
> +					   suppress_logging);
>  				if (settings->sync)
>  					fdatasync(outputs[_F_DMESG]);
>  
> @@ -1584,7 +1627,7 @@ static int monitor_output(pid_t child,
>  	}
>  
>  	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
> -	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> +	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size, suppress_logging);
>  	if (settings->sync)
>  		fdatasync(outputs[_F_DMESG]);
>  	if (dmesgwritten > 0) {
> -- 
> 2.51.0
> 
