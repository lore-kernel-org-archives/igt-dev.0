Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263AE10E0FD
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Mar 2022 07:22:11 +0000 (UTC)
Date: Tue, 22 Mar 2022 08:22:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yjl5HIG55rmhnfYl@zkempczy-mobl2>
References: <YiBboHmOS4cuU1iH@zkempczy-mobl2> <YiCNFUCFm8qWn4W0@kamilkon-DESK1>
 <YiCtTfYqWTfvfX9z@zkempczy-mobl2> <YjNYR2c027KZwtsT@kamilkon-DESK1>
 <YjTLkQ+wjeU0p2SG@zkempczy-mobl2>
 <YjhExEM8S6uxqujD@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjhExEM8S6uxqujD@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [RFC] Use HAX for series which add igt_describe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 11:26:28AM +0200, Petri Latvala wrote:

<cut>

> > > One downside is when developers document dynamic subtests, see
> > > "test/i915_pm_rpm: Remove igt_describe() from dynamic subtest"
> > > 
> > > ./i915_pm_rpm --run gem-execbuf-stress
> > > [cut]
> > > Starting subtest: gem-execbuf-stress
> > > documenting dynamic subsubtests is impossible, document the subtest instead.please refer to lib/igt_core documentation
> > > i915_pm_rpm: ../lib/igt_core.c:365: internal_assert: Assertion `0' failed.
> > > Received signal SIGABRT.
> > 
> > Eh, what a pity this is not detected on compile time. Unfortunately this
> > cannot be easily catched if test requirements are not met and test will
> > skip. So you're right, using HAX is bad idea.
> > 
> > Btw shouldn't igt_describe() be no-op with warning in such case instead
> > of asserting?
> 
> 
> We decided to make that assert loudly to catch dead code. Or rather,
> dead documentation that never reaches docs.
> 
> A way to catch those is to build the docs locally
> 
>    $ ninja -C build igt-gpu-tools-doc
> 
> and check the output. That would also preemptively avoid the review
> round that just points out incorrect use of multiline strings where a
> space is missing between the lines.
> 
> In general people should do some testing locally on their code before
> they send patches.
>

Agree, author as well as reviewer should test change locally. I was not
careful enough proposing HAX with igt_describe(). I wasn't aware that
for dynamic subtests it will assert. Anyway building docs is good tip
to catch this locally. 

--
Zbigniew
 
> -- 
> Petri Latvala
> 
> 
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > That patch deleted following lines "> -":
> > > 
> > > >   	igt_subtest_with_dynamic("gem-execbuf-stress") {
> > > >   		for_each_memory_region(r, drm_fd) {
> > > > -			igt_describe("Validate execbuf submission while exercising rpm "
> > > > -				     "suspend/resume cycles.");
> > > >   			igt_dynamic_f("%s", r->name)
> > > >   				gem_execbuf_stress_subtest(rounds, WAIT_STATUS, &r->ci);
> > > > -			igt_describe("Validate execbuf submission while exercising rpm "
> > > > -				     "suspend/resume cycles with extra wait.");
> > > >   			igt_dynamic_f("%s-%s", "extra-wait", r->name)
> > > >   				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA, &r->ci);
> > > >   		}
> > > 
> > > This fail will not be catched when we will use HAX.
> > > 
> > > --
> > > Kamil
> > > 
