Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 31 Jan 2023 18:56:34 +0100
Message-ID: <45287761.fMDQidcC6G@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <87a61y1w4l.wl-ashutosh.dixit@intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
 <87a61yvfq3.wl-ashutosh.dixit@intel.com>
 <87a61y1w4l.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/i915/perf: Add stress / race
 exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 31 January 2023 17:55:54 CET Dixit, Ashutosh wrote:
> On Tue, 31 Jan 2023 08:19:48 -0800, Dixit, Ashutosh wrote:
> >
> > On Tue, 31 Jan 2023 01:17:29 -0800, Janusz Krzysztofik wrote:
> > >
> >
> > Hi Janusz,
> >
> > > Users reported oopses on list corruptions when using i915 perf with a
> > > number of concurrently running graphics applications.  That indicates we
> > > are currently missing some important tests for such scenarios.  Cover
> > > that gap.
> >
> > Do these oops etc. have anything to do with perf itself or rather with
> > persistence or non-persistence not properly supported with GuC? We should
> > have seen such failures with persistence tests (with GuC) itself so I am
> > wondering if there's any point of dragging perf into these already muddy
> > waters? Such failures should be isolated first with other tests without
> > mixing perf into this IMO.
> 
> Basically failures in these tests indicate defects in which subsystem? If
> the failures do not indicate defects in perf then these tests should not be
> added as perf tests. E.g. if failures indicate defects in GuC subsystem
> then they should be added as GuC tests.

But how can a tests know in advance what bugs, in which particular subsystems, 
it is ever going to hit?  If it could, we wouldn't need any root cause 
analysis, only tests telling us which bug from a predicted set was hit.
For me your vision seems to assume an environment without cross-subsystem 
dependencies, where a test is only capable of triggering bugs in a particular 
subsystem and never in others.  That's not possible in reality, I believe, we 
need root cause analysis to tell.

> 
> Otherwise it gets hard to dispostion bugs which are filed due to these
> failures. The bugs come to the wrong team and then have to be sent to the
> correct team etc.

In my opinion, all parties, whether validation, or bug filling, or 
development, must do their job with care.  Assigning bugs to teams by test 
name, not by a signature of the issue found in test output or system logs, 
doesn't seem to be the best practice to me.

Thanks,
Janusz

> 
> Thanks.
> --
> Ashutosh
> 



