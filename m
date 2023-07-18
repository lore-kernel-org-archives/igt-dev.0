Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC0410E064
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 04:27:17 +0000 (UTC)
Message-ID: <aa1e803f-f24b-21ff-405e-a1259298daa8@intel.com>
Date: Tue, 18 Jul 2023 09:57:02 +0530
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230717105711.3277000-1-badal.nilawar@intel.com>
 <87o7kahruu.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87o7kahruu.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/xe: Verify actual frequency on
 the basis of GT state
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

On 18-07-2023 08:02, Dixit, Ashutosh wrote:
> On Mon, 17 Jul 2023 03:57:11 -0700, Badal Nilawar wrote:
>>
> 
> Hi Badal,
> 
>> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
>> index c34df8d60..ff1b32613 100644
>> --- a/tests/xe/xe_guc_pc.c
>> +++ b/tests/xe/xe_guc_pc.c
>> @@ -218,7 +218,7 @@ static void test_freq_basic_api(int fd, int gt_id)
>>    * Run type: FULL
>>    */
>>
>> -static void test_freq_fixed(int fd, int gt_id)
>> +static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
> 
> We could try to "deduce" the value of gt_idle (depending on whether gt is
> in rc6 or not) but the gt_idle flag is better.
> 
> 
>>   {
>> 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
>> 	uint32_t rpe = get_freq(fd, gt_id, "rpe");
>> @@ -226,6 +226,9 @@ static void test_freq_fixed(int fd, int gt_id)
>>
>> 	igt_debug("Starting testing fixed request\n");
>>
>> +	if (gt_idle)
>> +		igt_require(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 1));
>> +
>> 	/*
>> 	 * For Fixed freq we need to set both min and max to the desired value
>> 	 * Then we check if hardware is actually operating at the desired freq
>> @@ -235,13 +238,25 @@ static void test_freq_fixed(int fd, int gt_id)
>> 	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
>> 	usleep(ACT_FREQ_LATENCY_US);
>> 	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
>> -	igt_assert(get_freq(fd, gt_id, "act") == rpn);
>> +
>> +	if (gt_idle) {
>> +		usleep(ACT_FREQ_LATENCY_US);
> 
> Looks like this usleep should in the else? Since we've already igt_wait'ed
> above for the idle case? In all places in this patch.
As get_freq(fd, gt_id, "cur") will forcewake the gt so added usleep to 
gt to settle down. Else case is covering exec case so it is expected 
that act freq is already reached to set freq with the delay added after 
set_freq.
> 
>> +		igt_assert(get_freq(fd, gt_id, "act") == 0);
>> +	} else {
>> +		igt_assert(get_freq(fd, gt_id, "act") == rpn);
>> +	}
>>
>> 	igt_assert(set_freq(fd, gt_id, "min", rpe) > 0);
>> 	igt_assert(set_freq(fd, gt_id, "max", rpe) > 0);
>> 	usleep(ACT_FREQ_LATENCY_US);
>> 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>> -	igt_assert(get_freq(fd, gt_id, "act") == rpe);
>> +
>> +	if (gt_idle) {
>> +		usleep(ACT_FREQ_LATENCY_US);
>> +		igt_assert(get_freq(fd, gt_id, "act") == 0);
>> +	} else {
>> +		igt_assert(get_freq(fd, gt_id, "act") == rpe);
>> +	}
>>
>> 	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
>> 	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
> 
> We can't check for 0 act freq in this rp0 case?
Yes we can check. I will add this check.
> 
>> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
>> index a20c4449c..5c4516d03 100644
>> --- a/tests/xe/xe_pm_residency.c
>> +++ b/tests/xe/xe_pm_residency.c
>> @@ -28,6 +28,16 @@ const double tolerance = 0.1;
>> 		     (tol) * 100.0, (tol) * 100.0, \
>> 		     (double)(ref))
>>
>> +/**
>> + * SUBTEST: gt-c6-on-idle
>> + * Description: Validate GT C6 state on idle
>> + * Run type: BAT
>> + *
>> + * SUBTEST: idle-residency
>> + * Description: basic residency test to validate idle residency
>> + *		measured over a time interval is within the tolerance
>> + * Run type: FULL
>> + */
> 
> Why combine these two doc sections? idle-residency description should be
> above test_idle_residency?
Since gt-c6-on-idle moved to lib I moved its doc here. To maintain 
uniformity I combined all the docs. tests/xe/xe_ccs.c is following this 
practice.
> 
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>
>>   static unsigned int measured_usleep(unsigned int usec)
>> @@ -45,24 +55,6 @@ static unsigned int measured_usleep(unsigned int usec)
>> 	return igt_nsec_elapsed(&ts) / 1000;
>>   }
>>
>> -/**
>> - * SUBTEST: gt-c6-on-idle
>> - * Description: Validate GT C6 state on idle
>> - * Run type: BAT
>> - */
>> -static bool is_gt_in_c6(int fd, int gt)
>> -{
>> -	char gt_c_state[16];
>> -	int gt_fd;
>> -
>> -	gt_fd = xe_sysfs_gt_open(fd, gt);
>> -	igt_assert(gt_fd >= 0);
>> -	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
>> -	close(gt_fd);
>> -
>> -	return strcmp(gt_c_state, "gt-c6") == 0;
>> -}
>> -
>>   static unsigned long read_idle_residency(int fd, int gt)
>>   {
>> 	unsigned long residency = 0;
>> @@ -76,17 +68,11 @@ static unsigned long read_idle_residency(int fd, int gt)
>> 	return residency;
>>   }
>>
>> -/**
>> - * SUBTEST: idle-residency
>> - * Description: basic residency test to validate idle residency
>> - *		measured over a time interval is within the tolerance
>> - * Run type: FULL
>> - */
>>   static void test_idle_residency(int fd, int gt)
>>   {
>> 	unsigned long elapsed_ms, residency_start, residency_end;
>>
>> -	igt_assert_f(igt_wait(is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
>> +	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
>>
>> 	residency_start = read_idle_residency(fd, gt);
>> 	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
>> @@ -110,7 +96,7 @@ igt_main
>> 	igt_describe("Validate GT C6 on idle");
>> 	igt_subtest("gt-c6-on-idle")
>> 		xe_for_each_gt(fd, gt)
>> -			igt_assert_f(igt_wait(is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
>> +			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
>>
>> 	igt_describe("Validate idle residency measured over a time interval is within the tolerance");
>> 	igt_subtest("idle-residency")
>> --
>> 2.25.1
> 
> Thanks.
> --
> Ashutosh
