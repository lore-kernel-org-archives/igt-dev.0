Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48061C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 13:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7410E135;
	Mon, 26 Aug 2024 13:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaDLtmeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1AA10E135
 for <IGT-Dev@lists.freedesktop.org>; Mon, 26 Aug 2024 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724677641; x=1756213641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bwdCMzzxflpt8pgnlz++wPfcCvcsNqE7pN0PNUdaS4E=;
 b=EaDLtmeP52kX3CVXJP5ezWPK79oMb3fFSlLmcA5dNsTe/+1olJu65dw7
 CiTW0OGBb9vwydhQhQyF7PQryGtDgk8bvlYkTSzh3tulXopxdHRmG3KrY
 PAKolGvWoqaQHnUEXWemztatVo7tfrm9nM2fQR0ZIQIc1F8/YrXPCt3c/
 +dFEI1opJYU4vTVvY5FD1S2Pk1alvGN0EC47j97oWzJC+4cUTMkYz0s9l
 0WJX2QFZ4XIcREYf7cQGz2jr+RmZ/G0mRxn8EsN5lnRmE2IzElZJIQO5x
 87MTBLJ1ZE2fCKNcEaD5rAMYolrezU7XPXBMKkNImY+jkWfeUo45MOQro g==;
X-CSE-ConnectionGUID: KqvhC0j/SKK7ZHa29bB6jg==
X-CSE-MsgGUID: FUZn92+iQ+CvD/ssuJ+icw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23228832"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="23228832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:07:21 -0700
X-CSE-ConnectionGUID: dt2zRk2YSdqlCJy5Vpzh9Q==
X-CSE-MsgGUID: 7QF8Xqa2S6KsmJroBuOCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="66834211"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.130])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:07:19 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John.C.Harrison@intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: IGT-Dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
Date: Mon, 26 Aug 2024 15:07:17 +0200
Message-ID: <1941664.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240826114645.76jn7mlknpirgoml@kamilkon-DESK.igk.intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <20240826114645.76jn7mlknpirgoml@kamilkon-DESK.igk.intel.com>
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

Hi John, Kamil,

On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
> Hi John.C.Harrison,
> On 2024-08-23 at 11:24:18 -0700, John.C.Harrison@Intel.com wrote:
> > From: johnharr <johnharr@invalid-email.com>
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Again invalid e-mail here.
> 
> > 
> > The list of supported kunit tests is currently hard coded. 

That pattern originates from i915_selftest, where there are 3 stable subtests, 
"mock", "live" and "perf", each of them executing a (possibly long) list of 
dynamic sub-subtests actually provided by the module for each category.  Also, 
IIRC there was a separate module for each Xe test suite before, each mapped to 
a separate IGT test, later merged into one module with multiple suites and one 
test with multiple corresponding subtests.

> > Which means
> > that adding a new test to the kernel also requires patches to IGT as
> > well.
> > 
> > The list of available kunit tests is already exported by the kernel.
> > So there is no need to bake a list into the IGT source code. So, add
> > support for querying the test list dynamically.
> > 
> > NB: Currently, the test list can only be queried by root but the IGT
> > build system queries all tests at compile time. In theory this should
> > not be a problem. However, the kunit helper code is all written to run
> > inside a test and not inside the prep code, which means that when it
> > fails to open the root only interfaces, it calls 'skip'. And skip is
> > not allowed outside of running a test. Hence the build fails with:
> >   skipping is allowed only in fixtures, subtests or igt_simple_main
> 
> Looks like we should fix it, move out skips from kunit libs.

I suggest you consider a different approach: for a module, call igt_kunit() 
only once, with NULL suite argument.  As a result, you'll get results from one 
IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-subtests 
called "<test_suite>-<test_case>", one for each test case provided by the 
module.

> 
> > 
> > And of course, putting all the query code inside an igt_fixture block
> > means it doesn't get run as part of --show-testlist or --list-subtests.
> > 
> > Reworking the kunit code to fail cleanly rather than skipping
> > everywhere seems much more invasive. It is also not clear why the
> > kunit code is considered 'library' when it is execlusively used from
> > the kunit test alone!? 

Current users:
	igt$ grep -rl igt_kunit tests/
	tests/intel/xe_live_ktest.c
	tests/kms_selftest.c
	tests/drm_mm.c
	tests/drm_buddy.c

The other 3 were first converted from i915_selftest standard to KUnit still 
before Xe KUnit IGT tests started appearing.

Thanks,
Janusz

> > So posting this as an RFC before going too far
> > down the possible rabbit hole.
> > 
> 
> As I see this, it is a lib because some other vendor (like amdpgu)
> could use it.
> 
> +cc Janusz
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> 
> btw could you split this into two patches, one for lib/* and
> one for tests/intel/xe_live_ktest ?
> 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  lib/igt_kmod.c              | 68 +++++++++++++++++++++++++++++++++++++
> >  lib/igt_kmod.h              |  6 ++++
> >  tests/intel/xe_live_ktest.c | 60 ++++++++++++++++----------------
> >  3 files changed, 103 insertions(+), 31 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 464c0dcf484a..69c1254b397c 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -1414,6 +1414,74 @@ static void __igt_kunit(struct igt_ktest *tst,
> >  	}
> >  }
> >  
> > +/**
> > + * igt_kunit:
> > + * @module_name: the name of the module
> > + * @suite: the name of test suite to be executed, also used as subtest name;
> > + *	   if NULL then test cases from all test suites provided by the module
> > + *	   are executed as dynamic sub-subtests of one IGT subtest, which name
> > + *	   is derived from the module name by cutting off its optional trailing
> > + *	   _test or _kunit suffix
> > + * @opts: options to load the module
> > + *
> > + * Loads the test module, parses its (k)tap dmesg output, then unloads it
> > + */
> > +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names)
> > +{
> > +	char debugfs_path[PATH_MAX] = { '\0', };
> > +	struct igt_ktest tst = { .kmsg = -1, };
> > +	struct igt_ktap_results *ktap = NULL;
> > +	const char *subtest;
> > +	char *suite_name = NULL, *case_name = NULL;
> > +	DIR *debugfs_dir = NULL;
> > +	IGT_LIST_HEAD(tests);
> > +
> > +	subtest = strdup(module_name);
> > +	if (!igt_debug_on(!subtest)) {
> > +		char *suffix = strstr(subtest, "_test");
> > +
> > +		if (!suffix)
> > +			suffix = strstr(subtest, "_kunit");
> > +
> > +		if (suffix)
> > +			*suffix = '\0';
> > +	}
> > +
> > +	igt_require(subtest);
> > +
> > +	igt_require(!igt_ktest_init(&tst, module_name));
> > +	igt_require(!igt_ktest_begin(&tst));
> > +
> > +	igt_ignore_warn(igt_kmod_load("kunit", NULL));
> > +
> > +	kunit_debugfs_path(debugfs_path);
> > +	igt_info("kunit path: %s\n", debugfs_path);
> > +	if (igt_debug_on(!*debugfs_path) ||
> > +	    !kunit_get_tests(&tests, &tst, NULL, opts, debugfs_path, &debugfs_dir, &ktap)) {
> > +		igt_info("kunit - no tests found!?\n");
> > +	} else {
> > +		struct igt_ktap_result *t;
> > +		igt_info("kunit tests:\n");
> > +		igt_list_for_each_entry(t, &tests, link) {
> > +			struct igt_kunit_names *name = malloc(sizeof(*name));
> > +			name->suite = strdup(t->suite_name);
> > +			name->sub = strdup(t->case_name);
> > +			igt_info("  %s / %s\n", t->suite_name, t->case_name);
> > +			igt_list_add(&name->link, names);
> > +		}
> > +	}
> > +
> > +	igt_ktap_free(&ktap);
> > +
> > +	kunit_results_free(&tests, &suite_name, &case_name);
> > +
> > +	if (debugfs_dir)
> > +		closedir(debugfs_dir);
> > +
> > +	igt_ktest_end(&tst);
> > +	igt_ktest_fini(&tst);
> > +}
> > +
> >  /**
> >   * igt_kunit:
> >   * @module_name: the name of the module
> > diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> > index efb46da128d4..2f608eb69d48 100644
> > --- a/lib/igt_kmod.h
> > +++ b/lib/igt_kmod.h
> > @@ -71,7 +71,13 @@ static inline int igt_xe_driver_unload(void)
> >  int igt_amdgpu_driver_load(const char *opts);
> >  int igt_amdgpu_driver_unload(void);
> >  
> > +struct igt_kunit_names {
> > +	char *suite;
> > +	char *sub;
> > +	struct igt_list_head link;
> > +};
> >  void igt_kunit(const char *module_name, const char *name, const char *opts);
> > +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names);
> >  
> >  void igt_kselftests(const char *module_name,
> >  		    const char *module_options,
> > diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> > index 4376d5df7751..13265e87ba9d 100644
> > --- a/tests/intel/xe_live_ktest.c
> > +++ b/tests/intel/xe_live_ktest.c
> > @@ -9,40 +9,38 @@
> >   * Sub-category: kunit
> >   * Functionality: kunit test
> >   * Test category: functionality test
> > - *
> > - * SUBTEST: xe_bo
> > - * Description:
> > - *	Kernel dynamic selftests to check if GPU buffer objects are
> > - *	being handled properly.
> > - * Functionality: bo
> > - *
> > - * SUBTEST: xe_dma_buf
> > - * Description: Kernel dynamic selftests for dmabuf functionality.
> > - * Functionality: dmabuf test
> > - *
> > - * SUBTEST: xe_migrate
> > - * Description:
> > - *	Kernel dynamic selftests to check if page table migrations
> > - *	are working properly.
> > - * Functionality: migrate
> > - *
> > - * SUBTEST: xe_mocs
> > - * Description:
> > - *	Kernel dynamic selftests to check mocs configuration.
> > - * Functionality: mocs configuration
> >   */
> >  
> 
> Does that mean we will not have any subtests here? The point
> into moving subtests names into documentation was to have a testlist
> generated during compilation, so it will not depend on running
> test with --list option. Adding also Katarzyna to cc.
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> 
> Regards,
> Kamil
> 
> > -static const char *live_tests[] = {
> > -	"xe_bo",
> > -	"xe_dma_buf",
> > -	"xe_migrate",
> > -	"xe_mocs",
> > -};
> > -
> >  igt_main
> >  {
> > -	int i;
> > +	IGT_LIST_HEAD(names);
> > +	IGT_LIST_HEAD(done);
> > +	struct igt_kunit_names *name, *cmp;
> > +
> > +	igt_kunit_get_test_names("xe_live_test", NULL, &names);
> > +
> > +	while (!igt_list_empty(&names)) {
> > +		bool found = false;
> > +
> > +		name = igt_list_first_entry(&names, name, link);
> > +		igt_list_del(&name->link);
> > +
> > +		/*
> > +		 * Retuned list is sub-tests.
> > +		 * So, need filter out duplicated top level names.
> > +		 */
> > +		igt_list_for_each_entry(cmp, &done, link) {
> > +			if (strcmp(name->suite, cmp->suite) != 0)
> > +				continue;
> > +
> > +			found = true;
> > +		}
> > +
> > +		if (found)
> > +			continue;
> > +
> > +		igt_list_add(&name->link, &done);
> >  
> > -	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
> > -		igt_kunit("xe_live_test", live_tests[i], NULL);
> > +		igt_kunit("xe_live_test", name->suite, NULL);
> > +	}
> >  }
> 




