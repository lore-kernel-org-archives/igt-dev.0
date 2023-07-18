Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <da0a376b-9703-b17b-72b8-151794e9beca@intel.com>
Date: Tue, 18 Jul 2023 11:00:36 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230717184213.624518-1-vinay.belgaumkar@intel.com>
 <87pm4qhtss.wl-ashutosh.dixit@intel.com>
 <8544177f-994d-88a4-6c7f-aa64c84e8846@intel.com>
 <87msztj14r.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87msztj14r.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 i-g-t] i915_pm_freq_api: Add some debug to
 tests
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


On 7/17/2023 9:26 PM, Dixit, Ashutosh wrote:
> On Mon, 17 Jul 2023 21:19:13 -0700, Belgaumkar, Vinay wrote:
>>
>> On 7/17/2023 6:50 PM, Dixit, Ashutosh wrote:
>>> On Mon, 17 Jul 2023 11:42:13 -0700, Vinay Belgaumkar wrote:
>>>> Some subtests seem to be failing in CI, use igt_assert_(lt/eq) which
>>>> print the values being compared and some additional debug as well.
>>>>
>>>> v2: Print GT as well (Ashutosh)
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    tests/i915/i915_pm_freq_api.c | 18 ++++++++----------
>>>>    1 file changed, 8 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
>>>> index 522abee35..a7bbd4896 100644
>>>> --- a/tests/i915/i915_pm_freq_api.c
>>>> +++ b/tests/i915/i915_pm_freq_api.c
>>>> @@ -55,6 +55,7 @@ static void test_freq_basic_api(int dirfd, int gt)
>>>> 	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>>>> 	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>>> 	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
>>>> +	igt_debug("GT: %d, RPn: %d, RPe: %d, RP0: %d", gt, rpn, rpe, rp0);
>>>>
>>>> 	/*
>>>> 	 * Negative bound tests
>>>> @@ -90,21 +91,18 @@ static void test_reset(int i915, int dirfd, int gt, int count)
>>>> 	int fd;
>>>>
>>>> 	for (int i = 0; i < count; i++) {
>>>> -		igt_assert_f(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0,
>>>> -			     "Failed after %d good cycles\n", i);
>>>> -		igt_assert_f(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0,
>>>> -			     "Failed after %d good cycles\n", i);
>>>> +		igt_debug("Running cycle: %d", i);
>>>> +		igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>>> +		igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>> I am R-b'ing this but stuff like this should be using igt_assert_lt()
>>> according to the commit message?
>>>
>>> This _lt stuff has to be fixed all over the file, not just this patch, if
>>> it brings any value (again according to the commit message).
>>>
>>> Let me know if you want to fix this now or in a later patch. I'll wait
>>> before merging.
>> Yup, I will send out another version with the corrected commit message.
> Hmm, I thought the code needs to be fixed not the commit message :)

Ok, I meant this specific patch will address just the area where we 
check for the requested frequency. I will change the remaining in a 
separate patch.

Thanks,

Vinay.

>
>> Thanks,
>>
>> Vinay.
>>
>>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>
>>>> 		usleep(ACT_FREQ_LATENCY_US);
>>>> -		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
>>>> -			     "Failed after %d good cycles\n", i);
>>>> +		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>>>
>>>> 		/* Manually trigger a GT reset */
>>>> 		fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
>>>> 		igt_require(fd >= 0);
>>>> 		igt_ignore_warn(write(fd, "1\n", 2));
>>>>
>>>> -		igt_assert_f(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn,
>>>> -			     "Failed after %d good cycles\n", i);
>>>> +		igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>>> 	}
>>>> 	close(fd);
>>>>    }
>>>> @@ -116,13 +114,13 @@ static void test_suspend(int i915, int dirfd, int gt)
>>>> 	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>>> 	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>>> 	usleep(ACT_FREQ_LATENCY_US);
>>>> -	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
>>>> +	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>>>
>>>> 	/* Manually trigger a suspend */
>>>> 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>>>> 				      SUSPEND_TEST_NONE);
>>>>
>>>> -	igt_assert(get_freq(dirfd, RPS_CUR_FREQ_MHZ) == rpn);
>>>> +	igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>>>>    }
>>>>
>>>>    int i915 = -1;
>>>> --
>>>> 2.38.1
>>>>
