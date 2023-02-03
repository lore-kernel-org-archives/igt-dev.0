Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187CC10E797
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 13:26:59 +0000 (UTC)
Message-ID: <69b00d34-d7ad-ad24-8f3b-9ec14d73ea75@intel.com>
Date: Fri, 3 Feb 2023 18:56:54 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, =?UTF-8?Q?Jouni_H=c3=b6gander?=
 <jouni.hogander@intel.com>
References: <20230202072121.26153-1-swati2.sharma@intel.com>
 <20230202072121.26153-4-swati2.sharma@intel.com>
 <20230203122909.7i7435opcxi2adee@kamilkon-desk1>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230203122909.7i7435opcxi2adee@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/6] tests/i915/kms_dsc: Remove
 pointless struct
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

Hi Kamil,

Can we add checkpatch for patchwork IGT in CI infrastructure like how we 
have for patchwork intel-gfx?

On 03-Feb-23 5:59 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-02-02 at 12:51:18 +0530, Swati Sharma wrote:
>> Array can be used for plane_format. Use that and remove
>> struct.
>>
>> v2: -make format list static (Jouni)
> 
> Please use checkpatch script from Linux kernel source to find out
> and correct some problems. You can sometimes ignore some warnings
> like line too long or string splitted but please correct all
> others.
> 
> +cc Jouni

Sorry, this patch is already merged; will take care next time.

> 
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/i915/kms_dsc.c | 15 +++------------
>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index af9466518..0f048e575 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -52,16 +52,7 @@ typedef struct {
>>   	enum pipe pipe;
>>   } data_t;
>>   
>> -const struct {
>> -	const int format;
>> -	const char format_str[20];
>> -} format_list[] = {
>> -	{DRM_FORMAT_XYUV8888, "XYUV8888"},
>> -	{DRM_FORMAT_XRGB2101010, "XRGB2101010"},
>> -	{DRM_FORMAT_XRGB16161616F, "XRGB16161616F"},
>> -	{DRM_FORMAT_YUYV, "YUYV"},
>> -};
>> -
>> +static int format_list[] =  {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
> ---------------------------- ^^ ^
> imho this should be:
> static int format_list[] = {
> 	DRM_FORMAT_XYUV8888,
> 	DRM_FORMAT_XRGB2101010,
> 	DRM_FORMAT_XRGB16161616F,
> 	DRM_FORMAT_YUYV
> };
> 
> Regards,
> Kamil
> 
>>   uint32_t bpc_list[] = {12, 10, 8};
>>   
>>   static inline void manual(const char *expected)
>> @@ -242,7 +233,7 @@ igt_main
>>   		     "with default parameters and creating fb with diff formats");
>>   	igt_subtest_with_dynamic("dsc-with-formats") {
>>   		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> -			test_dsc(&data, TEST_DSC_BASIC, 0, format_list[k].format);
>> +			test_dsc(&data, TEST_DSC_BASIC, 0, format_list[k]);
>>   	}
>>   
>>   	igt_describe("Tests basic display stream compression functionality if supported "
>> @@ -259,7 +250,7 @@ igt_main
>>   	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
>>   		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>>   			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
>> -				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
>> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k]);
>>   			}
>>   		}
>>   	}
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
