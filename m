Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0284810E749
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 19:55:20 +0000 (UTC)
Date: Thu, 25 May 2023 21:55:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525195517.tjiqaeya3e5wfey4@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 05/11] i915/gem_ctx_*: better
 document i915 context tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-05-25 at 11:05:29 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> i915 gem_ctx test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/gem_ctx_bad_destroy.c |   4 ++
>  tests/i915/gem_ctx_create.c      |  22 +++++-
>  tests/i915/gem_ctx_engines.c     |   4 ++
>  tests/i915/gem_ctx_exec.c        |  28 +++++++-
>  tests/i915/gem_ctx_freq.c        |   4 ++
>  tests/i915/gem_ctx_isolation.c   |  38 ++++++++++-
>  tests/i915/gem_ctx_param.c       |  76 +++++++++++++++++++++
>  tests/i915/gem_ctx_persistence.c | 112 +++++++++++++++++++++++++++++++
>  tests/i915/gem_ctx_shared.c      |  37 +++++++++-
>  9 files changed, 321 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
> index 90495da8ab2e..8c47e7c1cb67 100644
> --- a/tests/i915/gem_ctx_bad_destroy.c
> +++ b/tests/i915/gem_ctx_bad_destroy.c
> @@ -36,9 +36,13 @@
>  
>  /**
>   * TEST: gem ctx bad destroy
> + * Category: Infrastructure
>   * Description: Negative test cases for destroy contexts.
>   * Feature: context
> + * Functionality: context management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-destroy
>   *
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 0c65027bc838..95e219482de6 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -38,70 +38,90 @@
>  /**
>   * TEST: gem ctx create
>   * Description: Test the context create ioctls
> - * Feature: context
>   *
>   * SUBTEST: active
>   * Description:
>   *   For each engine calculate the average performance of context creation execution and
>   *   exercise context reclaim
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: active-all
>   * Description: Calculate the average performance of context creation and it's execution using all engines
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Test random context creation
> + * Feature: context
> + * Functionality: context management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-files
> + * Category: Infrastructure
>   * Description: Exercise implicit per-fd context creation
> + * Feature: context
> + * Functionality: context management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: ext-param
>   * Description: Verify valid and invalid context extensions
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: files
>   * Description: Exercise implicit per-fd context creation on 1 CPU for long duration
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: forked-active
>   * Description:
>   *   For each engine calculate the average performance of context creation and execution on
>   *   multiple parallel processes
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: forked-active-all
>   * Description:
>   *   Calculate the average performance of context creation and it's execution using all engines
>   *   on multiple parallel processes
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: forked-files
>   * Description: Exercise implicit per-fd context creation on all CPUs for long duration
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: hog
>   * Description:
>   *   For each engine calculate the average performance of context creation and execution while
>   *   all other engines are hogging the resources
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: iris-pipeline
>   * Description: Set, validate and execute particular context params
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: maximum-mem
>   * Description:
>   *   Create contexts upto available RAM size, calculate the average performance of their
>   *   execution on multiple parallel processes
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: maximum-swap
>   * Description:
>   *   Create contexts upto available RAM+SWAP size, calculate the average performance of their
>   *   execution on multiple parallel processes
> + * Feature: context
>   * Run type: FULL
>   */
>  
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index d15a7b7e5f67..61718494e86a 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -45,8 +45,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx engines
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execute-allforone
>   *
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 9fec2bb10fdf..bd6671ec8d90 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -50,34 +50,60 @@
>  /**
>   * TEST: gem ctx exec
>   * Description: Test context batch buffer execution.
> - * Feature: context
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Check the basic context batch buffer execution.
> + * Feature: context
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-close-race
> + * Category: Infrastructure
>   * Description: Race the execution and interrupt handlers along a context, while closing it at a random time.
> + * Feature: context
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-invalid-context
> + * Category: Infrastructure
>   * Description: Verify that execbuf with invalid context fails.
> + * Feature: context
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-nohangcheck
> + * Category: Server
>   * Description: Verify that contexts are automatically shotdown on close, if hangchecking is disabled.
> + * Feature: context
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-norecovery
> + * Category: Server
>   * Description: Check the status of context after a hang by setting and unsetting the RECOVERABLE.
> + * Feature: context
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: eviction
>   * Description: Check maximum number of buffers it can evict for a context.
> + * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: reset-pin-leak
>   * Description: Check if the kernel doesn't leak the vma pin_count for the last context on reset.
> + * Feature: context
>   * Run type: FULL
>   */
>  
> diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
> index 8e432cbdf8f5..2c30934daa23 100644
> --- a/tests/i915/gem_ctx_freq.c
> +++ b/tests/i915/gem_ctx_freq.c
> @@ -36,8 +36,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx freq
> + * Category: Server
>   * Feature: context
> + * Functionality: frequency management
>   * Run type: FULL
> + * Sub-category: Performance
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sysfs
>   */
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 2c2da296d301..d50a90597e6f 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -28,26 +28,62 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem ctx isolation
> - * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: clean
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dirty-create
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dirty-switch
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv-switch
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation-S3
> + * Feature: context

No other fields here?

>   *
>   * SUBTEST: preservation-S4
> + * Feature: context

Same here, imho we can correct that later.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>   *
>   * SUBTEST: preservation-reset
> + * Category: Infrastructure
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   */
>  
>  /* MAX_REG must be greater than the maximum register address. */
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index 5e56c645572b..7c59fe3ed0db 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -36,71 +36,139 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using valid context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-default
> + * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using default context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: get-priority-new-ctx
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Verify that priority is default for newly created context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ctx-get
> + * Category: Infrastructure
>   * Description: Verify that context get param ioctl using invalid context returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ctx-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl using invalid context returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-get-engines
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-get-no-zeromap
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-get-ringsize
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-param-get
> + * Category: Infrastructure
>   * Description: Checks that fetching context parameters using an unused param value is erroneous
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-param-set
> + * Category: Infrastructure
>   * Description: Checks that setting context parameters using an unused param value is erroneous
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-set-no-zeromap
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-set-ringsize
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-size-get
> + * Category: Infrastructure
>   * Description: Verify that context get param ioctl returns valid size for valid context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-size-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl using invalid size returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: non-root-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl returns relevant error in non root mode
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: root-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl works fine in root mode
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: set-priority-invalid-size
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Verify that relevant error is returned on setting invalid ctx size with default priority
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: set-priority-not-supported
>   * Description:
> @@ -109,14 +177,22 @@
>   * Feature: context, no-set-priority
>   *
>   * SUBTEST: set-priority-range
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Change priority range to test value overflow
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: vm
> + * Category: Infrastructure
>   * Description: Tests that multiple contexts can share the same VMA
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 42cf9632989e..584137db4546 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -51,68 +51,180 @@
>   * Run type: FULL
>   *
>   * SUBTEST: engines-cleanup
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-hostile-preempt
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-mixed
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-mixed-process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-persistence
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-queued
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: file
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-close
>   *
>   * SUBTEST: heartbeat-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: heartbeat-many
>   *
>   * SUBTEST: heartbeat-stop
>   *
>   * SUBTEST: hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: idempotent
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-cleanup
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-hostile-preempt
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-mixed
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-mixed-process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-persistence
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-engines-queued
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: many-contexts
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: processes
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: saturated-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: saturated-hostile-nopreempt
>   *
>   * SUBTEST: smoketest
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   */
>  
>  #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 98827f09f9ea..ede6db13b265 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -50,36 +50,71 @@
>  /**
>   * TEST: gem ctx shared
>   * Description: Test shared contexts.
> - * Feature: context
>   * Run type: FULL
>   *
>   * SUBTEST: Q-in-order
> + * Feature: context
>   *
>   * SUBTEST: Q-independent
> + * Feature: context
>   *
>   * SUBTEST: Q-out-order
> + * Feature: context
>   *
>   * SUBTEST: Q-promotion
> + * Feature: context
>   *
>   * SUBTEST: Q-smoketest
> + * Feature: context
>   *
>   * SUBTEST: Q-smoketest-all
> + * Feature: context
>   *
>   * SUBTEST: create-shared-gtt
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: detached-shared-gtt
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: disjoint-timelines
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-shared-gtt
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-single-timeline
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exhaust-shared-gtt
> + * Feature: context
>   *
>   * SUBTEST: exhaust-shared-gtt-lrc
> + * Feature: context
>   *
>   * SUBTEST: single-timeline
> + * Category: Desktop client
> + * Feature: context
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   */
>  
>  #define LO 0
> -- 
> 2.40.1
> 

