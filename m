Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D028010E0B4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 15:58:49 +0000 (UTC)
Message-ID: <55ad1a6f-b49f-9899-c1fe-728ee014eaa6@intel.com>
Date: Wed, 14 Jun 2023 21:28:18 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230609094457.3355182-1-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230609094457.3355182-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe: Add basic idle residency test
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

On 09-06-2023 15:14, Riana Tauro wrote:
> The test reads idle residency within a time interval and
> checks if its within the tolerance
> 
> Currently the test checks RC6 Residency
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/meson.build     |   1 +
>   tests/xe/xe_gt_idle.c | 117 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 118 insertions(+)
>   create mode 100644 tests/xe/xe_gt_idle.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index c15eb3a08..10273ebf5 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -254,6 +254,7 @@ xe_progs = [
>   	'xe_exec_fault_mode',
>   	'xe_exec_reset',
>   	'xe_exec_threads',
> +	'xe_gt_idle',
>   	'xe_gpgpu_fill',
>   	'xe_guc_pc',
>   	'xe_huc_copy',
> diff --git a/tests/xe/xe_gt_idle.c b/tests/xe/xe_gt_idle.c
> new file mode 100644
> index 000000000..3a1090ffd
> --- /dev/null
> +++ b/tests/xe/xe_gt_idle.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Test gtidle properties
> + * Category: Software building block
> + * Sub-category: Power Management
> + * Functionality: RC6
> + * Test category: functionality test
> + */
> +
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe/xe_query.h"
> +
> +#define SLEEP_DURATION 3 /* in seconds */
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
> +static bool in_rc6(int sysfs, int gt)
> +{
> +	char path[PATH_MAX];
> +	char rc[8];
> +
> +	sprintf(path, "device/gt%d/gtidle/idle_status", gt);
> +	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
> +		return false;
> +
> +	return strcmp(rc, "rc6") == 0;
> +}
This function is also defined in xe_guc_pc.c. So how about making this 
function as library function may be under new file lib/xe/xe_pm.c.

Regards,
Badal
> +
> +static bool is_rc_dir(int sysfs, int gt)
> +{
> +	char path[PATH_MAX], name[NAME_MAX];
> +	char rc[8];
> +
> +	sprintf(path, "device/gt%d/gtidle/name", gt);
> +	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
> +		return false;
> +
> +	sprintf(name, "gt%d-rc", gt);
> +	return strcmp(rc, name) == 0;
> +}
> +
> +static unsigned long read_idle_residency(int sysfs, int gt)
> +{
> +	unsigned long residency;
> +	char path[PATH_MAX];
> +
> +	residency = 0;
> +	sprintf(path, "device/gt%d/gtidle/idle_residency_ms", gt);
> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1);
> +	return residency;
> +}
> +
> +/**
> + * SUBTEST: idle-residency
> + * Description: basic residency test to check idle residency
> + * 		within a time interval
> + * Run type: FULL
> + */
> +static void test_idle(int sysfs, int gt)
> +{
> +	struct timespec tv;
> +	unsigned long elapsed_ms, residency_start, residency_end;
> +
> +	assert(is_rc_dir(sysfs, gt));
> +	assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
> +
> +	igt_gettime(&tv);
> +	residency_start = read_idle_residency(sysfs, gt);
> +	sleep(SLEEP_DURATION);
> +	residency_end = read_idle_residency(sysfs, gt);
> +	elapsed_ms = igt_nsec_elapsed(&tv) / 1000000;
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
> +	static int sysfs = -1;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		xe_device_get(fd);
> +		sysfs = igt_sysfs_open(fd);
> +		igt_assert(sysfs != -1);
> +	}
> +
> +	igt_subtest("idle-residency")
> +		xe_for_each_gt(fd, gt)
> +			test_idle(sysfs, gt);
> +
> +	igt_fixture {
> +		close(sysfs);
> +		xe_device_put(fd);
> +		close(fd);
> +	}
> +}
