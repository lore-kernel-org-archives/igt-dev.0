Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579210E428
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 14:08:10 +0000 (UTC)
Message-ID: <d204d8a1-ac60-a42d-fd76-8365b0e78148@intel.com>
Date: Wed, 17 May 2023 19:33:08 +0530
Content-Language: en-US
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
 <20230517063323.4146387-2-bhanuprakash.modem@intel.com>
 <20230517090319.virtwge6s5q6a36b@kamilkon-desk1>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230517090319.virtwge6s5q6a36b@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 01/81] tests/chamelium: Move chamelium
 helpers to lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, igt-dev@lists.freedesktop.org, mchehab@kernel.org, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Wed-17-05-2023 02:33 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> 
> On 2023-05-17 at 12:02:03 +0530, Bhanuprakash Modem wrote:
>> The correct place for helpers is lib as the tests directory is
>> supposed to have test files, also having the helpers in tests
>> dir will break the compilation of testplan. Hence move all
>> helpers to library.
>>
>> Expectation is to have an executable binary for each .c file
>> the "tests" dir.
>>
> 
> Please send these three patches 1/81, 2/ and 3/ as separate
> patchseries.

Please check my comments on coverletter (Patch[0/81]) of this series.

- Bhanu

> 
> Regards,
> Kamil
> 
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   .../kms_chamelium_helper.c => lib/igt_chamelium_helper.c      | 4 ++--
>>   .../kms_chamelium_helper.h => lib/igt_chamelium_helper.h      | 0
>>   lib/meson.build                                               | 1 +
>>   tests/chamelium/kms_chamelium_audio.c                         | 2 +-
>>   tests/chamelium/kms_chamelium_edid.c                          | 2 +-
>>   tests/chamelium/kms_chamelium_frames.c                        | 2 +-
>>   tests/chamelium/kms_chamelium_hpd.c                           | 2 +-
>>   tests/meson.build                                             | 3 +--
>>   8 files changed, 8 insertions(+), 8 deletions(-)
>>   rename tests/chamelium/kms_chamelium_helper.c => lib/igt_chamelium_helper.c (99%)
>>   rename tests/chamelium/kms_chamelium_helper.h => lib/igt_chamelium_helper.h (100%)
>>
>> diff --git a/tests/chamelium/kms_chamelium_helper.c b/lib/igt_chamelium_helper.c
>> similarity index 99%
>> rename from tests/chamelium/kms_chamelium_helper.c
>> rename to lib/igt_chamelium_helper.c
>> index 197d29be9..3c1a802d3 100644
>> --- a/tests/chamelium/kms_chamelium_helper.c
>> +++ b/lib/igt_chamelium_helper.c
>> @@ -25,7 +25,7 @@
>>    */
>>   
>>   #include "igt_edid.h"
>> -#include "kms_chamelium_helper.h"
>> +#include "igt_chamelium_helper.h"
>>   
>>   void chamelium_init_test(chamelium_data_t *data)
>>   {
>> @@ -344,4 +344,4 @@ bool chamelium_check_analog_bridge(chamelium_data_t *data,
>>   		return true;
>>   
>>   	return false;
>> -}
>> \ No newline at end of file
>> +}
>> diff --git a/tests/chamelium/kms_chamelium_helper.h b/lib/igt_chamelium_helper.h
>> similarity index 100%
>> rename from tests/chamelium/kms_chamelium_helper.h
>> rename to lib/igt_chamelium_helper.h
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 85f100f75..2d3456577 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -17,6 +17,7 @@ lib_sources = [
>>   	'i915/intel_cmds_info.c',
>>   	'i915/i915_blt.c',
>>   	'i915/i915_crc.c',
>> +	'igt_chamelium_helper.c',
>>   	'igt_collection.c',
>>   	'igt_color_encoding.c',
>>   	'igt_crc.c',
>> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
>> index 6c6177fc5..a4204fbb6 100644
>> --- a/tests/chamelium/kms_chamelium_audio.c
>> +++ b/tests/chamelium/kms_chamelium_audio.c
>> @@ -26,7 +26,7 @@
>>   
>>   #include "igt_eld.h"
>>   #include "igt_infoframe.h"
>> -#include "kms_chamelium_helper.h"
>> +#include "igt_chamelium_helper.h"
>>   
>>   /* Playback parameters control the audio signal we synthesize and send */
>>   #define PLAYBACK_CHANNELS 2
>> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
>> index 4a52e6922..fc78d4a07 100644
>> --- a/tests/chamelium/kms_chamelium_edid.c
>> +++ b/tests/chamelium/kms_chamelium_edid.c
>> @@ -42,7 +42,7 @@
>>   #include "igt_eld.h"
>>   #include "igt_vc4.h"
>>   #include "igt_infoframe.h"
>> -#include "kms_chamelium_helper.h"
>> +#include "igt_chamelium_helper.h"
>>   #include "monitor_edids/dp_edids.h"
>>   #include "monitor_edids/hdmi_edids.h"
>>   #include "monitor_edids/monitor_edids_helper.h"
>> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
>> index 22a7ba936..2d90b45b2 100644
>> --- a/tests/chamelium/kms_chamelium_frames.c
>> +++ b/tests/chamelium/kms_chamelium_frames.c
>> @@ -31,7 +31,7 @@
>>   
>>   #include "igt_eld.h"
>>   #include "igt_infoframe.h"
>> -#include "kms_chamelium_helper.h"
>> +#include "igt_chamelium_helper.h"
>>   
>>   #define connector_dynamic_subtest(name__, type__)                   \
>>   	igt_subtest_with_dynamic(name__)                            \
>> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
>> index efd40ba54..ea0ee10e7 100644
>> --- a/tests/chamelium/kms_chamelium_hpd.c
>> +++ b/tests/chamelium/kms_chamelium_hpd.c
>> @@ -29,7 +29,7 @@
>>    * Category: Display
>>    */
>>   
>> -#include "kms_chamelium_helper.h"
>> +#include "igt_chamelium_helper.h"
>>   
>>   #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
>>   #define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 38f080f7c..d5f0f54c1 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -342,8 +342,7 @@ endforeach
>>   if chamelium.found()
>>   	foreach prog : chamelium_progs
>>   		test_executables += executable(prog,
>> -				 [join_paths('chamelium', prog + '.c'),
>> -					join_paths('chamelium', 'kms_chamelium_helper.c')],
>> +				 join_paths('chamelium', prog + '.c'),
>>   				 dependencies : test_deps,
>>   				 install_dir : libexecdir,
>>   				 install_rpath : libexecdir_rpathdir,
>> -- 
>> 2.40.0
>>

