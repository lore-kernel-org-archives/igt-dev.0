Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB59F44872
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 14:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86010E965;
	Fri, 10 Apr 2026 14:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrWOqoOO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354410E965
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775830192; x=1807366192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JTSxaxT1QERPPfDm5QsCEKYV8nT4UgYNPAnpwJ9FLhg=;
 b=UrWOqoOOuL+Zi4p6KIPly/Ft9exUvUMFcZowsNHRxsFUcuGkXwSyvx06
 eiucHnRR5bPlHk3B+h6o8npP8HUJ13r4j27ibLi+68L0Z0+NKwOOaAP8v
 UsrDVqV6vU5oi7O59ybAvZKkfWMQi2iIiYrUKE87wZ/GPG7iaek+Rek64
 A6QNbxst6xE6l9ACumr3xNqXbfEm/hF59bUIakFQc4e7diRxXvlXJxuio
 jFRnWvqHBHUQlTtLaqLgRn0x8Yryi57PkWaAbfWIwUwt84IvSMnBQ2n01
 AMByjRKc0+smnNQxnA5xTw9KyryYFQwi51SGXiAPxiMmNAfQ4UOdr22JG A==;
X-CSE-ConnectionGUID: 2qk04UaNTz21r3mGOok/ew==
X-CSE-MsgGUID: B/y1EHRmQXOKxsDchAiccw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99486832"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="99486832"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 07:09:51 -0700
X-CSE-ConnectionGUID: MqFGwP+QQjuvPixM77/uHg==
X-CSE-MsgGUID: 1k9qSrCgQEiZtgXG3zMAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229014680"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:09:50 -0700
Date: Fri, 10 Apr 2026 16:09:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com
Subject: Re: [PATCH i-g-t v1 1/1] lib/igt_core: flush output on each line
Message-ID: <20260410140947.b5wuqidzf2b4x4td@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
 <ucockssbabmd3orxmsridophyscseb2jb4pzabpvhevstsprzn@32xk2sugvgue>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ucockssbabmd3orxmsridophyscseb2jb4pzabpvhevstsprzn@32xk2sugvgue>
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

Hi Zbigniew,
On 2026-03-26 at 16:39:03 +0100, Zbigniew Kempczyński wrote:
> On Wed, Mar 25, 2026 at 12:49:01PM +0100, Jan Sokolowski wrote:
> > It was found while running tests that if a test launches threads with
> > even more subthreads, some igt_debug calls might not print their lines.
> > 
> > Fflush after each line to make sure we see everything we want to see.
> > 
> > Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> > ---
> >  lib/igt_core.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 65325f08d..ed4f48d86 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -3294,10 +3294,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> >  	pthread_mutex_lock(&print_mutex);
> >  
> >  	/* use stderr for warning messages and above */
> > -	if (level >= IGT_LOG_WARN) {
> > +	if (level >= IGT_LOG_WARN)
> >  		file = stderr;
> > -		fflush(stdout);
> > -	}
> >  	else
> >  		file = stdout;
> >  
> > @@ -3309,6 +3307,11 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
> >  		_log_line_fprintf(file, "%s%s", thread_id, line);
> >  	}
> >  
> > +	/* Ensure output is flushed explicitly, as concurrent test threads
> > +	 * may otherwise cause messages to be dropped or reordered.
> > +	 */
> > +	fflush(file);
> 
> stderr is not buffered, so I bet this is no-op call.
> fflush(stdout) is imo enough here. But I agree, fflush on the end
> on stdout of this critical section is better.
> 
> With or without nit addressed:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 

This is not needed for igt_runner test runs, as runner sends
both outputs via socket. It could help a developer running
test on his/her machine, so maybe add a global var check here
and call it only in that scenario?

Regards,
Kamil

> > +
> >  	pthread_mutex_unlock(&print_mutex);
> >  
> >  out:
> > -- 
> > 2.43.0
> > 
