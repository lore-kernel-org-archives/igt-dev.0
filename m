Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3B810E0F5
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 18:20:08 +0000 (UTC)
Message-ID: <c545097f-5436-d559-f02e-8f051357d943@amd.com>
Date: Tue, 20 Dec 2022 11:20:02 -0700
To: Melissa Wen <mwen@igalia.com>
References: <20221219192150.1497674-1-alex.hung@amd.com>
 <20221220115544.ytkcz3jyfobkg3rm@mail.igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20221220115544.ytkcz3jyfobkg3rm@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_color: Reduce skips on some ctm-*
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-12-20 04:55, Melissa Wen wrote:
> On 12/19, Alex Hung wrote:
>> 64d0ff72 introduced a workaround for ctm-max but the condition caused
>> other ctm tests to skip unintentionally on some platforms.
> 
> Hi Alex,
> 
> Can't we just drop this gamma/degamma setup for CTM tests?
> 
> I remember thinking about removing this setup before... From DRM docs,
> "Each of the properties are optional." so I don't see an explicity
> reason for degamma/gamma dependencies. I think we should only test the
> CTM property here, or change the name of the subtest to describe a full
> color mgmt testing.
> 
> I took a look at previous discussions on having or not degamma/gamma
> here and if it's an intel limitation, than I prefer to explicitly
> restrict it for i915 HW. What do you think?

Hi Melissa,

I may not understand you 100%.

Could you please share what you'd like to change, or create a patch for 
more discussion?

Cheers,
Alex

> 
> Best regards,
> 
> Melissa
> 
>>
>> The patch improves the condition by keeping the original condition
>> for i915 and checking degamma and gamma props for others. The
>> following subtests will be executed instead of skipped.
>>
>>    kms_color@ctm-0-25@*
>>    kms_color@ctm-0-50@*
>>    kms_color@ctm-0-75@*
>>    kms_color@ctm-red-to-blue@*
>>    kms_color@ctm-negative@*
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   tests/kms_color.c | 30 +++++++++++++++++++++---------
>>   1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index d016cefb..450bf7ca 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -446,6 +446,26 @@ end:
>>   	return ret;
>>   }
>>   
>> +static bool is_gamma_degamma_supported(data_t *data,
>> +				       igt_plane_t *primary,
>> +				       color_t *before,
>> +				       color_t *after)
>> +{
>> +	/*
>> +	 * Don't program LUT's for max CTM cases, as limitation of
>> +	 * representing intermediate values between 0 and 1.0 causes
>> +	 * rounding issues and inaccuracies leading to crc mismatch.
>> +	 */
>> +	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(color_t)))
>> +		return true;
>> +
>> +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT) &&
>> +	    igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   /*
>>    * Draw 3 rectangles using before colors with the ctm matrix apply and verify
>>    * the CRC is equal to using after colors with an identify ctm matrix.
>> @@ -493,14 +513,7 @@ static bool test_pipe_ctm(data_t *data,
>>   	igt_assert(fb_modeset_id);
>>   	igt_plane_set_fb(primary, &fb_modeset);
>>   
>> -	/*
>> -	 * Don't program LUT's for max CTM cases, as limitation of
>> -	 * representing intermediate values between 0 and 1.0 causes
>> -	 * rounding issues and inaccuracies leading to crc mismatch.
>> -	 */
>> -	if (memcmp(before, after, sizeof(color_t))) {
>> -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
>> -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>> +	if (is_gamma_degamma_supported(data, primary, before, after)) {
>>   
>>   		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>>   		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
>> @@ -508,7 +521,6 @@ static bool test_pipe_ctm(data_t *data,
>>   		set_degamma(data, primary->pipe, degamma_linear);
>>   		set_gamma(data, primary->pipe, gamma_linear);
>>   	} else {
>> -		/* Disable Degamma and Gamma for ctm max test */
>>   		disable_degamma(primary->pipe);
>>   		disable_gamma(primary->pipe);
>>   	}
>> -- 
>> 2.25.1
>>
