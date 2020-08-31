Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC456E10C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 12:19:04 +0000 (UTC)
Date: Mon, 31 Aug 2020 17:37:46 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20200831120745.GM25390@intel.com>
References: <20200831115515.16531-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200831115514.GL25390@intel.com>
 <SN6PR11MB3421A7F734380A3B8266ADE8DF510@SN6PR11MB3421.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB3421A7F734380A3B8266ADE8DF510@SN6PR11MB3421.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/i915_pm_lpsp: remove
 screens-disabled subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-08-31 at 17:40:18 +0530, Surendrakumar Upadhyay, TejaskumarX wrote:
> Inline
> 
> -----Original Message-----
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> Sent: 31 August 2020 17:25
> To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH] [i-g-t] tests/i915_pm_lpsp: remove screens-disabled subtest
> 
> On 2020-08-31 at 17:25:15 +0530, Tejas Upadhyay wrote:
> > screens-disabled subtest is not required to run when DMC firmware is
> > loaded. Thus this test code becomes redundant and increases needless
> > SKIP counts.
> >
> > Cc: Anshuman Gupta <Anshuman.Gupta@intel.com>
> > Signed-off-by: Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > ---
> >  tests/i915/i915_pm_lpsp.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> > index 4a187810..d1efd9e0 100644
> > --- a/tests/i915/i915_pm_lpsp.c
> > +++ b/tests/i915/i915_pm_lpsp.c
> > @@ -185,13 +185,6 @@ igt_main
> >  igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
> >  }
> >
> > -igt_describe("This test validates lpsp while all crtc are disabled");
> > -igt_subtest("screens-disabled") {
> > -igt_require_f(!dmc_supported(data.debugfs_fd),
> > -      "DC states supported platform don't have ROI for this subtest\n");
> > -screens_disabled_subtest(&data);
> > -}
> > -
> Platfrom like HASWELL still need this test, you can't simply remove the test, this is a valid skip for platform above skl+.
> Thanks,
> Anshuman Gupta.
> 
> Tejas : But those platforms will have DMC loaded? If DMC not loaded test will not enter in. And if DMC loaded this subtest will not run. How it will get executed?
DMC is not supported on platfrom prior to SKL.
Check igt_pm_dmc_loaded() carefully, it will return true in case DMC is not supported.
> 
> >  igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
> >  igt_subtest_with_dynamic_f("kms-lpsp") {
> >  igt_display_t *display = &data.display;
> > --
> > 2.25.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
