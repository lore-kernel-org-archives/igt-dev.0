Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B849FC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 11:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573CE10E247;
	Mon, 24 Mar 2025 11:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4jvyTRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7018210E247
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742814318; x=1774350318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RfJr2oXA9cWYP+f59xrdoPJcvjjoiKbgBQMpf3h7RW4=;
 b=h4jvyTRIeWAS3LyY4O7/HoY4+zLgjkgIN0bGXuIvorKfyYSnueYH9VEk
 bN1ygInvI48MoTZLFzN3Y1vDVgvQn4Xr4kwwfPE332hcGheqvKtLcGZR3
 aBR/RL/GI14U/kG4O+PRE24xRujt+gzVPukPe5hHvOyGQ997scIUu7m6N
 XNI8mFl00VNPKW49jW+AhhMOX+hiea2dSlHRf11kgNBrxOCqEO0+1QoVx
 Jbc2781Xtk9UmfJvHYXzVr/ZrlgygGfmcYOQHwdzxK7/vn9hDfHoMyHN/
 SsFuIpfHwza9HkJTtPxWDIHeANQJlvKhUm3chinhnuKtIw9Ve/rdKjbAM g==;
X-CSE-ConnectionGUID: m2Y9xYtHQ46AG2qvrWjo5A==
X-CSE-MsgGUID: NUIYT8K8QuuFYeiDDikUIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47886237"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="47886237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 04:05:18 -0700
X-CSE-ConnectionGUID: X2987mbAQMSg7L1NMBxbpg==
X-CSE-MsgGUID: KMt/gbJ0SgWbG9uaJ/BZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="154919187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 04:05:17 -0700
Date: Mon, 24 Mar 2025 12:05:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/igt_core: capture logs for child processes
Message-ID: <20250324110505.xazxmlowyvlnvquc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
 <20250313125004.3881354-2-pawel.sikora@linux.intel.com>
 <20250317163907.lrhtwmbakoq3m65k@kamilkon-desk.igk.intel.com>
 <20250321100734.2wknvctzt2i33rfx@pawelsik-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321100734.2wknvctzt2i33rfx@pawelsik-desk>
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

Hi Pawel,
On 2025-03-21 at 11:07:34 +0100, Pawel Sikora wrote:
> On Mon, Mar 17, 2025 at 05:39:07PM +0100, Kamil Konieczny wrote:
> > Hi Pawel,
> > On 2025-03-13 at 13:50:04 +0100, Pawel Sikora wrote:
> > > This change addresses the issue of missing logs for child
> > > processes in the IGT runner.
> > > 
> > > The '_igt_log_buffer_dump()' function is now called before
> > > exiting child processes, ensuring that logs are properly
> > > captured and not lost when IGT fails and child processes
> > > dump logs before exiting.
> > > 
> > > Signed-off-by: Pawel Sikora <pawel.sikora@linux.intel.com>

After offline discussion I decided to merge this v1 with Closes
and r-b from Zbigniew. Thank you all for spotting this bug and
for fixing this.

Regards,
Kamil

> > > ---
> > >  lib/igt_core.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index 9702a9417..33e5ca7cd 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -1905,12 +1905,11 @@ void igt_fail(int exitcode)
> > >  		failed_one = true;
> > >  	}
> > >  
> > > -	/* Silent exit, parent will do the yelling. */
> > > +	_igt_log_buffer_dump();
> > > +
> > 
> > Can it be a conditional? As I remember this was a problem with
> > logs line interleaving one with another and it was solved by
> > igt_runner using comms, so I propose to use this only when comms
> > are active, see 8a3dc4020 lib/igt_core: Send logs to runner with comms
> > 
> > For example:
> > 	/* If igt_runner uses comms it could grab each childs logs
> > 	 * without them interleaving in stdout/stderr.
> > 	 */
> > 	has_comms = runner_connected();
> > 	if (has_comms)
> > 		_igt_log_buffer_dump();
> > 
> >   	if (test_child)
> >   		exit(exitcode);
> > 
> > 	if (!has_comms)
> > 		_igt_log_buffer_dump();
> > 
> > This will fix it for igt_runner with comms, leaving old behaviour
> > when no comms were used.
> > This is suggestion, if you do not like it at least add a comment
> > why was it added there.
> > 
> > Also I add Petri to Cc.
> > 
> 
> Seems fine to me. Will check it and add in v2.
> 
> Regards,
> Pawel
> 
> > Regards,
> > Kamil
> > 
> > >  	if (test_child)
> > >  		exit(exitcode);
> > >  
> > > -	_igt_log_buffer_dump();
> > > -
> > >  	if (test_multi_fork_child)
> > >  		exit(exitcode);
> > >  
> > > -- 
> > > 2.34.1
> > > 
