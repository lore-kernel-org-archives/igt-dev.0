Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C67F10E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 07:57:09 +0000 (UTC)
Message-ID: <0fc736bf-d644-f0f5-e0c0-bd8e7f73307f@intel.com>
Date: Mon, 14 Aug 2023 13:27:03 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-59-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-59-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 58/81] tests/kms_plane: Document each
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



On 12-Aug-23 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_plane.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6..46177d8f9 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -24,6 +24,11 @@
>    *   Damien Lespiau <damien.lespiau@intel.com>
>    */
>   
> +/**
> + * TEST: kms plane
> + * Category: Display
> + * Description: Testes for KMS Plane
> + */
>   #include "igt.h"
>   #include "igt_vec.h"
>   #include <errno.h>
> @@ -273,6 +278,29 @@ test_plane_position_with_output(data_t *data,
>   	igt_remove_fb(data->drm_fd, &sprite_fb);
>   }
>   
> +/**
> + * SUBTEST: plane-position-%s
> + * Description: Verify plane position using two planes to create a %arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: plane-position-hole-dpms
> + * Description: Verify plane position using two planes to create a partially
> + *              covered screen and check for DPMS
> + * Driver requirement: any
> + * Functionality: dpms, plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @covered:           fully covered screen
> + * @hole:              partially covered screen
> + */
>   static void
>   test_plane_position(data_t *data, enum pipe pipe)
>   {
> @@ -381,6 +409,29 @@ test_plane_panning_with_output(data_t *data,
>   	igt_remove_fb(data->drm_fd, &primary_fb);
>   }
>   
> +/**
> + * SUBTEST: plane-panning-%s
> + * Description: Verify plane panning at %arg[1] using primary plane
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: plane-panning-bottom-right-suspend
> + * Description: Verify plane panning at bottom-right position with suspend using
> + *              primary plane
> + * Driver requirement: any
> + * Functionality: plane, suspend
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @bottom-right:               bottom-right position
> + * @top-left:                   top-left position
> + */
>   static void
>   test_plane_panning(data_t *data, enum pipe pipe)
>   {
> @@ -1101,6 +1152,20 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
>   	return index != 0 && index != 3 && index != 5;
>   }
>   
> +/**
> + * SUBTEST: pixel-%s
> + * Description: verify the pixel formats for given plane and pipe
> + * Driver requirement: any
> + * Functionality: plane

Add pixel-format as functionality.

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @format:
> + * @format-source-clamping:          with source clamping
> + */
>   static void
>   test_pixel_formats(data_t *data, enum pipe pipe)
>   {
> @@ -1157,6 +1222,15 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	igt_assert_f(result, "At least one CRC mismatch happened\n");
>   }
>   
> +/**
> + * SUBTEST: invalid-pixel-format-settings
> + * Description: verify invalid settings for pixel format are not accepted
> + * Driver requirement: any
> + * Functionality: plane

Add pixel-format as functionality.

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_invalid_settings(data_t *data)
>   {
>   	enum pipe pipe = PIPE_A;
