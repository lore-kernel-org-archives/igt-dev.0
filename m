Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788ADD729FB
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 19:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F314A10E362;
	Fri, 29 Nov 2024 19:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2kwpHtu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5210E362
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732908694; x=1764444694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=adu5hTQj25L5aOMNzZOBhAQnsAtwkeY9mxrp4JL4LcY=;
 b=n2kwpHtuyheBAYiJill98iaeCFP3bAP3PSsAw+wdBN433Tysb2zuSUIi
 +KOU49u56WIgLg01xnGun4biN7ASGuFHO3ygaRxWqrt4MXV3Tfxcb9Ive
 w1zDKKOrboNBkW+LmCtGfemqGr7P/m5esavbV3bOwMSJR7cyk1OBcoi4P
 CxRYlJpZZbIKWWtA9qotoIXtG+PjuyGREYdn2bt9dgGAKrBdIJzS5T9xh
 PXgPe4fR3xLxHG3E7QBNMNwdDcqTjCoZQaoqgRmtYECpOyXzEt6fPdp3a
 RhSf6EYbs0wUA4vLqLHz2HQcvmlRO0AHoIb2wax2AYmFofGZ+hXXsNO8k w==;
X-CSE-ConnectionGUID: Pqy45u69T1Cm6sDwEgCFCQ==
X-CSE-MsgGUID: cBysgJcAS4SPFnWjGs0GrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33275694"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="33275694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 11:31:34 -0800
X-CSE-ConnectionGUID: ieZl2f9oQ5um3NjDlKKjAQ==
X-CSE-MsgGUID: tluLULa8QYyVH3b3SwqRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="115828729"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 11:31:34 -0800
Date: Fri, 29 Nov 2024 20:31:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ryszard Knop <rk@dragonic.eu>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [i-g-t, v2, 1/4] runner/executor: Check for error at writing dmesg
 dump
Message-ID: <20241129193130.lw7e3vuorxml2cyg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ryszard Knop <rk@dragonic.eu>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
References: <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
 <8383c51498ad6b3586afbc48523727a1db3b0e15.camel@dragonic.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8383c51498ad6b3586afbc48523727a1db3b0e15.camel@dragonic.eu>
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
On 2024-11-27 at 16:05:11 +0100, Ryszard Knop wrote:
> On Wed, 2024-11-20 at 19:32 +0100, Kamil Konieczny wrote:
> > In processing kernel dmesg there are checks for error at reading
> > so add also one for writing.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> >  runner/executor.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index ac73e1dde..e4d1fc323 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  	bool underflow_once = false;
> >  	char cont;
> >  	char buf[2048];
> > -	ssize_t r;
> > +	ssize_t r, w;
> >  	long written = 0;
> >  
> >  	if (kmsgfd < 0)
> > @@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  			return written;
> >  		}
> >  
> > -		write(outfd, buf, r);
> > -		written += r;
> > +		w = write(outfd, buf, r);
> > +		if (w < r) {
> 
> You could rewrite this entire block to have a single write call, or to handle multiple
> interrupts/better error messages:
> 
> int encountered_errors = 0;
> while (written < r) {
>   int w = write(outfd, buf + written, r - written);
>   if (w > 0) {
>     written += w;
>     continue;
>   }
> 
>   encountered_errors += 1;
>   if (encountered_errors >= 100) {
>     errf("Too many errors while writing out dmesg, aborting\n");
>     break;
>   }
> 
>   // Recoverable errors:
>   if ((errno == EINTR) || (errno == EAGAIN)) continue;
> 
>   // Non-recoverable:
>   errf("Error writing out dmesg (written %ld < %ld bytes): %s\n", written, r, strerror(errno));
>   break;
> }
> 

Good idea but mayb it should start small with jyst reporting
error and bail out? I will drop this patch for now.

Regards,
Kamil

> > +			if (w == -1 && errno == EINTR)
> > +				w = write(outfd, buf, r);
> > +
> > +			if (w < r && w >= 0)
> > +				w += write(outfd, buf + w, r - w);
> > +
> > +			if (w < r) {
> > +				long err = -errno;
> > +
> > +				if (err) {
> > +					errf("Write error while processing dmesg, errno=%d %ld <
> > %ld\n", errno, w, r);
> > +				} else {
> > +					errf("Cannot write dmesg chunk: %ld < %ld\n", w, r);
> > +					err = -1;
> > +				}
> >  
> > +				if (comparefd >= 0)
> > +					close(comparefd);
> > +
> > +				return err;
> > +			}
> > +		}
> > +
> > +		written += r;
> >  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> >  					    &flags, &seq, &usec, &cont) == 4) {
> >  			/*
> 
