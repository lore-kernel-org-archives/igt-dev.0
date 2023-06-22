Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8427A10E13C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 05:10:10 +0000 (UTC)
Message-ID: <76e59168-038f-c67b-834e-a63e44fe6301@intel.com>
Date: Thu, 22 Jun 2023 10:39:54 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230621095036.4177883-1-riana.tauro@intel.com>
 <CY5PR11MB6211F6EF0460B794327FF911955DA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211F6EF0460B794327FF911955DA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/xe: Add basic idle residency
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman

Thanks for the review

On 6/21/2023 5:31 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Wednesday, June 21, 2023 3:21 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Nilawar, Badal <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com
>> Subject: [PATCH i-g-t v2] tests/xe: Add basic idle residency test
>>
>> The test reads idle residency within a time interval and checks if its within the
>> tolerance
>>
>> Patch for gtidle properties
>> https://patchwork.freedesktop.org/series/119262/
>>
>> v2:
>>     - rename file to xe_pm_residency
>>     - add kernel patch in commit message (Kamil)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/meson.build          |   1 +
>>   tests/xe/xe_pm_residency.c | 117
>> +++++++++++++++++++++++++++++++++++++
>>   2 files changed, 118 insertions(+)
>>   create mode 100644 tests/xe/xe_pm_residency.c
>>
>> diff --git a/tests/meson.build b/tests/meson.build index
>> f908ae885..f877b7a11 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -264,6 +264,7 @@ xe_progs = [
>>   	'xe_module_load',
>>   	'xe_noexec_ping_pong',
>>   	'xe_pm',
>> +	'xe_pm_residency',
>>   	'xe_prime_self_import',
>>   	'xe_query',
>>   	'xe_vm',
>> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c new
>> file mode 100644 index 000000000..33f840325
>> --- /dev/null
>> +++ b/tests/xe/xe_pm_residency.c
>> @@ -0,0 +1,117 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Test gtidle properties
>> + * Category: Software building block
>> + * Sub-category: Power Management
>> + * Functionality: GT C States
>> + * Test category: functionality test
>> + */
>> +
>> +#include <limits.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +
>> +#include "xe/xe_query.h"
>> +
>> +#define SLEEP_DURATION 3000 /* in milliseconds */
>> +
>> +const double tolerance = 0.1;
>> +
>> +#define assert_within_epsilon(x, ref, tol) \
>> +	igt_assert_f((double)(x) <= (1.0 + (tol)) * (double)(ref) && \
>> +		     (double)(x) >= (1.0 - (tol)) * (double)(ref), \
>> +		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of
>> %f)\n",\
>> +		     #x, #ref, (double)(x), \
>> +		     (tol) * 100.0, (tol) * 100.0, \
>> +		     (double)(ref))
> This might get used at several places, how about moving it to a library ?
Will move this to lib. lib/igt_pm should be okay?
>> +
>> +static unsigned int measured_usleep(unsigned int usec) {
>> +	struct timespec ts = { };
>> +	unsigned int slept;
>> +
>> +	slept = igt_nsec_elapsed(&ts);
>> +	igt_assert(slept == 0);
>> +	do {
>> +		usleep(usec - slept);
> slept was nsec, then why aren't we converting it to usec ?
The first time slept is 0. From the next loop run, it is converted to usec.
>> +		slept = igt_nsec_elapsed(&ts) / 1000;
>> +	} while (slept < usec);
>> +
>> +	return igt_nsec_elapsed(&ts) / 1000;
>> +}
>> +
>> +static bool in_gt_c6(int sysfs, int gt) {
>> +	char path[PATH_MAX];
>> +	char gt_c_state[8];
>> +
>> +	sprintf(path, "device/gt%d/gtidle/idle_status", gt);
>> +	if (igt_sysfs_scanf(sysfs, path, "%s", gt_c_state) < 0)
>> +		return false;
>> +
>> +	return strcmp(gt_c_state, "gt-c6") == 0; }
>> +
>> +static unsigned long read_idle_residency(int sysfs, int gt) {
>> +	unsigned long residency;
>> +	char path[PATH_MAX];
>> +
>> +	residency = 0;
>> +	sprintf(path, "device/gt%d/gtidle/idle_residency_ms", gt);
> IMO we need something like igt_debugfs_gt_dir() here for sysfs.
sysfs lib also has this igt_sysfs_gt_open but the path is specific to 
i915. If this needs to be added, should it be a new lib ? or this can be 
done for the tile patches?

Thanks
Riana
> Thanks,
> Anshuman Gupta.
>> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1);
>> +	return residency;
>> +}
>> +
>> +/**
>> + * SUBTEST: idle-residency
>> + * Description: basic residency test to check idle residency
>> + *		within a time interval
>> + * Run type: FULL
>> + */
>> +static void test_idle_residency(int sysfs, int gt) {
>> +	unsigned long elapsed_ms, residency_start, residency_end;
>> +
>> +	assert(igt_wait(in_gt_c6(sysfs, gt), 1000, 1));
>> +
>> +	residency_start = read_idle_residency(sysfs, gt);
>> +	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
>> +	residency_end = read_idle_residency(sysfs, gt);
>> +
>> +	igt_info("Measured %lums of idle residency in %lums\n",
>> +		 residency_end - residency_start, elapsed_ms);
>> +
>> +	assert_within_epsilon(residency_end - residency_start, elapsed_ms,
>> +tolerance); }
>> +
>> +igt_main
>> +{
>> +	int fd, gt;
>> +	static int sysfs = -1;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +		xe_device_get(fd);
>> +		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>> +
>> +		sysfs = igt_sysfs_open(fd);
>> +		igt_assert(sysfs != -1);
>> +	}
>> +
>> +	igt_subtest("idle-residency")
>> +		xe_for_each_gt(fd, gt)
>> +			test_idle_residency(sysfs, gt);
>> +
>> +	igt_fixture {
>> +		close(sysfs);
>> +		xe_device_put(fd);
>> +		close(fd);
>> +	}
>> +}
>> --
>> 2.40.0
> 
