Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB0FC52D70
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 12:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4AF10E0C6;
	Tue,  6 Aug 2024 12:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IM0CG/Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6510E0C6
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722948634; x=1754484634;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0No2yv+QlSL3Wzglycsos6dGrKSzsqdBI8o3LNgHYCQ=;
 b=IM0CG/Y6zRTyr4LBz5OPddYciV+d0HZAfn+JJk5keojEc8EHP5yI/ZUo
 5rqYFaYsXjJZ6d6l51FLD1rMe+YGr7tdJYvJz/8+bGsVQCx2henl7ChNV
 oEX0IqBx3sSIl/ihDuzP7Um1LeLpUA2uglDGkNdMzUWLjMlMcbkmUpOy2
 PFIAIaRQrxpFtoqyLwUKQA0HedWnX8BcuWi1404fm+DKzXlQBdyEyOs09
 +ruTsZnWeqlrSdMStTv5meiDDCAysoiHU2rEY7udWImLXuZwWD9zY6x6r
 bNtUQqonb9Ee7dQW2j83nw3iKjGhUp2m5/7a9EnxKwBnVsr//iNV/dguS A==;
X-CSE-ConnectionGUID: PoZhcWFkQAimpdVChwwuCg==
X-CSE-MsgGUID: C8yviVXGRvKzS20UjHP+aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21140967"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="21140967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 05:50:33 -0700
X-CSE-ConnectionGUID: Z0ub8aVAQJezkAhSMb7u6Q==
X-CSE-MsgGUID: X+go+2mIS+uyuvezccG2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="79760976"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 05:50:31 -0700
Date: Tue, 6 Aug 2024 14:50:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
Message-ID: <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
 <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
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

Hi Sundaresan,,
On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
> 
> On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
> > Hi Sujaritha,
> > On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
> > 
> > small nit about subject, you wrote:
> > 
> > [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display
> > 
> > imho this should be:
> > 
> > [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display
> > 
> > More nits below.
> 
> Hey Kamil,
> 
> Sure this change I can make.
> 
> > 
> > > Add tests to validate basic execution suspend/resume cycle
> > > without display module to rule out display related issues
> > > from the suspend/resume stack.
> > > 
> > > v2: Add normal reload cycle after running test (Anshuman)
> > > 
> > > v3: Rebase
> > > 
> > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >   tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 34 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > > index 8b115e2f6..03f742265 100644
> > > --- a/tests/intel/xe_pm.c
> > > +++ b/tests/intel/xe_pm.c
> > > @@ -17,6 +17,7 @@
> > >   #include "igt.h"
> > >   #include "lib/igt_device.h"
> > > +#include "lib/igt_kmod.h"
> > >   #include "lib/igt_pm.h"
> > >   #include "lib/igt_sysfs.h"
> > >   #include "lib/igt_syncobj.h"
> > > @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
> > >    * Description: suspend/autoresume on %arg[1] state and exec after RPM
> > >    * Functionality: pm - %arg[1]
> > >    *
> > > + * SUBTEST: %s-without-display
> > > + * Description: suspend/autoresume on %arg[1] state without display
> > > + * Functionality: pm - %arg[1]
> > I see you copy-pasted it but imho both Description and
> > Functionality documentation fields should be static, here and
> > in other places.
> > +cc Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > 
> > > + *
> > >    * arg[1]:
> > >    *
> > >    * @s2idle:	s2idle
> > > @@ -681,6 +686,7 @@ igt_main
> > >   	struct drm_xe_engine_class_instance *hwe;
> > >   	device_t device;
> > >   	uint32_t d3cold_allowed;
> > > +	const char *opts;
> > >   	int sysfs_fd;
> > >   	const struct s_state {
> > > @@ -757,6 +763,34 @@ igt_main
> > >   					  NO_RPM, 0);
> > >   		}
> > > +		igt_subtest_f("%s-without-display", s->name) {
> > > +
> > > +			if (!drmModeGetResources(device.fd_xe))
> > > +				return;
> > Why 'return' here?! Imho this should be checked in fixture
> > or be a skip. Or other way around - what about a headless board
> > or one without any connected display?
> > 
> > Regards,
> > Kamil
> 
> I think this patch idea sort stemmed from the cases where we have a display
> connected and
> 
> want to make sure that the suspend/resume issues are not being caused by the
> display.
> 
> But would you suggest expanding the test to have the headless/no display
> situations? If so what changes are you suggesting for that ?
> 
> Thanks,
> 
> Suja
> 

I would suggest turn this into a igt_skip_on_f(), not a return.

Regards,
Kamil

> > 
> > > +
> > > +			xe_for_each_engine(device.fd_xe, hwe) {
> > > +
> > > +				igt_debug("Reload w/o display\n");
> > > +
> > > +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> > > +				igt_assert_eq(igt_xe_driver_unload(), 0);
> > > +
> > > +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
> > > +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
> > > +
> > > +				test_exec(device, hwe, 1, 2, s->state,
> > > +					  NO_RPM, 0);
> > > +
> > > +				igt_debug("Reload as normal\n");
> > > +
> > > +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> > > +				igt_assert_eq(igt_xe_driver_unload(), 0);
> > > +
> > > +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
> > > +				igt_assert_eq(igt_xe_driver_load(opts), 0);
> > > +			}
> > > +		}
> > > +
> > >   		for (const struct vm_op *op = vm_op; op->name; op++) {
> > >   			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> > >   				xe_for_each_engine(device.fd_xe, hwe)
> > > -- 
> > > 2.34.1
> > > 
