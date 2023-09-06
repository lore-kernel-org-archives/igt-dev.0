Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345710E591
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 07:56:48 +0000 (UTC)
Message-ID: <5c63c873-e570-3c2b-8fd6-9727a1444d6f@intel.com>
Date: Wed, 6 Sep 2023 13:26:43 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
 <20230905125356.1659246-3-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230905125356.1659246-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2 2/7] tests/intel/kms_pm_backlight: Fix
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

Hi Bhanu,

On 05-Sep-23 6:23 PM, Bhanuprakash Modem wrote:
> As kms_pm_backlight is moved to display, update the test
> documentation according to the kms testplan kms_test_config.json
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 40 +++++++++++++++++++++++++---------
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index eca385518..7a2a4e06f 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -16,29 +16,49 @@
>   #include "igt_device.h"
>   #include "igt_device_scan.h"
>   /**
> - * TEST: i915 pm backlight
> + * TEST: kms pm backlight
> + * Category: Display
>    * Description: Basic backlight sysfs test
> - * Feature: backlight
>    *
>    * SUBTEST: bad-brightness
> - * Description: test the bad brightness.
> + * Description: Test the bad brightness.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
>    * Run type: FULL
> + * Test category: functionality test
>    *
>    * SUBTEST: basic-brightness
> - * Description: test the basic brightness.
> + * Description: Test the basic brightness.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
>    * Run type: BAT
> + * Test category: functionality test
>    *
>    * SUBTEST: fade
> - * Description: test basic fade.
> - * Run type: FULL
> + * Description: Test basic fade.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
> + * Run type: BAT

Run type should be FULL.

> + * Test category: functionality test
>    *
>    * SUBTEST: fade-with-dpms
> - * Description: test the fade with DPMS.
> - * Run type: FULL
> + * Description: Test the fade with DPMS.
> + * Driver requirement: i915
> + * Functionality: dpms, backlight
> + * Mega feature: Display Power
> + * Run type: BAT

Run type should be FULL.

> + * Test category: functionality test
>    *
>    * SUBTEST: fade-with-suspend
> - * Description: test the fade with suspend.
> - * Run type: FULL
> + * Description: Test the fade with suspend.
> + * Driver requirement: i915
> + * Functionality: backlight, suspend
> + * Mega feature: Display Power
> + * Run type: BAT

Run type should be FULL.

> + * Test category: functionality test
>    */
>   
>   struct context {
