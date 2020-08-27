Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8786E184
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 12:44:14 +0000 (UTC)
References: <20200827120226.6855-1-sowmyax.kaparthi@intel.com>
 <152ce90e-5606-557c-f141-8e3226b95c3e@intel.com>
 <BL0PR11MB29934C33B622CBF3E26B8F189B550@BL0PR11MB2993.namprd11.prod.outlook.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <c935d367-a4d9-04d8-2dd8-f3952c63aa3e@intel.com>
Date: Thu, 27 Aug 2020 15:44:10 +0300
MIME-Version: 1.0
In-Reply-To: <BL0PR11MB29934C33B622CBF3E26B8F189B550@BL0PR11MB2993.namprd11.prod.outlook.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] Fixing the latency of hrtimer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kaparthi, SowmyaX" <sowmyax.kaparthi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sure,

The proportion of time in the test spent in the kernel depends on the 
number of wakeups.
Wakeups are driven by the hrtimer, so if you decrease the hrtimer, 
you'll have more wakeups and spend more time in the kernel.

The current expectation was computed for 5ms wakeups and it was 
expecting <= 1% of the time spent in the kernel.
With 2ms wakeups for instance you should be a bit over twice that : <= 2.5%.

-Lionel

On 27/08/2020 15:32, Kaparthi, SowmyaX wrote:
> As per your suggestions. I have updated the code and tested. It works fine with this change but  I did not understood what you are suggesting here. Can you please clearly make me understand that where I went wrong.
>
> -----Original Message-----
> From: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
> Sent: 27 August 2020 17:42
> To: Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>; igt-dev@lists.freedesktop.org; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> Subject: Re: [i-g-t] Fixing the latency of hrtimer
>
> On 27/08/2020 15:02, Sowmya Kaparthi wrote:
>> This test undergoes sanity check that we are not spending more than
>> 1/100th of the time awake in the kernel. The right thing would be to
>> adjust that value by the number of expected wakeups. We expect the
>> kernel time not to exceed 1/100th of the total test duration at the
>> default hrtimer of 200Hz/every5ms. Scale that by the provided hrtimer
>> if applicable.
>>
>> Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
>> Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
>> ---
>>    tests/i915/perf.c | 16 ++++++++++++++--
>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c index
>> a894fd38..952da84c 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -1993,6 +1993,7 @@ test_blocking(uint64_t requested_oa_period, bool
>> set_kernel_hrtimer, uint64_t ke
>>
>>    int64_t start, end;
>>    int n = 0;
>> +uint64_t max_expected_kernel_ns;
>>
>>    stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>
>> @@ -2098,7 +2099,12 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
>>     */
>>    igt_assert(n > (min_iterations + n_extra_iterations));
>>
>> -igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>> +if (set_kernel_hrtimer)
>> +max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100);
> That's not quite right.
>
>
> test_duration_ns / 100 is the expectation for a 5ms kernel_hrtimer.
>
> You can't just multiply that by kernel_hrtimer, it has a be proportional.
>
>
> Thanks,
>
>
> -Lionel
>
>
>> +else
>> +max_expected_kernel_ns = test_duration_ns / 100;
>> +
>> +igt_assert(kernel_ns <= max_expected_kernel_ns);
>>
>>    __perf_close(stream_fd);
>>    }
>> @@ -2152,6 +2158,7 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>>    int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
>>    int64_t start, end;
>>    int n = 0;
>> +uint64_t max_expected_kernel_ns;
>>
>>    stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>
>> @@ -2286,7 +2293,12 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
>>     */
>>    igt_assert(n > (min_iterations + n_extra_iterations));
>>
>> -igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>> +if (set_kernel_hrtimer)
>> +max_expected_kernel_ns = kernel_hrtimer * (test_duration_ns / 100);
>> +else
>> +max_expected_kernel_ns = test_duration_ns / 100;
>> +
>> +igt_assert(kernel_ns <= max_expected_kernel_ns);
>>
>>    __perf_close(stream_fd);
>>    }
>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
