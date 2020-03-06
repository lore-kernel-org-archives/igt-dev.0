Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FBA6E432
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 14:28:09 +0000 (UTC)
Date: Fri, 6 Mar 2020 16:28:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200306142806.GY3839@platvala-desk.ger.corp.intel.com>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
 <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] ts/core_setmaster: new test for
 drop/set master semantics
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 02:17:07PM +0000, Emil Velikov wrote:
> On Wed, 4 Mar 2020 at 14:17, Petri Latvala <petri.latvala@intel.com> wrote:
> 
> [snip]
> > > Thinking about it, you're likely talking about the 3rd subtest aka
> > > "master-drop-set-shared-fd". Sure we can use igt_require() there,
> > > although I'd rather keep the__drm_open_driver() + igt_require()
> > > combination.
> > >
> > > Do you agree?
> >
> > For i915, gem_quiescent_gpu and pals are required so pending work
> > failing is reported on the correct test. Without that done, results
> > are hilariously racy.
> >
> Sure I get that, yet there is _no_ work being done in these tests.
> 
> [snip]
> > > Thinking about it close(drm_open_driver(...)) looks like a workaround,
> > > instead of addressing the issue.
> > > Even though it seems like it might work, the modprobe machinery seems partial:
> > >  - in the non i915 case, modprobe failure is a _debug_ message
> >
> > igt_warn("Could not load i915\n");
> >
> > Looks like a warn to me.
> >
> Note: _non_ i915 case.

I need glasses. Yes, the other probes have debug messages.

> > >  - the DRIVER_FOO to module name mapping is partial
> >
> > Yes, we don't have all of them, but we should have all that have
> > module reloading tests.
> >
> Agreed, yet this is not a module reloading test.

I mean that we modprobe all drivers that have module loading tests, or
otherwise special module handling. This test not being a module
reloading test doesn't matter, see example below.

> > >  - for some drivers, the module name differs from the name in
> >      drmGetVersion()
> >
> > Hence the special cased modprobe hook for i915 and the now-removed
> > virtio-gpu.
> >
> Virtio-gpu is a perfect example.

And we don't modprobe that anymore.


> > >  - some drivers have changed their module name
> >
> > The ones we modprobe in IGT don't seem to have?
> >
> >
> > Now, for i915 in particular since we do a load of module reload
> > testing, our required semantics for tests are to leave the state of
> > the system at test exit time in either
> >
> > 1) module is loaded and working
> > 2) module not loaded
> >
> > For i915, not doing drm_open_driver() first means you don't have
> > /dev/dri/card0 if the previously run test is something from
> > i915_module_load.
> >
> > See commit 676d031e6bd9 for a related fix.
> >
> I agree with the point of having reloading tests, so having a modprobe
> machinery, of sorts, makes sense.
> 
> Here we are relying on the _partial_ machinery to workaround a
> extremely unlikely corner-case.

It is _extremely_ likely that we (i915 CI) could sometimes run
igt@i915_module_load@reload right before this test. Or
igt@i915_selftest@live. When we do, there's no /dev/dri/card0 at the
time of chmodding but is at the time of __drm_open_driver().


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
