Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69B7EBFD20
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 09:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC0310E3A1;
	Mon, 13 Apr 2026 09:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3ZEAl3h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02D610E3A1
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 09:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072650; x=1807608650;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=UyUSB/FWpqLxvniVFJW++9TpWWJhfIimBvaVMjZePuQ=;
 b=b3ZEAl3hXigwaqGLn9npobkT5YgLzXZneKiUbeXlEAa9zpB7AUhzWXYz
 Fg+wAdwyGjuVxB/ny/Ks+Pj8hCFIgiCj48OYoJPcUbY0SqJsbN2bgbRqv
 3yLWAUt+gw/ukUn5KdY+mNTfdLedA7SHqYbtWjWleRwKH2twxgVMI9l2+
 oxKjuzDjS4b7Iwi42DWPnMGkbL2aSW3I6hbTmV48KdHbZGfI6ZHAgfB5M
 ltC13bbkGeTrKzZVJxOe5LszALPzLV9WWR4CKf2/fIWBXNazcjztoKnF0
 81RyMcYj2eAp4jusJojsy+57/BkshYPh/6dV71maZOieGFMF/4BjOIs77 g==;
X-CSE-ConnectionGUID: fJ9fA6DkQEWiI2lM7D3YSQ==
X-CSE-MsgGUID: nFfFXFdwQoq8+zDjXVQaTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88452118"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="88452118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:30:50 -0700
X-CSE-ConnectionGUID: CrXiabiXScm9KIeqI4B/xw==
X-CSE-MsgGUID: fszGwDsWQ+C0LBPxaNT6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="253132588"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:30:48 -0700
Date: Mon, 13 Apr 2026 11:30:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org,
 peter.senna@linux.intel.com, piotr.rudnicki@intel.com
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
Message-ID: <rfxpi6tguujexu5jftvpcaud6rsphwxql5gtdhxaq7qjm4genj@qdmja7vccurc>
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
 <ucockssbabmd3orxmsridophyscseb2jb4pzabpvhevstsprzn@32xk2sugvgue>
 <20260410140947.b5wuqidzf2b4x4td@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410140947.b5wuqidzf2b4x4td@kamilkon-DESK.igk.intel.com>
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

On Fri, Apr 10, 2026 at 04:09:47PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2026-03-26 at 16:39:03 +0100, Zbigniew Kempczyński wrote:
> > On Wed, Mar 25, 2026 at 12:49:01PM +0100, Jan Sokolowski wrote:
> > > It was found while running tests that if a test launches threads with
> > > even more subthreads, some igt_debug calls might not print their lines.
> > > 
> > > Fflush after each line to make sure we see everything we want to see.
> > > 
> > > Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> > > ---
> > >  lib/igt_core.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index 65325f08d..ed4f48d86 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> > >  	pthread_mutex_lock(&print_mutex);
> > >  
> > >  	/* use stderr for warning messages and above */
> > > -	if (level >= IGT_LOG_WARN) {
> > > +	if (level >= IGT_LOG_WARN)
> > >  		file = stderr;
> > > -		fflush(stdout);
> > > -	}
> > >  	else
> > >  		file = stdout;
> > >  
> > > @@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> > >  		_log_line_fprintf(file, "%s%s", thread_id, line);
> > >  	}
> > >  
> > > +	/* Ensure output is flushed explicitly, as concurrent test threads
> > > +	 * may otherwise cause messages to be dropped or reordered.
> > > +	 */
> > > +	fflush(file);
> > 
> > stderr is not buffered, so I bet this is no-op call.
> > fflush(stdout) is imo enough here. But I agree, fflush on the end
> > on stdout of this critical section is better.
> > 
> > With or without nit addressed:
> > 
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > 
> > --
> > Zbigniew
> > 
> 
> This is not needed for igt_runner test runs, as runner sends
> both outputs via socket. It could help a developer running
> test on his/her machine, so maybe add a global var check here
> and call it only in that scenario?

if (!runner_connected())
	fflush(file);

would be enough?

--
Zbigniew

> 
> Regards,
> Kamil
> 
> > > +
> > >  	pthread_mutex_unlock(&print_mutex);
> > >  
> > >  out:
> > > -- 
> > > 2.43.0
> > > 
