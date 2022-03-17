Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EFB10EB69
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 15:48:27 +0000 (UTC)
Date: Thu, 17 Mar 2022 16:48:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YjNYR2c027KZwtsT@kamilkon-DESK1>
References: <YiBboHmOS4cuU1iH@zkempczy-mobl2> <YiCNFUCFm8qWn4W0@kamilkon-DESK1>
 <YiCtTfYqWTfvfX9z@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YiCtTfYqWTfvfX9z@zkempczy-mobl2>
Subject: Re: [igt-dev] [RFC] Use HAX for series which add igt_describe
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

Dnia 2022-03-03 at 12:58:05 +0100, Zbigniew Kempczyński napisał(a):
> On Thu, Mar 03, 2022 at 10:40:37AM +0100, Kamil Konieczny wrote:
> > Dnia 2022-03-03 at 07:09:36 +0100, Zbigniew Kempczyński napisał(a):
> > > Hi all.
> > > 
> > > Last time we got number of patches which don't change test logic so
> > > they trigger BAT + IGT runs.
> > > 
> > > This is imo a waste of time for CI as it doesn't improve anything apart
> > > of better in-test documentation.
> > > 
> > > As such patches needs to be reviewed I think we could use HAX patch in
> > > which we remove all subtests in tests/intel-ci/fast-feedback.testlist
> > > adding line with:
> > > 
> > > igt@meta_test@fail-result
> > > 
> > > Any comments are welcome.
> > > --
> > > Zbigniew
> > 
> > imho good idea, but I assume that this should be done by the person
> > sending. I wonder (and I suppose it is question to CI team) if it
> > can be automated based on content of patch ? So no need for additional
> > HAX and cover-letter ?
> > One more idea - check tag in subject ? like [... NO-TESTS 1/1] ...
> > 
> > We can start with HAX though.
> 
> I will accept any solution which would lead to stop unnecessary runs.
> Both - HAX or NO-TESTS base on people awereness but I think it is worth
> to do this. @Petri - your opinion?
> 
> --
> Zbigniew

One downside is when developers document dynamic subtests, see
"test/i915_pm_rpm: Remove igt_describe() from dynamic subtest"

./i915_pm_rpm --run gem-execbuf-stress
[cut]
Starting subtest: gem-execbuf-stress
documenting dynamic subsubtests is impossible, document the subtest instead.please refer to lib/igt_core documentation
i915_pm_rpm: ../lib/igt_core.c:365: internal_assert: Assertion `0' failed.
Received signal SIGABRT.

That patch deleted following lines "> -":

>   	igt_subtest_with_dynamic("gem-execbuf-stress") {
>   		for_each_memory_region(r, drm_fd) {
> -			igt_describe("Validate execbuf submission while exercising rpm "
> -				     "suspend/resume cycles.");
>   			igt_dynamic_f("%s", r->name)
>   				gem_execbuf_stress_subtest(rounds, WAIT_STATUS, &r->ci);
> -			igt_describe("Validate execbuf submission while exercising rpm "
> -				     "suspend/resume cycles with extra wait.");
>   			igt_dynamic_f("%s-%s", "extra-wait", r->name)
>   				gem_execbuf_stress_subtest(rounds, WAIT_STATUS | WAIT_EXTRA, &r->ci);
>   		}

This fail will not be catched when we will use HAX.

--
Kamil
