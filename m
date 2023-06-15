Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5010E509
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 14:51:43 +0000 (UTC)
Date: Thu, 15 Jun 2023 16:08:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Message-ID: <20230615140837.y36k7xkusat3yomg@kamilkon-desk1>
References: <20230529104932.495519-1-janga.rahul.kumar@intel.com>
 <20230614134240.qs7akj32z5nd3hwg@kamilkon-desk1>
 <MW3PR11MB4748A0950D601017ADEEC95AAE5BA@MW3PR11MB4748.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748A0950D601017ADEEC95AAE5BA@MW3PR11MB4748.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 core hotunplug test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-06-15 at 07:55:14 +0000, Kumar, Janga Rahul wrote:
> 
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: 14 June 2023 19:13
> > To: igt-dev@lists.freedesktop.org
> > Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add core
> > hotunplug test
> > 
> > Hi Janga,
> > 
> > On 2023-05-29 at 16:19:32 +0530, janga.rahul.kumar@intel.com wrote:
> > > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > >
> > > Add core hotunplug unbind and rebind test.
> > >
> > > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > 
> > Is this test working with Xe driver ?
> Yes, Test is passing. Unbind-rebind subtest contains drm ioctl independent of i915/XE driver
> Due to that test is passing on XE as well. Ran test on simulation and HW environment.
> 
> Thanks,
> Rahul

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >  tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/tests/intel-ci/xe-fast-feedback.testlist
> > > b/tests/intel-ci/xe-fast-feedback.testlist
> > > index 7242c8d8..f8ad160e 100644
> > > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > > @@ -270,3 +270,9 @@ igt@kms_prop_blob@basic
> > > igt@kms_psr@primary_page_flip  igt@kms_psr@cursor_plane_move
> > > igt@kms_psr@sprite_plane_onoff
> > > +
> > > +# All tests that do module unloading and reloading are executed last.
> > > +# They will sometimes reveal issues of earlier tests leaving the #
> > > +driver in a broken state that is not otherwise noticed in that test.
> > > +
> > > +igt@core_hotunplug@unbind-rebind
> > > --
> > > 2.25.1
> > >
