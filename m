Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C969EC47DAF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 13:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6822310E1A2;
	Fri, 19 Jan 2024 13:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BAE10E1A2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705671158; x=1737207158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OtxaBxU4ZQKVk8GUG8fhsZ8B8U8i+eg6fDSHopBg2h0=;
 b=fZGY9ZJeRvB5LGg2CtfNN2NVRwvjcCK2rDlQHxm9xfInt6k9/n3pvKTJ
 p9WrgjS2mHpXpfK1mfHBBkUpsxmlQUYsL/+RlY21y7V0XuwUV+kPkEfVk
 jAWYeX0u/qqO8sNBRTyDf1rnwx6n+1nZbv/CQlPP9k8OF/rR3KRDHslwz
 im8HvDZ3nuKWSN4BRfexf4eaVT5t4FO+cEQRki8Z09fJM7yWMx61CG5RS
 0i8rBBh8iyuj6LdpR4BoOwjT/+eZniVunZ0sth8waFo7Oi3XkfXC2YrTa
 W19cngDM+9ePvCuaI3D2FDMRqfLrbVeoHtFB4CwGlmZvSWxaTx6rFv4kM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="431916136"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="431916136"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 05:32:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1116246409"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1116246409"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 05:32:32 -0800
Date: Fri, 19 Jan 2024 14:32:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
Message-ID: <20240119133229.lmnfwqrkdbo4nahq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
References: <20240109131802.2624834-1-bhanuprakash.modem@intel.com>
 <20240117111256.yb7fs23zrr36xvtl@kamilkon-desk.igk.intel.com>
 <d9621791-8a6e-4cb0-8da3-7d03bf328761@intel.com>
 <CY5PR11MB62118F52982F03F5F42AA42295712@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62118F52982F03F5F42AA42295712@CY5PR11MB6211.namprd11.prod.outlook.com>
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

Hi Gupta,,
On 2024-01-18 at 04:44:59 +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Sent: Wednesday, January 17, 2024 8:52 PM
> > To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-
> > dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.com>
> > Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
> > 
> > Hi Kamil,
> > 
> > On 17-01-2024 04:42 pm, Kamil Konieczny wrote:
> > > Hi Bhanuprakash,
> > > On 2024-01-09 at 18:48:02 +0530, Bhanuprakash Modem wrote:
> > >> Call drm_close_driver() only if fd >=0, otherwise it'll will throw WARN:
> > >>
> > >> (i915_suspend:7563) drmtest-WARNING: Don't attempt to close
> > >> standard/invalid file descriptor: -1
> > >>
> > >> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > >> ---
> > >>   tests/intel/i915_suspend.c | 4 +++-
> > >>   1 file changed, 3 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> > >> index c25805584..82cabfa41 100644
> > >> --- a/tests/intel/i915_suspend.c
> > >> +++ b/tests/intel/i915_suspend.c
> > >> @@ -300,7 +300,9 @@ test_suspend_without_i915(int state)
> > >>   		igt_pm_get_d3cold_allowed(card.pci_slot_name,
> > &d3cold_allowed);
> > >>   		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
> > >>   	}
> > >> -	drm_close_driver(fd);
> > >
> > > imho proper fix would be remove this and
> > > fd=__drm_open_driver(DRIVER_INTEL)
> > > from this function, as function is named:
> > > test_suspend_without_i915
> > 
> > I don't have much expertise in D states. After reading the comments in the
> > subtest "When module is unloaded and s2idle is triggered, PCI core leaves the
> > endpoint in D0 and the bridge in D3 state causing PCIE spec violation and
> > config space is read as 0xFF. Keep the bridge in D0 before module unload to
> > prevent this issue"
> This is not a real time use case, either a system boots with i915 driver or not.
> Removing i915 module and trigger suspend is not a valid use case but we want to test that
> suspend coverage without i915. So we need to disallow d3cold(which will bring the pcie bridge to D0).
> igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
> ***above is applicable tp  discrete card.

So this code should look like:

if (state == SUSPEND_STATE_FREEZE) {
    igt_devices_scan(false);
    if (igt_device_find_first_i915_discrete_card(&card)) {
            fd = __drm_open_driver(DRIVER_INTEL); /* write comment why we need this */
            igt_pm_get_d3cold_allowed(card.pci_slot_name, &d3cold_allowed);
            igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
            drm_close_driver(fd);
    }
}

But this will fix problem on iGPU but still doesn't answer why
__drm_open_driver fails... as in dmesg from fails I see i915
was loaded/unloaded successfully.

Regards,
Kamil

>  
> Thanks,
> Anshuman Gupta  
> > 
> > IMHO, still this patch is a valid fix. Perhaps, we can drop
> > drm_close_driver() and use close().
> > 
> > + Anshuman to comment
> > 
> > - Bhanu
> > 
> > >
> > > we are expecting i915 driver to be _unloaded_.
> > >
> > > Regards,
> > > Kamil
> > >
> > >> +
> > >> +	if (fd >= 0)
> > >> +		drm_close_driver(fd);
> > >>
> > >>   	igt_kmsg(KMSG_INFO "Unloading i915\n");
> > >>   	igt_assert_eq(igt_i915_driver_unload(),0);
> > >> --
> > >> 2.40.0
> > >>
