Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A941C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F293210E0E0;
	Thu, 27 Mar 2025 17:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivAAywAe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4D210E0E0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743096193; x=1774632193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3AbJrQvN0GmLLuSOwU/55kh3kQTbEEs3aagFFYrmHqY=;
 b=ivAAywAeGkR1kVnbsGTCvR9dIx3K0hslnTLy5gbmalRgqdDnHLKcjheA
 78j20CUvSxbTxOKHfo+VVvPIeF3F0GZOHrM1pb6qKDkKcwzs48OCEnl0j
 vHiPZP3M7Q7GB5ZDReGBdcSc9iJU1ke9Hgd/OteMkRAGhfMGVOLXN8xYI
 aZY8xmFx2ZKy7dKkenRwKroIFNNoiYodxz4NI3Wo19MgWMsCjNHXy+RDv
 kE33K9XZ2+zCAhOM+mMgOD+3KeQpACcfwek/RgOmOV56GzNLWyLSgFlKr
 7VkvhCoDUyoDKW6fiQctUalFbPlHF2Wzxm5M6sx3smI8Cm8GgzJfqX9l1 Q==;
X-CSE-ConnectionGUID: uCksdJk4R4SOlSwAIVYfaw==
X-CSE-MsgGUID: V00qjPQ4T9ec7LOZwPuipQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44362028"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44362028"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:23:13 -0700
X-CSE-ConnectionGUID: wV8mVLSrRMiAYUXC27cXLw==
X-CSE-MsgGUID: 7L7EI7/0SAusVO89Irm/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="156148857"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 10:23:11 -0700
Date: Thu, 27 Mar 2025 18:23:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>
Cc: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH 1/1] Added tests to handle error string conditions in
 xe_sysfs_scheduler.c
Message-ID: <20250327172308.gmr6ypoynx2og6hm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20250326180312.1808192-1-sobin.thomas@intel.com>
 <20250326180312.1808192-2-sobin.thomas@intel.com>
 <DS0PR11MB7264DD43F8D5B99A837E3FA0D9A12@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7264DD43F8D5B99A837E3FA0D9A12@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi Piatkowski,,
On 2025-03-27 at 08:15:35 +0000, Piatkowski, Dominik Karol wrote:
> Hi Sobin,
> 
> > -----Original Message-----
> > From: Thomas, Sobin <sobin.thomas@intel.com>
> > Sent: Wednesday, March 26, 2025 7:03 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Piatkowski, Dominik Karol
> > <dominik.karol.piatkowski@intel.com>
> > Subject: [PATCH 1/1] Added tests to handle error string conditions in
> > xe_sysfs_scheduler.c
> 
> Just like in cover letter, please fix the subject for future submissions.
> 
> > 
> > From: "Thomas, Sobin" <sobin.thomas@intel.com>
> 
> "From" field shouldn't be here.
> 
> The patch is missing commit description. Please fix it.

Well, sometimes you can use 'From:' - what is important it should be
the same as s-o-b below.

> 
> > 
> > Signed-off-by: Thomas, Sobin <sobin.thomas@intel.com>
> 
> I believe the formatting we use for name and surname inside tags is "Sobin Thomas".
> 

There should be no ',' chars, imho just set it up globally:

git config --global user.name "FIRST_NAME LAST_NAME"

or if your culture uses LAST_NAME in first place:

git config --global user.name "LAST_NAME FIRST_NAME"

Up to you, once set please keep it.

Regards,
Kamil

> > ---
> >  tests/intel/xe_sysfs_scheduler.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> > index 4fc764f82..a0eaad5ab 100644
> > --- a/tests/intel/xe_sysfs_scheduler.c
> > +++ b/tests/intel/xe_sysfs_scheduler.c
> > @@ -10,6 +10,11 @@
> >   * Sub-category: SysMan tests
> >   * Functionality: scheduler control interface
> >   *
> > + * SUBTEST: %s-invalid-string
> > + * Description: Test to check if %s arg[1] schedule parameter checks for
> > + * min max values.
> 
> You need to indent this line, or build will fail.
> 
> > + * Test category: Negative string test
> > + *
> >   * SUBTEST: %s-invalid
> >   * Description: Test to check if %s arg[1] schedule parameter rejects any
> >   *		unrepresentable intervals.
> > @@ -121,6 +126,23 @@ static void test_min_max(int xe, int engine, const
> > char **property,
> >  	igt_assert_eq(set, default_max);
> >  }
> > 
> > +static void test_invalid_string(int xe, int engine, const char **property,
> > +                         uint16_t class, int gt)
> 
> Please use tabs to indent code where possible (unless it's less than one tab worth of spaces after tabs for correct alignment).
> 
> > +{
> > +	unsigned int saved, set;
> > +	char invalid_input[] = "999abc"; //Intentionally passing wrong string
> 
> I think this comment is redundant.
> 
> > +
> > +	for(int i=0;i<3;i++) {
> 
> There are missing spaces inside this statement. Please format it.
> 
> > +		igt_assert(igt_sysfs_scanf(engine,property[i],"%u",&saved) ==
> > 1);
> 
> Same here.
> 
> > +		igt_info("Initial %s:%u\n",property[i],saved);
> 
> And here.
> 
> > +		igt_sysfs_printf(engine, property[i], "%s", invalid_input);
> > +		igt_sysfs_scanf(engine,property[i],"%u",&set);
> 
> And here.
> 
> > +		igt_assert_eq(set,saved);
> 
> And here.
> 
> > +		igt_info("Property %s correctly rejected input
> > %s\n",property[i],invalid_input);
> 
> And here.
> 
> Also, it would be a good idea to check return values of igt_sysfs_printf/igt_sysfs_scanf, for example checking if igt_sysfs_printf failed (returned negative value) - as I assume we expect it to fail. If second igt_sysfs_scanf fails, and we won't know about it, we will deal with uninitialized values, and that will be a headache of its own.
> 
> Thanks,
> Dominik Karol
> 
> > +	}
> > +}
> > +
> > +
> >  #define MAX_GTS 8
> >  igt_main
> >  {
> > @@ -130,6 +152,7 @@ igt_main
> >  	} tests[] = {
> >  		{ "invalid", test_invalid },
> >  		{ "min-max", test_min_max },
> > +		{ "invalid-string", test_invalid_string },
> >  		{ }
> >  	};
> > 
> > --
> > 2.34.1
> 
