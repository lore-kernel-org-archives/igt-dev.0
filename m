Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07F310E239
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 19:14:34 +0000 (UTC)
Date: Fri, 18 Nov 2022 11:14:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y3fZj+5QD9fBtOKo@nvishwa1-DESK>
References: <20221115190513.30821-1-niranjana.vishwanathapura@intel.com>
 <42fed476-5f00-90e2-83ba-df17a9acc73a@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <42fed476-5f00-90e2-83ba-df17a9acc73a@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix memory
 requirement assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 02:54:40PM +0000, Matthew Auld wrote:
>On 15/11/2022 19:05, Niranjana Vishwanathapura wrote:
>>The reclaim subtest do not require the alloc_size memory
>>allocations. Ensure the memory requirement assert is only
>>applied for other subtests.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  tests/i915/gem_shrink.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>>diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
>>index e3e20dfc9..380d2c846 100644
>>--- a/tests/i915/gem_shrink.c
>>+++ b/tests/i915/gem_shrink.c
>>@@ -456,9 +456,6 @@ igt_main
>>  			 num_processes, alloc_size);
>>  		alloc_size <<= 20;
>>-		igt_require_memory(num_processes, alloc_size,
>>-				   CHECK_SWAP | CHECK_RAM);
>>-
>
>If that's the case then all the other stuff in the fixture is not 
>really used either (like alloc_size, num_processes etc). Maybe just 
>move the fixture instead?
>
>igt_subtest_group {
>	igt_fixture {
>
>	}
>
>	for(const struct test *t = tests; t->name; t++) {
>	....	
>}
>
>igt_subtest("reclaim")
>...
>

Ok, but the igt_fixture() inside the igt_subtest_group still gets executed
when we run reclaim subtest (with '--r reclaim').

Niranjana

>>  		close(fd);
>>  	}
>>@@ -467,9 +464,12 @@ igt_main
>>  	for(const struct test *t = tests; t->name; t++) {
>>  		for(const struct mode *m = modes; m->suffix; m++) {
>>-			igt_subtest_f("%s%s", t->name, m->suffix)
>>+			igt_subtest_f("%s%s", t->name, m->suffix) {
>>+				igt_require_memory(num_processes, alloc_size,
>>+						   CHECK_SWAP | CHECK_RAM);
>>  				run_test(num_processes, alloc_size,
>>  					 t->func, m->flags);
>>+			}
>
>
>
>>  		}
>>  	}
>>  }
