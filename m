Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FF710E092
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 12:17:36 +0000 (UTC)
Message-ID: <1218b190-0ba4-a26b-201e-71ea7817083d@intel.com>
Date: Wed, 9 Aug 2023 17:47:29 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-68-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-68-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 67/81] tests/kms_properties: Document each
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

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_properties.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 8645808d1..197c72065 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -28,6 +28,31 @@
>   #include <stdio.h>
>   #include <string.h>
>   #include <time.h>
> +/**
> + * TEST: kms properties
> + * Category: Display
> + *
> + * SUBTEST: %s-properties-%s
> + * Description: Tests %arg[1] properties with %arg[2] commit
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @connector:       Connector
> + * @crtc:            CRTC
> + * @plane:           Plane
> + * @invalid:         Invalid (connector/crtc/plane)
> + *
> + * arg[2]:
> + *
> + * @atomic:          atomic
> + * @legacy:          legacy
> + */
> +
>   
>   struct additional_test {
>   	const char *name;
> @@ -687,6 +712,21 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
>   	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
>   }
>   
> +/**
> + * SUBTEST: get_properties-sanity-%s
> + * Description: Test validates the properties of all planes, crtc and connectors
> + *              with %arg[1] commit
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @atomic:          atomic
> + * @non-atomic:      legacy
> + */
>   static void get_prop_sanity(igt_display_t *display, bool atomic)
>   {
>   	int fd = display->drm_fd;
