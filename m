Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F318DD462BF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 15:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2346210E0BE;
	Wed, 13 Nov 2024 15:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh4EkWcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D559310E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731510942; x=1763046942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9TPSJW/CqnmQfr7ZDxfwzhAVD9CDCoFciUvW0MfYWbY=;
 b=Qh4EkWcbNYXrDG+F7FXkDnE2t1o8n01jahKJ4IDXR736XCon1GQ2GVAJ
 oQYbxGyYnKVeTOHxuSgburRZRl/Rx3UMq0x/3Wz2KwpQ5AokxN6zoMc9u
 dH3SYcKxso+2l3YqjEsmpjFWbkds7Nwgfvs7XVuB/ZCxv+IU3klWGPB0k
 CJj/E3LHpwiuj2FjCuQiKnJlgM2z6phKnF2DTBvaYWPkl9HqcjWnlVvPU
 BQczwXBJrTVjZD//o6bHKVdjOVRbGRop/hBIdmu2XwsHB0HcgW4nt7Mok
 FbFeXLaqUPcjjaGORMJwu7DOLzLnNUuPntBs4H9gnTbd8j5jMLHqZJDdc w==;
X-CSE-ConnectionGUID: l5qvQcWATw2MPYNdeSJWww==
X-CSE-MsgGUID: uS7jF2vaSYOJNjiIWOd2UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31580136"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31580136"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 07:15:42 -0800
X-CSE-ConnectionGUID: KzQmZ7UjSGi+1JUI5XEK+g==
X-CSE-MsgGUID: 0CKsmglgSvaMn6S3PKOhkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="88065890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 07:15:42 -0800
Date: Wed, 13 Nov 2024 16:15:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t 1/2] runner/executor: Check for error at writing
 dmesg dump
Message-ID: <20241113151539.i2or7hqmwtp7zcnd@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>
References: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
 <20241018161820.76014-2-kamil.konieczny@linux.intel.com>
 <wfetyjmy34erijop7ffm5ywke7hx5q3i4za46u7m6xljry6iza@acdponikqdlx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wfetyjmy34erijop7ffm5ywke7hx5q3i4za46u7m6xljry6iza@acdponikqdlx>
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
On 2024-10-24 at 13:45:48 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> I looked through the change and found only one thing that could be
> added, the rest looks good to me.
> 
> On 2024-10-18 at 18:18:19 +0200, Kamil Konieczny wrote:
> > In processing kernel dmesg there are checks for error at reading
> > so add also one for writing.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index ac73e1dde..3939f92f1 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  	bool underflow_once = false;
> >  	char cont;
> >  	char buf[2048];
> > -	ssize_t r;
> > +	ssize_t r, w;
> >  	long written = 0;
> >  
> >  	if (kmsgfd < 0)
> > @@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
> >  			return written;
> >  		}
> >  
> > -		write(outfd, buf, r);
> > -		written += r;
> > +		w = write(outfd, buf, r);
> > +		if (w < r) {
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
> > +					errf("Write error while processing dmesg, errno=%d\n", errno);
> You could include `w` and `r` values into this log as well.

Done.

Regards,
Kamil

> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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
> >  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> >  					    &flags, &seq, &usec, &cont) == 4) {
> >  			/*
> > -- 
> > 2.47.0
> > 
> 
> Best Regards,
> Krzysztof K
