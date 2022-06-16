Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117AA113B69
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 08:55:59 +0000 (UTC)
Message-ID: <32a2c998-4a80-0fd3-07f8-b6e53e954035@intel.com>
Date: Thu, 16 Jun 2022 14:25:45 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20220613062447.21577-1-karthik.b.s@intel.com>
 <Yqb8T0PUOfFEgb7U@zkempczy-mobl2>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <Yqb8T0PUOfFEgb7U@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: Move
 intel_ibb_destroy out of test_cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6/13/2022 2:28 PM, Zbigniew Kempczyński wrote:
> On Mon, Jun 13, 2022 at 11:54:47AM +0530, Karthik B S wrote:
>> All the clean up functions were moved to fixture in patch "2aff4179".
>> But this causes an assert in intel_bb_destory() after the test passes,
>> on configurations having eDP connected.
>>
>> So moving the intel_bb_destroy() call back to the original function.
> Yes, calling intel_bb_destroy() in fixture is problematic. When test completes
> we clean the allocator and initialize it from scratch for next test.
>
> With intel-bb and softpin during intel_bb_create() we open allocator (get ahnd)
> which is not valid after test completes. So intel_bb_destroy() in fixture
> will try to free all offsets for attached intel_bufs. Unfortunately allocator
> was already reinitialized and there's no ahnd in it.
Thank you for the details. I was wondering how exactly this was breaking 
the test.
>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks for the ack.

Thanks,
Karthik.B.S
>
> --
> Zbigniew
>
>> Fixes: 2aff41793e5f ("tests/i915/kms_big_fb: Move cleanup code to fixture")
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/i915/kms_big_fb.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
>> index abf974bb..d50fde45 100644
>> --- a/tests/i915/kms_big_fb.c
>> +++ b/tests/i915/kms_big_fb.c
>> @@ -457,6 +457,8 @@ static bool test_pipe(data_t *data)
>>   	if (data->format == DRM_FORMAT_C8)
>>   		unset_lut(data);
>>   
>> +	intel_bb_destroy(data->ibb);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -549,6 +551,8 @@ max_hw_stride_async_flip_test(data_t *data)
>>   	}
>>   	igt_reset_timeout();
>>   
>> +	intel_bb_destroy(data->ibb);
>> +
>>   	return true;
>>   }
>>   
>> @@ -763,7 +767,6 @@ static void test_cleanup(data_t *data)
>>   	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
>>   	igt_remove_fb(data->drm_fd, &data->small_fb);
>>   
>> -	intel_bb_destroy(data->ibb);
>>   	data->output = NULL;
>>   }
>>   
>> -- 
>> 2.22.0
>>
