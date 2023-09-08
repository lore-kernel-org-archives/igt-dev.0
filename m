Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406B10E039
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 05:51:14 +0000 (UTC)
Message-ID: <70f8cb6b-b3cd-defa-3466-b2c7101142b7@intel.com>
Date: Fri, 8 Sep 2023 11:21:09 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230907143214.1280453-1-swati2.sharma@intel.com>
 <20230907143214.1280453-2-swati2.sharma@intel.com>
 <20230907173310.nb5ttfmfqsnqdwat@kamilkon-desk.igk.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230907173310.nb5ttfmfqsnqdwat@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests: rename feature_discovery to
 kms_feature_discovery
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

On 07-Sep-23 11:03 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-09-07 at 20:02:12 +0530, Swati Sharma wrote:
>> Since feature discovery test is only having kms tests,
>> rename to kms_feature_discovery. Also, add documentation
>> for the subtests.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   ...re_discovery.c => kms_feature_discovery.c} | 53 ++++++++++++++++++-
>>   tests/meson.build                             |  2 +-
>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>   rename tests/{feature_discovery.c => kms_feature_discovery.c} (68%)
>>
>> diff --git a/tests/feature_discovery.c b/tests/kms_feature_discovery.c
>> similarity index 68%
>> rename from tests/feature_discovery.c
>> rename to tests/kms_feature_discovery.c
>> index d1f4b1633..49958fd88 100644
>> --- a/tests/feature_discovery.c
>> +++ b/tests/kms_feature_discovery.c
>> @@ -22,6 +22,58 @@
>>    *
>>    */
>>   
>> +/**
>> + * TEST: kms feature discovery
>> + * Category: Display
>> + * Description: A metatest that checks for \"features\" presence.
>> + *		The subtests here should only skip or pass,
>> + *		anything else means we have a serious problem.
>> + *
>> + * SUBTEST: display
>> + * Description: Make sure that we have display support with
>> + * 		some outputs connected.
>> + * Driver requirement: i915, xe
>> + * Functionality: feature_discovery
>> + * Mega feature: General Display Features
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: display-%dx
>> + * Description: Make sure that we have display support with %arg[1]
>> + * 		outputs connected.
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
>> + * Run type: FULL
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: psr2
>> + * Description: Make sure that we have eDP panel with PSR2 support.
>> + * Driver requirement: i915, xe
> ----- ^
> 
>> + * Functionality: feature_discovery, psr2, eDP
>> + * Mega feature: General Display Features
> ----- ^
> 
>> + * Run type: FULL
> ----- ^
> 
>> + * Test category: functionality test
> ----- ^
> All these fields are the same for all SUBTEST:, imho we should
> move them into TEST: and save some space. With that:
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil

Hi Kamil,
This might be valid for today but in future if we need to extend test
having different fields, this might not to be true.
For other kms tests too, we have done testplan documentation at
subtest level only.

> 
>> + *
>> + * arg[1].values: 2, 3, 4
>> + */
>> +
>>   #include "igt.h"
>>   #ifdef HAVE_CHAMELIUM
>>   #include "igt_chamelium.h"
>> @@ -46,7 +98,6 @@ igt_main {
>>   	}
>>   
>>   	igt_subtest_group {
>> -
>>   		igt_fixture {
>>   			igt_display_require(&display, fd);
>>   		}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index aa8e3434c..eb643d4dd 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -14,7 +14,6 @@ test_progs = [
>>   	'drm_mm',
>>   	'drm_read',
>>   	'fbdev',
>> -	'feature_discovery',
>>   	'kms_3d',
>>   	'kms_addfb_basic',
>>   	'kms_async_flips',
>> @@ -31,6 +30,7 @@ test_progs = [
>>   	'kms_dither',
>>   	'kms_display_modes',
>>   	'kms_dp_aux_dev',
>> +	'kms_feature_discovery',
>>   	'kms_flip',
>>   	'kms_flip_event_leak',
>>   	'kms_force_connector_basic',
>> -- 
>> 2.25.1
>>
