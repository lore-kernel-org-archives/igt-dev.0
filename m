Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CDD10E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 08:17:08 +0000 (UTC)
Message-ID: <c0cadff9-d168-1edf-467e-e34de33cbc6d@intel.com>
Date: Mon, 14 Aug 2023 13:47:02 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "B, Jeevan" <jeevan.b@intel.com>,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-45-bhanuprakash.modem@intel.com>
 <DM4PR11MB63120DC474C773B593AEAF6D9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <DM4PR11MB63120DC474C773B593AEAF6D9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 44/81] tests/kms_display_modes: Document
 each subtest for testplan
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

On 09-Aug-23 10:57 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Bhanuprakash Modem
>> Sent: Thursday, June 29, 2023 8:19 PM
>> To: igt-dev@lists.freedesktop.org
>> Subject: [igt-dev] [V5 i-g-t 44/81] tests/kms_display_modes: Document each
>> subtest for testplan
>>
>> Add documentation for all kms tests which is used by IGT testplan
>> documentation.
>>
>> V2: - Add missing documentation
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> LGTM.
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>   tests/kms_display_modes.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index
>> 93d91ef5b..b26a3f71a 100644
>> --- a/tests/kms_display_modes.c
>> +++ b/tests/kms_display_modes.c
>> @@ -24,6 +24,11 @@
>>    *  Jeevan B <jeevan.b@intel.com>
>>    */
>>
>> +/**
>> + * TEST: kms display modes
>> + * Category: Display
>> + * Description: Test Display Modes
>> + */
>>   #include "igt.h"
>>
>>   #define HDISPLAY_4K	3840
>> @@ -231,6 +236,16 @@ static void run_extendedmode_basic(data_t *data,
>>   	for_each_connected_output_local((display), (output)) \
>>   		for_each_if (igt_pipe_connector_valid((pipe), (output)))
>>
>> +/**
>> + * SUBTEST: extended-mode-basic
>> + * Description: Test for validating display extended mode with a pair of
>> connected
>> + *              displays
>> + * Driver requirement: any
>> + * Functionality: kms_core
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + */
>>   static void run_extendedmode_test(data_t *data) {
>>   	enum pipe pipe1, pipe2;
>>   	igt_output_t *output1, *output2;
>> @@ -276,6 +291,16 @@ static void run_extendedmode_test(data_t *data) {
>>   	}
>>   }
>>
>> +/**
>> + * SUBTEST: mst-extended-mode-negative
>> + * Description: Negative test for validating display extended mode with a
>> pair
>> + *		of connected 2k-4k or 4k-4k displays.
>> + * Driver requirement: any
>> + * Functionality: kms_core

Should we add functionality as mst here?

>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + */
>>   static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>> {
>>   	struct igt_fb fbs[2];
>> --
>> 2.40.0
> 
