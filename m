Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE27CA0FE9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 12:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40FF10E64B;
	Tue, 26 Aug 2025 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HctEZzH+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BA510E64B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756212132; x=1787748132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fkuHwu1/BcmEl+ptaCTV4QXF3Wno3j9s3w6tdafpb7Y=;
 b=HctEZzH+Ec/63IGJOnf6o+fEs9yVXK8c+yrV0MF3EfF3+a0OtCYXGNsy
 7yKfD03++lPQbW1rt/gAQtV9fjIVTlLf+mAsmMFzPmpp0tJlVlturDWIH
 5JsbrpTbeHe+fjsL86imXL3BdzMBV+uBYhsqM2uDO6SCZOsdP8d3Ix7m7
 +odL58k8tlYV0OLiJqbV93AFUVj/rSsGQY54p+MS/TzWEL5gt9uvjk56E
 +Y/ZPUSuC+j/yG0vOhfA6Cot77Znws+ToxQYXhRsvH8TbNH627+L6+rti
 Z90u/N1V+tg1LvFLbwa43/f/XlpU19KxcffAVsSiuA2O9o6LDfNxaq7uk g==;
X-CSE-ConnectionGUID: GO4jVlY8QNGKlCRO3eNlVA==
X-CSE-MsgGUID: wYwZKY6MTDq/+FFMN3239g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58378390"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58378390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:42:12 -0700
X-CSE-ConnectionGUID: cfYkk80zRimxpjPInQgvNA==
X-CSE-MsgGUID: vk2BnjAkTOWu9CY1EQhjuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173962860"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 05:42:10 -0700
Date: Tue, 26 Aug 2025 14:41:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] runner/executor: Abort if dmesg is flooded
Message-ID: <20250826124154.5upz2yaoyjfc2tke@kamilkon-DESK.igk.intel.com>
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
References: <20250723160609.103140-1-kamil.konieczny@linux.intel.com>
 <bnxzyriwiduoxxp2s7mxkkn3jscy5xua5tx3lweaqwxkcsvn56@f5y4zifuil4t>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bnxzyriwiduoxxp2s7mxkkn3jscy5xua5tx3lweaqwxkcsvn56@f5y4zifuil4t>
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
On 2025-07-24 at 11:23:05 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> I posted some comments below.
> 
> [...]
> > Create a way to abort test in such scenarios with the help of
> > measureing kernel kmsg activity before first test is executed
> measureing -> measuring
> 

Fixed.

> [...]
> > +++ b/runner/executor.c
> > +static int open_kmsg_rdonly(void)
> > +{
> > +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> > +}
> > +
> >  /* Returns the number of bytes written to disk, or a negative number on error */
> >  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  {
> > @@ -734,6 +739,95 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
> >  	}
> >  }
> >  
> > +/*
> > + * Measure how many bytes appears in dmesg.
> > + * This is the same as above dump_dmesg() but with reading only.
> > + */
> > +static unsigned long long read_dmesg2(int kmsgfd, unsigned long long size, int wrfd)
> > +{
> > +	bool underflow_once = false;
> > +	int comparefd;
> > +	char buf[2048];
> > +	unsigned int flags;
> > +	unsigned long long readed = 0;
> readed -> read, as this is irregular verb.
> 

There is read() system function so no easy name here.
I changed it into dmsg_read

> > +	unsigned long long seq, cmpseq, usec;
> > +	char cont;
> > +	ssize_t r;
> > +
> > +	if (kmsgfd < 0)
> > +		return 0;
> > +
> > +	if (wrfd < 0)
> > +		wrfd = 0;
> > +
> > +	comparefd = open_kmsg_rdonly();
> > +	if (comparefd < 0) {
> > +		errf("Error opening another fd for /dev/kmsg\n");
> > +		return 0;
> > +	}
> > +
> > +	lseek(comparefd, 0, SEEK_END);
> > +
> > +	while (1) {
> > +		if (comparefd >= 0) {
> > +			r = read(comparefd, buf, sizeof(buf) - 1);
> > +			if (r < 0) {
> > +				if (errno != EAGAIN && errno != EPIPE) {
> > +					errf("Warning: Error reading kmsg comparison record: %m\n");
> > +					close(comparefd);
> > +					return readed;
> > +				}
> > +			} else {
> > +				buf[r] = '\0';
> > +				if (sscanf(buf, "%u,%llu,%llu,%c;",
> > +					   &flags, &cmpseq, &usec, &cont) == 4) {
> > +					close(comparefd);
> > +					comparefd = -1;
> > +				}
> What would happen if the first call to
> r = read(comparefd, buf, sizeof(buf) - 1);
> failed and then
> r = read(kmsgfd, buf, sizeof(buf));
> would succeed? Would we be counting the comparefd bytes after we
> already got some bytes from kmsgfd? Or is the comparison
> operation optional?

Please note that while(1) loop is entered with comparefd >= 0
and is set to -1 only when read from it succeeded. Also,
comparefd reads are not counted here as this is only a once
time read of one dmesg line.

> > +			}
> > +		}
> > +
> > +		r = read(kmsgfd, buf, sizeof(buf));
> > +		if (r < 0) {
> > +			if (errno == EPIPE) {
> > +				if (!underflow_once) {
> > +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> > +					underflow_once = true;
> > +				}
> > +				continue;
> > +			} else if (errno == EINVAL) {
> > +				errf("Warning: Buffer too small for kernel log record, record lost.\n");
> > +				continue;
> > +			} else if (errno != EAGAIN) {
> > +				errf("Error reading from kmsg: %m\n");
> > +				return 0;
> > +			}
> > +
> > +			/* EAGAIN, so we're done reading */
> > +			close(comparefd);
> > +
> > +			return readed;
> > +		}
> > +
> > +		readed += r;
> > +		if (wrfd && r)
> > +			write(wrfd, buf, r);
> > +
> > +		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> > +					    &flags, &seq, &usec, &cont) == 4) {
> > +			if (seq >= cmpseq)
> I wonder if seq can be a lower value than cmpseq - should we
> care if that happens? If not, then maybe move the "seq >= cmpseq"
> check into the if before, to reduce indentation a bit.
> 

Good question, imho it could happen in systems running for
very long time without reboot, then counter could overflow
and start from zero. Imho this will not happen in out CI
runs.

> > +				return readed;
> > +		}
> > +
> > +		if (size && readed >= size) {
> > +			if (comparefd >= 0)
> > +				close(comparefd);
> > +
> > +			return readed;
> > +		}
> > +	} /* while(1) */
> > +}
> > +
> >  static bool kill_child(int sig, pid_t child)
> >  {
> >  	/*
> > @@ -948,6 +1042,78 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
> >  	return dt != 0 ? dt : -1;
> >  }
> >  
> > +/*
> > + * Returns:
> > + *  =>0.0 - Success, measured kmsg activity in bytes/second
> > + *  -1.0 - Failure
> > + */
> > +static double measure_dmesg_bytes_per_sec(int wrfd)
> > +{
> > +	struct timespec time_beg, time_now, nsec_sleep;
> > +	unsigned long long readed, rnow;
> > +	double time, ratio;
> > +	int kmsgfd, cnt, zero;
> > +
> > +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> > +		errf("Warning: Cannot open /dev/kmsg\n");
> > +
> > +		return -1.0;
> > +	}
> > +
> > +	if (wrfd < 0)
> > +		wrfd = 0;
> > +
> > +	lseek(kmsgfd, 0, SEEK_END);
> > +	nsec_sleep.tv_sec = 0;
> > +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> > +	runner_gettime(&time_beg);
> > +	for (cnt = 0, zero = 0, time = 0.0, readed = 0.0; cnt < 11 && time < 0.01; ++cnt) {
> > +		if (zero)
> If "zero" only serves as a flag then I think below sleep could
> be moved to the end of this for loop, because from execution
> standpoint this will never trigger during the first pass

Right, I rewritten this loop according to your suggestions,
less vars, easier flow (I hope). See v5.

> > +			nanosleep(&nsec_sleep, NULL);
> > +
> > +		rnow = read_dmesg2(kmsgfd, 128 * 1024, wrfd); /* 64KB max */
> > +		readed += rnow;
> > +		runner_gettime(&time_now);
> > +		time = igt_time_elapsed(&time_beg, &time_now);
> > +		if (time <= 0.0) {
> > +			errf("Warning: Time underflow\n");
> > +
> > +			return -1.0;
> > +		}
> > +
> > +		if (rnow == 0)
> Move the nanosleep here and perhaps remove "zero" variable
> completely. Then the code here would only contain a single if:
> 	if (rnow == 0)
> 		nanosleep(&nsec_sleep, NULL);
> 

Done.

> > +			++zero;
> > +		else
> > +			zero = 0;
> > +	}
> > +
> > +	runner_gettime(&time_now);
> > +	time = igt_time_elapsed(&time_beg, &time_now);
> > +	if (time <= 0.0) {
> > +		errf("Warning: Time underflow\n");
> > +
> You could skip this newline here.
> 

Done.

> > +		return -1.0;
> > +	}
> > +
> > +	ratio = (double)readed / time;
> > +
> > +	return ratio;
> You could return (double)readed / time; and remove ratio
> variable.
> 

Done, thank you for review.

Regards,
Kamil

> Best Regards,
> Krzysztof
