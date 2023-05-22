Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9C810E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 12:42:58 +0000 (UTC)
Date: Mon, 22 May 2023 14:42:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230522124254.b2qt7nxal3lehql5@kamilkon-desk1>
References: <20230522071230.2494402-1-mauro.chehab@linux.intel.com>
 <20230522071230.2494402-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230522071230.2494402-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/6] i915/perf_*: better document
 tests
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

On 2023-05-22 at 09:12:29 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> i915 perf test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/perf.c     |  68 ++++++++++++++++++----------
>  tests/i915/perf_pmu.c | 103 ++++++++++++++++++++++++++++--------------
>  2 files changed, 112 insertions(+), 59 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 1b1c39aafb8b..b7fa2924888e 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -49,23 +49,27 @@
>   * TEST: perf
>   * Description: Test the i915 perf metrics streaming interface
>   * Run type: FULL
> + * Test category: Perf
>   *
>   * SUBTEST: blocking
>   * Description: Test blocking read with default hrtimer frequency
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: blocking-parameterized
>   * Description: Test blocking read with different hrtimer frequencies
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: buffer-fill
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: create-destroy-userspace-config
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: disabled-read-error
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: enable-disable
>   * Feature: oa
> @@ -84,7 +88,7 @@
>   *
>   * SUBTEST: gen12-invalid-class-instance
>   * Description: Verify invalid class instance
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: gen12-mi-rpc
>   * Description: Test MI REPORT PERF COUNT for Gen 12
> @@ -92,7 +96,7 @@
>   *
>   * SUBTEST: gen12-oa-tlb-invalidate
>   * Description: Test OA TLB invalidate
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: gen12-unprivileged-single-ctx-counters
>   * Description: Measure performance for a specific context using OAR in Gen 12
> @@ -110,84 +114,98 @@
>   * Feature: oa
>   *
>   * SUBTEST: i915-ref-count
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-create-userspace-config
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-oa-exponent
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-oa-format-id
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-oa-metric-set-id
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-open-flags
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: invalid-remove-userspace-config
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: low-oa-exponent-permissions
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: mi-rpc
>   * Feature: oa
>   *
>   * SUBTEST: missing-sample-flags
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: non-sampling-read-error
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: non-system-wide-paranoid
>   * Feature: oa
>   *
>   * SUBTEST: non-zero-reason
>   * Description: Test that reason field in OA reports is never 0 on Gen8+
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: oa-exponents
>   * Feature: oa
>   *
>   * SUBTEST: oa-formats
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: per-context-mode-unprivileged
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: polling
>   * Description: Test polled read with default hrtimer frequency
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: polling-parameterized
>   * Description: Test polled read with different hrtimer frequencies
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: polling-small-buf
>   * Description: Test polled read with buffer size smaller than available data
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
>   *
>   * SUBTEST: rc6-disable
>   * Feature: oa
>   *
>   * SUBTEST: short-reads
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: stress-open-close
>   * Description: Stress tests opening & closing the i915-perf stream in a busy loop
>   * Feature: oa
>   *
>   * SUBTEST: sysctl-defaults
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: unprivileged-single-ctx-counters
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: whitelisted-registers-userspace-config
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Functionality: Test the i915 perf metrics streaming interface
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index bedadbe92797..bc0d517007d6 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -53,54 +53,71 @@
>   * TEST: perf pmu
>   * Description: Test the i915 pmu perf interface
>   * Run type: FULL
> + * Test category: Perf
>   *
>   * SUBTEST: all-busy-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: all-busy-idle-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: busy-accuracy-2
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-accuracy-50
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-accuracy-98
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu all engines report busy when there is a workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: busy-double-start
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-hang
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure there is no hanf when all engines are busy
>   *
>   * SUBTEST: busy-idle
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu engine reports idle when there is no workload
>   *
>   * SUBTEST: busy-idle-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu all engine reports idle when there is no workload
>   *
>   * SUBTEST: busy-idle-no-semaphores
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu idle through engine business pmu counters
>   *
>   * SUBTEST: busy-no-semaphores
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu busyness through engine business pmu counters
>   *
>   * SUBTEST: busy-start
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu busyness through engine business pmu counters
>   *
>   * SUBTEST: cpu-hotplug
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: enable-race
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: event-wait
>   * Feature: obsolete, pmu
> @@ -109,52 +126,67 @@
>   * Feature: pmu
>   *
>   * SUBTEST: frequency
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
>   *
>   * SUBTEST: frequency-idle
>   * Feature: pmu
>   *
>   * SUBTEST: gt-awake
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Setup workload on all engines,measure gt awake time via pmu
>   *
>   * SUBTEST: idle
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: idle-no-semaphores
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: init-busy
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: init-sema
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: init-wait
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: interrupts
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: interrupts-sync
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: invalid-init
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Tests that i915 PMU corectly errors out in invalid initialization
>   *
>   * SUBTEST: invalid-open
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: module-unload
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: most-busy-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: most-busy-idle-check-all
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: multi-client
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: pmu-read
>   * Description: Verify i915 pmu dir exists and read all events
> @@ -179,13 +211,16 @@
>   * Feature: pmu
>   *
>   * SUBTEST: semaphore-busy
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: semaphore-wait
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: semaphore-wait-idle
> - * Feature: pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Functionality: Test the i915 pmu perf interface
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> -- 
> 2.40.1
> 

