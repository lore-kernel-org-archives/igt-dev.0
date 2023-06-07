Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B028310E4EE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 14:07:47 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 07 Jun 2023 16:07:28 +0200
Message-ID: <1890884.IobQ9Gjlxr@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <BYAPR11MB347921D98F30E435CF352D86D952A@BYAPR11MB3479.namprd11.prod.outlook.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <9166079.rMLUfLXkoz@jkrzyszt-mobl2.ger.corp.intel.com>
 <BYAPR11MB347921D98F30E435CF352D86D952A@BYAPR11MB3479.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH v5 i-g-t 0/8] Introduce KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 6 June 2023 09:54:56 CEST Piatkowski, Dominik Karol wrote:
> Hi Janusz,
> 
> > -----Original Message-----
> > From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Sent: wtorek, 6 czerwca 2023 09:47
> > To: igt-dev@lists.freedesktop.org; Piatkowski, Dominik Karol
> > <dominik.karol.piatkowski@intel.com>; Mauro Carvalho Chehab
> > <mauro.chehab@linux.intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Subject: Re: [PATCH v5 i-g-t 0/8] Introduce KUnit
> > 
> > On Monday, 5 June 2023 12:47:08 CEST Dominik Karol Piatkowski wrote:
> > > This series is a continuation of Isabella's work on introducing KUnit
> > > to IGT.
> > >
> > > Sample drm_buddy output:
> > > 	Starting subtest: all-tests
> > > 	[thread:8003] TAP version 1
> > > 	[thread:8003] Executing 6 tests in: drm_buddy
> > > 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_limit
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_limit:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest:
> > drm_buddy__drm_test_buddy_alloc_range
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_range:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest:
> > drm_buddy__drm_test_buddy_alloc_optimistic
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_optimistic:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest:
> > drm_buddy__drm_test_buddy_alloc_pessimistic
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pessimistic:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest:
> > drm_buddy__drm_test_buddy_alloc_smoke
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_smoke:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest:
> > drm_buddy__drm_test_buddy_alloc_pathological
> > > 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pathological:
> > SUCCESS (0.000s)
> > > 	Starting dynamic subtest: drm_buddy
> > > 	Dynamic subtest drm_buddy: SUCCESS (0.000s)
> > > 	Subtest all-tests: SUCCESS (0.707s)
> > 
> > It would be nice if we could see CI results from the new kunit subtests
> > before accepting the series.  Unfortunately, none of the tests seems to 
have
> > been executed within the pre-merge run.  Can we fix that?
> 
> AFAIK, Kconfig used by CI does not have required params set (CONFIG_KUNIT 
> and CONFIG_DRM_I915_KUNIT_SELFTESTS). I submitted a merge request to enable 
> these params, but it was not merged yet. The best option I can think of 
> right now, is a trybot run tested with Kconfig patch enabling these params. 
> Would that be ok with you?

I think the reason for no results from CI is that these tests trigger abort if 
kunit modules are missing, at least on my laptop:

jkrzyszt@jkrzyszt-mobl2:~/build/igt$ sudo ./tests/drm_mm
IGT-Version: 1.27.1-gbdd46c438a (x86_64) (Linux: 6.1.31-1-lts x86_64)
Starting subtest: all-tests
(drm_mm:121917) igt_kmod-WARNING: Unable to load KUnit
drm_mm: ../../git/rebasing-scripts/igt/lib/igt_core.c:1808: igt_fail: 
Assertion `_igt_dynamic_tests_executed < 0 || dynamic_failed_one' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0x17b]
 #1 [__sigaction+0x50]
 #2 [pthread_key_delete+0x14c]
 #3 [gsignal+0x18]
 #4 [abort+0xd7]
 #5 [<unknown>+0xd7]
 #6 [__assert_fail+0x46]
 #7 [igt_fail+0x121]
 #8 [__igt_kunit+0x29d]
 #9 [igt_kunit+0x6c]
 #10 [main+0x32]
 #11 [__libc_init_first+0x90]
 #12 [__libc_start_main+0x8a]
 #13 [_start+0x25]
Aborted

They should skip, I believe, not abort.

Thanks,
Janusz

> 
> Thanks,
> Dominik
> 
> > 
> > Thanks,
> > Janusz
> > 
> > >
> > > The issue of possibility of too many sublevels occurrence is solved by
> > > name concatenation.
> > >
> > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > >
> > > Dominik Karol Piatkowski (2):
> > >   Change logic of ktap parser to run on a thread
> > >   lib/igt_kmod: fix nesting igt_fixture in igt_subtest
> > >
> > > Isabella Basso (4):
> > >   lib/igt_kmod: rename kselftest functions to ktest
> > >   lib/igt_kmod.c: check if module is builtin before attempting to unload
> > >     it
> > >   lib/igt_kmod: add compatibility for KUnit
> > >   tests: DRM selftests: switch to KUnit
> > >
> > > Mauro Carvalho Chehab (2):
> > >   lib/igt_kmod: place KUnit tests on a subtest
> > >   kunit tests: add an optional name for the selftests
> > >
> > >  lib/igt_kmod.c       | 146 +++++++++-
> > >  lib/igt_kmod.h       |  14 +-
> > >  lib/igt_ktap.c       | 615
> > +++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_ktap.h       |  50 ++++
> > >  lib/meson.build      |   1 +
> > >  tests/drm_buddy.c    |   4 +-
> > >  tests/drm_mm.c       |   5 +-
> > >  tests/kms_selftest.c |  19 ++
> > >  8 files changed, 835 insertions(+), 19 deletions(-)  create mode
> > > 100644 lib/igt_ktap.c  create mode 100644 lib/igt_ktap.h
> > >
> > >
> > 
> > 
> > 
> 
> 





