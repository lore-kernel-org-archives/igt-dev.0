Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 31 Jan 2023 18:36:30 +0100
Message-ID: <1949047.usQuhbGJ8B@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <87a61yvfq3.wl-ashutosh.dixit@intel.com>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
 <87a61yvfq3.wl-ashutosh.dixit@intel.com>
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

On Tuesday, 31 January 2023 17:19:48 CET Dixit, Ashutosh wrote:
> On Tue, 31 Jan 2023 01:17:29 -0800, Janusz Krzysztofik wrote:
> >
> 
> Hi Janusz,
> 
> > Users reported oopses on list corruptions when using i915 perf with a
> > number of concurrently running graphics applications.  That indicates we
> > are currently missing some important tests for such scenarios.  Cover
> > that gap.
> 
> Do these oops etc. have anything to do with perf itself or rather with
> persistence or non-persistence not properly supported with GuC? 

My root cause analysis has revealed that these list corruptions are actually 
caused by a bug in barrier processing, then no, they are not persistence nor 
GuC related.  For details, please see my preliminary (still a bit buggy, but 
otherwise valid) fix, so far sent only to trybot:
https://patchwork.freedesktop.org/series/113268/

> We should
> have seen such failures with persistence tests (with GuC) itself so I am
> wondering if there's any point of dragging perf into these already muddy
> waters? Such failures should be isolated first with other tests without
> mixing perf into this IMO.

I see your point, but unfortunately things are not that easy.  My 
investigation has lead me to a conclusion that the bug within the barrier 
processing code is now addressed, to some extent, and probably not 
intentionally, by a kind of workaround that makes it really hard to reproduce 
without any interaction from an external user that tries to replace a barrier 
with its own request.  And I can see a very limited number of such users, one 
of them being perf.

The first patch was developed by Chris still before I found the the root cause 
of the issue.  Since the bug seemed strictly perf related at that point in 
time, that's probably why Chris decided to add the new subtest to perf.  As 
such, that subtest is more general than just focused on triggering the list 
corruption bug, and it pretty belongs to perf, I believe.

Since Chris' subtest didn't help in triggering the list corruption, I've 
developed a new subtest that can do it.  Since it is almost identical to the 
one Chris added, I decided to reuse his code, then add my new subtest to perf 
as well.  But maybe you are right that my subtest better fits to another test. 
not perf.  I'll think this over.

I hope this clarifies things for you.

Thanks,
Janusz

> 
> Thanks.
> --
> Ashutosh
> 



