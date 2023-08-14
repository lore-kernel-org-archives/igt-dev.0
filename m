Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEAD10E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 07:59:58 +0000 (UTC)
Message-ID: <a0855d90-52de-2e8e-77a2-0931c481d761@intel.com>
Date: Mon, 14 Aug 2023 13:29:19 +0530
MIME-Version: 1.0
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-40-bhanuprakash.modem@intel.com>
 <12e3ef42-fe49-8682-303a-8f4025b38930@intel.com>
In-Reply-To: <12e3ef42-fe49-8682-303a-8f4025b38930@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [V5 i-g-t 39/81] tests/kms_concurrent: Document each
 subtest for testplan
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


On 09-Aug-23 5:35 PM, Sharma, Swati2 wrote:
> LGTM
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
> On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
>> Add documentation for all kms tests which is used by IGT testplan
>> documentation.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_concurrent.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
>> index d915a98b2..f5fe321a2 100644
>> --- a/tests/kms_concurrent.c
>> +++ b/tests/kms_concurrent.c
>> @@ -24,6 +24,32 @@
>>   #include "igt.h"
>>   #include "drmtest.h"
>> +/**
>> + * TEST: kms concurrent
>> + * Category: Display
>> + * Description: Test atomic mode setting concurrently with multiple 
>> planes and
>> + *              screen resolution
>> + *
>> + * SUBTEST: pipe-%s
>> + * Description: Test atomic mode setting concurrently with multiple 
>> planes and
>> + *              screen resolution on %arg[1].
>> + * Driver requirement: any
>> + * Functionality: kms_core

Sorry, missed in previous review. Add plane as functionality too.

>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @A:      pipe A
>> + * @B:      pipe B
>> + * @C:      pipe C
>> + * @D:      pipe D
>> + * @E:      pipe E
>> + * @F:      pipe F
>> + * @G:      pipe G
>> + * @H:      pipe H
>> + */
>>   IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with 
>> multiple planes and screen resolution");
