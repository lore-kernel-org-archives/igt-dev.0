Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE98E10E23F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 06:09:48 +0000 (UTC)
Message-ID: <da3cd1b7-d733-674f-7648-82a7d3b31d9b@intel.com>
Date: Tue, 12 Sep 2023 11:39:32 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230811103217.415744-2-riana.tauro@intel.com>
 <20230905105409.2227832-1-riana.tauro@intel.com>
 <CY5PR11MB6211FABFE7EAB9A5B96F9B2895EDA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211FABFE7EAB9A5B96F9B2895EDA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/xe: Add a test that
 validates idle residency on exec
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
On 9/8/2023 6:52 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, September 5, 2023 4:24 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Nilawar, Badal <badal.nilawar@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>
>> Subject: [PATCH i-g-t v2 1/2] tests/xe: Add a test that validates idle residency on
>> exec
>>
>> Add a test what runs a background load that is active approximately 1% of the
>> time. Verify that we do enter
>> GT-C6 the rest of the time and validate idle residency is within tolerance.
>>
>> v2: use start and end variables for residency
>>      add detailed comment (Badal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 140 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 137 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
>> bf8230114..f3b247bf0 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -12,17 +12,20 @@
>>    */
>>   #include <fcntl.h>
>>   #include <limits.h>
>> +#include <time.h>
>>
>>   #include "igt.h"
>>   #include "igt_device.h"
>>   #include "igt_power.h"
>>   #include "igt_sysfs.h"
>>
>> +#include "lib/igt_syncobj.h"
>> +#include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_util.h"
>>
>>   #define NUM_REPS 16 /* No of Repetitions */ -#define SLEEP_DURATION 3000
>> /* in milliseconds */
>> +#define SLEEP_DURATION 3 /* in seconds */
>>
>>   const double tolerance = 0.1;
>>   int fw_handle = -1;
>> @@ -50,6 +53,11 @@ enum test_type {
>>    *		measured over a time interval is within the tolerance
>>    * Run type: FULL
>>    *
>> + * SUBTEST: idle-residency-on-exec
>> + * Description: Validate idle residency measured when a background
>> + *		load is only active for ~1% of the time
>> + * Run type: FULL
>> + *
>>    * SUBTEST: gt-c6-freeze
>>    * Description: Validate idle residency measured over suspend(s2idle)
>>    *              is greater than suspend time or within tolerance
>> @@ -68,6 +76,94 @@ static void close_fw_handle(int sig)
>>   		close(fw_handle);
>>   }
>>
>> +static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe,
>> +unsigned long *done) {
>> +	uint32_t bo = 0;
>> +	uint32_t exec_queue, syncobj, vm;
>> +	uint64_t addr = 0x1a0000;
>> +	uint64_t batch_addr, batch_offset, data_addr, data_offset;
>> +	size_t bo_size;
>> +	int b;
>> +	struct {
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +	} *data;
>> +
>> +	struct drm_xe_sync sync = {
>> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
>> +	};
>> +
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync),
>> +	};
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	bo_size = xe_get_default_alignment(fd);
>> +
>> +	bo = xe_bo_create_flags(fd, vm, bo_size,
>> +				visible_vram_if_possible(fd, hwe->gt_id));
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +	syncobj = syncobj_create(fd, 0);
>> +
>> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
>> +
>> +	batch_offset = (char *)&data->batch - (char *)data;
>> +	batch_addr = addr + batch_offset;
>> +	data_offset = (char *)&data->data - (char *)data;
>> +	data_addr = addr + data_offset;
>> +
>> +	/* Aim for ~1% busy */
>> +	do {
>> +		uint64_t submit, elapsed;
>> +		struct timespec tv = {};
>> +
>> +		b = 0;
>> +		done[1]++;
>> +		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +		data->batch[b++] = data_addr;
>> +		data->batch[b++] = data_addr >> 32;
>> +		data->batch[b++] = done[1];
>> +		data->batch[b++] = MI_BATCH_BUFFER_END;
>> +		igt_assert(b <= ARRAY_SIZE(data->batch));
>> +
>> +		exec.exec_queue_id = exec_queue;
>> +		exec.address = batch_addr;
>> +		sync.handle = syncobj;
>> +
>> +		igt_nsec_elapsed(&tv);
>> +		xe_exec(fd, &exec);
>> +		submit = igt_nsec_elapsed(&tv);
>> +
>> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +		elapsed = igt_nsec_elapsed(&tv);
>> +		igt_assert_eq(data->data, done[1]);
>> +
>> +		igt_debug("Execution took %.3fms (submit %.1fus, wait
>> %.1fus)\n",
>> +			  1e-6 * elapsed,
>> +			  1e-3 * submit,
>> +			  1e-3 * (elapsed - submit));
>> +
>> +		syncobj_reset(fd, &syncobj, 1);
>> +
>> +		/*
>> +		 * Execute the above workload for ~1% of the elapsed time and
>> sleep for
>> +		 * the rest of the time (~99%)
>> +		 */
>> +		usleep(elapsed / 10);
>> +	} while (!READ_ONCE(*done));
>> +
>> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
>> +	syncobj_destroy(fd, syncobj);
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>   static unsigned int measured_usleep(unsigned int usec)  {
>>   	struct timespec ts = { };
>> @@ -122,7 +218,7 @@ static void test_idle_residency(int fd, int gt, enum
>> test_type flag)
>>
>>   	if (flag == TEST_IDLE) {
>>   		residency_start = read_idle_residency(fd, gt);
>> -		elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) /
>> 1000;
>> +		elapsed_ms = measured_usleep(SLEEP_DURATION *
>> USEC_PER_SEC) / 1000;
>>   		residency_end = read_idle_residency(fd, gt);
>>   	}
>>
>> @@ -132,12 +228,44 @@ static void test_idle_residency(int fd, int gt, enum
>> test_type flag)
>>   	assert_within_epsilon(residency_end - residency_start, elapsed_ms,
>> tolerance);  }
>>
>> +static void idle_residency_on_exec(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	const int tol = 20;
>> +	unsigned long *done;
>> +	unsigned long end, start;
>> +	unsigned long elapsed_ms, residency_end, residency_start;
>> +
>> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
>> 0);
>> +	igt_assert(done != MAP_FAILED);
>> +	memset(done, 0, 4096);
>> +
>> +	igt_fork(child, 1)
>> +		exec_load(fd, hwe, done);
>> +
>> +	start = READ_ONCE(done[1]);
>> +	residency_start = read_idle_residency(fd, hwe->gt_id);
>> +	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) /
>> 1000;
>> +	residency_end = read_idle_residency(fd, hwe->gt_id);
>> +	end = READ_ONCE(done[1]);
>> +	*done = 1;
>> +
>> +	igt_waitchildren();
>> +
>> +	/* At least one wakeup/s needed for a reasonable test */
>> +	igt_assert(end - start);
>> +
>> +	/* While very nearly busy, expect full GT C6 */
>> +	assert_within_epsilon((residency_end - residency_start), elapsed_ms,
>> +tol);
>> +
>> +	munmap(done, 4096);
>> +}
>> +
>>   static void measure_power(struct igt_power *gpu, double *power)  {
>>   	struct power_sample power_sample[2];
>>
>>   	igt_power_get_energy(gpu, &power_sample[0]);
>> -	measured_usleep(SLEEP_DURATION * 1000);
>> +	measured_usleep(SLEEP_DURATION * USEC_PER_SEC);
>>   	igt_power_get_energy(gpu, &power_sample[1]);
>>   	*power = igt_power_get_mW(gpu, &power_sample[0],
>> &power_sample[1]);  } @@ -185,6 +313,7 @@ igt_main
>>   	uint32_t d3cold_allowed;
>>   	int fd, gt;
>>   	char pci_slot_name[NAME_MAX];
>> +	struct drm_xe_engine_class_instance *hwe;
>>
>>   	igt_fixture {
>>   		fd = drm_open_driver(DRIVER_XE);
>> @@ -215,6 +344,11 @@ igt_main
>>   		xe_for_each_gt(fd, gt)
>>   			test_idle_residency(fd, gt, TEST_IDLE);
>>
>> +	igt_describe("Validate idle residency on exec");
>> +	igt_subtest("idle-residency-on-exec")
>> +		xe_for_each_hw_engine(fd, hwe)
>> +			idle_residency_on_exec(fd, hwe);
> Are we running this test for each engine ?
> It would be better to run for each engine type ?
Yeah currently its running on all the engines.
Okay will run it for a single instance [ instance 0]

Thanks
Riana
> Thanks,
> Anshuman.
>> +
>>   	igt_describe("Toggle GT C states by acquiring/releasing forcewake and
>> validate power measured");
>>   	igt_subtest("toggle-gt-c6") {
>>   		igt_install_exit_handler(close_fw_handle);
>> --
>> 2.40.0
> 
