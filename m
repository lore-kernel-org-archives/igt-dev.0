Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB5810E456
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 09:48:43 +0000 (UTC)
Message-ID: <cee84e7f-e739-4db9-a104-a9a80799a765@intel.com>
Date: Tue, 16 Jan 2024 15:18:37 +0530
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Add LIC Type 1
 scenario
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, igt-dev@lists.freedesktop.org
References: <20240112103330.169688-1-suraj.kandpal@intel.com>
 <89c29c53-e4b9-403b-826b-a681bad2d9ab@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <89c29c53-e4b9-403b-826b-a681bad2d9ab@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Suraj,

On 16-Jan-24 3:04 PM, Nautiyal, Ankit K wrote:
> LGTM.
> 
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> 
> On 1/12/2024 4:03 PM, Suraj Kandpal wrote:
>> Currently LIC is done only for type0 content this patch
>> adds LIC for type1 content too.
>>
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   tests/kms_content_protection.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c 
>> b/tests/kms_content_protection.c
>> index 6d472ee02..38e4143c8 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -43,8 +43,11 @@
>>   #include "igt_kmod.h"
>>   /**
>> - * SUBTEST: lic
>> - * Description: Test for the integrity of link.
>> + * SUBTEST: lic-type-0
>> + * Description: Test for the integrity of link for type 0 content.
>> + *
>> + * SUBTEST: lic-type-1
>> + * Description: Test for the integrity of link for type 1 content.
>>    *

Instead if writing description like this you can add
lic-%arg[1]

@arg[1]:
@type0:		type-0
@type1:		type-1

Check this 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/docs/test_documentation.md?ref_type=heads

And functionality for both these tests will be hdcp1.4. Is this correct?
Or do we need to add hdcp2.2 too?
Please update functionality.

>>    * SUBTEST: content-type-change
>>    * Description: Test the content type change when the content 
>> protection already
>> @@ -783,11 +786,16 @@ static const struct {
>>         .cp_tests = CP_DPMS,
>>         .content_type = HDCP_CONTENT_TYPE_0
>>       },
>> -    { .desc = "Test for the integrity of link.",
>> -      .name = "lic",
>> +    { .desc = "Test for the integrity of link with type 0 content.",
>> +      .name = "lic-type-0",
>>         .cp_tests = CP_LIC,
>>         .content_type = HDCP_CONTENT_TYPE_0,
>>       },
>> +    { .desc = "Test for the integrity of link with type 1 content",
>> +      .name = "lic-type-1",
>> +      .cp_tests = CP_LIC,
>> +      .content_type = HDCP_CONTENT_TYPE_1,
>> +    },
>>       { .desc = "Test content protection with content type 1 "
>>             "that can be handled only through HDCP2.2.",
>>         .name = "type1",
