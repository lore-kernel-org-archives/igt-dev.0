Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF510E098
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 15:28:57 +0000 (UTC)
Date: Tue, 9 May 2023 08:28:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZFpmtSRigT12Rg+J@orsosgc001.jf.intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
 <20230506005528.1890922-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230506005528.1890922-6-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/15] perf_pmu: Use correct pmu config
 for multi-tile
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 05, 2023 at 05:55:18PM -0700, Umesh Nerlige Ramappa wrote:
>From: Riana Tauro <riana.tauro@intel.com>
>
>Use the correct perf_pmu config for actual and requested frequency in
>multi-tile frequency test.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/i915/perf_pmu.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>index 6080c5fdc..2d29887e0 100644
>--- a/tests/i915/perf_pmu.c
>+++ b/tests/i915/perf_pmu.c
>@@ -1670,8 +1670,8 @@ test_frequency(int gem_fd, unsigned int gt)
> 	igt_require(max_freq > min_freq);
> 	igt_require(boost_freq > min_freq);
>
>-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
>-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
>+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
>+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
>
> 	/*
> 	 * Set GPU to min frequency and read PMU counters.
>@@ -1764,8 +1764,8 @@ test_frequency_idle(int gem_fd, unsigned int gt)
>
> 	/* While parked, our convention is to report the GPU at 0Hz */
>
>-	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
>-	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
>+	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
>+	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
>
> 	gem_quiescent_gpu(gem_fd); /* Be idle! */
> 	measured_usleep(2000); /* Wait for timers to cease */
>-- 
>2.34.1
>
