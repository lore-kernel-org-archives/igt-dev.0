Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299910E497
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 20:23:20 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Thu, 09 Feb 2023 21:23:13 +0100
Message-ID: <2072521.bB369e8A3T@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <Y+U/aso25+0NZTh8@orsosgc001.jf.intel.com>
References: <20230207101121.104559-1-janusz.krzysztofik@linux.intel.com>
 <4484531.cEBGB3zze1@jkrzyszt-mobl1.ger.corp.intel.com>
 <Y+U/aso25+0NZTh8@orsosgc001.jf.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make __perf_open() and
 friends public
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thursday, 9 February 2023 19:46:02 CET Umesh Nerlige Ramappa wrote:
> On Thu, Feb 09, 2023 at 10:56:04AM +0100, Janusz Krzysztofik wrote:
> >On Wednesday, 8 February 2023 20:34:06 CET Umesh Nerlige Ramappa wrote:
> >> On Wed, Feb 08, 2023 at 11:09:23AM +0100, Janusz Krzysztofik wrote:
> >> >On Tuesday, 7 February 2023 21:15:26 CET Dixit, Ashutosh wrote:
> >> >> On Tue, 07 Feb 2023 12:04:17 -0800, Janusz Krzysztofik wrote:
> >> >> >
> >> >> > Hi Umesh,
> >> >> >
> >> >> > On Tuesday, 7 February 2023 20:33:50 CET Umesh Nerlige Ramappa wrote:
> >> >> > > On Tue, Feb 07, 2023 at 11:25:00AM -0800, Umesh Nerlige Ramappa
> >wrote:
> >> >> > > >I wouldn't do this. Please keep the changes local to the specific
> >test
> >> >> > > >that you implemented in your first rev. While it is a good idea to
> >> >> > > >have the some of the perf capabilities in the library, this is way
> >too
> >> >> > > >much churn to implement a specific test for the original failure.
> >> >> > > >Unless multiple IGT subsytems area already dependent on perf APIs to
> >> >> > > >implement multiple tests, let's not do this.
> >> >> > > >
> >> >> > >
> >> >> > > Also note that the perf library implemented in IGT is not entirely
> >used
> >> >> > > by IGT tests alone. The library is also linked to GPUvis software.
> >Only
> >> >> > > a few pieces of reusable code in the perf library is used by IGT
> >tests.
> >> >> >
> >> >> > Do you think that my changes will break other users?  How?
> >> >> >
> >> >> > Also, it looks like there are somehow conflicting expectations from
> >different
> >> >> > reviewers.  Ashutosh wanted the new subtest to be implemented outside
> >of i915/
> >> >> > perf test.  That's why I proposed to extend the library with open/close
> >and
> >> >> > related helpers, just to avoid code duplication, and I'm about to
> >resend it in
> >> >> > series with the new subtest implemented inside gem_ctx_exec.  Now,
> >after I
> >> >> > submitted this patch for initial review, you say that a specific test
> >is not
> >> >> > the way to go.  What are you afraid of?
> >> >> >
> >> >> > Whose expectations should I try to satisfy in order to have a subtest
> >accepted
> >> >> > and merged?  Or should I just give up and duplicate the code from i915/
> >perf in
> >> >> > another test?  Or maybe you can have a look at the whole series before
> >you
> >> >> > decide?
> >> >>
> >> >> Hi Janusz,
> >> >>
> >> >> I agree with Umesh. Given that here perf is just being used as a 'dummy
> >> >> workload' let's just duplicate the minimal code required for perf
> >> >> open/close wherever we are adding the new test. This will keep the real
> >> >> perf functionality undisturbed for reasons Umesh cited.
> >> >
> >> >TBH, I can't see any good justification among those reasons mentioned: "too
> >> >much churn", "unless ... already dependent", "not entirely used by IGT
> >tests",
> >> >"linked to GPUvis software", "only a few pieces of reusable code ... used
> >by
> >> >IGT" -- which of those justifies duplication of i915 perf code in IGT
> >tests?
> >>
> >> You yourself mentioned that this is not related to perf. It's just that
> >> perf uses some code in i915 that does barrier related stuff which helps
> >> you to reproduce the issue. Why can't that barrier-related-stuff be
> >> implemented in IGT without the use of perf APIs?
> >
> >Because inside the driver I found no ways to trigger the issue (within a time
> >period reasonable from CI perspective) other than calling
> >intel_context_prepare_remote_request().  Only perf and gen8 sseu call that
> >function.  Out of the two, perf was my choice because:
> >- perf matched the user scenario reported as the one that could trigger the
> >  bug,
> >- we already had some work in progress subtest added to tests/i915/perf.c
> >  still before my root cause analysis was completed.
> 
> If you know the sequence in perf code that uncovering this issue, why 
> not just add a selftest for this?

Hmm, because it would take some significant time for me to learn if and how 
a comparable scenario could be successfully implemented in a selftest.  Any 
help is appreciated.

Thanks,
Janusz


> 
> Umesh
> 
> >
> >> If that's a lot of
> >> effort and it's quicker to reproduce this issue using perf APIs, then
> >> that's fine with me, but keep it outside of perf library
> >
> >Why?
> >(assuming by "it" you mean some useful functions now in tests/i915/perf.c)
> >
> >> and maybe add a
> >> note saying that this test can be improved by figuring out how to do
> >> barrier related execution in IGT in future.
> >
> >I don't understand what you mean by "in IGT" here.  Isn't lib/i915/perf.c "in
> >IGT" (a part of IGT)?
> >
> >> I don't see any
> >> justification to modify perf library for an issue that's not even perf
> >> related.
> >
> >Not modify, only extend with a wrapper around DRM_IOCTL_I915_PERF_OPEN and
> >helpers it depends on.
> >
> >Justification why we need to call DRM_IOCTL_I915_PERF_OPEN from some new
> >subtests: extend CI coverage over some rarely used processing paths.
> >
> >Justification why add reusable code to a library: avoid code duplication.
> >
> >Justification why add it to perf library: no doubt DRM_IOCTL_I915_PERF_OPEN is
> >perf related, I believe.
> >
> >> I believe you also mentioned somewhere that the issue was fixed by some
> >> 'unknown' code changes to i915 and you are not able to reproduce
> >> it consistently with this test now.
> >
> >No, I must have missed my point while clarifying things if that's how you've
> >read them, sorry.  The issue is reproducible.  CI results from my trybot
> >attempt clearly confirm that:
> >https://intel-gfx-ci.01.org/tree/drm-tip/TrybotIGT_699/bat-all.html?
> >testfilter=barrier-race
> >
> >Results from preliminary fixes tested with the new IGT subtest on trybot:
> >https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_113662v1/bat-all.html?
> >testfilter=barrier-race
> >
> >>
> >> I have considered the above factors to suggest that this should not
> >> reside in perf library.
> >>
> >> >Again, do you think that my changes can break other (non-IGT) users?
> >> >How?
> >>
> >> I didn't say that your changes break anything. I was stating that the
> >> library code is shared across different tools.
> >
> >But why do you think that an IGT library shared across different tools can't
> >be extended with a few functions needed by IGT tests?
> >
> >Thanks,
> >Janusz
> >
> >
> >>
> >> Thanks,
> >> Umesh
> >>
> >> >
> >> >Anyway, assuming you are the "owner" of lib/i915/perf.c, in order to
> >satisfy
> >> >your (still not clear for me) requirements I'm already working on a new
> >> >version of my patch, with the i915 perf code duplicated as needed.
> >> >
> >> >Thanks,
> >> >Janusz
> >> >
> >> >>
> >> >> Thanks.
> >> >> --
> >> >> Ashutosh
> >> >>
> >> >
> >> >
> >> >
> >> >
> >>
> >
> >
> >
> >
> 



