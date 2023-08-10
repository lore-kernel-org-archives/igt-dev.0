Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB410E5CA
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 17:06:03 +0000 (UTC)
Message-ID: <533d589a-6c6d-f3b8-427e-6f3740fc40c2@intel.com>
Date: Thu, 10 Aug 2023 22:35:15 +0530
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-10-bhanuprakash.modem@intel.com>
 <e8f310ad-29f6-9eb7-a997-0f3dcdc08d97@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <e8f310ad-29f6-9eb7-a997-0f3dcdc08d97@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5, i-g-t,
 09/81] tests/chamelium/kms_chamelium_hpd: Document each subtest for
 testplan
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

Hi Kunal,

On Thu-10-08-2023 11:40 am, Joshi, Kunal1 wrote:
> 1) Same for all chamelium tests, we should have a some identifier for 
> getting testlist
>     for chamelium test
> 
> 2) Have Functionality/Mega Feature as  Hotplug to identify all tests 
> which validates hotplug?

I think, Mega feature can be same (DP, HDMI etc..), and sure we can add 
hotplug to the Functionality.

- Bhanu

> 
> On 6/29/2023 8:17 PM, Bhanuprakash Modem wrote:
>> Add documentation for all kms tests which is used by IGT testplan
>> documentation.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_hpd.c | 186 +++++++++++++++++++++++++++-
>>   1 file changed, 185 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/chamelium/kms_chamelium_hpd.c 
>> b/tests/chamelium/kms_chamelium_hpd.c
>> index 8b3189ca0..d7b9f0707 100644
>> --- a/tests/chamelium/kms_chamelium_hpd.c
>> +++ b/tests/chamelium/kms_chamelium_hpd.c
>> @@ -25,8 +25,9 @@
>>    */
>>   /**
>> - * TEST: Tests behaviour of hpd using chamelium
>> + * TEST: kms chamelium hpd
>>    * Category: Display
>> + * Description: Testing HPD with a Chamelium board
>>    */
>>   #include "kms_chamelium_helper.h"
>> @@ -117,6 +118,7 @@ static void 
>> try_suspend_resume_hpd(chamelium_data_t *data,
>>    * Run type: BAT
>>    * Functionality: dp_hotplug
>>    * Mega feature: DP
>> + * Driver requirement: any
>>    *
>>    * SUBTEST: hdmi-hpd-fast
>>    * Description: Check that we get uevents and updated connector 
>> status on
>> @@ -125,6 +127,7 @@ static void 
>> try_suspend_resume_hpd(chamelium_data_t *data,
>>    * Run type: BAT
>>    * Functionality: hdmi_hotplug
>>    * Mega feature: HDMI
>> + * Driver requirement: any
>>    *
>>    * SUBTEST: vga-hpd-fast
>>    * Description: Check that we get uevents and updated connector 
>> status on
>> @@ -133,6 +136,66 @@ static void 
>> try_suspend_resume_hpd(chamelium_data_t *data,
>>    * Run type: BAT
>>    * Functionality: vga_hotplug
>>    * Mega feature: VGA
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: dp-hpd
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: vga-hpd
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: vga_hotplug
>> + * Mega feature: VGA
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: dp-hpd-%s
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd-%s
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: vga-hpd-%s
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: vga_hotplug
>> + * Mega feature: VGA
>> + * Driver requirement: any
>> + *
>> + * arg[1]:
>> + *
>> + * @enable-disable-mode:     Toggle the mode
>> + * @with-enabled-mode:       Enabling the mode
>>    */
>>   static const char test_basic_hotplug_desc[] =
>>       "Check that we get uevents and updated connector status on "
>> @@ -200,6 +263,34 @@ static void test_hotplug(chamelium_data_t *data, 
>> struct chamelium_port *port,
>>       igt_remove_fb(data->drm_fd, &fb);
>>   }
>> +/**
>> + * SUBTEST: dp-hpd-for-each-pipe
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug for each pipe with valid output
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd-for-each-pipe
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug for each pipe with valid output
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: vga-hpd-for-each-pipe
>> + * Description: Check that we get uevents and updated connector 
>> status on
>> + *              hotplug and unplug for each pipe with valid output
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: vga_hotplug
>> + * Mega feature: VGA
>> + * Driver requirement: any
>> + */
>>   static const char test_hotplug_for_each_pipe_desc[] =
>>       "Check that we get uevents and updated connector status on "
>>       "hotplug and unplug for each pipe with valid output";
>> @@ -245,6 +336,39 @@ static void 
>> test_hotplug_for_each_pipe(chamelium_data_t *data,
>>       igt_hpd_storm_reset(data->drm_fd);
>>   }
>> +/**
>> + * SUBTEST: dp-hpd-after-%s
>> + * Description: Toggle HPD during %arg[1], check that uevents are 
>> sent and
>> + *              connector status is updated
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd-after-%s
>> + * Description: Toggle HPD during %arg[1], check that uevents are 
>> sent and
>> + *              connector status is updated
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: vga-hpd-after-%s
>> + * Description: Toggle HPD during %arg[1], check that uevents are 
>> sent and
>> + *              connector status is updated
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: vga_hotplug
>> + * Mega feature: VGA
>> + * Driver requirement: any
>> + *
>> + * arg[1]:
>> + *
>> + * @hibernate:     Hibernation
>> + * @suspend:       Suspend
>> + */
>>   static const char test_suspend_resume_hpd_desc[] =
>>       "Toggle HPD during suspend, check that uevents are sent and 
>> connector "
>>       "status is updated";
>> @@ -276,6 +400,16 @@ static void 
>> test_suspend_resume_hpd(chamelium_data_t *data,
>>    * Run type: BAT
>>    * Functionality: hotplug
>>    * Mega feature: General Display Features
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: common-hpd-after-hibernate
>> + * Description: Toggle HPD during suspend on all connectors, check 
>> that uevents
>> + *              are sent and connector status is updated
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hotplug
>> + * Mega feature: General Display Features
>> + * Driver requirement: any
>>    */
>>   static const char test_suspend_resume_hpd_common_desc[] =
>>       "Toggle HPD during suspend on all connectors, check that uevents 
>> are "
>> @@ -306,6 +440,16 @@ static void 
>> test_suspend_resume_hpd_common(chamelium_data_t *data,
>>       igt_cleanup_uevents(mon);
>>   }
>> +/**
>> + * SUBTEST: vga-hpd-without-ddc
>> + * Description: Disable DDC on a VGA connector, check we still get a 
>> uevent on
>> + *              hotplug
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: vga_hotplug
>> + * Mega feature: VGA
>> + * Driver requirement: any
>> + */
>>   static const char test_hpd_without_ddc_desc[] =
>>       "Disable DDC on a VGA connector, check we still get a uevent on 
>> hotplug";
>>   static void test_hpd_without_ddc(chamelium_data_t *data,
>> @@ -332,6 +476,27 @@ static void test_hpd_without_ddc(chamelium_data_t 
>> *data,
>>       igt_cleanup_uevents(mon);
>>   }
>> +/**
>> + * SUBTEST: dp-hpd-storm
>> + * Description: Trigger a series of hotplugs in a very small 
>> timeframe to
>> + *              simulate abad cable, check the kernel falls back to 
>> polling
>> + *              to avoid a hotplug storm
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd-storm
>> + * Description: Trigger a series of hotplugs in a very small 
>> timeframe to
>> + *              simulate abad cable, check the kernel falls back to 
>> polling
>> + *              to avoid a hotplug storm
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + */
>>   static const char test_hpd_storm_detect_desc[] =
>>       "Trigger a series of hotplugs in a very small timeframe to 
>> simulate a"
>>       "bad cable, check the kernel falls back to polling to avoid a 
>> hotplug "
>> @@ -366,6 +531,25 @@ static void 
>> test_hpd_storm_detect(chamelium_data_t *data,
>>       igt_hpd_storm_reset(data->drm_fd);
>>   }
>> +/**
>> + * SUBTEST: dp-hpd-storm-disable
>> + * Description: Disable HPD storm detection, trigger a storm and 
>> check the
>> + *              kernel doesn't detect one
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: dp_hotplug
>> + * Mega feature: DP
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-hpd-storm-disable
>> + * Description: Disable HPD storm detection, trigger a storm and 
>> check the
>> + *              kernel doesn't detect one
>> + * Test category: functionality test
>> + * Run type: FULL
>> + * Functionality: hdmi_hotplug
>> + * Mega feature: HDMI
>> + * Driver requirement: any
>> + */
>>   static const char test_hpd_storm_disable_desc[] =
>>       "Disable HPD storm detection, trigger a storm and check the 
>> kernel "
>>       "doesn't detect one";
