Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923D310E295
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 13:23:59 +0000 (UTC)
Message-ID: <d12956e8-a29f-a6ca-eb85-110110e342a2@intel.com>
Date: Mon, 31 Jul 2023 18:53:27 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Sundaresan, Sujaritha"
 <sujaritha.sundaresan@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20230728060906.2047834-1-riana.tauro@intel.com>
 <825ff60a-aa42-7941-8d27-6002935e58b3@intel.com>
 <cb014e1f-b302-6705-a00e-a98855af0d9d@intel.com>
 <1f93b4b2-24ac-431f-0e4d-6b407f3a5892@intel.com>
 <CY5PR11MB6211507AB9E69C3FA0A716F39505A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211507AB9E69C3FA0A716F39505A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] RFC tests/xe: Stress test GT C states
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

On 7/31/2023 5:34 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Monday, July 31, 2023 3:38 PM
>> To: Tauro, Riana <riana.tauro@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: Nilawar, Badal <badal.nilawar@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>
>> Subject: Re: [igt-dev] [PATCH i-g-t] RFC tests/xe: Stress test GT C states
>>
>>
>> On 7/31/2023 1:57 PM, Riana Tauro wrote:
>>> Hi Suja
>>>
>>> On 7/31/2023 1:00 PM, Sundaresan, Sujaritha wrote:
>>>>
>>>> On 7/28/2023 11:39 AM, Riana Tauro wrote:
>>>>> stress test GT C states by checking if GT is in C0 when forcewake is
>>>>> acquired and in C6 once released.
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>    tests/xe/xe_pm_residency.c | 27 +++++++++++++++++++++++++++
>>>>>    1 file changed, 27 insertions(+)
>>>>>
>>>>> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
>>>>> index 4936de166..9713e61cd 100644
>>>>> --- a/tests/xe/xe_pm_residency.c
>>>>> +++ b/tests/xe/xe_pm_residency.c
>>>>> @@ -85,6 +85,29 @@ static void test_idle_residency(int fd, int gt)
>>>>>        assert_within_epsilon(residency_end - residency_start,
>>>>> elapsed_ms, tolerance);
>>>>>    }
>>>>> +/**
>>>>> + * SUBTEST: stress-gt-c6
>>>>> + * Description: stress test GT C states by acquiring/releasing
>>>>> forcewake
>>>>> + * Run type: FULL
>>>>> + */
>>>>> +static void stress_c6(int fd, int n) {
>>>>> +    int handle, gt;
>>>>> +
>>>>> +    while (n--) {
>>>>> +        handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
>>>>> +        igt_assert(handle >= 0);
>>>>> +        /* check if all gts are in C0 after forcewake is acquired
>>>>> +*/
>>>>> +        xe_for_each_gt(fd, gt)
>>>>> +            igt_assert_f(!xe_is_gt_in_c6(fd, gt), "GT in C6\n");
>>>>> +        close(handle);
>>>>> +        /* check if all gts are in C6 after forcewake is released
>>>>> +*/
>>>>> +        xe_for_each_gt(fd, gt)
>>>>> +            igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
>>>>> +                     "GT is not in C6\n");
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    igt_main
>>>>>    {
>>>>>        int fd, gt;
>>>>> @@ -104,6 +127,10 @@ igt_main
>>>>>            xe_for_each_gt(fd, gt)
>>>>>                test_idle_residency(fd, gt);
>>>>> +    igt_describe("stress test GT C states by acquiring/releasing
>>>>> forcewake");
>>>>> +    igt_subtest("stress-gt-c6")
> How about toggle-gt-c6 ?
Sounds better. Will rename and send a new rev

Thanks
Riana
> Thanks,
> Anshuman Gupta.
>>>>> +        stress_c6(fd, 16);
>>>>> +
>>>>>        igt_fixture {
>>>>>            close(fd);
>>>>>        }
>>>>
>>>> Hi Riana,
>>>>
>>>> Just curious, But usually stress testing involves some sort a
>>>> workload running to test out rc6 during the run. Will you be
>>>> introducing another test with a spinner of sorts ?I will be sending
>>>> out another patch series for exec as well which will
>>> be similar to rc6-idle of i915.
>> Got it.
>>>
>>> This patch does only acquiring/releasing forcewake and checks GT C
>>> states. added a loop to check multiple times.
>> The loop for this case makes sense.
>>>
>>> Should i rename the test?
>> Maybe ? But I'm not sure to what. I guess this is between sanity and stress test.
>> So that can be your call I guess.
>>>
>>> Thanks
>>> Riana
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
