Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4886210F1BB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 10:59:23 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:59:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yl/nhvPAbM8VcLys@kamilkon-DESK1>
References: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
 <20220318160445.27986-2-kamil.konieczny@linux.intel.com>
 <YjhK2FvwgZol1crL@platvala-desk.ger.corp.intel.com>
 <76113dfc-b042-54e9-a3af-1bf23f0441a2@linux.intel.com>
 <Yjl+dkKMgdRt6Awm@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yjl+dkKMgdRt6Awm@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_engine_topology: add
 iterator for choosing one random engine from each class
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-03-22 at 08:44:54 +0100, Zbigniew Kempczyński napisał(a):
> On Mon, Mar 21, 2022 at 12:28:58PM +0000, Tvrtko Ursulin wrote:
> > 
> > On 21/03/2022 09:52, Petri Latvala wrote:
> > > On Fri, Mar 18, 2022 at 05:04:44PM +0100, Kamil Konieczny wrote:
> > > > In new GPUs there are many engines so tests with fixed timeout
> > > > which iterate over all engines can take much longer than on older
> > > > gens. Add new iterator for_one_random_cfg_ctx_engine, which will
> > > > iterate over each class of engines and will choose one from each
> > > > class at random.
> > > > 
> > > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > ---
> > > >   lib/i915/gem_engine_topology.c | 64 ++++++++++++++++++++++++++++++++++
> > > >   lib/i915/gem_engine_topology.h | 19 ++++++++++
> > > >   2 files changed, 83 insertions(+)
> > > > 
> > > > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > > > index ca3333c2..52a2f3ef 100644
> > > > --- a/lib/i915/gem_engine_topology.c
> > > > +++ b/lib/i915/gem_engine_topology.c
> > > > @@ -208,6 +208,70 @@ void intel_next_engine(struct intel_engine_data *ed)
> > > >   	}
> > > >   }
> > > > +static void __intel_random_init(void)
> > > > +{
> > > > +	struct timespec start;
> > > > +
> > > > +	clock_gettime(CLOCK_MONOTONIC, &start);
> > > > +	igt_debug("seed %d\n", (int)start.tv_nsec);
> > > > +	srand((int)start.tv_nsec);
> > > > +}
> > > 
> > > I don't like randomness for testing, but it sure is sometimes needed.
> > > 
> > > We have quite a bit of rand()-using tests and some of them have a
> > > --seed parameter so their results can be reproduced. Currently there's
> > > no overlap in sight with them and this thing, but if testing ever
> > > expands that way, mixing RNGs might break reproduceability. Can this
> > > instead use another RNG stream that's self-contained, like maybe
> > > rand_r() or such? Or the one implemented in lib/igt_rand.
> > 
> > Agreed, for developer use it is an essential requirement to be able to run a
> > test multiple times with same parameters. So any test which would be
> > converted to use for_one_random_ctx_cfg_engine would need to have a common
> > way of specifying a stable config.
> > 
> > Hm if we look at the end result:
> > 
> >  	igt_subtest_with_dynamic("active") {
> > -		for_each_ctx_cfg_engine(fd, &cfg, e) {
> > +		for_one_random_ctx_cfg_engine(fd, &cfg, e) {
> >  			igt_dynamic_f("%s", e->name)
> >  				active(fd, &cfg, e, 20, 1);
> >  		}
> > 
> > Would that even work better at the test runner layer? New testlist syntax to
> > pick one random out of a list of dynamic subtests?
> 
> Getting random engine is prone for two problems:
> 
> 1. if we have same seed we always choose same engine in single test
>    (as igt_runner is executing tests in separate processes we lost randomness
>     at all)
> 
> 2. if we have different seed we will have fluctuations on e->name across
>    different runs. I don't know how CI will react if subtest will be rcs0
>    then bcs0 in next run. 
> 
> I think subtest name crc/hash would be good seed, it would allow us to 
> keep same engine across runs for single subtest and selecting different 
> engines across subtests.
> 
> --
> Zbigniew
> 
> 
> > 
> > Regards,
> > 
> > Tvrtko

Maybe following will be better and will not confuse CI:

        igt_subtest("active-random") {
		igt_random_seed();
		for_one_random_ctx_cfg_engine(fd, &cfg, e) {
		    active(fd, &cfg, e, 20, 1);
	}

Function igt_random_seed will use evnironment var IGT_SEED
and if not present will use time(), then it will print its seed.

Regards,
Kamil
