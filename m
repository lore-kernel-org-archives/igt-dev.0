Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECA2C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 17:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0943310E3B4;
	Wed,  8 May 2024 17:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV08cWQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0210E411
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715188375; x=1746724375;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tb/fXxjdfxgrXsCKqaW9VfUU/EDvNFlbP2MrbS3iZ74=;
 b=OV08cWQI4Q8TNCKt/gWbXvmYnvECSrtjGyGflPqJ9gLQ5yen3ackB1mh
 nxxh5xrQs8JQ0/jF4ewJfcGDNNwz8X3mFfFIlcR9/Xo1rjGCagdzFqOBB
 veHY6Qpu5RIq/eT+eRicHPkMGkeJAVlpgKikIt5p6xBMrnZWzFx5woOqk
 YyXgGGHe8YYanLmE8/hjE9U0eI70hm9pjahnEuQY0WTvdAvkEtGRBGlIg
 c4Vt2BvgurJMYPbWBC1dRI6Ahe8XmFg4ZaZrjmY8SB4zX1ls9By1FBIND
 HQq0iYeWMo3kOU5BQVbaPmxL6t+Bh8VxlA+XrdtSGj5HbMJ0wlgV/+C6D A==;
X-CSE-ConnectionGUID: s/VUA+B4TYSLTmqttsno+w==
X-CSE-MsgGUID: q1JA37SlT4+ZBDI0IcYIRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14875138"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="14875138"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 10:11:32 -0700
X-CSE-ConnectionGUID: U13VVXJFT2SRdMCTttPunw==
X-CSE-MsgGUID: ijbZGno9TGyGDzbz/OucMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33649067"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:11:31 -0700
Date: Wed, 8 May 2024 19:11:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Message-ID: <20240508171127.cjl3ty7vra5fsszj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
 <20240503193714.1967850-2-jonathan.cavitt@intel.com>
 <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB5444E8304D0EF667EB79DBC9E5E52@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444E8304D0EF667EB79DBC9E5E52@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi,
On 2024-05-08 at 16:43:04 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Wednesday, May 8, 2024 9:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Welty, Brian <brian.welty@intel.com>; Mistat, Tomasz <tomasz.mistat@intel.com>; Girotra, Himanshu <himanshu.girotra@intel.com>
> Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
> > 
> > Hi Jonathan,
> > On 2024-05-03 at 12:37:14 -0700, Jonathan Cavitt wrote:
> > > It's possible for xe_supports_faults to return false if the system is
> > > busy with multiple running tests.  This is because the check looks for
> > > all active VMs and searches for VMs that do not have faults enabled,
> > > returning false if any exist.  Recently, this check has been changed to
> > > return EBUSY when the check fails in this way, so wait for up to ten
> > > seconds for all the active VMs to flush out before proceeding.
> > > 
> > > Suggested-by: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >  lib/xe/xe_query.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index 6df8f42649..5458c73417 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -314,8 +314,13 @@ bool xe_supports_faults(int fd)
> > >  		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > >  			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> > >  	};
> > > -
> > > -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > > +	struct timespec tv = {};
> > > +	int result, timeout;
> > > +	do {
> > > +		result = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > > +		supports_faults = !result;
> > > +		timeout = igt_seconds_elapsed(&tv);
> > > +	} while (result == -EBUSY && timeout < 10);
> > -------------------------------- ^^^^^^^^^^^^
> > 
> > Waiting any number of seconds in library function is way too much,
> > imho this is ok in test itself, not on lib.
> 
> Is the suggestion here that we should perform the wait "on" xe_supports_faults,
> rather than "in" xe_supports_faults?  I.E. that we do something like this instead
> in xe_exec_fault_mode.c:
> 
>         igt_fixture {
>                 bool supports_faults;
>                 struct timespec tv = {};
>                 fd = drm_open_driver(DRIVER_XE);
>                 do {
>                         supports_faults = xe_supports_faults(fd);
>                 } while (!supports_faults && igt_seconds_elapsed(&tv) < 10);
>                 igt_require(supports_faults);
>         }
> 
> I can do this, though if xe_supports_faults returns false for any non-EBUSY related
> reasons, we won't be able to detect it from here and we'll spend ten seconds waiting
> for xe_supports_faults to return true when it strictly cannot.  Is this an acceptable
> tradeoff?
> -Jonathan Cavitt
> 

If you are doing this just after igt_main you do not expect
it will return EBUSY. Other way would be to return errno from
lib function and let subtest decide if it want to wait.
There you could also account for simulation, where it can
take longer. Btw is there any sysfs param for it?

Regards,
Kamil

> > 
> > Regards,
> > Kamil
> > 
> > >  
> > >  	if (supports_faults)
> > >  		xe_vm_destroy(fd, create.vm_id);
> > > -- 
> > > 2.25.1
> > > 
> > 
