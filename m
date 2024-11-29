Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC3BD729FC
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 19:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10EC10E587;
	Fri, 29 Nov 2024 19:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izaadY0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0410E587
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732908258; x=1764444258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LwP0TW/XeY5xiBmO86FMCDddgiXFIPvLw39tzPABEc0=;
 b=izaadY0BjtXhVpNa/N0UkiQYPOJx9zFQlZT0jx1Fcujs3IsLbOf8/fFD
 fi4Imm0/EijxYpQp8PiceewkGcFbtTWjq6MhdA2IzmPLwLEY09oN7cuMJ
 dEiLIc+eJILpGA2VY8CPxXwrXLetVdRIlIBZpouc8crnjkxOsxV0JsMXl
 xuQQUaJWqDRgp6HLhIk261ZEz19I1/hlLPU6SoeeOo3MuUQ+OquDi2joq
 gyLFltIaZ4xofJV0gyGuk6ZU5L7SZkyg2OMW9BCCwWTzUdcepbU2BIlie
 zZKhQuIwywdDfESd7XC+YpyRK2bbHs/8TgdRcloVOOFZyiHqFV2UEUp5c A==;
X-CSE-ConnectionGUID: rsvW6kFbRfCIotupUKuyeQ==
X-CSE-MsgGUID: tf6f5cj0Tluif4f/52e90w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="37081732"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="37081732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 11:24:17 -0800
X-CSE-ConnectionGUID: 9AZvLDjMQViGVEMdMhmR/A==
X-CSE-MsgGUID: 1MUfyNEhR2eY2U7AxuSH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97591503"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 11:24:16 -0800
Date: Fri, 29 Nov 2024 20:24:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <rk@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>,
 Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: [i-g-t,v2,2/4] runner/executor: Limit reading dmesg to chunks
Message-ID: <20241129192413.igqk5gh3wkaxov4f@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ryszard Knop <rk@dragonic.eu>,
 Petri Latvala <adrinael@adrinael.net>,
 Karol Krol <karol.krol@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20241120183208.146299-3-kamil.konieczny@linux.intel.com>
 <3c1808f58179c740c953aa8d19b7dc4275b5e9dd.camel@dragonic.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c1808f58179c740c953aa8d19b7dc4275b5e9dd.camel@dragonic.eu>
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

Hi Ryszard,
On 2024-11-27 at 16:12:13 +0100, Ryszard Knop wrote:
> LGTM, with one question below.
> 
> Reviewed-by: Ryszard Knop <rk@dragonic.eu>
> 
> On Wed, 2024-11-20 at 19:32 +0100, Kamil Konieczny wrote:
> > There was no disk limit checks in reading kernel dmesg and that
> > could lead to writing really huge dumps longer than 400MB,
> > greatly exceeding disk limits used by CI and hardly useful for
> > developers. Make a dmesg dumping in chunks, size depending on
> > number of CPUs present, with a minimum of 64KB.
> > This could also allow to kick in disk limits checks if a driver
> > starts spilling messages into dmesg.
> > 
> > v2: correct size at last dump, also inform user about exceeding
> >   limits (Kamil)
> > 
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
> > Cc: Petri Latvala <adrinael@adrinael.net>
> > Cc: Karol Krol <karol.krol@intel.com>
> > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c | 64 ++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 55 insertions(+), 9 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index e4d1fc323..a5b5c0eab 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -585,13 +585,14 @@ void close_outputs(int *fds)
> >  }
> >  
> >  /* Returns the number of bytes written to disk, or a negative number on error */
> > -static long dump_dmesg(int kmsgfd, int outfd)
> > +static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  {
> >  	/*
> >  	 * Write kernel messages to the log file until we reach
> > -	 * 'now'. Unfortunately, /dev/kmsg doesn't support seeking to
> > -	 * -1 from SEEK_END so we need to use a second fd to read a
> > -	 * message to match against, or stop when we reach EAGAIN.
> > +	 * 'now' or we read at least size bytes. Unfortunately,
> > +	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
> > +	 * so we need to use a second fd to read a message to
> > +	 *  match against, or stop when we reach EAGAIN.
> >  	 */
> >  
> >  	int comparefd;
> > @@ -606,6 +607,9 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  	if (kmsgfd < 0)
> >  		return 0;
> >  
> > +	if (size < 0)
> > +		return 0;
> > +
> >  	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
> >  	if (comparefd < 0) {
> >  		errf("Error opening another fd for /dev/kmsg\n");
> > @@ -690,6 +694,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  			if (seq >= cmpseq)
> >  				return written;
> >  		}
> > +
> > +		if (size && written >= size) {
> > +			if (comparefd >= 0)
> > +				close(comparefd);
> > +
> > +			return written;
> > +		}
> >  	}
> >  }
> >  
> > @@ -883,6 +894,25 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet,
> > bool s
> >  /* TODO: Refactor this macro from here and from various tests to lib */
> >  #define KB(x) ((x) * 1024)
> >  
> > +#if !defined(SIZE_MAX)
> > +#define SIZE_MAX (((size_t)-1) ^ (1 << (8 * sizeof(size_t) - 1)))
> > +#endif
> > +
> > +/* Calculates disk limit to use when dumping dmesg, returns:
> > + * number > 0	: size of limit to use
> > + * number < 0	: negative number when limit exceeded, no more dumping
> > + **/
> > +static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
> > +{
> > +	size_t dt = limit - disk_usage;
> > +
> > +	assert(SIZE_MAX > 0);
> > +	if (!limit)
> > +		return SIZE_MAX; /* no limit */
> > +
> > +	return dt != 0 ? dt : -1;
> > +}
> > +
> >  /*
> >   * Returns:
> >   *  =0 - Success
> > @@ -915,6 +945,8 @@ static int monitor_output(pid_t child,
> >  	unsigned long taints = 0;
> >  	bool aborting = false;
> >  	size_t disk_usage = 0;
> > +	size_t dmsg_chunk_size = 4096 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 16);
> 
> Any reason for 4096 here? If it's supposed to be the page size, maybe getpagesize() here?
> 

No special reason, maybe even 1024 could be better as the purpose
was to have all CPUs dumps in case of kernel Oops (with additional
condition that it will happen in main monitor loop).

Regards,
Kamil

> > +	long dmesgwritten;
> >  	bool socket_comms_used = false; /* whether the test actually uses comms */
> >  	bool results_received = false; /* whether we already have test results that might need
> > overriding if we detect an abort condition */
> >  
> > @@ -1240,11 +1272,9 @@ static int monitor_output(pid_t child,
> >  	socket_end:
> >  
> >  		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
> > -			long dmesgwritten;
> > -
> >  			time_last_activity = time_now;
> >  
> > -			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> > +			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> >  			if (settings->sync)
> >  				fdatasync(outputs[_F_DMESG]);
> >  
> > @@ -1482,7 +1512,8 @@ static int monitor_output(pid_t child,
> >  					asprintf(abortreason, "Child refuses to die, tainted
> > 0x%lx.", taints);
> >  				}
> >  
> > -				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> > +				dmsg_chunk_size = calc_last_dmesg_chunk(settings-
> > >disk_usage_limit, disk_usage);
> > +				dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> >  				if (settings->sync)
> >  					fdatasync(outputs[_F_DMESG]);
> >  
> > @@ -1508,9 +1539,24 @@ static int monitor_output(pid_t child,
> >  		}
> >  	}
> >  
> > -	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> > +	dmsg_chunk_size = calc_last_dmesg_chunk(settings->disk_usage_limit, disk_usage);
> > +	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
> >  	if (settings->sync)
> >  		fdatasync(outputs[_F_DMESG]);
> > +	if (dmesgwritten > 0) {
> > +		disk_usage += dmesgwritten;
> > +		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
> > +			char disk[1024];
> > +
> > +			snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded at dmesg
> > dump, %ld > %ld\n", disk_usage, settings->disk_usage_limit);
> > +			if (settings->log_level >= LOG_LEVEL_NORMAL) {
> > +				outf("%s", disk);
> > +				fflush(stdout);
> > +			} else if (killed) {
> > +				errf("%s", disk);
> > +			}
> > +		}
> > +	}
> >  
> >  	free(buf);
> >  	free(outbuf);
> 
