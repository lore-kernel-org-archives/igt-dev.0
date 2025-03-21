Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F52C35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 10:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621410E76F;
	Fri, 21 Mar 2025 10:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmAuo3BD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1C10E76F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742551665; x=1774087665;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=l5QsGlFnD5V7XmMP+d78RgVttvfxLpJQwJtVq8Pd4bE=;
 b=BmAuo3BDErZRvtQ8Dy9YbSVM9rU52+eexLRlTkaP3h7bQO45wo89diBK
 T53gs9l0PXkomvr1bR9Geq+arfK/8ljHBzgcLKxDaY/1y7ns42+YFRPz1
 EyIB6mjPpalwUVw1wir/sdDMy6SvKKoJauFQwz8ztM0Yx9ELCXW6VJ6mn
 OGwoDxVnFplMDKRj4neV3w0rnZybIbepu8b+E2ckSos1ju4HrSb+Nx8do
 +59GI719y9eIp9s3W/ZLoJuaDGpMvwYo7aZefusSLEWTFYFvSLG2L3+iM
 a3PLNixPbK6I7yUPy6VfW23IzgqFbAkI0sCLymjyUZz8KxO4SLmSDZ/Gl w==;
X-CSE-ConnectionGUID: VuAmbTmeTPK4kTgFI3RI2A==
X-CSE-MsgGUID: k9zkdMzPR5yFgSxiAzcyaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43739043"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43739043"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:07:40 -0700
X-CSE-ConnectionGUID: LpGomxpyTui2AnxLZU8IiQ==
X-CSE-MsgGUID: xPPRFE1EStGjsia2AWZr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128416872"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:07:38 -0700
Date: Fri, 21 Mar 2025 11:07:34 +0100
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_core: capture logs for child processes
Message-ID: <20250321100734.2wknvctzt2i33rfx@pawelsik-desk>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
 <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
 <20250317163907.lrhtwmbakoq3m65k@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317163907.lrhtwmbakoq3m65k@kamilkon-desk.igk.intel.com>
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

On Mon, Mar 17, 2025 at 05:39:07PM +0100, Kamil Konieczny wrote:
> Hi Pawel,
> On 2025-03-13 at 13:50:04 +0100, Pawel Sikora wrote:
> > This change addresses the issue of missing logs for child
> > processes in the IGT runner.
> > 
> > The '_igt_log_buffer_dump()' function is now called before
> > exiting child processes, ensuring that logs are properly
> > captured and not lost when IGT fails and child processes
> > dump logs before exiting.
> > 
> > Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>
> > ---
> >  lib/igt_core.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 9702a9417..33e5ca7cd 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -1905,12 +1905,11 @@ void igt_fail(int exitcode)
> >  		failed_one = true;
> >  	}
> >  
> > -	/* Silent exit, parent will do the yelling. */
> > +	_igt_log_buffer_dump();
> > +
> 
> Can it be a conditional? As I remember this was a problem with
> logs line interleaving one with another and it was solved by
> igt_runner using comms, so I propose to use this only when comms
> are active, see 8a3dc4020 lib/igt_core: Send logs to runner with comms
> 
> For example:
> 	/* If igt_runner uses comms it could grab each childs logs
> 	 * without them interleaving in stdout/stderr.
> 	 */
> 	has_comms = runner_connected();
> 	if (has_comms)
> 		_igt_log_buffer_dump();
> 
>   	if (test_child)
>   		exit(exitcode);
> 
> 	if (!has_comms)
> 		_igt_log_buffer_dump();
> 
> This will fix it for igt_runner with comms, leaving old behaviour
> when no comms were used.
> This is suggestion, if you do not like it at least add a comment
> why was it added there.
> 
> Also I add Petri to Cc.
> 

Seems fine to me. Will check it and add in v2.

Regards,
Pawel

> Regards,
> Kamil
> 
> >  	if (test_child)
> >  		exit(exitcode);
> >  
> > -	_igt_log_buffer_dump();
> > -
> >  	if (test_multi_fork_child)
> >  		exit(exitcode);
> >  
> > -- 
> > 2.34.1
> > 
