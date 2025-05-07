Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D879C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 12:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1384610E79C;
	Wed,  7 May 2025 12:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XT1bTppx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D080610E79C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746621221; x=1778157221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YST6Ai2IiEqHJQ+sCvHaE9WSKBs+hNobNz/h1UMT8fs=;
 b=XT1bTppx3nRP3ap2tozRyK1w/ApSx8Kxu1bbZPOigxjW9MvNoga7pAgU
 GTGigD2lVxVUu0+1/lSkXjSlC6PXsfXuOmpJJkzx5698Gwx6RLd1dWKAG
 c/USCWqk8ER1btTfYEA7LmIiUSDRFbHXGyp4bU00tXsLi1AkXOx7DcGN7
 IAsCka3pTMSPOsOK+UEr6qHA3FjGUayZR5P5eeg7kCg9ecdcyYB4s/iXv
 kXGQlWGcpjOBK8sDP1jxIiox/blf0BceZXO1DDHjG+WdBxpxigmukSvar
 72WMYFe4UQM0Tqoipa5vc80J3KDoXYyon7Qst8zNY2pS7odi5PKmUz2z2 Q==;
X-CSE-ConnectionGUID: fnDvfz39T7ajGXNyasQfcw==
X-CSE-MsgGUID: gTE4VpXdRWCoPlz/34TGTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="35979054"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="35979054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 05:33:41 -0700
X-CSE-ConnectionGUID: 9ZXG8YHmThORRnQPdqAgZQ==
X-CSE-MsgGUID: 9A3Pt4DIS3S1RFL7EDuZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136463634"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:33:40 -0700
Date: Wed, 7 May 2025 14:33:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, michal.winiarski@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [RFC v3 i-g-t] tests/intel/sec_xe_exec_queue_timeslice_abuse:
 Validate the Impact of Timeslice Abuse on Exec Queues
Message-ID: <20250507123325.ui66iyj662uyv6ux@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, michal.winiarski@intel.com,
 rodrigo.vivi@intel.com
References: <20250507104111.446923-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507104111.446923-1-peter.senna@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Peter,
On 2025-05-07 at 12:41:10 +0200, Peter Senna Tschudin wrote:
> DO NOT MERGE!
> 
> The objective is to test the behavior of the GPU scheduler under
> conditions where one execution queue ("attacker") is configured with an
> abnormally large timeslice, potentially disrupting the normal execution
> of another queue ("attacked"). The explicit attack point is the ioctl
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY.
> 
> This temporarily disables drm and xe logging to prevent it from slowing
> down and serializing the tests. Using igt_drm_debug_level_update()
> ensures that the logging level is restored after this igt is done.
> 
> This RFC implements the first step that is reading timeslice values for
> each engine and run the following tests on timeslice limits:
>  - Boundary Value Analysis: Focuses on testing at the boundaries of
>    input values with values such as max - 1, max, max + 1.
>  - Equivalence Partitioning:  Divide values into partitions where all
>    values behave similarly and test one value from each partition.
>  - Fuzz Testing: Basic fuzz tester for
>       - Large numbers
>       - Empty value
>       - '\0'
>       - 10'000 u64 random values
>  - Fuzz stress test: Create 1000 threads and call the fuzzing test.
>    While this takes about 30 seconds to run, it produces several
>    megabytes of dmesg.
> 
> The proposed steps are (this patch goes until 2a):
> 
> 1. Determine the values for the following parameters:
>         - `timeslice_duration_us`: Default timeslice duration in
>            microseconds.
>         - `timeslice_duration_min`: Minimum allowable timeslice duration.
>         - `timeslice_duration_max`: Maximum allowable timeslice duration.
> 
> 2. Create two execution queues with the following configurations:
>         - `attacked`: Queue with standard/default settings.
>         - `attacker`: Queue configured with an extended timeslice
>                       duration. The goal is to:
>                 a) Try to set timeslice to invalid values. This is
>                    expected to fail.
> 
>                 b) Create the attacker queue setting the timeslice to
>                    `timeslice_duration_max`.
> 
> 3. Submit tasks to both queues:
>         - Submit a workload to the `attacked` queue with normal
>            operations.
>         - Submit a workload to the `attacker` queue designed to
>           maximize its timeslice and potentially disrupt the GPU
>           scheduler.
> 
> 4. Verify the behavior of the `attacked` queue:
>         - Ensure that tasks in the `attacked` queue execute within the
>           expected time constraints and are not delayed or blocked due
>           to the extended timeslice of the `attacker` queue.
>         - Specifically, confirm that tasks in the `attacked` queue do
>           not exceed `timeslice_duration_max` in terms of execution
>           delays or interruptions.
> 
> Cc: michal.winiarski@intel.com
> Cc: rodrigo.vivi@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  .../intel/sec_xe_exec_queue_timeslice_abuse.c | 689 ++++++++++++++++++

Small nit about naming, please start all Xe tests with xe_ prefix,
so for example use for filename:

(imho this name looks good)
tests/intel/xe_sec_exec_queue.c

or (looks not so good)

tests/intel/xe_exec_queue_sec.c

and then name tests like timeslice-abuse


>  tests/meson.build                             |   1 +
>  2 files changed, 690 insertions(+)
>  create mode 100644 tests/intel/sec_xe_exec_queue_timeslice_abuse.c
> 
> diff --git a/tests/intel/sec_xe_exec_queue_timeslice_abuse.c b/tests/intel/sec_xe_exec_queue_timeslice_abuse.c
> new file mode 100644
> index 000000000..abbc384c4
> --- /dev/null
> +++ b/tests/intel/sec_xe_exec_queue_timeslice_abuse.c
> @@ -0,0 +1,689 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/*
> + * Test Specification: Validate the Impact of Timeslice Abuse on Exec Queues
> + *
> + * Objective
> + * Test the behavior of the GPU scheduler under conditions where one execution
> + * queue ("attacker") is configured with an abnormally large timeslice,
> + * potentially disrupting the normal execution of another queue ("attacked").
> + *
> + * Steps:
> + *
> + * For each GPU engine available:
> + *	1. Determine the values for the following parameters:
> + *		- `timeslice_duration_us`: Default timeslice duration in
> + *		   microseconds.
> + *		- `timeslice_duration_min`: Minimum allowable timeslice duration.
> + *		- `timeslice_duration_max`: Maximum allowable timeslice duration.
> + *
> + *	2. Create two execution queues with the following configurations:
> + *		- `attacked`: Queue with standard/default settings.
> + *		- `attacker`: Queue configured with an extended timeslice
> + *			      duration. The goal is to:
> + *			a) First attempt to set a timeslice greater than
> + *			   `timeslice_duration_max`.
> + *			b) If setting a timeslice above `timeslice_duration_max`
> + *			   fails, fallback to setting the timeslice to
> + *			   `timeslice_duration_max`.
> + *
> + *	3. Submit tasks to both queues:
> + *		- Submit a workload to the `attacked` queue with normal
> + *		   operations.
> + *		- Submit a workload to the `attacker` queue designed to
> + *		  maximize its timeslice and potentially disrupt the GPU
> + *		  scheduler.
> + *
> + *	4. Verify the behavior of the `attacked` queue:
> + *		- Ensure that tasks in the `attacked` queue execute within the
> + *		  expected time constraints and are not delayed or blocked due
> + *		  to the extended timeslice of the `attacker` queue.
> + *		- Specifically, confirm that tasks in the `attacked` queue do
> + *		  not exceed `timeslice_duration_max` in terms of execution
> + *		  delays or interruptions.
> + *
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "igt.h"
> +#include "igt_list.h"
> +#include "igt_sysfs.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define MAX_U64 0xFFFFFFFFFFFFFFFF
> +
> +static struct igt_list_head engines_list;
> +
> +/* Struct to Hold Data for Each Engine */
> +struct engines_timeslice_test_data {
> +	/* Name of the GPU engine (e.g., "CCS", "VCS", "RCS", "BCS", "VECS") */
> +	const char *engine_name;
> +
> +	/* Minimum allowable timeslice duration (microseconds) */
> +	uint32_t timeslice_min;
> +
> +	/* Maximum allowable timeslice duration (microseconds) */
> +	uint32_t timeslice_max;
> +
> +	/* Timeslice value set for the attacker queue (microseconds) */
> +	uint32_t timeslice_set;
> +
> +	/* Linked list node */
> +	struct igt_list_head link;
> +};
> +
> +/* Struct for parametric testing */
> +struct timeslice_test_case {
> +	uint64_t value;
> +	int expected_result;
> +};
> +
> +typedef struct {
> +	int xe;
> +	int vm;
> +	int random_count;
> +} thread_args_t;
> +
> +/**
> + * engines_list_add_timeslices: Check if there is already an entry in the list
> + *				for the engine and add timeslices.
> + * @engine: name of the engine
> + * @set: timeslice duration set for the attacker queue
> + * @min: minimum allowable timeslice duration
> + * @max: maximum allowable timeslice duration
> + *
> + * Returns: bool indicating if timeslices were added to the list
> + *
> + */
> +static bool engines_list_add_timeslices(const char *engine, uint32_t set,
> +					uint32_t min, uint32_t max)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL;
> +
> +	/* Check if the engine already exists in the list. If it does
> +	 * add the timeslice values to the existing entry
> +	 */
> +	igt_list_for_each_entry(engine_data, &engines_list, link) {
> +		if (strcmp(engine_data->engine_name, engine) == 0) {
> +			engine_data->timeslice_set = set;
> +			engine_data->timeslice_min = min;
> +			engine_data->timeslice_max = max;
> +			return true;
> +		}
> +	}
> +	/* If the engine does not exist, create a new entry */
> +	engine_data = malloc(sizeof(*engine_data));
> +	if (!engine_data)
> +		return false;
> +
> +	engine_data->engine_name = strdup(engine);
> +	engine_data->timeslice_set = set;
> +	engine_data->timeslice_min = min;
> +	engine_data->timeslice_max = max;
> +
> +	igt_list_add(&engine_data->link, &engines_list);
> +	return true;
> +}
> +
> +/**
> + * engines_list_print_all: Print all engines in the list
> + *
> + * Returns: void
> + *
> + */
> +static void engines_list_print_all(void)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL;
> +
> +	igt_warn("Engines List:\n");
> +	igt_list_for_each_entry(engine_data, &engines_list, link) {
> +		igt_warn("Engine: %s, Set: %u, Min: %u, Max: %u\n",
> +			 engine_data->engine_name,
> +			 engine_data->timeslice_set,
> +			 engine_data->timeslice_min,
> +			 engine_data->timeslice_max);
> +	}
> +}
> +
> +/**
> + * engines_list_free_all: Free all engines in the list
> + *
> + * Returns: void
> + *
> + */
> +static void engines_list_free_all(void)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL, *tmp = NULL;
> +
> +	igt_list_for_each_entry_safe(engine_data, tmp, &engines_list, link) {
> +		free((void *)engine_data->engine_name);
> +		free(engine_data);
> +	}
> +}
> +
> +/**
> + * debug_info_igt_assert: Print debug information for assertion failures
> + * @msg: message to print
> + * @cond: condition to evaluate
> + */
> +static void debug_info_igt_assert(const char *msg, bool cond)
> +{
> +	if (!cond) {
> +		igt_warn("Assertion failed: %s\n", msg);
> +		engines_list_print_all();
> +	}
> +	igt_assert(cond);
> +}
> +
> +/**
> + * get_queue_timeslice_properties: Get the timeslice properties for an engine
> + *
> + * @xe: xe device file descriptor
> + * @engine: engine file descriptor
> + * @set: pointer to store the timeslice duration set for the attacker queue
> + * @min: pointer to store the minimum allowable timeslice duration
> + * @max: pointer to store the maximum allowable timeslice duration
> + *
> + * Returns: 0 on success, -1 on failure
> + */
> +static int get_queue_timeslice_properties(int xe, int engine,
> +			unsigned int *set, unsigned int *min, unsigned int *max)
> +{
> +	int defaults;
> +
> +	defaults = openat(engine, ".defaults", O_DIRECTORY);
> +	if (defaults == -1)
> +		return -1; /* Failure: Unable to open the defaults directory */
> +
> +	/* Read the max, min, and set values from the sysfs */
> +	if (igt_sysfs_scanf(defaults, "timeslice_duration_max", "%u", max) != 1 ||
> +	    igt_sysfs_scanf(defaults, "timeslice_duration_min", "%u", min) != 1 ||
> +	    igt_sysfs_scanf(engine, "timeslice_duration_us", "%u", set) != 1) {
> +		close(defaults);
> +		return -1; /* Failure: Unable to read sysfs values */
> +	}
> +	close(defaults);
> +
> +	return 0; /* Success */
> +}
> +
> +/**
> + * random_u64: Generate a random 64-bit unsigned integer
> + *
> + * Returns: A random 64-bit unsigned integer
> + */
> +static uint64_t random_u64(void)
> +{
> +	uint64_t high = ((uint64_t)rand() << 32);
> +	uint64_t low = (uint64_t)rand();
> +
> +	return high | low;
> +}
> +
> +/**
> + * TEST: Validate the Impact of Timeslice Abuse on Exec Queues
> + * Category: Security
> + * Mega feature: Security Validation Plan
> + * Sub-category: Security Validation Plan
> + * Functionality: Test if exec queue timeslice property can be used as an
> + *		  attack to prevent other queues from running
> + * Test category: security test
> + *
> + * SUBTEST: get-xe-exec-queue-timeslice-properties
> + * Description: Test to check if timeslice properties are available and
> + *		read them.
> + * Test category: functionality test
> + */

Move this 'TEST:' to begin of file, just after a copyright.
SUBTEST imho should be a short name, you could describe it at lenght
in descriprion. Same note about subtests names len apply below.

Regards,
Kamil

> +
> +/**
> + * get_xe_exec_queue_timeslice_properties:
> + * @xe: xe device file descriptor
> + *
> + * Returns: void
> + */
> +static void get_xe_exec_queue_timeslice_properties(int xe)
> +{
> +	unsigned int max = -1;
> +	unsigned int min = -1;
> +	unsigned int set = -1;
> +	int gt = -1;
> +
> +	xe_for_each_gt(xe, gt) {
> +		int engines = -1;
> +		int gt_fd = -1;
> +		DIR *dir;
> +		struct dirent *de;
> +
> +		gt_fd = xe_sysfs_gt_open(xe, gt);
> +		igt_require(gt_fd != -1);
> +
> +		engines = openat(gt_fd, "engines", O_RDONLY);
> +		igt_require(engines != -1);
> +
> +		lseek(engines, 0, SEEK_SET);
> +
> +		dir = fdopendir(engines);
> +		if (!dir)
> +			close(engines);
> +
> +		while ((de = readdir(dir))) {
> +			int engine_fd = -1;
> +
> +			if (*de->d_name == '.')
> +				continue;
> +
> +			engine_fd = openat(engines, de->d_name, O_RDONLY);
> +			if (engine_fd < 0)
> +				continue;
> +
> +			/* Check if the timeslice properties are available */
> +			if (get_queue_timeslice_properties(xe, engine_fd, &set, &min, &max) == 0)
> +				engines_list_add_timeslices(de->d_name, set, min, max);
> +			else
> +				igt_warn("Failed to get timeslice properties\n");
> +
> +			close(engine_fd);
> +		}
> +		close(gt_fd);
> +	}
> +}
> +
> +/**
> + * xe_exec_queue_test_create_timeslice:
> + * @xe: xe device file descriptor
> + * @vm: vm file descriptor
> + * @timeslice: timeslice value to be set
> + * @expected_ret: expected return value
> + *§
> + * Returns: bool indicating if the queue creation was successful
> + *
> + */
> +static bool xe_exec_queue_test_create_timeslice(int xe, int  vm,
> +						uint64_t timeslice,
> +						int expected_ret)
> +{
> +	uint32_t queue_id = -1;
> +	int ret;
> +	char error_msg[256];
> +
> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> +	};
> +	struct drm_xe_ext_set_property property = {
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.base.next_extension = 0,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE,
> +		.value = timeslice,
> +	};
> +
> +	igt_assert(vm != -1);
> +
> +	ret = __xe_exec_queue_create(xe, vm, 1, 1,
> +				     &instance, to_user_pointer(&property),
> +				     &queue_id);
> +	if (ret == 0)
> +		xe_exec_queue_destroy(xe, queue_id);
> +
> +	if (ret == expected_ret)
> +		return true;
> +
> +	snprintf(error_msg, sizeof(error_msg),
> +		 "ERROR: Failed to create exec queue with timeslice %lu, expected %d, got %d",
> +		 timeslice, expected_ret, ret);
> +	debug_info_igt_assert(error_msg, ret == expected_ret);
> +
> +	return false;
> +}
> +
> +/**
> + * xe_exec_queue_test_iterate_create_timeslice:
> + * @xe: xe device file descriptor
> + * @vm: vm file descriptor
> + * @test_case: struct containing the timeslice value and expected result
> + * @test_case_count: number of test cases
> + *
> + * Returns: void
> + *
> + */
> +static void xe_exec_queue_test_iterate_create_timeslice(int xe, int vm,
> +						   struct timeslice_test_case *test_case,
> +						   int test_case_count)
> +{
> +	for (int i = 0; i < test_case_count; i++)
> +		xe_exec_queue_test_create_timeslice(xe, vm,
> +						    test_case[i].value,
> +						    test_case[i].expected_result);
> +}
> +
> +/**
> + * SUBTEST: xe-exec-queue-timeslice-boundary-value-analysis
> + * Description: Test to check if the timeslice boundary values are
> + *              working as expected.
> + * Test category: functionality test
> + */
> +
> +/**
> + * xe_exec_queue_timeslice_boundary_value_analysis:
> + * @xe: xe device file descriptor
> + * @vm: vm file descriptor
> + *
> + * Returns: void
> + *
> + */
> +static void xe_exec_queue_timeslice_boundary_value_analysis(int xe, int vm)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL;
> +	int test_case_count = 6;
> +	struct timeslice_test_case test_cases[test_case_count];
> +
> +	igt_list_for_each_entry(engine_data, &engines_list, link) {
> +		if (engine_data->timeslice_set != -1)
> +			break;
> +	}
> +	igt_assert(engine_data != NULL);
> +	igt_assert(engine_data->timeslice_set != -1);
> +
> +	/* Test cases for boundary value analysis */
> +	test_cases[0].value = engine_data->timeslice_max + 1;
> +	test_cases[0].expected_result = -EINVAL;
> +	test_cases[1].value = engine_data->timeslice_max;
> +	test_cases[1].expected_result = 0;
> +	test_cases[2].value = engine_data->timeslice_max - 1;
> +	test_cases[2].expected_result = 0;
> +	test_cases[3].value = engine_data->timeslice_min - 1;
> +	test_cases[3].expected_result = -EINVAL;
> +	test_cases[4].value = engine_data->timeslice_min;
> +	test_cases[4].expected_result = 0;
> +	test_cases[5].value = engine_data->timeslice_min + 1;
> +	test_cases[5].expected_result = 0;
> +
> +	/* Check if the timeslice values are working as expected */
> +	xe_exec_queue_test_iterate_create_timeslice(xe, vm, test_cases,
> +						    test_case_count);
> +}
> +
> +/**
> + * SUBTEST: xe-exec-queue-timeslice-equivalence-partitioning
> + * Description: Divide timeslice values into partitions where all values should
> + *		have the same behavior. This test checks if the timeslice
> + *		values are working as expected.
> + *
> + * Test category: functionality test
> + */
> +
> +/**
> + * xe_exec_queue_timeslice_equivalence_partitioning:
> + * @xe: xe device file descriptor
> + * @vm: vm file descriptor
> + *
> + * Returns: void
> + *
> + */
> +static void xe_exec_queue_timeslice_equivalence_partitioning(int xe, int vm)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL;
> +	int test_case_count = 5;
> +	struct timeslice_test_case test_cases[test_case_count];
> +
> +	igt_list_for_each_entry(engine_data, &engines_list, link) {
> +		if (engine_data->timeslice_set != -1)
> +			break;
> +	}
> +	igt_assert(engine_data != NULL);
> +	igt_assert(engine_data->timeslice_set != -1);
> +
> +	/* Test cases for equivalence partitioning */
> +	test_cases[0].value = engine_data->timeslice_min - 1;
> +	test_cases[0].expected_result = -EINVAL;
> +	test_cases[1].value = engine_data->timeslice_min;
> +	test_cases[1].expected_result = 0;
> +	test_cases[2].value = (engine_data->timeslice_min + engine_data->timeslice_max) / 2;
> +	test_cases[2].expected_result = 0;
> +	test_cases[3].value = engine_data->timeslice_max;
> +	test_cases[3].expected_result = 0;
> +	test_cases[4].value = engine_data->timeslice_max + 1;
> +	test_cases[4].expected_result = -EINVAL;
> +
> +	/* Check if the timeslice values are working as expected */
> +	xe_exec_queue_test_iterate_create_timeslice(xe, vm, test_cases,
> +						    test_case_count);
> +}
> +
> +/**
> + * SUBTEST: xe-exec-queue-timeslice-fuzzing
> + * Description: Test a large set of random timeslice values to check if the
> + *              behavior is as expected. Includes testing for:
> + *                - very large numbers
> + *                - empty value
> + *                - null value
> + *
> + * Test category: functionality test
> + */
> +
> +/**
> + * xe_exec_queue_timeslice_fuzzing:
> + * @xe: xe device file descriptor
> + * @random_count: number of random timeslice values to test
> + *
> + * Returns: void
> + *
> + */
> +static void xe_exec_queue_timeslice_fuzzing(int xe, int vm, int random_count)
> +{
> +	struct engines_timeslice_test_data *engine_data = NULL;
> +	__u64 timeslice_value;
> +	uint32_t queue_id = -1;
> +
> +	struct drm_xe_engine_class_instance instance = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
> +	};
> +	struct drm_xe_ext_set_property empty_value_property = {
> +		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		.base.next_extension = 0,
> +		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE,
> +	};
> +
> +	igt_list_for_each_entry(engine_data, &engines_list, link) {
> +		if (engine_data->timeslice_set != -1)
> +			break;
> +	}
> +	igt_assert(engine_data != NULL);
> +	igt_assert(engine_data->timeslice_set != -1);
> +
> +	igt_assert(vm != -1);
> +
> +	/* test empty timeslice_value 10 times*/
> +	for (int i = 0; i < 10; i++)
> +		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
> +					to_user_pointer(&empty_value_property),
> +					&queue_id), -EINVAL);
> +
> +	/* Very large number 10 times for max_u64 and for max_u64 -1 */
> +	timeslice_value = MAX_U64;
> +	for (int i = 0; i < 10; i++)
> +		xe_exec_queue_test_create_timeslice(xe, vm, timeslice_value,
> +						    -EINVAL);
> +	timeslice_value = MAX_U64 - 1;
> +	for (int i = 0; i < 10; i++)
> +		xe_exec_queue_test_create_timeslice(xe, vm, timeslice_value,
> +						    -EINVAL);
> +
> +	/* Test '\0' timeslice_value 10 times */
> +	for (int i = 0; i < 10; i++)
> +		xe_exec_queue_test_create_timeslice(xe, vm, '\0', -EINVAL);
> +
> +	/* Test random_count random values */
> +	srand((unsigned int)time(NULL));
> +
> +	for (int i = 0; i < random_count; i++) {
> +		timeslice_value = random_u64();
> +
> +		if (timeslice_value < engine_data->timeslice_min ||
> +		    timeslice_value > engine_data->timeslice_max)
> +			xe_exec_queue_test_create_timeslice(xe,  vm,
> +							    timeslice_value,
> +							    -EINVAL);
> +		else
> +			xe_exec_queue_test_create_timeslice(xe, vm,
> +							    timeslice_value,
> +							    0);
> +	}
> +}
> +
> +/**
> + * SUBTEST: xe-exec-queue-timeslice-fuzzing-stress-test
> + * Description: Test a large set of random timeslice values to check if the
> + *              behavior is as expected. Includes testing for:
> + *                - very large numbers
> + *                - empty value
> + *                - null value
> + *
> + * Test category: functionality test
> + */
> +
> + /**
> +  * fuzz_workload: Thread function to perform fuzz testing
> +  * @args: thread arguments containing the xe device file descriptor and
> +  *        random count
> +  *
> +  * Returns: void
> +  */
> +static void *fuzz_workload(void *args)
> +{
> +	thread_args_t *thread_args = (thread_args_t *) args;
> +
> +	/* Call the fuzz testing function with the provided arguments */
> +	xe_exec_queue_timeslice_fuzzing(thread_args->xe, thread_args->vm,
> +					thread_args->random_count);
> +
> +	return NULL;
> +}
> +
> +/**
> + * xe_exec_queue_timeslice_fuzzing_stress_threads:
> + * @xe: xe device file descriptor
> + * @vm: vm file descriptor
> + * @thread_count: number of threads to create
> + * @random_count_per_thread: number of random timeslice values per thread
> + *
> + * Returns: void
> + *
> + */
> +static void xe_exec_queue_timeslice_fuzzing_stress_threads(int xe,
> +							   int vm,
> +							   int thread_count,
> +							   int random_count_per_thread)
> +{
> +	pthread_t *threads;
> +	thread_args_t *thread_args;
> +
> +	threads = malloc(thread_count * sizeof(pthread_t));
> +	igt_assert(threads);
> +	thread_args = malloc(thread_count * sizeof(thread_args_t));
> +	igt_assert(thread_args);
> +
> +	igt_info("Starting stress test with %d threads and with %d random tests each...\n",
> +		 thread_count, random_count_per_thread);
> +
> +	// Create the specified number of threads
> +	for (int i = 0; i < thread_count; i++) {
> +		thread_args[i].xe = xe;
> +		thread_args[i].vm = vm;
> +		thread_args[i].random_count = random_count_per_thread;
> +
> +		if (pthread_create(&threads[i], NULL, fuzz_workload, &thread_args[i]) != 0) {
> +			igt_info("Failed to create thread %d.\n", i);
> +			exit(EXIT_FAILURE);
> +		}
> +	}
> +
> +	// Wait for all threads to finish
> +	for (int i = 0; i < thread_count; i++) {
> +		if (pthread_join(threads[i], NULL) != 0)
> +			igt_info("Failed to join thread %d.\n", i);
> +	}
> +
> +	igt_info("Stress test with %d threads completed successfully.\n",
> +		 thread_count);
> +
> +	// Free allocated memory
> +	free(threads);
> +	free(thread_args);
> +}
> +
> +igt_main
> +{
> +	bool has_sysfs = false;
> +	int sys_fd = -1;
> +	int xe = -1;
> +	int vm = -1;
> +
> +	igt_fixture {
> +		/* Disable logging for this igt: Logging imposes a 20X slowdown
> +		 * on the operations we are trying to stress test. The logging
> +		 * slows down and serializes the operations, which is not what
> +		 * we want. igt_drm_debug_level_update() installs an exit
> +		 * handler making sure that the logging is reset to the previous
> +		 * value when the test ends.
> +		 */
> +		igt_drm_debug_level_update(0);
> +
> +		/* Initialize the list of engines */
> +		IGT_INIT_LIST_HEAD(&engines_list);
> +
> +		xe = drm_open_driver(DRIVER_XE);
> +		sys_fd = igt_sysfs_open(xe);
> +
> +		if (sys_fd != -1) {
> +			close(sys_fd);
> +			has_sysfs = true;
> +		} else {
> +			has_sysfs = false;
> +		}
> +	}
> +
> +	igt_subtest("get-xe-exec-queue-timeslice-properties") {
> +		igt_require(has_sysfs);
> +		get_xe_exec_queue_timeslice_properties(xe);
> +	}
> +
> +	igt_fixture {
> +		vm = xe_vm_create(xe, 0, 0);
> +		igt_assert(vm != -1);
> +	}
> +
> +	igt_subtest("xe-exec-queue-timeslice-boundary-value-analysis") {
> +		xe_exec_queue_timeslice_boundary_value_analysis(xe, vm);
> +	}
> +
> +	igt_subtest("xe-exec-queue-timeslice-equivalence-partitioning") {
> +		xe_exec_queue_timeslice_equivalence_partitioning(xe, vm);
> +	}
> +
> +	igt_subtest("xe-exec-queue-timeslice-fuzzing") {
> +		xe_exec_queue_timeslice_fuzzing(xe, vm, 1000000);
> +	}
> +
> +	igt_subtest("xe-exec-queue-timeslice-fuzzing-stress-test") {
> +		xe_exec_queue_timeslice_fuzzing_stress_threads(xe, vm,
> +							       50000, 500);
> +	}
> +
> +	igt_fixture {
> +		engines_list_free_all();
> +		close(sys_fd);
> +
> +		if (vm != -1)
> +			xe_vm_destroy(xe, vm);
> +
> +		xe_device_put(xe);
> +		drm_close_driver(xe);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 20ddddb89..560b74ceb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -273,6 +273,7 @@ intel_kms_progs = [
>  ]
>  
>  intel_xe_progs = [
> +	'sec_xe_exec_queue_timeslice_abuse',
>  	'xe_wedged',
>  	'xe_ccs',
>  	'xe_create',
> -- 
> 2.43.0
> 
