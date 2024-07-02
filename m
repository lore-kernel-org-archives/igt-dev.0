Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F42CC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 16:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83AC10E101;
	Tue,  2 Jul 2024 16:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHygZFBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA8A10E09E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719939286; x=1751475286;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oJ5QASWQQ2QoxGMH9sxt53pPwSsiC05bRlCH/7x27ww=;
 b=mHygZFBo81rugGD8MZYrKCQLceLRX5/BQYP+LY+ERP2RfqYluUXW3QnS
 /IhP3dwtcTlq6zXlL6p0u33SnuUCG1DuYl8eDXIh2Vb4jtwtIGzNf8Msm
 o+D0C8x8+28EaNzbJCOZWy89TBpRad4gUbhEuumhmGeP8uVtRrw+CV+yv
 B4JTBhK6AAH/Q3H7pzx6jiQVT5L1SQXO3s0fRsM6jLdv4Zmaulf5X3dhg
 0t5mstBlzMyQbHShkdCAAwLprn7DRRSc7eVqk905IyhcQGb4OfUBcItA+
 wmLVWGOIDkoj+uZHO1pWL4rPOfKLJcKqq51fBMtk0f8Zj5bsk71mbc0S0 A==;
X-CSE-ConnectionGUID: buVEOFimTzG0HsAGr1Pcdg==
X-CSE-MsgGUID: Wwu53YT5R+Sc2oZbEtgl1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17007036"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="17007036"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:54:45 -0700
X-CSE-ConnectionGUID: rbvBDfNrT5CojucCL8V9Og==
X-CSE-MsgGUID: hCxR5wXYTae34SiiEn+egA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="46619615"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 09:54:43 -0700
Date: Tue, 2 Jul 2024 18:54:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, rodrigo.vivi@intel.com,
 janga.rahul.kumar@intel.com,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Message-ID: <20240702165439.pzw6f4w3uw7zzrcp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, rodrigo.vivi@intel.com,
 janga.rahul.kumar@intel.com,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240701145439.91038-1-badal.nilawar@intel.com>
 <20240701145439.91038-2-badal.nilawar@intel.com>
 <3e4fb60d-901d-4716-9689-8f7e17a07a83@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e4fb60d-901d-4716-9689-8f7e17a07a83@intel.com>
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

Hi Riana,
On 2024-07-02 at 16:19:18 +0530, Riana Tauro wrote:
> Hi Badal
> 
> On 7/1/2024 8:24 PM, Badal Nilawar wrote:
> > Use existing d3 helpers to cover D3Hot and D3Cold.
> add description for the test being modified in commit message
> > 
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >   tests/intel/xe_pm.c | 49 +++++++++++++++++++++++++++++++--------------
> >   1 file changed, 34 insertions(+), 15 deletions(-)
> > 
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > index b30e94a2a..eac5ea8a7 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -611,10 +611,15 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> >   }
> >   /**
> > - * SUBTEST: mocs-rpm
> > + * SUBTEST: %s-mocs-rpm
> %s already denotes the runtime pm state. 'rpm' can be dropped
> >    * Description:
> >    *     Validate mocs register contents over suspend resume
> %s/register/registers
> %s/suspend resume/runtime suspend,resume

or just:
 * Description: Validate mocs registers contents over runtime suspend and resume

> >    *
> > + * arg[2]:
> %s/arg[2]/arg[1]
> > + *
> > + * @d3hot:	d3hot
> > + * @d3cold:	d3cold
> > + *
> >    * Functionality: mocs registers
> Functionality for the other mocs test is pm - %arg[1]

Please do not use '%args[1]' in Functionality or other fields,
this is only for subtests names, also put all these before
describing args[] vars.

+Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>

Regards,
Kamil

> Should be same
> >    * Run type: FULL
> >    */
> > @@ -629,9 +634,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> >    * @s3:		s3
> >    * @s4:		s4
> >    */
> > -static void test_mocs_suspend_resume(device_t device, int s_state)
> > +static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_state,
> > +				     enum igt_acpi_d_state d_state)
> >   {
> >   	int gt;
> > +	uint64_t active_time;
> > +	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
> > +			  d_state == IGT_ACPI_D3Cold);
> > +
> >   	xe_for_each_gt(device.fd_xe, gt) {
> It would be good to have a log to identify the gt running this test,
> else would be difficult to identify which GT moc registers failed
> >   		char path[256];
> > @@ -644,19 +654,27 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
> >   		igt_debugfs_dump(device.fd_xe, path);
> >   		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> > -		if (s_state == NO_SUSPEND) {
> > +		if (check_rpm) {
> > +			igt_assert(in_d3(device, d_state));
> > +			active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> > +
> >   			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> >   			igt_assert(fw_handle >= 0);
> > -			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +			igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> > +				   active_time);
> >   			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
> >   			close(fw_handle);
> > -			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +			sleep(1);
> > +
> > +			igt_assert(in_d3(device, d_state));
> >   		} else {
> > -			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> > -				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> > +			if (s_state != NO_SUSPEND) {
> > +				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> > +					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> > -			igt_system_suspend_autoresume(s_state, test);
> > +				igt_system_suspend_autoresume(s_state, test);
> > +			}
> >   		}
> >   		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> >   		igt_debugfs_dump(device.fd_xe, path);
> > @@ -766,7 +784,7 @@ igt_main
> >   		}
> >   		igt_subtest_f("%s-mocs", s->name)
> add igt_describe
> > -			test_mocs_suspend_resume(device, s->state);
> > +			test_mocs_suspend_resume(device, s->state, NO_RPM);
> >   	}
> >   	igt_fixture {
> > @@ -825,6 +843,13 @@ igt_main
> >   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> >   		}
> add igt_describe
> 
> Could you also add the tests temporarily to BAT in these series to check the
> CI of the new tests?
> 
> Thanks
> Riana Tauro
> > +
> > +		igt_subtest_f("%s-mocs-rpm", d->name) {
> > +			igt_assert(setup_d3(device, d->state));
> > +			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
> > +			cleanup_d3(device);
> > +		}
> > +
> >   	}
> >   	igt_describe("Validate whether card is limited to d3hot,"
> > @@ -835,12 +860,6 @@ igt_main
> >   		test_vram_d3cold_threshold(device, sysfs_fd);
> >   	}
> > -	igt_subtest("mocs-rpm") {
> > -		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > -		test_mocs_suspend_resume(device, NO_SUSPEND);
> > -		dpms_on_off(device, DRM_MODE_DPMS_ON);
> > -	}
> > -
> >   	igt_fixture {
> >   		close(sysfs_fd);
> >   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
