Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913F10E767
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 20:42:59 +0000 (UTC)
Date: Thu, 25 May 2023 22:42:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525204255.ejzjyfxpfji4n7it@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 06/11] i915/perf_*: better document
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

Hi Mauro,

On 2023-05-25 at 11:05:30 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> i915 perf test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/i915/perf.c     |  96 +++++++++++++++++++++--------
>  tests/i915/perf_pmu.c | 137 +++++++++++++++++++++++++++++++-----------
>  2 files changed, 173 insertions(+), 60 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 1b1c39aafb8b..55594ea6c671 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -52,20 +52,28 @@
>   *
>   * SUBTEST: blocking
>   * Description: Test blocking read with default hrtimer frequency
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: blocking-parameterized
>   * Description: Test blocking read with different hrtimer frequencies
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: buffer-fill
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: create-destroy-userspace-config
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: disabled-read-error
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: enable-disable
>   * Feature: oa
> @@ -84,7 +92,8 @@
>   *
>   * SUBTEST: gen12-invalid-class-instance
>   * Description: Verify invalid class instance
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: gen12-mi-rpc
>   * Description: Test MI REPORT PERF COUNT for Gen 12
> @@ -92,7 +101,8 @@
>   *
>   * SUBTEST: gen12-oa-tlb-invalidate
>   * Description: Test OA TLB invalidate
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: gen12-unprivileged-single-ctx-counters
>   * Description: Measure performance for a specific context using OAR in Gen 12
> @@ -110,84 +120,118 @@
>   * Feature: oa
>   *
>   * SUBTEST: i915-ref-count
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-create-userspace-config
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-exponent
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-format-id
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-metric-set-id
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-open-flags
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-remove-userspace-config
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: low-oa-exponent-permissions
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: mi-rpc
>   * Feature: oa
>   *
>   * SUBTEST: missing-sample-flags
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: non-sampling-read-error
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: non-system-wide-paranoid
>   * Feature: oa
>   *
>   * SUBTEST: non-zero-reason
> - * Description: Test that reason field in OA reports is never 0 on Gen8+
> - * Feature: oa
> + * Description:
> + *   Test that reason field in OA reports is never 0 on Gen8+.
> + *   Test that reason field in OA reports is never 0 on Gen8+
------- ^
Repeated without ending dot.

Rest looks good, you can add my r-b if you feel this can be
corrected later.

Regards,
Kamil

> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: oa-exponents
>   * Feature: oa
>   *
>   * SUBTEST: oa-formats
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: per-context-mode-unprivileged
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: polling
>   * Description: Test polled read with default hrtimer frequency
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: polling-parameterized
>   * Description: Test polled read with different hrtimer frequencies
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: polling-small-buf
>   * Description: Test polled read with buffer size smaller than available data
> - * Feature: oa
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: rc6-disable
>   * Feature: oa
>   *
>   * SUBTEST: short-reads
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: stress-open-close
>   * Description: Stress tests opening & closing the i915-perf stream in a busy loop
>   * Feature: oa
>   *
>   * SUBTEST: sysctl-defaults
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   *
>   * SUBTEST: unprivileged-single-ctx-counters
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: whitelisted-registers-userspace-config
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index bedadbe92797..28897797f81c 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -55,52 +55,84 @@
>   * Run type: FULL
>   *
>   * SUBTEST: all-busy-check-all
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: all-busy-idle-check-all
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy
> - * Feature: pmu
> + * Description: Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-2
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-50
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-98
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-check-all
> - * Feature: pmu
> + * Description: Test to ensure gpu all engines report busy when there is a workload by reading engine busyness pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-double-start
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-hang
> - * Feature: pmu
> + * Description: Test to ensure there is no hanf when all engines are busy
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-idle
> - * Feature: pmu
> + * Description: Test to ensure gpu engine reports idle when there is no workload
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-idle-check-all
> - * Feature: pmu
> + * Description: Test to ensure gpu all engine reports idle when there is no workload
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-idle-no-semaphores
> - * Feature: pmu
> + * Description: Test to verify gpu idle through engine business pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-no-semaphores
> - * Feature: pmu
> + * Description: Test to verify gpu busyness through engine business pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: busy-start
> - * Feature: pmu
> + * Description: Test to verify gpu busyness through engine business pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: cpu-hotplug
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: enable-race
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: event-wait
>   * Feature: obsolete, pmu
> @@ -109,56 +141,87 @@
>   * Feature: pmu
>   *
>   * SUBTEST: frequency
> - * Feature: pmu
> + * Description: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: frequency-idle
>   * Feature: pmu
>   *
>   * SUBTEST: gt-awake
> - * Feature: pmu
> + * Description: Setup workload on all engines,measure gt awake time via pmu
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: idle
> - * Feature: pmu
> + * Description: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: idle-no-semaphores
> - * Feature: pmu
> + * Description: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: init-busy
> - * Feature: pmu
> + * Description: Test to verify gpu busyness init through pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: init-sema
> - * Feature: pmu
> + * Description: Test to verify gpu busyness init through pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: init-wait
> - * Feature: pmu
> + * Description: Test to verify gpu busyness init through pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: interrupts
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: interrupts-sync
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-init
> - * Feature: pmu
> + * Description: Tests that i915 PMU corectly errors out in invalid initialization
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-open
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: module-unload
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: most-busy-check-all
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: most-busy-idle-check-all
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: multi-client
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: pmu-read
>   * Description: Verify i915 pmu dir exists and read all events
>   * Feature: pmu
> + * Test category: Perf
>   *
>   * SUBTEST: rc6
>   * Feature: pmu
> @@ -179,13 +242,19 @@
>   * Feature: pmu
>   *
>   * SUBTEST: semaphore-busy
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: semaphore-wait
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   *
>   * SUBTEST: semaphore-wait-idle
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> -- 
> 2.40.1
> 

