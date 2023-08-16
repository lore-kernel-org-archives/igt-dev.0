Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <aeeaa6f1-f194-5cd1-4327-f44959bf0de7@intel.com>
Date: Wed, 16 Aug 2023 13:01:12 +0530
From: Riana Tauro <riana.tauro@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
References: <20230809005014.3451790-1-vinay.belgaumkar@intel.com>
 <b5e574a1-7aa4-d233-3b02-f0acbac517bc@intel.com>
Content-Language: en-US
In-Reply-To: <b5e574a1-7aa4-d233-3b02-f0acbac517bc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915_pm_freq_api:
 Ignore zero register value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/14/2023 12:54 PM, Riana Tauro wrote:
> Hi Vinay
> 
> On 8/9/2023 6:20 AM, Vinay Belgaumkar wrote:
>> Register read for requested_freq can return 0 when system is
>> in runtime_pm. Make allowance for this case.
>>
>> Link: https://gitlab.freedesktop.org/drm/intel/issues/8736
>> Link: https://gitlab.freedesktop.org/drm/intel/issues/8989
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   tests/i915/i915_pm_freq_api.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/i915/i915_pm_freq_api.c 
>> b/tests/i915/i915_pm_freq_api.c
>> index cf21cc936..9c71411ee 100644
>> --- a/tests/i915/i915_pm_freq_api.c
>> +++ b/tests/i915/i915_pm_freq_api.c
>> @@ -88,6 +88,7 @@ static void test_freq_basic_api(int dirfd, int gt)
>>   static void test_reset(int i915, int dirfd, int gt, int count)
>>   {
>>       uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>> +    uint32_t req_freq;
>>       int fd;
>>       for (int i = 0; i < count; i++) {
>> @@ -95,14 +96,18 @@ static void test_reset(int i915, int dirfd, int 
>> gt, int count)
>>           igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>           igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>           usleep(ACT_FREQ_LATENCY_US);
>> -        igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>> +        req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>> +        if (req_freq)
>> +            igt_assert_eq(req_freq, rpn);
> 
> Is there anything else that can cause req_freq to be zero?
> 
> To differentiate can we assert only when runtime_status is active 
> (igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE) ?
> 

Hi Vinay

using  igt_get_runtime_pm_status doesn't work. There seems to be a delay 
in setting the status to suspended.

Freq is 0 [due to wakeref not in use] and status remains active.

We can retain this patch. Sorry for the confusion.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks
Riana Tauro
> 
> Thanks
> Riana Tauro
>>           /* Manually trigger a GT reset */
>>           fd = igt_debugfs_gt_open(i915, gt, "reset", O_WRONLY);
>>           igt_require(fd >= 0);
>>           igt_ignore_warn(write(fd, "1\n", 2));
>> -        igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>> +        req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>> +        if (req_freq)
>> +            igt_assert_eq(req_freq, rpn);
>>       }
>>       close(fd);
>>   }
>> @@ -110,17 +115,22 @@ static void test_reset(int i915, int dirfd, int 
>> gt, int count)
>>   static void test_suspend(int i915, int dirfd, int gt)
>>   {
>>       uint32_t rpn = get_freq(dirfd, RPS_RPn_FREQ_MHZ);
>> +    uint32_t req_freq;
>>       igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, rpn) > 0);
>>       igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, rpn) > 0);
>>       usleep(ACT_FREQ_LATENCY_US);
>> -    igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>> +    req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>> +    if (req_freq)
>> +        igt_assert_eq(req_freq, rpn);
>>       /* Manually trigger a suspend */
>>       igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>>                         SUSPEND_TEST_NONE);
>> -    igt_assert_eq(get_freq(dirfd, RPS_CUR_FREQ_MHZ), rpn);
>> +    req_freq = get_freq(dirfd, RPS_CUR_FREQ_MHZ);
>> +    if (req_freq)
>> +        igt_assert_eq(req_freq, rpn);
>>   }
>>   int i915 = -1;
