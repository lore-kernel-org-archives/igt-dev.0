Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2BC6EA53
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 14:15:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id 12so23495919wrz.7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 07:15:39 -0700 (PDT)
Date: Thu, 15 Apr 2021 16:15:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YHhKh3ubt/FVSD0A@phenom.ffwll.local>
References: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
 <CAKMK7uGBoVRHEHgBr5rfgMW3qT6Rx1Hu7sgi-d_=i0M7Vy7LRQ@mail.gmail.com>
 <SN6PR11MB3327DD0D5044C9D630FEB7B98D709@SN6PR11MB3327.namprd11.prod.outlook.com>
 <YHcJOMSJ9pddPCEg@phenom.ffwll.local>
 <20210414160649.GC3081792@ideak-desk.fi.intel.com>
 <YHc2dJsZhHhzR6sl@phenom.ffwll.local>
 <20210414190129.GH3081792@ideak-desk.fi.intel.com>
 <SN6PR11MB33270FA879D43FFBD0F80CD08D4D9@SN6PR11MB3327.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB33270FA879D43FFBD0F80CD08D4D9@SN6PR11MB3327.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Fix mode selection for 2x tests
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 12:56:39PM +0000, Modem, Bhanuprakash wrote:
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Thursday, April 15, 2021 12:31 AM
> > To: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Daniel Vetter
> > <daniel.vetter@ffwll.ch>; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; IGT
> > development <igt-dev@lists.freedesktop.org>
> > Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Fix mode selection for 2x tests
> > 
> > On Wed, Apr 14, 2021 at 08:37:40PM +0200, Daniel Vetter wrote:
> > > > > > > [...]
> > > > > > > Uh this is really not how kms is supposed to work. There are _tons_
> > of
> > > > > > > reasons why 2 crtc at the same time wont work, mst bw constraint is
> > > > > > > just one.
> > > > > > >
> > > > > > > If you want to fix this, this should be fixed with atomic TEST_ONLY
> > > > > > In fact, we are doing the same in this series.
> > > > > >
> > > > > > By parsing the PATH connector prop, igt_output_refresh() will update
> > the
> > > > > > link_group_id field for each connector [1].
> > > > > >
> > > > > > Each individual (Nx)-test will identify the connectors those are
> > sharing
> > > > > > the MST bw (by reading the link_group_id field in igt_output_t), and
> > call
> > > > > > the helper to find the suitable modes [2].
> > > > > >
> > > > > > A helper function iterates through those N output/mode combinations.
> > And
> > > > > > find the combination using the most BW by ATOMIC_TEST_ONLY and
> > returned
> > > > > > to the test [3].
> > > > > >
> > > > > > Am I missing anything?
> > > > >
> > > > > Using TEST_ONLY sounds good. Trying to do clever filtering with PATH
> > > > > property before you call TEST_ONLY is not good. You should check with
> > > > > TEST_ONLY in general, not just when the path property indicates that the
> > > > > dp output is shared.
> > > >
> > > > I think it would still make sense to find the working config first on
> > > > outputs sharing a link bandwidth with TEST_ONLY and only then find the
> > > > config with all required outputs included in the TEST_ONLY commit,
> > > > starting with the modes found for outpus sharing a link. This is the way
> > > > you could find the maximum resolution that can be used on each output.
> > >
> > > That sounds like a testcase to make sure we support at least 2 working
> > > modes on the same MST link. I'm not sure that really should be the generic
> > > solution thing, for that you just have to go around reducing resolutions
> > > until you've managed to light up enough outputs. So order doesn't
> > > matter really, aside from maybe a preference for same resolutions (due to
> > > clock sharing and even splits of fifos and that kind of stuff).
> > >
> > > Treating MST links specially just to light up a set of outputs still feels
> > > a bit wrong.
> > 
> > Imo we should test the most usual user scenario, which I assumed is the
> > max resolution on all connected displays. But this could be wrong and
> > any more complicated logic could be added as a follow up if needed. So
> > I'm also ok to ignore the link bandwidth sharing aspect.
> 
> In simple words, just remove the MST specific stuff (link_group_id, PATH, etc...)
> from this series, and each individual (Nx)-test should call the helper[1] to get
> output/mode combo. Is my understanding correct?

Yup. We can then also add fancier fallback logic that tries to emulated
what compositors generally try to pick in there.
-Daniel

> 
> [1] https://patchwork.freedesktop.org/patch/427719
> 
> > 
> > > -Daniel
> > >
> > > >
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > [1]: https://patchwork.freedesktop.org/patch/427718
> > > > > > [2]: https://patchwork.freedesktop.org/patch/427720
> > > > > > [3]: https://patchwork.freedesktop.org/patch/427719
> > > > > >  N : 2,3,4,...
> > > > > >
> > > > > > -Bhanu
> > > > > > > mode to figure out what works and what doesn't. Not by trying to
> > > > > > > re-implement the kernel's atomic_check configuration validation,
> > > > > > > because you just can't do that.
> > > > > > >
> > > > > > > So nack on architectural reasons on this approach.
> > > > > > > -Daniel
> > > > > > >
> > > > > > > >
> > > > > > > > Bhanuprakash Modem (5):
> > > > > > > >   lib/igt_kms: Add a support to read PATH connector property
> > > > > > > >   lib/igt_kms: Identify outputs that shares link bandwidth
> > > > > > > >   lib/igt_kms: helper to override the mode on all connectors
> > > > > > > >   tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
> > > > > > > >   tests/kms_cursor_legacy: Fix mode selection for 2x tests
> > > > > > > >
> > > > > > > >  lib/igt_kms.c                    | 71
> > ++++++++++++++++++++++++++++++++
> > > > > > > >  lib/igt_kms.h                    |  3 ++
> > > > > > > >  tests/kms_cursor_legacy.c        | 53 ++++++++++++++++++++++--
> > > > > > > >  tests/kms_frontbuffer_tracking.c | 35 ++++++++++++++++
> > > > > > > >  4 files changed, 159 insertions(+), 3 deletions(-)
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.20.1
> > > > > > > >
> > > > > > > > _______________________________________________
> > > > > > > > igt-dev mailing list
> > > > > > > > igt-dev@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
