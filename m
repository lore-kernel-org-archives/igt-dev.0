Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FC10E307
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 14:43:34 +0000 (UTC)
Message-ID: <65a7b181-ae01-c247-798a-57c10c14d399@intel.com>
Date: Mon, 11 Sep 2023 20:12:50 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
 <20230908175039.1291593-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230908175039.1291593-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] tests/intel/kms_pm_backlight: Add
 XE support
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


On Fri-08-09-2023 11:20 pm, Swati Sharma wrote:
> Add XE driver support for kms pm tests.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel/kms_pm_backlight.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 42aa7cb5d..03bafb773 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -43,7 +43,7 @@
>    *
>    * SUBTEST: bad-brightness
>    * Description: Test the bad brightness.
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: backlight
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -51,7 +51,7 @@
>    *
>    * SUBTEST: basic-brightness
>    * Description: Test the basic brightness.
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: backlight
>    * Mega feature: Display Power
>    * Run type: BAT
> @@ -59,7 +59,7 @@
>    *
>    * SUBTEST: fade
>    * Description: Test basic fade.
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: backlight
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -67,7 +67,7 @@
>    *
>    * SUBTEST: fade-with-dpms
>    * Description: Test the fade with DPMS.
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: dpms, backlight
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -75,7 +75,7 @@
>    *
>    * SUBTEST: fade-with-suspend
>    * Description: Test the fade with suspend.
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: backlight, suspend
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -302,7 +302,7 @@ igt_main
>   		 * try to enable all.
>   		 */
>   		kmstest_set_vt_graphics_mode();
> -		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
> +		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
>   
>   		for_each_connected_output(&display, output) {
>   			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
