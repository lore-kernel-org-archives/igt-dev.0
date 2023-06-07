Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <408f6bd2-66bb-5fc6-345b-f7ed34715a5f@intel.com>
Date: Wed, 7 Jun 2023 16:11:30 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230606203535.292739-1-vinay.belgaumkar@intel.com>
 <87bkhrm0xk.wl-ashutosh.dixit@intel.com>
 <c46fbbe8-51b2-bf23-50df-328dd5d9bc21@intel.com>
 <87a5xanaoq.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87a5xanaoq.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_api: Add a suspend
 subtest
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


On 6/7/2023 3:56 PM, Dixit, Ashutosh wrote:
> On Wed, 07 Jun 2023 15:31:33 -0700, Belgaumkar, Vinay wrote:
>> On 6/7/2023 2:12 PM, Dixit, Ashutosh wrote:
>>> On Tue, 06 Jun 2023 13:35:35 -0700, Vinay Belgaumkar wrote:
>>> Hi Vinay,
>>>
>>>> Verify that SLPC API works as expected after a suspend.
>>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    tests/i915/i915_pm_freq_api.c | 30 ++++++++++++++++++++++++++++++
>>>>    1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
>>>> index 9005cd220..f35f1f8e0 100644
>>>> --- a/tests/i915/i915_pm_freq_api.c
>>>> +++ b/tests/i915/i915_pm_freq_api.c
>>>> @@ -18,6 +18,9 @@
>>>>     *
>>>>     * SUBTEST: freq-reset
>>>>     * Description: Test basic freq API works after a reset
>>>> + *
>>>> + * SUBTEST: freq-suspend
>>>> + * Description: Test basic freq API works after a runtime suspend
>>>>     */
>>>>
>>>>    IGT_TEST_DESCRIPTION("Test SLPC freq API");
>>>> @@ -99,6 +102,24 @@ static void test_reset(int i915, int dirfd, int gt)
>>>> 	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
>>>>    }
>>>>
>>>> +static void test_suspend(int i915, int dirfd, int gt)
>>>> +{
>>>> +	uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>>>> +
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>>> +	usleep(ACT_FREQ_LATENCY_US);
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
>>>> +
>>>> +	/* Manually trigger a suspend */
>>>> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>>>> +				      SUSPEND_TEST_NONE);
>>>> +
>>>> +	igt_assert(get_freq(dirfd, RPS_MIN_FREQ_MHZ) == rpn);
>>>> +	igt_assert(get_freq(dirfd, RPS_MAX_FREQ_MHZ) == rpn);
>>> I am wondering what the purpose/value of this test (and also "freq-reset")
>>> is?  How can the "set" min/max set freq (which are just input settings)
>>> change whether or not there is a suspend/resume or a reset? Especially when
>>> we just return cached min/max values from i915?
>> It is mainly checking that we don't smother the softlimit during a reset or
>> suspend flow.
> How can softlimit which is a ordinary variable in memory get clobbered by
> suspend resume?
>
>> In addition, it also tests the read/write interface works as expected
>> after those events.
> There's no write. Sorry, but I'm not convinced. There should be some more
> meat to the test.
There are writes in the IGT fixture after the test completes.
>
> Maybe we can write a test which will check /all/ sysfs values are the same
> after a suspend resume cycle? Why do only these specific ones have to be
> checked?

This test is specific to the freq api, hence just min/max entries.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
>
>
>> Thanks,
>>
>> Vinay.
>>
>>> Thanks.
>>> --
>>> Ashutosh
>>>
>>>
>>>> +}
>>>> +
>>>>    igt_main
>>>>    {
>>>> 	int i915 = -1;
>>>> @@ -143,6 +164,15 @@ igt_main
>>>> 				test_reset(i915, dirfd, gt);
>>>> 	}
>>>>
>>>> +	igt_describe("Test basic freq API works after suspend");
>>>> +	igt_subtest_with_dynamic_f("freq-suspend") {
>>>> +		int dirfd, gt;
>>>> +
>>>> +		for_each_sysfs_gt_dirfd(i915, dirfd, gt)
>>>> +			igt_dynamic_f("gt%u", gt)
>>>> +				test_suspend(i915, dirfd, gt);
>>>> +	}
>>>> +
>>>> 	igt_fixture {
>>>> 		int dirfd, gt;
>>>> 		/* Restore frequencies */
>>>> --
>>>> 2.38.1
>>>>
