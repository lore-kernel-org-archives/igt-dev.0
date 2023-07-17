Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <e132d009-2532-e675-9887-2a161dfd8780@intel.com>
Date: Mon, 17 Jul 2023 11:26:37 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230707232359.81039-1-vinay.belgaumkar@intel.com>
 <87zg46gpqo.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87zg46gpqo.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915_pm_freq_api: Add some
 debug to tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 7/8/2023 12:36 PM, Dixit, Ashutosh wrote:
> On Fri, 07 Jul 2023 16:23:59 -0700, Vinay Belgaumkar wrote:
>> Some subtests seem to be failing in CI, use igt_assert_(lt/eq) which
>> print the values being compared and some additional debug as well.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   tests/i915/i915_pm_freq_api.c | 18 ++++++++----------
>>   1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
>> index 522abee35..cdb2e70ca 100644
>> --- a/tests/i915/i915_pm_freq_api.c
>> +++ b/tests/i915/i915_pm_freq_api.c
>> @@ -55,6 +55,7 @@ static void test_freq_basic_api(int dirfd, int gt)
>> 	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>> 	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>> 	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
>> +	igt_debug("RPn: %d, RPe: %d, RP0: %d", rpn, rpe, rp0);
> Print gt here too.
ok.
>
>> 	/*
>> 	 * Negative bound tests
>> @@ -90,21 +91,18 @@ static void test_reset(int i915, int dirfd, int gt, int count)
>> 	int fd;
>>
>> 	for (int i = 0; i < count; i++) {
>> -		igt_assert_f(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0,
>> -			     "Failed after %d good cycles\n", i);
>> -		igt_assert_f(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0,
>> -			     "Failed after %d good cycles\n", i);
>> +		igt_debug("Running cycle: %d", i);
>> +		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>> +		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>> 		usleep(ACT_FREQ_LATENCY_US);
>> -		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
>> -			     "Failed after %d good cycles\n", i);
>> +		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>
>> 		/* Manually trigger a GT reset */
>> 		fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
>> 		igt_require(fd >= 0);
>> 		igt_ignore_warn(write(fd, "1\n", 2));
>>
>> -		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
>> -			     "Failed after %d good cycles\n", i);
>> +		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
> Probably ok but why the changes in this loop?

There are a couple of bugs that are failing around this area.

Thanks,

Vinay.

>
>> 	}
>> 	close(fd);
>>   }
>> @@ -116,13 +114,13 @@ static void test_suspend(int i915, int dirfd, int gt)
>> 	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>> 	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>> 	usleep(ACT_FREQ_LATENCY_US);
>> -	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
>> +	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>
>> 	/* Manually trigger a suspend */
>> 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>> 				      SUSPEND_TEST_NONE);
>>
>> -	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
>> +	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>   }
>>
>>   int i915 = -1;
>> --
>> 2.38.1
>>
