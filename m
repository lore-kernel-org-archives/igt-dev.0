Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1289C29
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 10:51:59 +0000 (UTC)
Message-ID: <7ca1eac1-d3ac-3f98-1fa9-2bccd87e1394@intel.com>
Date: Tue, 24 Jan 2023 16:21:53 +0530
MIME-Version: 1.0
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230124065152.19747-1-swati2.sharma@intel.com>
 <20230124065152.19747-4-swati2.sharma@intel.com>
 <def29359dff009a21a53dfd8d7f08dd3fce93d25.camel@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <def29359dff009a21a53dfd8d7f08dd3fce93d25.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] tests/i915/kms_dsc: Remove
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



On 24-Jan-23 4:17 PM, Hogander, Jouni wrote:
> On Tue, 2023-01-24 at 12:21 +0530, Swati Sharma wrote:
>> Array can be used for plane_format. Use that and remove
>> struct.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/i915/kms_dsc.c | 15 +++------------
>>   1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index af9466518..62df87636 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -52,16 +52,7 @@ typedef struct {
>>          enum pipe pipe;
>>   } data_t;
>>   
>> -const struct {
>> -       const int format;
>> -       const char format_str[20];
>> -} format_list[] = {
>> -       {DRM_FORMAT_XYUV8888, "XYUV8888"},
>> -       {DRM_FORMAT_XRGB2101010, "XRGB2101010"},
>> -       {DRM_FORMAT_XRGB16161616F, "XRGB16161616F"},
>> -       {DRM_FORMAT_YUYV, "YUYV"},
>> -};
>> -
>> +int format_list[] =  {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010,
>> DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>>   uint32_t bpc_list[] = {12, 10, 8};
> 
> I think format_list should be static. Not matter of this patch, but
> maybe you could change bpc_list as a static too.
> 
Right, will make that change.

>>   
>>   static inline void manual(const char *expected)
>> @@ -242,7 +233,7 @@ igt_main
>>                       "with default parameters and creating fb with
>> diff formats");
>>          igt_subtest_with_dynamic("dsc-with-formats") {
>>                  for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> -                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> format_list[k].format);
>> +                       test_dsc(&data, TEST_DSC_BASIC, 0,
>> format_list[k]);
>>          }
>>   
>>          igt_describe("Tests basic display stream compression
>> functionality if supported "
>> @@ -259,7 +250,7 @@ igt_main
>>          igt_subtest_with_dynamic("dsc-with-bpc-formats") {
>>                  for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>>                          for (int k = 0; k < ARRAY_SIZE(format_list);
>> k++) {
>> -                               test_dsc(&data, TEST_DSC_BPC,
>> bpc_list[j], format_list[k].format);
>> +                               test_dsc(&data, TEST_DSC_BPC,
>> bpc_list[j], format_list[k]);
>>                          }
>>                  }
>>          }
> 

-- 
~Swati Sharma
