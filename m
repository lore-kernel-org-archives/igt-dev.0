Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5634C35FF9
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 09:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8193410E12B;
	Tue, 17 Sep 2024 09:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7tqLEGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED8E10E12B
 for <IGT-Dev@lists.freedesktop.org>; Tue, 17 Sep 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726564484; x=1758100484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YrFfe6wHQ8XAFhXfbEcNNCFZWsmBTdYTzO+ZKWZgh6o=;
 b=m7tqLEGsot/IgngjF9Tmym3SnYe/XSLJHgQz+dTM0PfY3NORcFtXSpvZ
 jTdVpSWrE+yl0U2gX2mpFipY/UJ4SMF3Ft19DWsFxxFVAk2pbp9Dm3XrS
 JCgP/NRIrAuurYS5M5fbJXwYtHm/dtPkGDZ+6j0JC4ClpIVYFN6fwtzkM
 VDz6ywnpBSX6Fxv9JUDtAX6bFcR4G46Or2s4tvl2n/7l/oLGRUBMNdjxk
 /gd6n6xRbBMVb24+CGQy/OVOAbozdVg9U+hg1kskzZTXwTgpJP6j+gwUK
 tU/JSJRuoQsldsGTmP7HbhgJEIK2+Z/XnT7QdP1aaf9bU2V0jWMDyEzh0 A==;
X-CSE-ConnectionGUID: 7pUo9nhkRaag3d/l5jNC5A==
X-CSE-MsgGUID: YYcWp2dkSPWRHmCKY9c7eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36548255"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36548255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:14:43 -0700
X-CSE-ConnectionGUID: 6q0w9rkzST23013apDBM8A==
X-CSE-MsgGUID: aQIrB/g0RkG8jXvoxKVKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69089375"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 02:14:42 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT-Dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
Date: Tue, 17 Sep 2024 11:14:39 +0200
Message-ID: <2670381.k3LOHGUjKi@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7968ee02-8cbd-4e66-8490-0628fb47b4a5@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <3240976.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
 <7968ee02-8cbd-4e66-8490-0628fb47b4a5@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tuesday, 17 September 2024 00:10:42 GMT+2 John Harrison wrote:
> On 9/16/2024 01:17, Janusz Krzysztofik wrote:
> > Hi John,
> >
> > On Saturday, 14 September 2024 02:20:32 GMT+2 John Harrison wrote:
> >> On 8/29/2024 02:57, Janusz Krzysztofik wrote:
> >>> Hi John,
> >>>
> >>> On Wednesday, 28 August 2024 20:04:06 GMT+2 John Harrison wrote:
> >>>> On 8/26/2024 06:07, Janusz Krzysztofik wrote:
> >>>>> Hi John, Kamil,
> >>>>>
> >>>>> On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
> >>>>>> Hi John.C.Harrison,
> >>>>>> On 2024-08-23 at 11:24:18 -0700,John.C.Harrison@Intel.com  wrote:
> >>>>>>> From: johnharr<johnharr@invalid-email.com>
> >>>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>>>> Again invalid e-mail here.
> >>>>>>
> >>>>>>> The list of supported kunit tests is currently hard coded.
> >>>>> That pattern originates from i915_selftest, where there are 3 stable
> > subtests,
> >>>>> "mock", "live" and "perf", each of them executing a (possibly long) list
> > of
> >>>>> dynamic sub-subtests actually provided by the module for each category.
> > Also,
> >>>>> IIRC there was a separate module for each Xe test suite before, each
> > mapped to
> >>>>> a separate IGT test, later merged into one module with multiple suites
> > and one
> >>>>> test with multiple corresponding subtests.
> >>>> Not sure if you are just explaining the history of the test or making a
> >>>> suggestion as to how it should evolve next?
> >>> Both, I think.  Maybe not the history, but origin of ideas standing behind
> > the
> >>> implementation, and how tests are expected to use it (and maybe evolve if
> > now
> >>> doing that in a different way).
> >>>
> >>>>>>> Which means
> >>>>>>> that adding a new test to the kernel also requires patches to IGT as
> >>>>>>> well.
> >>>>>>>
> >>>>>>> The list of available kunit tests is already exported by the kernel.
> >>>>>>> So there is no need to bake a list into the IGT source code. So, add
> >>>>>>> support for querying the test list dynamically.
> >>>>>>>
> >>>>>>> NB: Currently, the test list can only be queried by root but the IGT
> >>>>>>> build system queries all tests at compile time. In theory this should
> >>>>>>> not be a problem. However, the kunit helper code is all written to run
> >>>>>>> inside a test and not inside the prep code, which means that when it
> >>>>>>> fails to open the root only interfaces, it calls 'skip'. And skip is
> >>>>>>> not allowed outside of running a test. Hence the build fails with:
> >>>>>>>      skipping is allowed only in fixtures, subtests or igt_simple_main
> >>>>>> Looks like we should fix it, move out skips from kunit libs.
> >>>>> I suggest you consider a different approach: for a module, call
> > igt_kunit()
> >>>>> only once, with NULL suite argument.  As a result, you'll get results
> > from one
> >>>>> IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-
> > subtests
> >>>>> called "<test_suite>-<test_case>", one for each test case provided by
> > the
> >>>>> module.
> >>>> I'm not following. This is what my patch does, isn't it?
> >>> No, your patch introduces a runtime determined list of subtests --
> > something
> >>> not existent in IGT.
> >>>
> >>> An IGT test may consist of one or more statically defined subtests with
> > pre-
> >>> defined names.  The term dynamic subtest is usually used in two meanings.
> > It
> >>> may mean a subtest of type igt_subtest_with_dynamic, still with a pre-
> > defined
> >>> name, but with a runtime determined list of sub-subtests, sometimes called
> >>> dynamic sub-subtests, but often also called just dynamic subtests.  Names
> > of
> >>> dynamic sub-subtests are determined at runtime.
> >>>
> >>> My approach tries to address your need for a maintenance-free kunit IGT
> > test
> >>> source file in a different way.  I'm following the IGT standard of
> > statically
> >>> defined list of subtests with pre-defined names: one subtest of type
> >>> igt_subtest_with_dynamic, named after the kunit test module name which you
> >>> have to enter into the test code anyway, and providing all test cases from
> >>> all test suites contained in that module reported as dynamic sub-subtests
> >>> named <test_suite>-<test_case>.
> >> Can you please prototype how to do this?  I can read your words but I
> >> don't really get your meaning and I have no clue how to implement what
> >> you are saying.
> > The test code may look as simple as:
> >
> > igt_main
> > {
> >          igt_kunit("xe_live_test", NULL, NULL);
> > }
> >
> > Then, igt_kunit() will use xe_live_test module and should report results from
> > all its KUnit test cases as results from a set of IGT dynamic sub-subtests
> > "<test_suite>-<test_case>" under a single IGT subtest "xe_live".
> >
> > Janusz
> >
> Doing that solves the problem of not generating a test list at compile 
> time. But it creates the problem of not being able to generate a test 
> list at all:
> 
>     0:28> sudo ./build/tests/xe_live_ktest --show-testlist
>     igt@xe_live_ktest@xe_live
>     0:29> sudo ./build/tests/xe_live_ktest --list-subtests
>     xe_live
>     0:30> sudo ./build/tests/xe_live_ktest --describe
>     SUB xe_live ../lib/igt_kmod.c:1475:
>        NO DOCUMENTATION!
> 
> 
> And that last is clearly wrong because if I don't have a comment 
> description of xe_live then it gives a build time error.

I suggested only how the code could look like, leaving necessary documentation 
changes to an implementer.  Please have a look at tests/intel/i915_selftest.c 
to see how subtest documentation is managed there.  There are 3 subtests: 
mock, live and perf, each of them having a bunch of dynamic sub-subtests 
also documented.

> 
> It is possible to run a specific sub-test, but you have to know the name 
> already. E.g.:
> 
>     0:25> sudo ./build/tests/xe_live_ktest --dynamic-subtest xe_bo-xe_bo_evict_kunit
>     IGT-Version: 1.28-g8df80ef3edc8 (x86_64) (Linux: 6.11.0-rc5-g2g x86_64)
>     Using IGT_SRANDOM=1726523447 for randomisation
>     Starting subtest: xe_live
>     Starting dynamic subtest: xe_bo-xe_bo_evict_kunit
>     ...
> 
> 
> That seems less than ideal.

AFAICU, CI now depends on availability of subtest documentation in IGT source 
files, from where a list of IGT subtests (not including dynamic sub-subtests, 
I believe) is derived at compile time.  Then, some of your options are:

1. Keep adding new subtests with documentation to xe_live_ktest IGT test when 
   new test suites are added to xe_live_test module, otherwise new test cases 
   added to the module won't be executed.
2. Use one subtest, as I suggested, correctly documented, and optionally 
   update the xe_live_ktest IGT test documentation with description of new 
   dynamic sub-subtests corresponding to new test cases added to the 
   xe_live_test module,
3. Develop and implement a new (hardware independent) way of providing CI with 
   a complete list of IGT subtests, including those corresponding to all KUnit 
   test suites provided by KUnit modules used in IGT tests, at compile time.

I'm not against the third option, I only tried to show you a ready-to-use even 
if not ideal option 2.  With that approach, if you add a new test suite to the 
xe_live_test module without touching the xe_live_ktest IGT test, those new 
test cases, unlike now, will be automatically executed by in CI shards runs 
and their results reported, only their (optional) documentation will be 
missing if you don't add it to the xe_live_ktest IGT test source file.

Thanks,
Janusz

> 
> John.
> 




