Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390AA6E199
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 12:58:29 +0000 (UTC)
References: <20200408151213.30717-1-arjun.melkaveri@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <0e608658-a3f9-7638-fe99-9db4a1ff9b3d@linux.intel.com>
Date: Tue, 14 Apr 2020 13:58:25 +0100
MIME-Version: 1.0
In-Reply-To: <20200408151213.30717-1-arjun.melkaveri@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V5]tests/i915/gem_sync.c :Added
 __for_each_physical_engine to utilize all available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 08/04/2020 16:12, Arjun Melkaveri wrote:
> Replaced the legacy for_each_engine* defines with the ones
> implemented in the gem_engine_topology library.
> 
> Used  gem_context_clone_with_engines
> to make sure that engine index was potentially created
> based on a  default context with engine map configured.
> 
> Added gem_reopen_driver and gem_context_copy_engines
> to transfer the engine map from parent fd default
> context.
> 
> V2:
> Added Legacy engine coverage for sync_ring and sync_all.
> 
> V3:
> Added back ALL_ENGINES. Corrected Test cases that used
> gem_reopen_driver in fork. Which was not recommended.
> 
> V4:
> Removed gem_require_ring and gem_can_store_dword.
> 
> V5:
> Addressed the review comments.
> divided tests into static for ALL_Engine test cases
>   and dynamic for multiple engine .

I see Chris has been giving you some feedback but I haven't been 
following closely. In case of conflicting advice please double-check 
with both. More below.

> 
> Cc: Dec Katarzyna <katarzyna.dec@intel.com>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>   tests/i915/gem_sync.c | 290 +++++++++++++++++++++++++++---------------
>   1 file changed, 185 insertions(+), 105 deletions(-)
> 
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 2ef55ecc..a93fa63a 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -24,6 +24,9 @@
>   #include <time.h>
>   #include <pthread.h>
>   
> +#include "igt_debugfs.h"
> +#include "igt_dummyload.h"
> +#include "igt_gt.h"
>   #include "igt.h"
>   #include "igt_sysfs.h"
>   
> @@ -37,6 +40,9 @@
>   #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
>   
>   #define ENGINE_MASK  (I915_EXEC_RING_MASK | LOCAL_I915_EXEC_BSD_MASK)
> +#define RESET_TIMEOUT_MS (2 * MSEC_PER_SEC)
> +static unsigned long reset_timeout_ms = RESET_TIMEOUT_MS;
> +#define NSEC_PER_MSEC (1000 * 1000ull)
>   
>   IGT_TEST_DESCRIPTION("Basic check of ring<->ring write synchronisation.");
>   
> @@ -78,24 +84,35 @@ out:
>   	return ts.tv_sec + 1e-9*ts.tv_nsec;
>   }
>   
> +static void cleanup(int i915)
> +{
> +	igt_drop_caches_set(i915,
> +			    /* cancel everything */
> +			    DROP_RESET_ACTIVE | DROP_RESET_SEQNO |
> +			    /* cleanup */
> +			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> +	igt_require_gem(i915);
> +}
> +
> +
>   static void
>   sync_ring(int fd, unsigned ring, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +		__for_each_physical_engine(fd, e2) {
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   
>   		num_children *= num_engines;
>   	} else {
> -		gem_require_ring(fd, ring);
>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -139,7 +156,7 @@ sync_ring(int fd, unsigned ring, int num_children, int timeout)
>   }
>   
>   static void
> -idle_ring(int fd, unsigned ring, int timeout)
> +idle_ring(int fd, unsigned int ring, int num_children, int timeout)
>   {
>   	const uint32_t bbe = MI_BATCH_BUFFER_END;
>   	struct drm_i915_gem_exec_object2 object;
> @@ -180,24 +197,23 @@ idle_ring(int fd, unsigned ring, int timeout)
>   static void
>   wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   		igt_require(num_engines);
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));

Why it is okay to remove the can_store_dword check?

>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -290,26 +306,26 @@ wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>   	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
>   }
>   
> -static void active_ring(int fd, unsigned ring, int timeout)
> +static void active_ring(int fd, unsigned int ring,
> +			int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   		igt_require(num_engines);
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));

Same here and more below.

>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -359,24 +375,23 @@ static void active_ring(int fd, unsigned ring, int timeout)
>   static void
>   active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   		igt_require(num_engines);
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));
>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -493,26 +508,25 @@ active_wakeup_ring(int fd, unsigned ring, int timeout, int wlen)
>   static void
>   store_ring(int fd, unsigned ring, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	const int gen = intel_gen(intel_get_drm_devid(fd));
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   
>   		num_children *= num_engines;
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));
>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -608,6 +622,7 @@ store_ring(int fd, unsigned ring, int num_children, int timeout)
>   static void
>   switch_ring(int fd, unsigned ring, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	const int gen = intel_gen(intel_get_drm_devid(fd));
>   	unsigned engines[16];
>   	const char *names[16];
> @@ -616,20 +631,18 @@ switch_ring(int fd, unsigned ring, int num_children, int timeout)
>   	gem_require_contexts(fd);
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   
>   		num_children *= num_engines;
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));
>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -931,8 +944,9 @@ __store_many(int fd, unsigned ring, int timeout, unsigned long *cycles)
>   }
>   
>   static void
> -store_many(int fd, unsigned ring, int timeout)
> +store_many(int fd, unsigned int ring, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned long *shared;
>   	const char *names[16];
>   	int n = 0;
> @@ -943,22 +957,20 @@ store_many(int fd, unsigned ring, int timeout)
>   	intel_detect_and_clear_missed_interrupts(fd);
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			if (!gem_can_store_dword(fd, eb_ring(e)))
> +		__for_each_physical_engine(fd, e2) {
> +			if (!gem_class_can_store_dword(fd, e2->class))
>   				continue;
>   
>   			igt_fork(child, 1)
>   				__store_many(fd,
> -					     eb_ring(e),
> +					     e2->flags,
>   					     timeout,
>   					     &shared[n]);
>   
> -			names[n++] = e->name;
> +			names[n++] = e2->name;
>   		}
>   		igt_waitchildren();
>   	} else {
> -		gem_require_ring(fd, ring);
> -		igt_require(gem_can_store_dword(fd, ring));
>   		__store_many(fd, ring, timeout, &shared[n]);
>   		names[n++] = NULL;
>   	}
> @@ -1025,15 +1037,16 @@ sync_all(int fd, int num_children, int timeout)
>   static void
>   store_all(int fd, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e;
>   	const int gen = intel_gen(intel_get_drm_devid(fd));
>   	unsigned engines[16];
>   	int num_engines = 0;
>   
> -	for_each_physical_engine(e, fd) {
> -		if (!gem_can_store_dword(fd, eb_ring(e)))
> +	__for_each_physical_engine(fd, e) {
> +		if (!gem_class_can_store_dword(fd, e->class))
>   			continue;
>   
> -		engines[num_engines++] = eb_ring(e);
> +		engines[num_engines++] = e->flags;
>   		if (num_engines == ARRAY_SIZE(engines))
>   			break;
>   	}
> @@ -1132,22 +1145,22 @@ store_all(int fd, int num_children, int timeout)
>   static void
>   preempt(int fd, unsigned ring, int num_children, int timeout)
>   {
> +	const struct intel_execution_engine2 *e2;
>   	unsigned engines[16];
>   	const char *names[16];
>   	int num_engines = 0;
>   	uint32_t ctx[2];
>   
>   	if (ring == ALL_ENGINES) {
> -		for_each_physical_engine(e, fd) {
> -			names[num_engines] = e->name;
> -			engines[num_engines++] = eb_ring(e);
> +		__for_each_physical_engine(fd, e2) {
> +			names[num_engines] = e2->name;
> +			engines[num_engines++] = e2->flags;
>   			if (num_engines == ARRAY_SIZE(engines))
>   				break;
>   		}
>   
>   		num_children *= num_engines;
>   	} else {
> -		gem_require_ring(fd, ring);
>   		names[num_engines] = NULL;
>   		engines[num_engines++] = ring;
>   	}
> @@ -1207,76 +1220,99 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
>   	gem_context_destroy(fd, ctx[0]);
>   }
>   
> +static void do_test(void (*test)(int i915, unsigned int engine,
> +		    int num_children, int test_timeout),
> +		    int i915, unsigned int engine, int num_children,
> +		    int test_timeout, const char *name)
> +{
> +#define ATTR "preempt_timeout_ms"
> +	int timeout = -1;
> +
> +	cleanup(i915);
> +
> +	gem_engine_property_scanf(i915, name, ATTR, "%d", &timeout);
> +	if (timeout != -1) {
> +		igt_require(gem_engine_property_printf(i915, name,
> +						       ATTR, "%d", 50) > 0);
> +		reset_timeout_ms = 200;
> +	}
> +
> +	test(i915, engine, num_children, test_timeout);
> +
> +	if (timeout != -1) {
> +		gem_engine_property_printf(i915, name, ATTR, "%d", timeout);
> +		reset_timeout_ms = RESET_TIMEOUT_MS;
> +	}
> +
> +	gem_quiescent_gpu(i915);
> +}

Not sure what's this wrapper - reset_timeout_ms seems unused?

> +
>   igt_main
>   {
> -	const struct intel_execution_engine *e;
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>   	int fd = -1;
>   
> +	struct {
> +		const char *name;
> +		void (*func)(int fd, unsigned int engine,
> +			     int num_children, int timeout);
> +		int num_children;
> +		int timeout;
> +	} *test, AllEngine[] = {

If you insist, but don't think we use camel case anywhere else. :I

> +		{ "basic-each", sync_ring, 1, 2},
> +		{ "basic-store-each", store_ring, 1, 2},
> +		{ "basic-many-each", store_many, 0, 2},
> +		{ "switch-each", switch_ring, 1, 20},
> +		{ "forked-switch-each", switch_ring, ncpus, 20},
> +		{ "forked-each", sync_ring, ncpus, 20},
> +		{ "forked-store-each", store_ring, ncpus, 20},
> +		{ "active-each", active_ring, 0, 20},
> +		{ "wakeup-each", wakeup_ring, 20, 1},
> +		{ "active-wakeup-each", active_wakeup_ring, 20, 1},
> +		{ "double-wakeup-each", wakeup_ring, 20, 2},
> +		{ NULL, NULL },
> +	}, tests[] = {
> +		{ "default", sync_ring, 1, 20},
> +		{ "idle", idle_ring, 0, 20},
> +		{ "active", active_ring, 0, 20},
> +		{ "wakeup", wakeup_ring, 20, 1},
> +		{ "active-wakeup", active_wakeup_ring, 20, 1},
> +		{ "double-wakeup", wakeup_ring, 20, 2},
> +		{ "store", store_ring, 1, 20},
> +		{ "switch", switch_ring, 1, 20},
> +		{ "forked-switch", switch_ring, ncpus, 20},
> +		{ "many", store_many, 0, 20},
> +		{ "forked", sync_ring, ncpus, 20},
> +		{ "forked-store", store_ring, ncpus, 20},
> +		{ NULL, NULL },
> +	};
> +
> +
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_INTEL);
>   		igt_require_gem(fd);
>   		gem_submission_print_method(fd);
>   		gem_scheduler_print_capability(fd);
> -
>   		igt_fork_hang_detector(fd);
>   	}
>   
> -	for (e = intel_execution_engines; e->name; e++) {
> -		igt_subtest_f("%s", e->name)
> -			sync_ring(fd, eb_ring(e), 1, 20);
> -		igt_subtest_f("idle-%s", e->name)
> -			idle_ring(fd, eb_ring(e), 20);
> -		igt_subtest_f("active-%s", e->name)
> -			active_ring(fd, eb_ring(e), 20);
> -		igt_subtest_f("wakeup-%s", e->name)
> -			wakeup_ring(fd, eb_ring(e), 20, 1);
> -		igt_subtest_f("active-wakeup-%s", e->name)
> -			active_wakeup_ring(fd, eb_ring(e), 20, 1);
> -		igt_subtest_f("double-wakeup-%s", e->name)
> -			wakeup_ring(fd, eb_ring(e), 20, 2);
> -		igt_subtest_f("store-%s", e->name)
> -			store_ring(fd, eb_ring(e), 1, 20);
> -		igt_subtest_f("switch-%s", e->name)
> -			switch_ring(fd, eb_ring(e), 1, 20);
> -		igt_subtest_f("forked-switch-%s", e->name)
> -			switch_ring(fd, eb_ring(e), ncpus, 20);
> -		igt_subtest_f("many-%s", e->name)
> -			store_many(fd, eb_ring(e), 20);
> -		igt_subtest_f("forked-%s", e->name)
> -			sync_ring(fd, eb_ring(e), ncpus, 20);
> -		igt_subtest_f("forked-store-%s", e->name)
> -			store_ring(fd, eb_ring(e), ncpus, 20);
> +	/* Legacy testing must be first. */
> +	igt_subtest_group {
> +		for (test = AllEngine; test->name; test++) {
> +			igt_subtest_f("%s", test->name) {
> +				do_test(test->func,
> +					fd, ALL_ENGINES,
> +					test->num_children,
> +					test->timeout,
> +					test->name);
> +			}

On a quick glance, so I may be missing something, problem here is I 
think that the first subtest will convert the default context to engine 
map so nothing after the first subtest will be legacy any more. 
Therefore I think...

> +		}
>   	}
>   
> -	igt_subtest("basic-each")
> -		sync_ring(fd, ALL_ENGINES, 1, 2);
> -	igt_subtest("basic-store-each")
> -		store_ring(fd, ALL_ENGINES, 1, 2);
> -	igt_subtest("basic-many-each")
> -		store_many(fd, ALL_ENGINES, 2);
> -	igt_subtest("switch-each")
> -		switch_ring(fd, ALL_ENGINES, 1, 20);
> -	igt_subtest("forked-switch-each")
> -		switch_ring(fd, ALL_ENGINES, ncpus, 20);
> -	igt_subtest("forked-each")
> -		sync_ring(fd, ALL_ENGINES, ncpus, 20);
> -	igt_subtest("forked-store-each")
> -		store_ring(fd, ALL_ENGINES, ncpus, 20);
> -	igt_subtest("active-each")
> -		active_ring(fd, ALL_ENGINES, 20);
> -	igt_subtest("wakeup-each")
> -		wakeup_ring(fd, ALL_ENGINES, 20, 1);
> -	igt_subtest("active-wakeup-each")
> -		active_wakeup_ring(fd, ALL_ENGINES, 20, 1);
> -	igt_subtest("double-wakeup-each")
> -		wakeup_ring(fd, ALL_ENGINES, 20, 2);
> -
>   	igt_subtest("basic-all")
>   		sync_all(fd, 1, 2);
>   	igt_subtest("basic-store-all")
>   		store_all(fd, 1, 2);
> -
>   	igt_subtest("all")
>   		sync_all(fd, 1, 20);
>   	igt_subtest("store-all")
> @@ -1286,7 +1322,49 @@ igt_main
>   	igt_subtest("forked-store-all")
>   		store_all(fd, ncpus, 20);
>   
> +	/* legacy of selecting engines. */
> +
> +	igt_subtest_group {
> +		for (test = tests; test->name; test++) {
> +			igt_subtest_with_dynamic_f("legacy-engines-%s",
> +						   test->name) {
> +				for_each_physical_engine(e, fd) {
> +					igt_dynamic_f("%s", e->name) {
> +						do_test(test->func,
> +							fd, eb_ring(e),
> +							test->num_children,
> +							test->timeout,
> +							e->full_name);
> +					}
> +				}
> +			}
> +		}
> +	}

... this block should come first. Then the ALL_ENGINES block is not 
legacy engine selection due __for_eacy_physical_engine usage.

> +
> +	/* New way of selecting engines. */
> +
>   	igt_subtest_group {
> +		const struct intel_execution_engine2 *e;
> +
> +		for (test = tests; test->name; test++) {
> +			igt_subtest_with_dynamic_f("engines-%s", test->name) {

I'd be tempted to drop the "engines" from all subtest names since it 
feels redundant. There is "each" in tests which do all engines so that 
should be enough.

> +				__for_each_physical_engine(fd, e) {
> +					igt_dynamic_f("%s", e->name) {
> +						do_test(test->func,
> +							fd, e->flags,
> +							test->num_children,
> +							test->timeout,
> +							e->name);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
> +
> +	igt_subtest_group {
> +		const struct intel_execution_engine2 *e;
> +
>   		igt_fixture {
>   			gem_require_contexts(fd);
>   			igt_require(gem_scheduler_has_ctx_priority(fd));
> @@ -1295,10 +1373,12 @@ igt_main
>   
>   		igt_subtest("preempt-all")
>   			preempt(fd, ALL_ENGINES, 1, 20);
> -
> -		for (e = intel_execution_engines; e->name; e++) {
> -			igt_subtest_f("preempt-%s", e->name)
> -				preempt(fd, eb_ring(e), ncpus, 20);
> +		igt_subtest_with_dynamic("preempt") {
> +			__for_each_physical_engine(fd, e) {
> +				/* Requires master for STORE_DWORD on gen4/5 */
> +				igt_dynamic_f("%s", e->name)
> +					preempt(fd, e->flags, ncpus, 20);
> +			}
>   		}
>   	}
>   
> 

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
