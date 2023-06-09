Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A2410E67A
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 10:15:47 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 09 Jun 2023 12:15:41 +0200
Message-ID: <11320190.MucGe3eQFb@jkrzyszt-mobl2.ger.corp.intel.com>
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
To: igt-dev@lists.freedesktop.org, Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Dominik,

On Monday, 5 June 2023 12:47:08 CEST Dominik Karol Piatkowski wrote:
> This series is a continuation of Isabella's work on introducing
> KUnit to IGT.
> 
> Sample drm_buddy output:
> 	Starting subtest: all-tests
> 	[thread:8003] TAP version 1
> 	[thread:8003] Executing 6 tests in: drm_buddy
> 	Starting dynamic subtest: drm_buddy__drm_test_buddy_alloc_limit

Does TAP version 1 allow for more than one top level section starting with 
"Executing N tests in: <name>"?  If only one was expected then we could 
shorten dynamic sub-subtest names by dropping the initial top level <name> 
component from concatenated sub-subtest names, and maybe even use the top 
level <name> as IGT subtest name ("Starting subtest: <name>") 
(automatically?).

Besides, IGT traditionally uses dashes in subtest names, not underscores.  I'm 
not voting for replacing all underscores obtained from ktap with dashes, only 
using dashes as concatenation marks (where applicable) instead of your double 
underscores.

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

Having dynamic subtest names as concatenations of names from all levels of 
ktap subtest nesting (a consequence of only one dynamic sub-subtest nesting 
level expected by IGT users, including CI), I'm not sure if we should still 
report higher levels as separate subtests if we have already reported those 
nested inside them.  While CI can still be happy with that, bug 
classification, categorization and reporting as well as passrate calculation 
will be affected, I'm afraid.  Do we accept that impact?

Thanks,
Janusz


> 	Subtest all-tests: SUCCESS (0.707s)
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





