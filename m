Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43410E05A
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Feb 2023 13:09:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id n2so2601759lfb.12
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Feb 2023 05:09:17 -0800 (PST)
Date: Sat, 25 Feb 2023 15:09:14 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y/oIenZzQOV5OH8G@adrinael.net>
References: <20230224192703.53697-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224192703.53697-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: check disk limit at dumping kmsg
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arkadiusz.hiler@intel.com>,
 Karol Krol <karol.krol@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 08:27:03PM +0100, Kamil Konieczny wrote:
> It was reported that kernel dumps can grow beyond disk limit size
> so add checks for it and report error if that happen.
> 
> Reported-by: Karol Krol <karol.krol@intel.com>
> Ref: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 597cd7f5..17ebcdb8 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -584,7 +584,7 @@ void close_outputs(int *fds)
>  }
>  
>  /* Returns the number of bytes written to disk, or a negative number on error */
> -static long dump_dmesg(int kmsgfd, int outfd)
> +static long dump_dmesg(int kmsgfd, int outfd, size_t disk_limit)
>  {
>  	/*
>  	 * Write kernel messages to the log file until we reach
> @@ -599,12 +599,18 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  	bool underflow_once = false;
>  	char cont;
>  	char buf[2048];
> -	ssize_t r;
> +	ssize_t r, disk_written;
>  	long written = 0;
>  
>  	if (kmsgfd < 0)
>  		return 0;
>  
> +	disk_written = lseek(outfd, 0, SEEK_SET);
> +	if (disk_written > disk_limit) {
> +		errf("Error dumping kmsg: disk limit already exceeded\n");
> +		return disk_written;
> +	}

The return value is the amount written to disk by this call, return 0 here.


> +
>  	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
>  	if (comparefd < 0) {
>  		errf("Error opening another fd for /dev/kmsg\n");
> @@ -655,6 +661,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
>  
>  		write(outfd, buf, r);
>  		written += r;
> +		disk_written += r;
> +
> +		if (disk_written > disk_limit) {
> +			close(comparefd);
> +			errf("Error dumping kmsg: disk limit exceeded\n");
> +			return disk_written;
> +		}

And same as above, return 'written' here instead of the current size.


All in all, this is a fine solution and it looks like I had a bit of a
brainfart originally when writing this code. When we're aborting and
killing the test, the runner lets the test (and kernel) dump out the
dying screams in hopes that those logs are useful with figuring out
why that condition happened, but disk limit being exceeded doesn't
need that additional logging. The damage is already done and what's in
the assumed-to-be already-humongous logs is the interesting bits.

With the return values changed,
Reviewed-by: Petri Latvala <adrinael@adrinael.net>

TODO for later:
1) Instead of letting dmesg log grow to an additional limit (the disk
usage limit is supposed to be _total_, stdout+stderr+dmesg), let dmesg
dumping only use what's left of the quota.
2) When disk limit is exceeded, add a message to dmesg that more
kernel logs might be available but we stopped collecting.


-- 
Petri Latvala
