Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B998D10E16A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 08:22:48 +0000 (UTC)
Message-ID: <a6a8c173-98ac-f423-cefd-1ec61f4068b2@intel.com>
Date: Wed, 20 Sep 2023 13:52:42 +0530
MIME-Version: 1.0
References: <20230918101150.258055-1-swati2.sharma@intel.com>
 <20230920080003.irracppwfyjvx4p4@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230920080003.irracppwfyjvx4p4@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: rename
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 20-Sep-23 1:30 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-09-18 at 15:41:50 +0530, Swati Sharma wrote:
>> Use '-' instead of '_' while naming subtests and subtest name
>> should use small case.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_content_protection.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 9378a76c1..ea0c4a0ab 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -491,14 +491,14 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>>   }
>>   
>>   /**
>> - * SUBTEST: LIC
>> + * SUBTEST: lic
>>    * Description: Test for the integrity of link.
>>    * Driver requirement: i915, xe
>>    * Functionality: hdcp1.4
>>    * Mega feature: HDCP
>>    * Test category: functionality test
>>    *
>> - * SUBTEST: content_type_change
>> + * SUBTEST: content-type-change
> 
> imho this may be also just spaces (the same goes for TEST name).
> If in doubt please ask Mauro, +cc Mauro, this may be:
> 
>    * SUBTEST: content type change
> 
> testplan.py should fill proper delimiter here. Other changes are ok,

Hi Kamil,

Thanks for the review. Even if we have above case, i will still go with 
'-' delimiter since all kms tests have this delimiter. I don't want to 
change only for this case.

> 
> Regards,
> Kamil
> 
>>    * Description: Test the content type change when the content protection already
>>    *              enabled
>>    * Driver requirement: i915, xe
>> @@ -506,7 +506,7 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>>    * Mega feature: HDCP
>>    * Test category: functionality test
>>    *
>> - * SUBTEST: mei_interface
>> + * SUBTEST: mei-interface
>>    * Description: Test the teardown and rebuild of the interface between Intel
>>    *              and mei hdcp.
>>    * Driver requirement: i915, xe
>> @@ -802,7 +802,7 @@ static const struct {
>>   	  .content_type = HDCP_CONTENT_TYPE_0
>>   	},
>>   	{ .desc = "Test for the integrity of link.",
>> -	  .name = "LIC",
>> +	  .name = "lic",
>>   	  .cp_tests = CP_LIC,
>>   	  .content_type = HDCP_CONTENT_TYPE_0,
>>   	},
>> @@ -814,12 +814,12 @@ static const struct {
>>   	},
>>   	{ .desc = "Test the teardown and rebuild of the interface between "
>>   		  "Intel and mei hdcp.",
>> -	  .name = "mei_interface",
>> +	  .name = "mei-interface",
>>   	  .cp_tests = CP_MEI_RELOAD,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>>   	},
>>   	{ .desc = "Test the content type change when the content protection already enabled",
>> -	  .name = "content_type_change",
>> +	  .name = "content-type-change",
>>   	  .cp_tests = CP_TYPE_CHANGE,
>>   	  .content_type = HDCP_CONTENT_TYPE_1,
>>   	},
>> -- 
>> 2.25.1
>>

