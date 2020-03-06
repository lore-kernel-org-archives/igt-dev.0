Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691E16ED2E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 14:17:47 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id c18so1587389vsq.7
 for <igt-dev@lists.freedesktop.org>; Fri, 06 Mar 2020 06:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
 <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 6 Mar 2020 14:17:07 +0000
Message-ID: <CACvgo51TWNKBiqZhbbhSbEg9jf9ZUEKT07oEMGqVknWva9k6ag@mail.gmail.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 4 Mar 2020 at 14:17, Petri Latvala <petri.latvala@intel.com> wrote:

[snip]
> > Thinking about it, you're likely talking about the 3rd subtest aka
> > "master-drop-set-shared-fd". Sure we can use igt_require() there,
> > although I'd rather keep the__drm_open_driver() + igt_require()
> > combination.
> >
> > Do you agree?
>
> For i915, gem_quiescent_gpu and pals are required so pending work
> failing is reported on the correct test. Without that done, results
> are hilariously racy.
>
Sure I get that, yet there is _no_ work being done in these tests.

[snip]
> > Thinking about it close(drm_open_driver(...)) looks like a workaround,
> > instead of addressing the issue.
> > Even though it seems like it might work, the modprobe machinery seems partial:
> >  - in the non i915 case, modprobe failure is a _debug_ message
>
> igt_warn("Could not load i915\n");
>
> Looks like a warn to me.
>
Note: _non_ i915 case.

> >  - the DRIVER_FOO to module name mapping is partial
>
> Yes, we don't have all of them, but we should have all that have
> module reloading tests.
>
Agreed, yet this is not a module reloading test.

> >  - for some drivers, the module name differs from the name in
>      drmGetVersion()
>
> Hence the special cased modprobe hook for i915 and the now-removed
> virtio-gpu.
>
Virtio-gpu is a perfect example.

> >  - some drivers have changed their module name
>
> The ones we modprobe in IGT don't seem to have?
>
>
> Now, for i915 in particular since we do a load of module reload
> testing, our required semantics for tests are to leave the state of
> the system at test exit time in either
>
> 1) module is loaded and working
> 2) module not loaded
>
> For i915, not doing drm_open_driver() first means you don't have
> /dev/dri/card0 if the previously run test is something from
> i915_module_load.
>
> See commit 676d031e6bd9 for a related fix.
>
I agree with the point of having reloading tests, so having a modprobe
machinery, of sorts, makes sense.

Here we are relying on the _partial_ machinery to workaround a
extremely unlikely corner-case.
Given the probability of actually needing that WA is negligible, we
might as well omit it.

Tl:Dr; let's use __drm_open_driver() + igt_require() for
"master-drop-set-shared-fd"

Shall I sent v4 with that?


[snip]
>
> Weird spot is a good name for this state. a+c gets +1 from me, and b
> in principle but I don't know how feasible it is to implement.
>
> There's lib/igt.cocci that hasn't been touched in a while...
>
Doubt I'll get to cocci it - a quick grep job will do for the initial run.

Will post some patches after this test is finished.

Thanks
-Emil
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
