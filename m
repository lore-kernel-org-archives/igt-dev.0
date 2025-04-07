Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306BCC3601A
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 10:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D887010E3A4;
	Mon,  7 Apr 2025 10:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0YimD/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5750F10E3A4
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744022646; x=1775558646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ciBTmedeNEo3FpXw0CUa1EYx/BTb91pzPuELcsZNaOM=;
 b=l0YimD/h7YdtQZxT/CE15wP+B39f31VcFf+j7lAny4o3zGs6ahyjiVP1
 LNGNrqarqaeQm3WqSEvxaIm2l2m0YdVcooJsVef55IC9xOqZcK2oEBRgv
 6x6s0uE2q4ohDjKq2THHwRNBbQbBjXZPOFM2bMhZPD2fuE2GyC1E5yA5X
 x7rwSj4KRgRSKSM3EFs7kMGvL1HuGf3sbh4w3XYNqnecUe16yL2LhFMnl
 4QkJUQn6N7zURU/dxWcI7NslPSRxcDj8EEjKuJ14FG8bpdZK34RDIg3ya
 laHuZbkEJYvf6jsrf96MudPFhAb68WjLKugAfZXJ1mc434vcxgkLQCFQu w==;
X-CSE-ConnectionGUID: wyUGiliSSyCwGx217oRF4g==
X-CSE-MsgGUID: UzIUIAYvRWuZQf3ivA/gZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56764431"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56764431"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 03:43:10 -0700
X-CSE-ConnectionGUID: h/kzBVHWRxK/OidpTnBm9g==
X-CSE-MsgGUID: 3dlTAr34RD6Ij8xUnQ6ZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128850845"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:43:08 -0700
Date: Mon, 7 Apr 2025 12:43:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Message-ID: <20250407104306.mbjnkftieh3lea33@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev <igt-dev@lists.freedesktop.org>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>
References: <20250401114529.1828868-1-sobin.thomas@intel.com>
 <20250401114529.1828868-2-sobin.thomas@intel.com>
 <DS0PR11MB7264FED822E028577EF4062AD9AC2@DS0PR11MB7264.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR11MB7264FED822E028577EF4062AD9AC2@DS0PR11MB7264.namprd11.prod.outlook.com>
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
On 2025-04-01 at 12:59:54 +0000, Piatkowski, Dominik Karol wrote:
> Hi Sobin,
> 
> > -----Original Message-----
> > From: Thomas, Sobin <sobin.thomas@intel.com>
> > Sent: Tuesday, April 1, 2025 1:45 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>
> > Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid string
> > test for engine sysfs properties
> > 
> > From: Sobin Thomas <sobin.thomas@intel.com>
> > 
> > This test validates that invalid string inputs are correctly rejected
> > by engine sysfs write. It ensures that the property values remain
> > unchanged when invalid inputs are provided.
> > 
> > v3: Fixed the test logic. Fixed the tabs
> > 
> > v2: Added error check for return values for igt_sysfs_scanf and
> > igt_sysfs_printf. Removed the changes for fault injection in
> > tests/intel/xe_fault_injection.c
> > 
> > v1: Initial changes for checking error string.
> > 
> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> > ---
> >  tests/intel/xe_sysfs_scheduler.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> > index 4fc764f82..eb95d0d6e 100644
> > --- a/tests/intel/xe_sysfs_scheduler.c
> > +++ b/tests/intel/xe_sysfs_scheduler.c
> > @@ -10,6 +10,11 @@
> >   * Sub-category: SysMan tests
> >   * Functionality: scheduler control interface
> >   *
> > + * SUBTEST: %s-invalid-string
> > + * Description: Test to check if %s arg[1] schedule parameter checks for
> > + *		min max values.
> > + * Test category: Negative string test
> > + *
> >   * SUBTEST: %s-invalid
> >   * Description: Test to check if %s arg[1] schedule parameter rejects any
> >   *		unrepresentable intervals.
> > @@ -121,6 +126,28 @@ static void test_min_max(int xe, int engine, const
> > char **property,
> >  	igt_assert_eq(set, default_max);
> >  }
> > 
> > +static void test_invalid_string(int xe, int engine, const char **property,
> > +			uint16_t class, int gt)
> 
> One tab disappeared from this indent, it was present in v2, please fix.
> 
> > +{
> > +	unsigned int saved, set;
> > +	char invalid_input[] = "999abc";
> > +
> > +	for (int i = 0; i < 3; i++) {
> > +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &saved)
> > == 1);
> > +		igt_info("Initial %s: %u\n", property[i], saved);
> > +		if (igt_sysfs_printf(engine, property[i], "%s", invalid_input) >
> > 0) {
> > +			igt_critical("invalid value %s can be set to property
> > %s\n",
> > +					invalid_input, property[i]);
> 
> Please replace the last indenting tab with 5 spaces for perfect alignment.
> 
> > +		}
> 
> We don't use braces for single statements - please remove them from this if.
> 
> > +
> > +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &set) ==
> > 0);

Here also it is better to use _eq macro:

	igt_assert_eq(igt_sysfs_scanf(engine, property[i], "%u", &set), 0);

> > +
> > +		//Check if the values are unchanged.
> 
> I believe we prefer /* C-style comments */
> +cc Kamil

Yes, please use C-style comments. Also for white space errors please
use checkpatch.pl script from Linux kernel source, for some oprtions
for its usage look into CONTRIBUTING.md

> 
> With mentioned changes,
> LGTM,
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

After fixing above nits please add Dominik's r-b and resend.

Regards,
Kamil

> 
> > +		igt_assert_eq(set, saved);
> > +	}
> > +}
> > +
> > +
> >  #define MAX_GTS 8
> >  igt_main
> >  {
> > @@ -130,6 +157,7 @@ igt_main
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
