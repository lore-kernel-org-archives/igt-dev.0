Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1BC10E1AB
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 16:36:46 +0000 (UTC)
Message-ID: <3d2f3b1f-6bf7-d533-66e4-c083087c57ff@intel.com>
Date: Thu, 10 Aug 2023 21:59:24 +0530
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-6-bhanuprakash.modem@intel.com>
 <ed3528a0-a8ef-c4e4-10fb-999d3b890422@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ed3528a0-a8ef-c4e4-10fb-999d3b890422@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5, i-g-t,
 05/81] tests/chamelium/kms_chamelium_audio: Document each subtest
 for testplan
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

On Thu-10-08-2023 10:27 am, Joshi, Kunal1 wrote:
> 
> On 6/29/2023 8:17 PM, Bhanuprakash Modem wrote:
>> Add documentation for all kms tests which is used by IGT testplan
>> documentation.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_audio.c | 44 +++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/tests/chamelium/kms_chamelium_audio.c 
>> b/tests/chamelium/kms_chamelium_audio.c
>> index 8fbc1f80e..453f3518a 100644
>> --- a/tests/chamelium/kms_chamelium_audio.c
>> +++ b/tests/chamelium/kms_chamelium_audio.c
>> @@ -28,6 +28,12 @@
>>   #include "igt_infoframe.h"
>>   #include "kms_chamelium_helper.h"
>> +/**
>> + * TEST: kms chamelium audio
>> + * Category: Display
>> + * Description: Testing Audio with a Chamelium board
>> + */
>> +
>>   /* Playback parameters control the audio signal we synthesize and 
>> send */
>>   #define PLAYBACK_CHANNELS 2
>>   #define PLAYBACK_SAMPLES 1024
>> @@ -669,6 +675,25 @@ static bool check_audio_configuration(struct alsa 
>> *alsa,
>>       return true;
>>   }
>> +/**
>> + * SUBTEST: dp-audio
>> + * Description: Playback various audio signals with various audio 
>> formats/rates,
>> + *              capture them and check they are correct
>> + * Functionality: dp_audio
>> + * Mega feature: DP
>> + * Run type: FULL
>> + * Test category: functionality test
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-audio
>> + * Description: Playback various audio signals with various audio 
>> formats/rates,
>> + *              capture them and check they are correct
>> + * Functionality: hdmi_audio
>> + * Mega feature: HDMI
> 
> Can we keep one more mega feature here as Audio, so that we can either 
> generate testlist for all audio test cases
> or for checking overall Audio passrate across HDMI, DP ...

Will add this in next rev.

> 
>> + * Run type: FULL
>> + * Test category: functionality test
>> + * Driver requirement: any
>> + */
>>   static const char test_display_audio_desc[] =
>>       "Playback various audio signals with various audio formats/rates, "
>>       "capture them and check they are correct";
>> @@ -763,6 +788,25 @@ static void test_display_audio(chamelium_data_t 
>> *data,
>>       free(alsa);
>>   }
>> +/**
>> + * SUBTEST: dp-audio-edid
>> + * Description: Plug a connector with an EDID suitable for audio, 
>> check ALSA's
>> + *              EDID-Like Data reports the correct audio parameters
>> + * Functionality: dp_audio
>> + * Mega feature: DP
>> + * Run type: FULL
>> + * Test category: functionality test
>> + * Driver requirement: any
>> + *
>> + * SUBTEST: hdmi-audio-edid
>> + * Description: Plug a connector with an EDID suitable for audio, 
>> check ALSA's
>> + *              EDID-Like Data reports the correct audio parameters
>> + * Functionality: hdmi_audio
>> + * Mega feature: HDMI
>> + * Run type: FULL
>> + * Test category: functionality test
>> + * Driver requirement: any
> 
> 
> Can we have something like requirement as well like driver requirement,
> For this chamelium will be required
> 
> 
> Also we need to have chamelium somewhere in here to populate chamelium only
> testlist/ results

Adding chamelium to the Functionality seems the best option to me.

>> + */
>>   static const char test_display_audio_edid_desc[] =
>>       "Plug a connector with an EDID suitable for audio, check ALSA's "
>>       "EDID-Like Data reports the correct audio parameters";
> 
> 
> Apart from this everything looks good
> 
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> 
