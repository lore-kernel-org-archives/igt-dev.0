Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C88C10E118
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 05:08:29 +0000 (UTC)
Message-ID: <3211f36b-c7e2-4f78-ff3f-a9e59cc211f8@intel.com>
Date: Fri, 14 Jul 2023 10:38:05 +0530
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230711065424.1210524-1-riana.tauro@intel.com>
 <20230711065424.1210524-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230711065424.1210524-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] tests/xe: Add basic idle
 residency test
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

Hi Riana,

On 11-07-2023 12:24, Riana Tauro wrote:
> This test validates idle residency measured over a time interval
> is within the tolerance.
> 
> Patch for gtidle properties
> https://patchwork.freedesktop.org/series/119262/
> 
> v2:
>     - rename file to xe_pm_residency
>     - add kernel patch in commit message (Kamil)
> 
> v3:
>     - add igt test description (Anshuman)
> 
> v4:
>     - fix cosmetic review comments
>     - replace assert with igt_assert_f (Anshuman)
> 
> v5:
>     - use tile sysfs library functions
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/meson.build          |   1 +
>   tests/xe/xe_pm_residency.c | 113 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 tests/xe/xe_pm_residency.How about using filename xe_pm_idle_residency.c?
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 0567449bf..995bc2e28 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -266,6 +266,7 @@ xe_progs = [
>   	'xe_module_load',
>   	'xe_noexec_ping_pong',
>   	'xe_pm',
> +	'xe_pm_residency',
>   	'xe_prime_self_import',
>   	'xe_query',
>   	'xe_sysfs_tile',
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> new file mode 100644
> index 000000000..5e55700bf
> --- /dev/null
> +++ b/tests/xe/xe_pm_residency.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test gtidle properties
s/gtidle/gt idle?
> + * Category: Software building block
> + * Sub-category: Power Management
> + * Functionality: GT C States
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe/xe_query.h"
> +
> +#define SLEEP_DURATION 3000 /* in milliseconds */
> +
> +const double tolerance = 0.1;
> +
> +#define assert_within_epsilon(x, ref, tol) \
> +	igt_assert_f((double)(x) <= (1.0 + (tol)) * (double)(ref) && \
> +		     (double)(x) >= (1.0 - (tol)) * (double)(ref), \
> +		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
> +		     #x, #ref, (double)(x), \
> +		     (tol) * 100.0, (tol) * 100.0, \
> +		     (double)(ref))
> +
> +IGT_TEST_DESCRIPTION("Tests for gtidle properties");
s/gtidle/gt idle?
> +
> +static unsigned int measured_usleep(unsigned int usec)
> +{
> +	struct timespec ts = { };
> +	unsigned int slept;
> +
> +	slept = igt_nsec_elapsed(&ts);
> +	igt_assert(slept == 0);
> +	do {
> +		usleep(usec - slept);
> +		slept = igt_nsec_elapsed(&ts) / 1000;
> +	} while (slept < usec);
> +
> +	return igt_nsec_elapsed(&ts) / 1000;
> +}
> +
> +static bool in_gt_c6(int fd, int gt)
s/in_gt_c6/is_gt_in_c6?
> +{
> +	char gt_c_state[16];
> +	int gt_fd;
> +
> +	gt_fd = xe_sysfs_gt_open(fd, gt);
> +	igt_assert(gt_fd >= 0);
> +	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
> +	close(gt_fd);
> +
> +	return strcmp(gt_c_state, "gt-c6") == 0;
> +}
> +
> +static unsigned long read_idle_residency(int fd, int gt)
> +{
> +	unsigned long residency = 0;
> +	int gt_fd;
> +
> +	gt_fd = xe_sysfs_gt_open(fd, gt);
> +	igt_assert(gt_fd >= 0);
> +	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_residency_ms", "%lu", &residency) == 1);
> +	close(gt_fd);
> +
> +	return residency;
> +}
> +
> +/**
> + * SUBTEST: idle-residency
> + * Description: basic residency test to validate idle residency
> + *		measured over a time interval is within the tolerance
> + * Run type: FULL
> + */
> +static void test_idle_residency(int fd, int gt)
> +{
> +	unsigned long elapsed_ms, residency_start, residency_end;
> +
> +	igt_assert_f(igt_wait(in_gt_c6(fd, gt), 1000, 1), "GT not in C6\n");
> +
> +	residency_start = read_idle_residency(fd, gt);
> +	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
> +	residency_end = read_idle_residency(fd, gt);
> +
> +	igt_info("Measured %lums of idle residency in %lums\n",
> +		 residency_end - residency_start, elapsed_ms);
> +
> +	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
> +}
> +
> +igt_main
> +{
> +	int fd, gt;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> +	}
> +
> +	igt_describe("Validates idle residency measured over a time interval is within the tolerance");
s/Validates/Validate?

Regards,
Badal
> +	igt_subtest("idle-residency")
> +		xe_for_each_gt(fd, gt)
> +			test_idle_residency(fd, gt);
> +
> +	igt_fixture {
> +		close(fd);
> +	}
> +}
