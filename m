Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EBA10E2F7
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 09:14:47 +0000 (UTC)
Message-ID: <e4735153-956e-6273-d6c4-e9e859f4a32d@intel.com>
Date: Fri, 28 Apr 2023 11:14:42 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230428091332.12330-1-kamil.konieczny@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20230428091332.12330-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "runner: check disk limit at
 dumping kmsg"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 28.04.2023 11:13, Kamil Konieczny wrote:
> This reverts commit 3bd8bf9bca97bbfb7b4b408f9fccd0cf6f742d4c.
>
> After some tests it seems that runner is not reporting failures
> properly from i915_selftest due to this change, also after
> re-thinking I come to conclusion that clipping may be applied
> after runner/resume processes a tests dmesg from a run into
> rusults.json
>
> Fixes: 3bd8bf9bca97 ("runner: check disk limit at dumping kmsg")
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   runner/executor.c | 24 +++++-------------------
>   1 file changed, 5 insertions(+), 19 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index ae6cf1bba..597cd7f58 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -584,7 +584,7 @@ void close_outputs(int *fds)
>   }
>   
>   /* Returns the number of bytes written to disk, or a negative number on error */
> -static long dump_dmesg(int kmsgfd, int outfd, size_t disk_limit)
> +static long dump_dmesg(int kmsgfd, int outfd)
>   {
>   	/*
>   	 * Write kernel messages to the log file until we reach
> @@ -599,18 +599,12 @@ static long dump_dmesg(int kmsgfd, int outfd, size_t disk_limit)
>   	bool underflow_once = false;
>   	char cont;
>   	char buf[2048];
> -	ssize_t r, disk_written;
> +	ssize_t r;
>   	long written = 0;
>   
>   	if (kmsgfd < 0)
>   		return 0;
>   
> -	disk_written = lseek(outfd, 0, SEEK_SET);
> -	if (disk_written > disk_limit) {
> -		errf("Error dumping kmsg: disk limit already exceeded\n");
> -		return 0; /* number of written bytes */
> -	}
> -
>   	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
>   	if (comparefd < 0) {
>   		errf("Error opening another fd for /dev/kmsg\n");
> @@ -661,13 +655,6 @@ static long dump_dmesg(int kmsgfd, int outfd, size_t disk_limit)
>   
>   		write(outfd, buf, r);
>   		written += r;
> -		disk_written += r;
> -
> -		if (disk_written > disk_limit) {
> -			close(comparefd);
> -			errf("Error dumping kmsg: disk limit exceeded\n");
> -			return written;
> -		}
>   
>   		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
>   					    &flags, &seq, &usec, &cont) == 4) {
> @@ -903,7 +890,6 @@ static int monitor_output(pid_t child,
>   	unsigned long taints = 0;
>   	bool aborting = false;
>   	size_t disk_usage = 0;
> -	const size_t mon_disk_limit = settings->disk_usage_limit ? : (~(size_t)0);
>   	bool socket_comms_used = false; /* whether the test actually uses comms */
>   	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
>   
> @@ -1233,7 +1219,7 @@ static int monitor_output(pid_t child,
>   
>   			time_last_activity = time_now;
>   
> -			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
> +			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
>   			if (settings->sync)
>   				fdatasync(outputs[_F_DMESG]);
>   
> @@ -1471,7 +1457,7 @@ static int monitor_output(pid_t child,
>   					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
>   				}
>   
> -				dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
> +				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
>   				if (settings->sync)
>   					fdatasync(outputs[_F_DMESG]);
>   
> @@ -1497,7 +1483,7 @@ static int monitor_output(pid_t child,
>   		}
>   	}
>   
> -	dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
> +	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
>   	if (settings->sync)
>   		fdatasync(outputs[_F_DMESG]);
>   
