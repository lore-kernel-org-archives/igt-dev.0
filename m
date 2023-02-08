Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFB610E1F6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 10:09:28 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 08 Feb 2023 11:09:23 +0100
Message-ID: <8288817.T7Z3S40VBb@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <87zg9pmdup.wl-ashutosh.dixit@intel.com>
References: <20230207101121.104559-1-janusz.krzysztofik@linux.intel.com>
 <111723403.nniJfEyVGO@jkrzyszt-mobl1.ger.corp.intel.com>
 <87zg9pmdup.wl-ashutosh.dixit@intel.com>
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

On Tuesday, 7 February 2023 21:15:26 CET Dixit, Ashutosh wrote:
> On Tue, 07 Feb 2023 12:04:17 -0800, Janusz Krzysztofik wrote:
> >
> > Hi Umesh,
> >
> > On Tuesday, 7 February 2023 20:33:50 CET Umesh Nerlige Ramappa wrote:
> > > On Tue, Feb 07, 2023 at 11:25:00AM -0800, Umesh Nerlige Ramappa wrote:
> > > >I wouldn't do this. Please keep the changes local to the specific test
> > > >that you implemented in your first rev. While it is a good idea to
> > > >have the some of the perf capabilities in the library, this is way too
> > > >much churn to implement a specific test for the original failure.
> > > >Unless multiple IGT subsytems area already dependent on perf APIs to
> > > >implement multiple tests, let's not do this.
> > > >
> > >
> > > Also note that the perf library implemented in IGT is not entirely used
> > > by IGT tests alone. The library is also linked to GPUvis software. Only
> > > a few pieces of reusable code in the perf library is used by IGT tests.
> >
> > Do you think that my changes will break other users?  How?
> >
> > Also, it looks like there are somehow conflicting expectations from different
> > reviewers.  Ashutosh wanted the new subtest to be implemented outside of i915/
> > perf test.  That's why I proposed to extend the library with open/close and
> > related helpers, just to avoid code duplication, and I'm about to resend it in
> > series with the new subtest implemented inside gem_ctx_exec.  Now, after I
> > submitted this patch for initial review, you say that a specific test is not
> > the way to go.  What are you afraid of?
> >
> > Whose expectations should I try to satisfy in order to have a subtest accepted
> > and merged?  Or should I just give up and duplicate the code from i915/perf in
> > another test?  Or maybe you can have a look at the whole series before you
> > decide?
> 
> Hi Janusz,
> 
> I agree with Umesh. Given that here perf is just being used as a 'dummy
> workload' let's just duplicate the minimal code required for perf
> open/close wherever we are adding the new test. This will keep the real
> perf functionality undisturbed for reasons Umesh cited.

TBH, I can't see any good justification among those reasons mentioned: "too 
much churn", "unless ... already dependent", "not entirely used by IGT tests", 
"linked to GPUvis software", "only a few pieces of reusable code ... used by 
IGT" -- which of those justifies duplication of i915 perf code in IGT tests?  
Again, do you think that my changes can break other (non-IGT) users?  How?

Anyway, assuming you are the "owner" of lib/i915/perf.c, in order to satisfy 
your (still not clear for me) requirements I'm already working on a new  
version of my patch, with the i915 perf code duplicated as needed.

Thanks,
Janusz

> 
> Thanks.
> --
> Ashutosh
> 



