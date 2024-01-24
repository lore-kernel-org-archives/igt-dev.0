Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13363C47E49
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 12:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CD410E6E4;
	Wed, 24 Jan 2024 12:46:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E88010E6E4
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706100370; x=1737636370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fIwua/Re+3MmKqltoEmt3HBumszteoJ4cpV+ws0ozr8=;
 b=PbQmU1uC3fklfTyaChD6XtDclJpV9jj9TF8Vegur5QdrL00xahQUboSw
 aqe4NF2YrR+e4c5VfQXeKasStr9Xe4/r2a8HUI1DUUsaf73pPFGQCMglF
 UNLnmiTbHiqT+OCJbhQLtUPb5Er4F0l1haU/N0hrcfJdauEAl2Ro5qylj
 OSTL11sI21GV7auxt6EcjEswBj+ugSoyCdg+Ymn0PfuTuDMwDA23RrCLC
 AToqlSDrEkaed9ylX5O0BT1QN4htpCm0aqxLiHlVc8ts+WjRFQS3ijKe4
 7Fekm/mTVrKLB3rHDjAO4mDUZJYTZjewrtoac/TYpRON0wpPlG8vK/FP7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15356631"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15356631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 04:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1870475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:46:09 -0800
Date: Wed, 24 Jan 2024 13:45:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
Message-ID: <20240124124549.7bozrko5gjtrrqqm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20240109131802.2624834-1-bhanuprakash.modem@intel.com>
 <20240117111256.yb7fs23zrr36xvtl@kamilkon-desk.igk.intel.com>
 <d9621791-8a6e-4cb0-8da3-7d03bf328761@intel.com>
 <CY5PR11MB62118F52982F03F5F42AA42295712@CY5PR11MB6211.namprd11.prod.outlook.com>
 <20240119133229.lmnfwqrkdbo4nahq@kamilkon-desk.igk.intel.com>
 <e736cb2e-7f86-4da1-bc0b-6ab3e01b1cca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e736cb2e-7f86-4da1-bc0b-6ab3e01b1cca@intel.com>
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

Hi Modem,,
On 2024-01-24 at 13:46:20 +0530, Modem, Bhanuprakash wrote:
> Hi Kamil/Anshuman,
> 
> On 19-01-2024 07:02 pm, Kamil Konieczny wrote:
> > Hi Gupta,,
> > On 2024-01-18 at 04:44:59 +0000, Gupta, Anshuman wrote:
> > > 
> > > 
> > > > -----Original Message-----
> > > > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > > > Sent: Wednesday, January 17, 2024 8:52 PM
> > > > To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-
> > > > dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.com>
> > > > Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
> > > > 
> > > > Hi Kamil,
> > > > 
> > > > On 17-01-2024 04:42 pm, Kamil Konieczny wrote:
> > > > > Hi Bhanuprakash,
> > > > > On 2024-01-09 at 18:48:02 +0530, Bhanuprakash Modem wrote:
> > > > > > Call drm_close_driver() only if fd >=0, otherwise it'll will throw WARN:
> > > > > > 
> > > > > > (i915_suspend:7563) drmtest-WARNING: Don't attempt to close
> > > > > > standard/invalid file descriptor: -1
> > > > > > 
> > > > > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > > > > ---
> > > > > >    tests/intel/i915_suspend.c | 4 +++-
> > > > > >    1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> > > > > > index c25805584..82cabfa41 100644
> > > > > > --- a/tests/intel/i915_suspend.c
> > > > > > +++ b/tests/intel/i915_suspend.c
> > > > > > @@ -300,7 +300,9 @@ test_suspend_without_i915(int state)
> > > > > >    		igt_pm_get_d3cold_allowed(card.pci_slot_name,
> > > > &d3cold_allowed);
> > > > > >    		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
> > > > > >    	}
> > > > > > -	drm_close_driver(fd);
> > > > > 
> > > > > imho proper fix would be remove this and
> > > > > fd=__drm_open_driver(DRIVER_INTEL)
> > > > > from this function, as function is named:
> > > > > test_suspend_without_i915
> > > > 
> > > > I don't have much expertise in D states. After reading the comments in the
> > > > subtest "When module is unloaded and s2idle is triggered, PCI core leaves the
> > > > endpoint in D0 and the bridge in D3 state causing PCIE spec violation and
> > > > config space is read as 0xFF. Keep the bridge in D0 before module unload to
> > > > prevent this issue"
> > > This is not a real time use case, either a system boots with i915 driver or not.
> > > Removing i915 module and trigger suspend is not a valid use case but we want to test that
> > > suspend coverage without i915. So we need to disallow d3cold(which will bring the pcie bridge to D0).
> > > igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
> > > ***above is applicable tp  discrete card.
> > 
> > So this code should look like:
> > 
> > if (state == SUSPEND_STATE_FREEZE) {
> >      igt_devices_scan(false);
> >      if (igt_device_find_first_i915_discrete_card(&card)) {
> >              fd = __drm_open_driver(DRIVER_INTEL); /* write comment why we need this */

Or something like: if(!module_loaded(DRIVER_INTEL))
                    module_load();

> >              igt_pm_get_d3cold_allowed(card.pci_slot_name, &d3cold_allowed);
> >              igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
> >              drm_close_driver(fd);
> >      }
> > }
> > 
> > But this will fix problem on iGPU but still doesn't answer why
> > __drm_open_driver fails... as in dmesg from fails I see i915
> > was loaded/unloaded successfully.
> 
> I think, we can fix this as a separate activity. Meanwhile, shall we merge
> this patch?
> 
> - Bhanu
> 

Yes, we can discuss that later, you can add my r-b to your
original solution,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> > 
> > Regards,
> > Kamil
> > 
> > > Thanks,
> > > Anshuman Gupta
> > > > 
> > > > IMHO, still this patch is a valid fix. Perhaps, we can drop
> > > > drm_close_driver() and use close().
> > > > 
> > > > + Anshuman to comment
> > > > 
> > > > - Bhanu
> > > > 
> > > > > 
> > > > > we are expecting i915 driver to be _unloaded_.
> > > > > 
> > > > > Regards,
> > > > > Kamil
> > > > > 
> > > > > > +
> > > > > > +	if (fd >= 0)
> > > > > > +		drm_close_driver(fd);
> > > > > > 
> > > > > >    	igt_kmsg(KMSG_INFO "Unloading i915\n");
> > > > > >    	igt_assert_eq(igt_i915_driver_unload(),0);
> > > > > > --
> > > > > > 2.40.0
> > > > > > 
