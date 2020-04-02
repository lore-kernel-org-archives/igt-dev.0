Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187706EA33
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 09:56:28 +0000 (UTC)
Date: Thu, 2 Apr 2020 12:56:24 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200402095624.b7dxu77flhdwjfli@ahiler-desk1.fi.intel.com>
References: <20200331123857.1212432-5-arkadiusz.hiler@intel.com>
 <20200401162912.1238692-1-arkadiusz.hiler@intel.com>
 <20200402022533.GA13459@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402022533.GA13459@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] tests/kms_chamelium: Test HPD
 for different mode handling scenarios
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 07:55:34AM +0530, Kunal Joshi wrote:
> On 2020-04-01 at 19:29:12 +0300, Arkadiusz Hiler wrote:
> > The default scenario is now performing all hotplugs with modes disabled
> > on all connectors. This is the quickest of the tests and represents
> > userspace not caring about the new display (e.g. explicitly disabled).
> > 
> > *-hpd-enable-disable-mode covers the most common userspace behavior
> > where each hotplug event is accompanied by a corresponding enabling /
> > disabling commit.
> > 
> > *-hpd-with-enabled-mode explicitly targets the scenario where we have
> > mode enabled and never disable it as we do hotplugs to reproduce the
> > issue we see with TypeC connectors for ICL and TGL.
> > 
> > v2:
> >  - refresh igt_display output state after reprobing
> >  - get mode and set pipe only after we have connector plugged in
> > 
> > Cc: Kunal Joshi <kunal1.joshi@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > ---
> >  lib/igt_kms.c         |   2 +-
> >  lib/igt_kms.h         |   1 +
> >  tests/kms_chamelium.c | 315 ++++++++++++++++++++++++++++--------------
> >  3 files changed, 216 insertions(+), 102 deletions(-)
> > 
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index 236e1010..3019d270 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -2795,11 +2894,25 @@ igt_main
> >  
> >  		igt_describe(test_basic_hotplug_desc);
> >  		connector_subtest("vga-hpd", VGA)
> > -			test_basic_hotplug(&data, port, HPD_TOGGLE_COUNT_VGA);
> > +			test_hotplug(&data, port, HPD_TOGGLE_COUNT_VGA,
> > +				     TEST_MODESET_OFF);
> >  
> >  		igt_describe(test_basic_hotplug_desc);
> >  		connector_subtest("vga-hpd-fast", VGA)
> > -			test_basic_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST);
> > +			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
> > +				     TEST_MODESET_OFF);
> > +
> > +		igt_describe(test_basic_hotplug_desc);
> > +		connector_subtest("hdmi-hpd-enable-disable-mode", VGA)
> > +			test_hotplug(&data, port,
> > +				     HPD_TOGGLE_COUNT_FAST,
> > +				     TEST_MODESET_ON_OFF);
> > +
> > +		igt_describe(test_basic_hotplug_desc);
> > +		connector_subtest("hdmi-hpd-with-enabled-mode", VGA)
> > +			test_hotplug(&data, port,
> > +				     HPD_TOGGLE_COUNT_FAST,
> > +				     TEST_MODESET_ON);
> >  
> Can be rename as vga-hpd-enable-disable-mode and vga-hpd-with-enabled-mode

Or even should be :-)

That's a copy&paste fail on my side. Thanks for spotting this!

> 
> Otherwise looks good to me
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
