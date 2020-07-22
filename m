Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473188944A
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2020 05:58:16 +0000 (UTC)
References: <20200716141557.15909-1-anshuman.gupta@intel.com>
 <54af2290-3f1c-15b7-2f73-04d183f8f12a@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <6b46a8be-c0a9-e311-a0f5-d53413a14039@intel.com>
Date: Wed, 22 Jul 2020 11:28:11 +0530
MIME-Version: 1.0
In-Reply-To: <54af2290-3f1c-15b7-2f73-04d183f8f12a@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_lpsp: Add igt_wait to
 test lpsp
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
To: "Manna, Animesh" <animesh.manna@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the patch and the review. Pushed.

On 17-Jul-20 11:24 AM, Manna, Animesh wrote:
> 
> On 16-07-2020 19:45, Anshuman Gupta wrote:
>> Sometimes LPSP test may fail due to HOTPLUG events,
>> which initiates AUX transaction in order to detect a Connector
>> status, these ongoing AUX transaction may fail the LPSP igt test.
>> Adding a igt_wait will avoid such failures.
>> Some eDP panel may have power_cycle_delay of 600ms,
>> therefore 1sec delay is safer.
>>
>> Cc: Animesh Manna<animesh.manna@intel.com>
>> Signed-off-by: Anshuman Gupta<anshuman.gupta@intel.com>
> 
> LGTM.
> Reviewed-by: Animesh Manna<animesh.manna@intel.com>
> 
>> ---
>>   tests/i915/i915_pm_lpsp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
>> index 12670f22..e9a59307 100644
>> --- a/tests/i915/i915_pm_lpsp.c
>> +++ b/tests/i915/i915_pm_lpsp.c
>> @@ -163,7 +163,8 @@ static void test_lpsp(data_t *data)
>>   		    data->mode->vdisplay <= 2160);
>>   
>>   	setup_lpsp_output(data);
>> -	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
>> +	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
>> +		     "%s: lpsp is not enabled\n%s:\n%s\n",
>>   		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
>>   		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>>   }
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
