Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C08C3ABA2
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 08:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22B010E2E5;
	Mon, 16 Sep 2024 08:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDeqJnCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B8310E2E5
 for <IGT-Dev@lists.freedesktop.org>; Mon, 16 Sep 2024 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726474659; x=1758010659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udP1kq1qIod2+x5HqjoxdLiimFW1QQohUXPwmYjbqQI=;
 b=JDeqJnCt+Rh9KIb5/6oH0SXf5yw/P86EzXAh/91IG+2BfJOFkqhbijAd
 O3R8nlqA/kA34lhRGGyQvGkXPOYvHSDqSGASE2+1r0lvIKHTQI1axDRmh
 vsQKklBdUt9sR2Wp2ihLVT6sEYYRKlTlt/IcV/mnOIvLjwEcNWOJJSlbE
 kctWsD6ZxPFr4DkXxdXGz4gpqaJODlhd7o3+CXM7wsMnpeSu8YTtcLIBE
 ztgeOU1FU4tBKGWyKgTO9jgu0hwbRLY4O/cpNFtODXT+FB1xLSB1cYbG3
 RUxxj96BkHZVB4jku40+lRS8/+uh37jD62hcFsr6zfE0gKvVeuFGSXUEK A==;
X-CSE-ConnectionGUID: AxT4FXp2Ta6DUOlv//QoRw==
X-CSE-MsgGUID: iOMcVXKISLSgQjELOB2/ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="36640203"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="36640203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:17:39 -0700
X-CSE-ConnectionGUID: H4kBz5xZSJChrOTzNmcwLA==
X-CSE-MsgGUID: 74W35odDT92VT6PmlI+1Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="68756308"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.247])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:17:38 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT-Dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
Date: Mon, 16 Sep 2024 10:17:34 +0200
Message-ID: <3240976.5fSG56mABF@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <84c6520c-b634-4be3-89fd-98595b537cb8@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <1942260.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
 <84c6520c-b634-4be3-89fd-98595b537cb8@intel.com>
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

Hi John,

On Saturday, 14 September 2024 02:20:32 GMT+2 John Harrison wrote:
> On 8/29/2024 02:57, Janusz Krzysztofik wrote:
> > Hi John,
> >
> > On Wednesday, 28 August 2024 20:04:06 GMT+2 John Harrison wrote:
> >> On 8/26/2024 06:07, Janusz Krzysztofik wrote:
> >>> Hi John, Kamil,
> >>>
> >>> On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
> >>>> Hi John.C.Harrison,
> >>>> On 2024-08-23 at 11:24:18 -0700, John.C.Harrison@Intel.com wrote:
> >>>>> From: johnharr <johnharr@invalid-email.com>
> >>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>> Again invalid e-mail here.
> >>>>
> >>>>> The list of supported kunit tests is currently hard coded.
> >>> That pattern originates from i915_selftest, where there are 3 stable 
subtests,
> >>> "mock", "live" and "perf", each of them executing a (possibly long) list 
of
> >>> dynamic sub-subtests actually provided by the module for each category.  
Also,
> >>> IIRC there was a separate module for each Xe test suite before, each 
mapped to
> >>> a separate IGT test, later merged into one module with multiple suites 
and one
> >>> test with multiple corresponding subtests.
> >> Not sure if you are just explaining the history of the test or making a
> >> suggestion as to how it should evolve next?
> > Both, I think.  Maybe not the history, but origin of ideas standing behind 
the
> > implementation, and how tests are expected to use it (and maybe evolve if 
now
> > doing that in a different way).
> >
> >>>>> Which means
> >>>>> that adding a new test to the kernel also requires patches to IGT as
> >>>>> well.
> >>>>>
> >>>>> The list of available kunit tests is already exported by the kernel.
> >>>>> So there is no need to bake a list into the IGT source code. So, add
> >>>>> support for querying the test list dynamically.
> >>>>>
> >>>>> NB: Currently, the test list can only be queried by root but the IGT
> >>>>> build system queries all tests at compile time. In theory this should
> >>>>> not be a problem. However, the kunit helper code is all written to run
> >>>>> inside a test and not inside the prep code, which means that when it
> >>>>> fails to open the root only interfaces, it calls 'skip'. And skip is
> >>>>> not allowed outside of running a test. Hence the build fails with:
> >>>>>     skipping is allowed only in fixtures, subtests or igt_simple_main
> >>>> Looks like we should fix it, move out skips from kunit libs.
> >>> I suggest you consider a different approach: for a module, call 
igt_kunit()
> >>> only once, with NULL suite argument.  As a result, you'll get results 
from one
> >>> IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-
subtests
> >>> called "<test_suite>-<test_case>", one for each test case provided by 
the
> >>> module.
> >> I'm not following. This is what my patch does, isn't it?
> > No, your patch introduces a runtime determined list of subtests -- 
something
> > not existent in IGT.
> >
> > An IGT test may consist of one or more statically defined subtests with 
pre-
> > defined names.  The term dynamic subtest is usually used in two meanings.  
It
> > may mean a subtest of type igt_subtest_with_dynamic, still with a pre-
defined
> > name, but with a runtime determined list of sub-subtests, sometimes called
> > dynamic sub-subtests, but often also called just dynamic subtests.  Names 
of
> > dynamic sub-subtests are determined at runtime.
> >
> > My approach tries to address your need for a maintenance-free kunit IGT 
test
> > source file in a different way.  I'm following the IGT standard of 
statically
> > defined list of subtests with pre-defined names: one subtest of type
> > igt_subtest_with_dynamic, named after the kunit test module name which you
> > have to enter into the test code anyway, and providing all test cases from
> > all test suites contained in that module reported as dynamic sub-subtests
> > named <test_suite>-<test_case>.
> Can you please prototype how to do this?  I can read your words but I 
> don't really get your meaning and I have no clue how to implement what 
> you are saying.

The test code may look as simple as:

igt_main
{
        igt_kunit("xe_live_test", NULL, NULL);
}

Then, igt_kunit() will use xe_live_test module and should report results from 
all its KUnit test cases as results from a set of IGT dynamic sub-subtests 
"<test_suite>-<test_case>" under a single IGT subtest "xe_live".

Janusz

> 
> John.
> 
> 




