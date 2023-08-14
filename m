Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072B10E013
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 10:06:59 +0000 (UTC)
Message-ID: <42c304e3-d605-cc00-4579-260cc973e7f3@intel.com>
Date: Mon, 14 Aug 2023 15:36:54 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-17-bhanuprakash.modem@intel.com>
 <963feb81-6a1d-1535-c76b-af1f1947633d@intel.com>
 <0912f0c5-3eb3-b903-8342-88e927cbf8ed@intel.com>
 <6de815ec-bb1c-b809-e469-b89604862929@intel.com>
 <20230814113907.6a990b1b@maurocar-mobl2>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230814113907.6a990b1b@maurocar-mobl2>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [V5 i-g-t 16/81] tests/i915/kms_dsc: Document each
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 14-Aug-23 3:09 PM, Mauro Carvalho Chehab wrote:
> On Mon, 14 Aug 2023 10:34:52 +0530
> "Sharma, Swati2" <swati2.sharma@intel.com> wrote:
> 
>> On 10-Aug-23 10:53 PM, Modem, Bhanuprakash wrote:
>>> Hi Swati,
>>>
>>> On Wed-09-08-2023 01:20 pm, Sharma, Swati2 wrote:
>>>> On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
>>>>> Add documentation for all kms tests which is used by IGT testplan
>>>>> documentation.
>>>>>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>    tests/i915/kms_dsc.c | 27 +++++++++++++++++++++++++++
>>>>>    1 file changed, 27 insertions(+)
>>>>>
>>>>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>>>>> index 0a3e29924..4cce7face 100644
>>>>> --- a/tests/i915/kms_dsc.c
>>>>> +++ b/tests/i915/kms_dsc.c
>>>>> @@ -30,8 +30,35 @@
>>>>>     *
>>>>>     */
>>>>> +/**
>>>>> + * TEST: kms dsc
>>>>> + * Category: Display
>>>>> + * Description: Test to validate display stream compression
>>>>> + */
>>>>>    #include "kms_dsc_helper.h"
>>>>> +/**
>>>>> + * SUBTEST: dsc-%s
>>>>> + * Description: Tests basic display stream compression functionality
>>>>> if supported
>>>>> + *              by a connector by forcing %arg[1]
>>>>
>>>> forcing DSC on all connectors that support it with %arg[1]
>>>> (remove this from below subtests description)
>>>
>>> This description is adopted from igt_describe(), Feel free to update the
>>> subtest description I can pick it from there.
>>
>> But you haven't copied it as it is..right? Its the optimized version
>> of igt_describe(). I simply meant.
>> "forcing DSC on all connectors that support it with %arg[1]" => is
>> redundant in descriptions you have written below for each subtest.
>> We don't have to change igt_describe() for this. This should be handled
>> here.
>>
>>>    
>>>>   
>>>>> + * Driver requirement: any
>>>>
>>>> This is intel specific test.
>>>
>>> Yes. As this kms testplan is designed for Intel, the allowed values are:
>>>
>>> i915: supports i915 driver only
>>> xe: supports xe driver only
>>> any: supports both i915 & xe
>>
>> This ANY seems to correspond to drm_open_driver_master(DRIVER_ANY).
>> IDK this is right. @mauro do you have any inputs here?
>> Shouldn't "any" correspond to "any" driver. Even if this documentation
>> is specific to intel but tests outside i915/ directory are used by other
>> vendors too.
> 
> IMO, the best here is to provide a list of drivers that support the test,
> e. g.:
> 
> 	Driver requirement: i915, xe
> 
> Rationale:
> 
> - It lets it clear that only Intel drivers are supported;
> - It is clear what drivers support it;
> - There's no need to document somewhere what "any" means;
> - If in the future we have a new XYZ driver that it is not supported
>    by this test, there won't be any need to change existing documentation;
> - We already use comma-separated lists for other fields, like feature
>    (used on some core tests and at i915 driver).

Agree. @modem can we make these changes in complete series?

> 
> Regards,
> Mauro

