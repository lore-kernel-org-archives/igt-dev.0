Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <ee6394ca-ccab-7fc7-ba23-f5bdb449c45f@intel.com>
Date: Mon, 3 Apr 2023 10:22:34 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230328020028.2143954-1-vinay.belgaumkar@intel.com>
 <20230328020028.2143954-3-vinay.belgaumkar@intel.com>
 <87bkk8h3uy.wl-ashutosh.dixit@intel.com>
 <7327d651-d31f-8e20-a9a9-38b0ec37b86a@intel.com>
 <87jzytdlkl.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87jzytdlkl.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915_pm_freq_api: Add some basic
 SLPC igt tests
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


On 4/3/2023 8:36 AM, Dixit, Ashutosh wrote:
> On Mon, 03 Apr 2023 08:23:45 -0700, Belgaumkar, Vinay wrote:
>>
>> On 3/31/2023 4:56 PM, Dixit, Ashutosh wrote:
>>> On Mon, 27 Mar 2023 19:00:28 -0700, Vinay Belgaumkar wrote:
>>> Hi Vinay,
>>>
>>>> +/*
>>>> + * Too many intermediate components and steps before freq is adjusted
>>>> + * Specially if workload is under execution, so let's wait 100 ms.
>>>> + */
>>>> +#define ACT_FREQ_LATENCY_US 100000
>>>> +
>>>> +static uint32_t get_freq(int dirfd, uint8_t id)
>>>> +{
>>>> +	uint32_t val;
>>>> +
>>>> +	igt_require(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
>>> igt_assert?
>> ok.
>>>> +static void test_freq_basic_api(int dirfd, int gt)
>>>> +{
>>>> +	uint32_t rpn, rp0, rpe;
>>>> +
>>>> +	/* Save frequencies */
>>>> +	rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>>>> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>>>> +	rpe = get_freq(dirfd, RPS_RP1_FREQ_MHZ);
>>>> +	igt_info("System min freq: %dMHz; max freq: %dMHz\n", rpn, rp0);
>>>> +
>>>> +	/*
>>>> +	 * Negative bound tests
>>>> +	 * RPn is the floor
>>>> +	 * RP0 is the ceiling
>>>> +	 */
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1) < 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0 + 1) < 0);
>>>> +	igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn - 1) < 0);
>>> Is this supposed to be RPS_MAX_FREQ_MHZ?
>> We could do this check for max as well. But this is trying to see if min
>> can be set to below rpn.
> In that case this statement is the same as the first one (2 lines
> above). Is that needed?

ah, yes. Need more coffee. That should be RPS_MAX_FREQ_MHZ.

Thanks,

Vinay.

>
>
>
>>>> +	igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rp0 + 1) < 0);
>>>> +
>>> After addressing the above, this is:
>>>
>>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>
>>> Also, before merging it would be good to see the results of the new
>>> tests. So could you add a HAX patch adding the new tests to
>>> fast-feedback.testlist and resend the series?
>> Sure, will do. Thanks for the review.
>>
>> Vinay.
>>
>>> Thanks.
>>> --
>>> Ashutosh
