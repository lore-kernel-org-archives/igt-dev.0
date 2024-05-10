Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930E6C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 15:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CACA10E5BF;
	Fri, 10 May 2024 15:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UN1wdD1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB8810E5BF
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715356691; x=1746892691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WK8hVW8YxLW+8+P01PhV8VGv0qVxh/Q/azNUgJ2iRH4=;
 b=UN1wdD1LUn83f3Gte+wTKw20sR/qnTxsR29fuQ/Ae+rJd/0VbFWUt5Af
 +qPhxSPnMFcpdkoxJjVCv1QhqT0tNcWSklxa5+rMcdVY2eACURdA2H5mR
 mEXMBIqUh28GHUB9AHAvwazS7oCeG+2NukDO/fbkExHQw3dfxy0s5TpMy
 kpZR6WLIzQTQmFluaiAqR2o+M/xwWTV1m1v2maxUeubOTdcdlu5YB1bjP
 xYEDLK4kkskr2IntS0ON4Jc2O+VcpvByKOVQL7IGMT7C0AhCzy3PSCHt1
 y5mazzY+paRQGgiHQaH5ZwP9SlvZ4N3EURPsdphwaUA6/kVNWgQIhGGz6 g==;
X-CSE-ConnectionGUID: G9YCyHcSQtGbFxseyZuvDg==
X-CSE-MsgGUID: C8sKxjFpRqCK7N5ijZeq6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11206985"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11206985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:58:11 -0700
X-CSE-ConnectionGUID: 9qL8LsdITvavONORXQtfXA==
X-CSE-MsgGUID: xWUkCtx2Rw2Gnqael2KupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29506072"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:58:09 -0700
Date: Fri, 10 May 2024 17:58:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Message-ID: <20240510155805.apesv22vyj35ximn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
References: <20240508193545.2735209-1-jonathan.cavitt@intel.com>
 <20240508193545.2735209-2-jonathan.cavitt@intel.com>
 <20240509162038.czrttaz6eosznh2c@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB54444239130C8918DA7D8037E5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54444239130C8918DA7D8037E5E62@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Cavitt,,
On 2024-05-09 at 16:30:46 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com> 
> Sent: Thursday, May 9, 2024 9:21 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Welty, Brian <brian.welty@intel.com>; Mistat, Tomasz <tomasz.mistat@intel.com>; Girotra, Himanshu <himanshu.girotra@intel.com>
> Subject: Re: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
> > 
> > Hi Jonathan,
> > On 2024-05-08 at 12:35:45 -0700, Jonathan Cavitt wrote:
> > 
> > could you update subject of the patch? Or split it into two
> > patches.
> 
> How does "xe: Check xe_supports_faults for EBUSY" sound?
> 

tests/intel/xe_exec_fault_mode: account for EBUSY in support check

looks ok. If you want to use lib/ something like:

lib/xe/xe_query: return errno from xe_supports_faults check

or some other better description...

> > 
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
> > >  lib/xe/xe_query.c                | 15 ++++++++-------
> > >  lib/xe/xe_query.h                |  2 +-
> > >  tests/intel/xe_exec_fault_mode.c |  9 ++++++++-
> > >  3 files changed, 17 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index 6df8f42649..145dee8142 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -300,27 +300,28 @@ void xe_device_put(int fd)
> > >   * xe_supports_faults:
> > >   * @fd: xe device fd
> > >   *
> > > - * Returns true if xe device @fd allows creating vm in fault mode otherwise
> > > - * false.
> > > + * Returns the return value of the ioctl.  This can either be 0 if the
> > > + * xe device @fd allows creating a vm in fault mode, or an error value
> > > + * if it does not.
> > 
> > It is not consistent with your description above, as you can get
> > non-zero return -EBUSY and after a wait it will return 0.
> > 

Drop my comment from here.

> > >   *
> > >   * NOTE: This function temporarily creates a VM in fault mode. Hence, while
> > >   * this function is executing, no non-fault mode VMs can be created.
> > >   */
> > > -bool xe_supports_faults(int fd)
> > > +int xe_supports_faults(int fd)
> > >  {
> > > -	bool supports_faults;
> > > +	int ret;
> > >  
> > >  	struct drm_xe_vm_create create = {
> > >  		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > >  			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> > >  	};
> > >  
> > > -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > > +	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > >  
> > > -	if (supports_faults)
> > > +	if (!ret)
> > >  		xe_vm_destroy(fd, create.vm_id);
> > >  
> > > -	return supports_faults;
> > > +	return ret;
> > >  }
> > 
> > Above part looks ok.
> > 
> > >  
> > >  static void xe_device_destroy_cache(void)
> > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > > index f91d16bdf5..54115f8f7c 100644
> > > --- a/lib/xe/xe_query.h
> > > +++ b/lib/xe/xe_query.h
> > > @@ -94,7 +94,7 @@ uint64_t xe_visible_available_vram_size(int fd, int gt);
> > >  uint32_t xe_get_default_alignment(int fd);
> > >  uint32_t xe_va_bits(int fd);
> > >  uint16_t xe_dev_id(int fd);
> > > -bool xe_supports_faults(int fd);
> > > +int xe_supports_faults(int fd);
> > >  const char *xe_engine_class_string(uint32_t engine_class);
> > >  bool xe_has_engine_class(int fd, uint16_t engine_class);
> > >  bool xe_has_media_gt(int fd);
> > > diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> > > index 0b3f4cb8de..c1402889d9 100644
> > > --- a/tests/intel/xe_exec_fault_mode.c
> > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > @@ -406,8 +406,15 @@ igt_main
> > >  	int fd;
> > >  
> > >  	igt_fixture {
> > > +		struct timespec tv = {};
> > > +		bool supports_faults;
> > > +		int ret;
> > 
> > Add newline.
> > 
> > >  		fd = drm_open_driver(DRIVER_XE);
> > > -		igt_require(xe_supports_faults(fd));
> > > +		do {
> > > +			ret = xe_supports_faults(fd);
> > > +		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < 10);
> > 
> > Add newline. Btw 10 seconds seems a lot, could you make it
> > lower (2 seconds?) or make it depend on simulation?
> 
> I was under the impression that igt_run_in_simulation was not available
> upstream.  I just checked and this is apparently false.  My bad.  I'll try to
> remember this for the next revision.
> 
> > 
> > > +		supports_faults = !ret;
> > > +		igt_require(supports_faults);
> > 
> > This is also acceptable, I would prefer to fail in case
> > hardware supports faults but test cannot proceed due to
> > some background VM activity.
> > 
> > Regards,
> > Kamil
> 
> Thank you for the revision notes.  I'll get to work on them soon, but I'm currently
> waiting on a reply to some other revision notes before I proceed to make any major
> changes.  I want to make sure everyone is okay with the changes before I proceed.
> -Jonathan Cavitt
> 

No problem, if you could link to lore.kernel.org for discussion
(if there is some in drm/xe) it could help.

Regards,
Kamil

> > 
> > >  	}
> > >  
> > >  	for (const struct section *s = sections; s->name; s++) {
> > > -- 
> > > 2.25.1
> > > 
> > 
