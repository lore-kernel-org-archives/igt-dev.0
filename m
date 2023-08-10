Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6906F10E5D0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 18:07:51 +0000 (UTC)
Message-ID: <07ebb24b-2e9e-44f8-b254-74b9ff655db4@intel.com>
Date: Thu, 10 Aug 2023 23:35:06 +0530
Content-Language: en-US
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-24-bhanuprakash.modem@intel.com>
 <0b5da5c2-f4ec-87c4-de2d-eb15fd9fff36@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <0b5da5c2-f4ec-87c4-de2d-eb15fd9fff36@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 23/81] tests/i915/kms_legacy_colorkey:
 Document each subtest for testplan
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

Hi Swati,

On Wed-09-08-2023 05:22 pm, Sharma, Swati2 wrote:
> On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
>> Add documentation for all kms tests which is used by IGT testplan
>> documentation.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/i915/kms_legacy_colorkey.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/tests/i915/kms_legacy_colorkey.c 
>> b/tests/i915/kms_legacy_colorkey.c
>> index 450cb2e3f..fb1952113 100644
>> --- a/tests/i915/kms_legacy_colorkey.c
>> +++ b/tests/i915/kms_legacy_colorkey.c
>> @@ -24,6 +24,27 @@
>>   #include "igt.h"
>>   #include <errno.h>
>> +/**
>> + * TEST: kms legacy colorkey
>> + * Category: Display
>> + * Description: Check that the legacy set colorkey ioctl only works 
>> on sprite planes.
>> + *
>> + * SUBTEST: basic
>> + * Description: Test to check the legacy set colorkey ioctl only 
>> works for sprite planes.
> 
> Test description and subtest description is same.

This is simply adopted from igt_describe(), please feel free to fix that.

- Bhanu

> 
>> + * Driver requirement: i915
>> + * Functionality: xorg_xv
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: invalid-plane
>> + * Description: Check invalid plane id's, zero and outrange
>> + * Driver requirement: i915
>> + * Functionality: xorg_xv
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + */
>>   IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only 
>> works on sprite planes.");
