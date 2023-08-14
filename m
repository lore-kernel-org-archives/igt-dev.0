Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E63910E137
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 07:42:48 +0000 (UTC)
Message-ID: <92b7a7d2-18f4-281a-8e14-303767ab0df4@intel.com>
Date: Mon, 14 Aug 2023 13:12:21 +0530
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-51-bhanuprakash.modem@intel.com>
 <d1616c9c-973d-4398-9b02-a2f0774d30f8@intel.com>
 <850d7b56-3e24-2d8f-40f2-1d7d388bf8aa@intel.com>
 <894144eb-44a2-44d3-bbea-93bf231018fb@intel.com>
 <528f0bd4-6e93-4abd-ebfa-c56e3a2c2ba1@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <528f0bd4-6e93-4abd-ebfa-c56e3a2c2ba1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 50/81] tests/kms_getfb: Document each
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


On 8/14/2023 1:08 PM, Modem, Bhanuprakash wrote:
> Hi Karthik,
>
> On Mon-14-08-2023 12:49 pm, Karthik B S wrote:
>>
>> On 8/14/2023 12:35 PM, Modem, Bhanuprakash wrote:
>>> Hi Karthik,
>>>
>>> On Mon-14-08-2023 10:21 am, Karthik B S wrote:
>>>>
>>>> On 8/12/2023 12:16 AM, Bhanuprakash Modem wrote:
>>>>> Add documentation for all kms tests which is used by IGT testplan
>>>>> documentation.
>>>>>
>>>>> V2: - Fix functionality
>>>>>
>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>   tests/kms_getfb.c | 90 
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 90 insertions(+)
>>>>>
>>>>> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
>>>>> index afcf07fe8..1caa46e23 100644
>>>>> --- a/tests/kms_getfb.c
>>>>> +++ b/tests/kms_getfb.c
>>>>> @@ -27,6 +27,11 @@
>>>>>    *
>>>>>    */
>>>>> +/**
>>>>> + * TEST: kms getfb
>>>>> + * Category: Display
>>>>> + * Description: Tests GETFB and GETFB2 ioctls.
>>>>> + */
>>>>>   #include "igt.h"
>>>>>   #include <unistd.h>
>>>>>   #include <stdlib.h>
>>>>> @@ -169,6 +174,22 @@ static uint32_t get_any_prop_id(int fd)
>>>>>       return 0;
>>>>>   }
>>>>> +/**
>>>>> + * SUBTEST: getfb-handle-%s
>>>>> + * Description: Tests error handling %arg[1]
>>>>> + * Driver requirement: any
>>>>> + * Functionality: kms_gem_interop
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * arg[1]:
>>>>> + *
>>>>> + * @closed:       when passing a handle that has been closed.
>>>>> + * @not-fb:       when passing an invalid handle.
>>>>> + * @valid:        when passing an valid handle.
>>>>> + * @zero:         for a zero'd input.
>>>>> + */
>>>>>   static void test_handle_input(int fd)
>>>>>   {
>>>>>       struct drm_mode_fb_cmd2 add = {};
>>>>> @@ -224,6 +245,30 @@ static void test_handle_input(int fd)
>>>>>           gem_close(fd, add.handles[0]);
>>>>>   }
>>>>> +/**
>>>>> + * SUBTEST: getfb-reject-ccs
>>>>> + * Description: Tests error handling while requesting CCS buffers 
>>>>> it should
>>>>> + *              refuse because getfb supports returning a single 
>>>>> buffer handle.
>>>>> + * Driver requirement: any
>>>>> + * Functionality: ccs, kms_gem_interop, tiling
>>>>
>>>> Hi,
>>>>
>>>> Do we need 'tiling' here?
>>>
>>> I think we need a tiling support to us the CCS modifiers. Hence 
>>> added it here.
>>
>> But I can only see 'DRM_FORMAT_MOD_LINEAR' in the test. What am I 
>> missing here?
>
> Please check
>
> igt_subtest("getfb2-accept-ccs") --> get_ccs_fb()
>
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_getfb.c#n349 
>

Ah right. Thanks for pointing this out.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> - Bhanu
>
>>
>> Thanks,
>> Karthik.B.S
>>>
>>> - Bhanu
>>>
>>>>
>>>> Thanks,
>>>> Karthik.B.S
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * SUBTEST: getfb-%s-different-handles
>>>>> + * Description: Tests error handling while requesting for two 
>>>>> different handles
>>>>> + *              from %arg[1].
>>>>> + * Driver requirement: any
>>>>> + * Functionality: kms_gem_interop
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * arg[1]:
>>>>> + *
>>>>> + * @addfb:           same fd
>>>>> + * @repeated:        different fd
>>>>> + */
>>>>>   static void test_duplicate_handles(int fd)
>>>>>   {
>>>>>       struct drm_mode_fb_cmd2 add = {};
>>>>> @@ -289,6 +334,37 @@ static void test_duplicate_handles(int fd)
>>>>>       }
>>>>>   }
>>>>> +/**
>>>>> + * SUBTEST: getfb2-accept-ccs
>>>>> + * Description: Tests outputs are correct when retrieving a CCS 
>>>>> framebuffer.
>>>>> + * Driver requirement: any
>>>>> + * Functionality: ccs, kms_gem_interop, tiling
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * SUBTEST: getfb2-into-addfb2
>>>>> + * Description: Output check by passing the output of GETFB2 into 
>>>>> ADDFB2.
>>>>> + * Driver requirement: any
>>>>> + * Functionality: kms_gem_interop
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * SUBTEST: getfb2-handle-%s
>>>>> + * Description: Tests error handling %arg[1].
>>>>> + * Driver requirement: any
>>>>> + * Functionality: kms_gem_interop
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * arg[1]:
>>>>> + *
>>>>> + * @closed:                  when passing a handle that has been 
>>>>> closed
>>>>> + * @not-fb:                  when passing an invalid handle
>>>>> + * @zero:                    for a zero'd input
>>>>> + */
>>>>>   static void test_getfb2(int fd)
>>>>>   {
>>>>>       struct drm_mode_fb_cmd2 add_basic = {};
>>>>> @@ -397,6 +473,20 @@ static void test_getfb2(int fd)
>>>>>       }
>>>>>   }
>>>>> +/**
>>>>> + * SUBTEST: %s-handle-protection
>>>>> + * Description: Make sure %arg[1] return handles if caller is 
>>>>> non-root or non-master.
>>>>> + * Driver requirement: any
>>>>> + * Functionality: kms_gem_interop
>>>>> + * Mega feature: General Display Features
>>>>> + * Run type: FULL
>>>>> + * Test category: functionality test
>>>>> + *
>>>>> + * arg[1]:
>>>>> + *
>>>>> + * @getfb:      GETFB ioctl
>>>>> + * @getfb2:     GETFB2 ioctl
>>>>> + */
>>>>>   static void test_handle_protection(void) {
>>>>>       int non_master_fd;
>>>>>       struct drm_mode_fb_cmd2 non_master_add = {};
