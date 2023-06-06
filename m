Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBE810E2B8
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 07:46:43 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 06 Jun 2023 09:46:38 +0200
Message-ID: <9166079.rMLUfLXkoz@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
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
To: igt-dev@lists.freedesktop.org, Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 5 June 2023 12:47:08 CEST Dominik Karol Piatkowski wrote:
> This series is a continuation of Isabella's work on introducing
> KUnit to IGT.
> 
> Sample drm_buddy output:
> 	Starting subtest: all-tests
> 	[thread:8003] TAP version 1
> 	[thread:8003] Executing 6 tests in: drm_buddy
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_limit
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_limit: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_range
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_range: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_optimistic
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_optimistic: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_pessimistic
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pessimistic: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_smoke
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_smoke: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_pathological
> 	Dynamic subtest drm_buddy__drm_test_buddy_alloc_pathological: SUCCESS (0.000s)
> 	Starting dynamic subtest: drm_buddy
> 	Dynamic subtest drm_buddy: SUCCESS (0.000s)
> 	Subtest all-tests: SUCCESS (0.707s)

It would be nice if we could see CI results from the new kunit subtests before 
accepting the series.  Unfortunately, none of the tests seems to have been 
executed within the pre-merge run.  Can we fix that?

Thanks,
Janusz

> 
> The issue of possibility of too many sublevels occurrence is solved
> by name concatenation.
> 
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> 
> Dominik Karol Piatkowski (2):
>   Change logic of ktap parser to run on a thread
>   lib/igt_kmod: fix nesting igt_fixture in igt_subtest
> 
> Isabella Basso (4):
>   lib/igt_kmod: rename kselftest functions to ktest
>   lib/igt_kmod.c: check if module is builtin before attempting to unload
>     it
>   lib/igt_kmod: add compatibility for KUnit
>   tests: DRM selftests: switch to KUnit
> 
> Mauro Carvalho Chehab (2):
>   lib/igt_kmod: place KUnit tests on a subtest
>   kunit tests: add an optional name for the selftests
> 
>  lib/igt_kmod.c       | 146 +++++++++-
>  lib/igt_kmod.h       |  14 +-
>  lib/igt_ktap.c       | 615 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_ktap.h       |  50 ++++
>  lib/meson.build      |   1 +
>  tests/drm_buddy.c    |   4 +-
>  tests/drm_mm.c       |   5 +-
>  tests/kms_selftest.c |  19 ++
>  8 files changed, 835 insertions(+), 19 deletions(-)
>  create mode 100644 lib/igt_ktap.c
>  create mode 100644 lib/igt_ktap.h
> 
> 





