Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 13 Feb 2023 10:42:51 +0100
Message-ID: <2133289.irdbgypaU6@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <2903124.VdNmn5OnKV@jkrzyszt-mobl1.ger.corp.intel.com>
References: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
 <20230210112158.kydkkmcbtu2es3zu@kamilkon-desk1>
 <2903124.VdNmn5OnKV@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/1] tests/i915/perf: Add stress /
 race exercises
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 10 February 2023 12:56:12 CET Janusz Krzysztofik wrote:
> On Friday, 10 February 2023 12:21:58 CET Kamil Konieczny wrote:
> > Hi,
> > 
> > On 2023-02-10 at 08:53:12 +0100, Janusz Krzysztofik wrote:
> > > Hi,
> > > 
> > > On Thursday, 9 February 2023 12:50:38 CET Janusz Krzysztofik wrote:
> > > > Users reported oopses on list corruptions when using i915 perf with a
> > > > number of concurrently running graphics applications.  That indicates we
> > > > are currently missing some important tests for such scenarios.  Cover
> > > > that gap.
> > > > 
> > > > v2: drop open-race subtest for now, not capable of triggering the user
> > > >     reported bug, but triggering other bugs which I can't see any fixes
> > > >     for queued yet,
> > > >   - move the other new subtest out of tests/i915/perf.c (Ashutosh).
> > > > 
> > > > Janusz Krzysztofik (1):
> > > >   tests/gem_ctx_exec: Exercise barrier race
> > > 
> > > While still waiting for CI results (BAT results don't cover the new subtest) 
> > > I've collected results from a forced execution of the subtest in BAT scope on 
> > > trybot: https://patchwork.freedesktop.org/series/113608/#rev2
> > > 
> > > While working as expected on most platforms, the test failed on some ancient 
> > > ones instead of skipping.  I've fixed this issue and tested the fix 
> > > successfully on trybot: https://patchwork.freedesktop.org/series/113608/#rev3
> > > 
> > > I'm still waiting for your comments, if any, before I submit the fixed 
> > > version.
> > 
> > Patch looks good but as you already noticed it is blacklisted
> > and do not cause noticeable fail. Proposed solution is to move
> > it to other test or to create new one, imho one you proposed
> > 
> > igt@gem_barrier_race@remote-request
> 
> OK, since I can't point out any better existing candidate, let's create a new 
> test.  However, taking into account that we have some more variants in 
> progress which differ on the barrier rather then remote-request side 
> of workloads, and the remote-request workload will probably be common to all 
> those variants, I propose a somehow reordered test naming:
> 
> igt@gem_remote_request@barrier-race

I've decided to keep my initial igt@gem_barrier_race@remote-request naming.
Since implementation of barrier tasks list handling is intentionally racy, 
I think that's quite reasonable to have a test focused on exercising those 
race cases, and the remote-request case seems not the only one that can be
problematic.

Thanks,
Janusz


> 
> This way, we don't determine how remote requests are triggered, then we don't 
> connect the new test with perf specifically in any way, and we have plenty of 
> room for different workloads we may want to race against remote requests (be 
> it perf triggered or not).
> 
> If perf specifically requires more thorough testing, that can be handled 
> separately in a separate, perf dedicated test.
> 
> Thanks,
> Janusz
> 
> 
> > 
> > looks good.
> > 
> > Regards,
> > Kamil
> > 
> > > 
> > > Thanks,
> > > Janusz
> > > 
> > > > 
> > > >  tests/i915/gem_ctx_exec.c | 123 ++++++++++++++++++++++++++++++++++++++
> > > >  tests/meson.build         |   9 ++-
> > > >  2 files changed, 131 insertions(+), 1 deletion(-)
> > > > 
> > > > 
> > > 
> > > 
> > > 
> > > 
> > 
> 
> 
> 
> 
> 



