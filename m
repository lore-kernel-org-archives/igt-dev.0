Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB92D5B16F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E8810E25E;
	Mon, 15 Dec 2025 13:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETOBFroo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0B410E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765803771; x=1797339771;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VbA0/C5ccN+WSi6KPkSeFgzb9BWRGNtr5sLKChPZtOM=;
 b=ETOBFrooUQf4C+whPI0VlHFroHJujjCvmx3h0ApVu3V9ElrEQb6+R1Zp
 KUFDzjBdAZU915EV6VESOhzqCK+emJ3rD20lCc34LrWe+OcC+yE4KyJmJ
 ifvJzjps/YG42E6dr71hBIs7ROhR/oI5AWU9GEuBrC3vpOHwJ/nP0mmBI
 ZoXtSg6dRkirRU7bYqOasEGhQ8Fc5vQQ0mgQ1MBG0nw1WY3d9AAVt/kBG
 7f82zEW/zoYfIO5suNtHw9yMY78v9EOUdv79pa2uNigFilvisPEUukYHF
 bT7UjgymY+FgUJuSojHxMqbvCryI2aIu9Z6bwnoEHVEjT1IqkzSQI57fB Q==;
X-CSE-ConnectionGUID: 7lJjInPISuqbXSc3PiW9fg==
X-CSE-MsgGUID: AXZcFzVGTVSDTLO40iXGog==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67457898"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67457898"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:02:50 -0800
X-CSE-ConnectionGUID: IEBuuZdGTsG1CzlC248uIA==
X-CSE-MsgGUID: 79IbjK4+SmmVc1FmdyZiNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="198230879"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 05:02:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t 1/1] feat: Enable/Disable DRM debug logging
 between tests in shard mode
In-Reply-To: <20251215103305.445335-2-sobin.thomas@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215103305.445335-1-sobin.thomas@intel.com>
 <20251215103305.445335-2-sobin.thomas@intel.com>
Date: Mon, 15 Dec 2025 15:02:45 +0200
Message-ID: <55ada1787b4227a9942599baf8b0a85f1e1bd9e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 15 Dec 2025, Sobin Thomas <sobin.thomas@intel.com> wrote:
> In shard mode, when disk usage limit is exceeded during a test, DRM
> debug logging is disabled by writing "0" to /sys/module/drm/parameters/debug
> to prevent premature exit. However, this disabled state persisted across
> subsequent tests in the same shard, causing loss of debug information for
> tests that did not exceed the disk limit.
>
> Add a global flag to track when DRM debug was disabled in a previous test.
> At the start of each new test in monitor_output(), check this flag and
> restore DRM debug logging to the original value (or default "14" if the
> original value could not be saved). Verify the write succeeded by reading
> back the value, retrying up to 10 times with 100ms delays if needed.

Why the retries? Under what circumstances is retrying like this
warranted?

> The original DRM debug value is saved once at startup in execute() before
> any tests run, ensuring we can restore to the correct state. The per-test
> logging_disabled flag remains local to monitor_output() to track state
> within the current test execution.
>
> This ensures each test starts with a clean state and proper debug logging,
> while still allowing dynamic disabling when disk limits are exceeded.

There are already functions igt_drm_debug_mask_reset() and
igt_drm_debug_mask_update() that abstract modifying the parameter.

Please do not add four (!) new open-coded
open("/sys/module/drm/parameters/debug", ...) calls. Amend the existing
if needed.

Also, I think reducing debug logging in dmesg should be logged in dmegs
with igt_kmsg(). If I look at a dmesg, I need to know then and there
that the debugs were reduced, not out-of-band in some IGT log.

Some random comments inline.

> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  runner/executor.c | 148 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index 847abe481..8b1bb4d33 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -45,12 +45,15 @@
>  #define KMSG_HEADER "[IGT] "
>  #define KMSG_WARN 4
>  #define GRACEFUL_EXITCODE -SIGHUP
> -
> +#define DRM_DEBUG_DEFAULT "14"
> +#define DRM_DEBUG_DISABLE "0x0"

It's a mask. Seems silly to define the default in decimal and 0 in hex.

>  static struct {
>  	int *fds;
>  	size_t num_dogs;
>  } watchdogs;
>  
> +static bool global_logging_disabled;
> +
>  static void runner_gettime(struct timespec *tv)
>  {
>  	if (clock_gettime(CLOCK_BOOTTIME, tv))
> @@ -948,6 +951,111 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>  	return dt != 0 ? dt : -1;
>  }
>  
> +static char original_drm_debug[16] = {0};
> +static bool drm_debug_saved;
> +
> +static void restore_drm_debug(void)
> +{
> +	int fd;
> +	static const char default_debug[] = "14";
> +	const char *value_to_write;
> +	char readback[16];
> +	ssize_t cnt;
> +	int retries = 10;
> +	bool success = false;
> +
> +	// Use saved value if available, otherwise use default "14"
> +	value_to_write = drm_debug_saved ? original_drm_debug : DRM_DEBUG_DEFAULT;
> +	outf("Restoring DRM Debug to %s", value_to_write);

So this is using the macro for default just to debug log...?

> +	while (retries-- > 0 && !success) {
> +		outf("Restoring DRM Debug");
> +		/* Write the value */
> +		fd = open("/sys/module/drm/parameters/debug", O_WRONLY);
> +		if (fd >= 0) {
> +			write(fd, default_debug, sizeof(default_debug) - 1);

...but the actual value used is a magic value in a static const string?

> +			close(fd);
> +		} else {
> +			errf("Failed to open /sys/module/drm/parameters/debug"
> +			     "for writing: %m\n");
> +			break;
> +		}
> +
> +	/* Read it back to verify */
> +	fd = open("/sys/module/drm/parameters/debug", O_RDONLY);
> +	if (fd >= 0) {
> +		cnt = read(fd, readback, sizeof(readback) - 1);
> +		if (cnt > 0) {
> +			readback[cnt] = '\0';
> +			/* Remove trailing newline if present */
> +			if (cnt > 0 && readback[cnt - 1] == '\n')
> +				readback[cnt - 1] = '\0';
> +
> +			/* Check if it matches what we wrote */
> +			if (strcmp(readback, DRM_DEBUG_DEFAULT) == 0) {
> +				outf("Write Success");
> +				success = true;
> +				if (settings->log_level >= LOG_LEVEL_NORMAL) {
> +					errf("[RUNNER] Successfully restored "
> +					     "DRM debug to %s\n", readback);
> +				}
> +			} else {
> +				errf("[RUNNER] DRM debug readback mismatch:"
> +				     "wrote 14, read %s (retry %d)\n",
> +					readback, 10 - retries);
> +				usleep(100000); /* Wait 100ms before retry */
> +			}
> +		}
> +		close(fd);
> +	} else {
> +		errf("Failed to open /sys/module/drm/parameters/debug for reading: %m\n");
> +		break;
> +	}
> +	}

Something went wrong with the indentation there.

> +
> +	if (!success)
> +		errf("[RUNNER] Failed to restore DRM debug to default "
> +		     "after 10 retries\n");
> +}
> +
> +static void disable_drm_debug(void)
> +{
> +	int fd;
> +	static const char zero[] = "0x0";
> +	const char *msg = "[RUNNER] logging disabled due to disk usage limit\n";
> +	int cnt = 0;
> +	// Save the current value before disabling
> +	if (!drm_debug_saved) {
> +		fd = open("/sys/module/drm/parameters/debug", O_RDONLY);
> +	if (fd >= 0) {
> +		cnt = read(fd, original_drm_debug, sizeof(original_drm_debug) - 1);
> +		if (cnt > 0) {
> +			original_drm_debug[cnt] = '\0';
> +			// Remove trailing newline if present
> +			if (cnt > 0 && original_drm_debug[cnt - 1] == '\n')
> +				original_drm_debug[cnt - 1] = '\0';
> +			drm_debug_saved = true;
> +		}
> +		close(fd);
> +		}
> +	}
> +
> +	fd = open("/sys/module/drm/parameters/debug", O_WRONLY);
> +	if (fd >= 0) {
> +		write(fd, zero, sizeof(zero) - 1);

So this is not using the macro either.

> +		close(fd);
> +		fprintf(stdout, "%s", msg);
> +		fprintf(stderr, "%s", msg);
> +
> +		fflush(stdout);
> +		fflush(stderr);
> +
> +		/* Log to kernel that we disabled debug */
> +		kmsg_log(4, "igt_runner: Disabled DRM debug due to disk usage limit\n");
> +	}
> +	global_logging_disabled = true;
> +}
> +
> +
>  /*
>   * Returns:
>   *  =0 - Success
> @@ -984,10 +1092,20 @@ static int monitor_output(pid_t child,
>  	long dmesgwritten;
>  	bool socket_comms_used = false; /* whether the test actually uses comms */
>  	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
> +	bool logging_disabled = false;
>  
>  	runner_gettime(&time_beg);
>  	time_last_activity = time_last_subtest = time_killed = time_beg;
>  
> +	/* Restore DRM debug at the start of each test if it was disabled earlier */
> +	if (global_logging_disabled) {
> +		restore_drm_debug();
> +		global_logging_disabled = false;
> +
> +		if (settings->log_level >= LOG_LEVEL_NORMAL)
> +			outf("[RUNNER] Restored DRM debug logging for new test\n");
> +	}
> +
>  	if (errfd > nfds)
>  		nfds = errfd;
>  	if (socketfd > nfds)
> @@ -1321,6 +1439,34 @@ static int monitor_output(pid_t child,
>  			}
>  		}
>  
> +		/* Check if we need to disable logging due to disk usage limit */
> +
> +		if (!logging_disabled && disk_usage_limit_exceeded(settings, disk_usage)) {
> +			char msg[256];
> +
> +			logging_disabled = true;
> +
> +			/* Disable DRM debug to reduce dmesg spam */
> +			disable_drm_debug();
> +
> +			/* Write warning message to output files */
> +			snprintf(msg, sizeof(msg),
> +				"\n[RUNNER] Disk usage limit reached (%zu/%zu bytes). "
> +				"Disabling further logging and DRM debug. Test continues.\n ",
> +				disk_usage, settings->disk_usage_limit);
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

-- 
Jani Nikula, Intel
