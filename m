Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4625410E350
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 06:40:09 +0000 (UTC)
Message-ID: <353050ea-4eef-fa41-48e7-7c08deb62da6@intel.com>
Date: Tue, 12 Sep 2023 12:09:47 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230908070053.1283474-1-swati2.sharma@intel.com>
 <20230908070053.1283474-3-swati2.sharma@intel.com>
 <d842a5c9-a95c-77d9-ce08-6f39197beae7@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <d842a5c9-a95c-77d9-ce08-6f39197beae7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_feature_discovery: add
 testplan documentation
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

On 11-Sep-23 7:57 PM, Modem, Bhanuprakash wrote:
> Hi Swati,
> 
> On Fri-08-09-2023 12:30 pm, Swati Sharma wrote:
>> Add testplan documentation for the subtests.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tests/kms_feature_discovery.c | 53 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_feature_discovery.c 
>> b/tests/kms_feature_discovery.c
>> index d1f4b1633..49958fd88 100644
>> --- a/tests/kms_feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -22,6 +22,58 @@
>>    *
>>    */
>> +/**
>> + * TEST: kms feature discovery
>> + * Category: Display
>> + * Description: A metatest that checks for \"features\" presence.
>> + *        The subtests here should only skip or pass,
>> + *        anything else means we have a serious problem.
>> + *
>> + * SUBTEST: display
>> + * Description: Make sure that we have display support with
>> + *         some outputs connected.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery
>> + * Mega feature: General Display Features
>> + * Run type: FULL
> 
> Please drop Run type for every test.

Done.

> 
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: display-%dx
> 
> Just for readability purpose, please move this test group to end of the 
> list.

I guess its better here only, display test followed by display-2x/3x/4x
tests. Its kind of one group.

> 
>> + * Description: Make sure that we have display support with %arg[1]
>> + *         outputs connected.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: chamelium
>> + * Description: Make sure that Chamelium is configured and reachable.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery, chamelium
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: psr1
>> + * Description: Make sure that we have eDP panel with PSR1 support.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery, psr1, eDP
>> + * Mega feature: General Display Features
> 
> Mega feature should be PSR.

Done

> 
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: psr2
>> + * Description: Make sure that we have eDP panel with PSR2 support.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery, psr2, eDP
>> + * Mega feature: General Display Features
> 
> Mega feature should be PSR.

Done

> 
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * arg[1].values: 2, 3, 4
>> + */
>> +
>>   #include "igt.h"
>>   #ifdef HAVE_CHAMELIUM
>>   #include "igt_chamelium.h"
>> @@ -46,7 +98,6 @@ igt_main {
>>       }
>>       igt_subtest_group {
>> -
> 
> Nit: Unrelated change.
> 
> - Bhanu
> 
>>           igt_fixture {
>>               igt_display_require(&display, fd);
>>           }
