Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387D10E405
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:56:53 +0000 (UTC)
Message-ID: <7e0032f0-9c6b-10c1-bb05-d1493d8f9623@intel.com>
Date: Wed, 9 Aug 2023 14:26:48 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-70-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-70-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 69/81] tests/kms_rotation_crc: Document
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


On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_rotation_crc.c | 130 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 130 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 5ad04407d..6009afe95 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -22,6 +22,11 @@
>    *
>    */
>   
> +/**
> + * TEST: kms rotation crc
> + * Category: Display
> + * Description: Tests different rotations with different planes & formats
> + */
>   #include "igt.h"
>   #include "igt_vec.h"
>   #include <math.h>
> @@ -474,6 +479,97 @@ static bool test_format(data_t *data,
>   	return true;
>   }
>   
> +/**
> + * SUBTEST: %s-rotation-180
> + * Description: Rotation test with 180 degree for %arg[1] planes
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @primary:    primary
> + * @sprite:     sprite
> + * @cursor:     cursor
> + */
> +
> +/**
> + * SUBTEST: %s-rotation-%d
> + * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
> + * Driver requirement: any
> + * Functionality: rotation

Should we add plane in functionality too?
Same with other subtests.

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @primary:    primary
> + * @sprite:     sprite
> + *
> + * arg[2].values: 90, 270
> + */
> +
> +/**
> + * SUBTEST: bad-%s
> + * Description: Checking unsupported %arg[1] for gen9+ with 90 degree of rotation
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @pixel-format:       pixel format
> + * @tiling:             tiling
> + */
> +
> +/**
> + * SUBTEST: primary-%s-tiled-reflect-x-%d
> + * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @4:      4 tiling
> + * @x:      x tiling
> + * @y:      y tiling
> + * @yf:     yf tiling
> + *
> + * arg[2].values: 0, 180
> + */
> +
> +/**
> + * SUBTEST: primary-%s-tiled-reflect-x-%d
> + * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @y:      y tiling
> + * @yf:     yf tiling
> + *
> + * arg[2].values: 90, 270
> + *
> + * SUBTEST: sprite-rotation-90-pos-100-0
> + * Description: Rotation test with 90 degree for a plane of gen9+ with given position
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
>   {
>   	igt_display_t *display = &data->display;
> @@ -792,6 +888,31 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
>   
>   	return true;
>   }
> +
> +/**
> + * SUBTEST: multiplane-rotation
> + * Description: Rotation test on both planes by making them fully visible
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: multiplane-rotation-cropping-%s
> + * Description: Rotation test on both planes by cropping left/%arg[1] corner of
> + *              primary plane and right/%arg[1] corner of sprite plane
> + * Driver requirement: any
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @bottom:   bottom
> + * @top:      top
> + */
> +
>   /*
>    * Here is pipe parameter which is now used only for first pipe.
>    * It is left here if this test ever was wanted to be run on
> @@ -993,6 +1114,15 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   	igt_require_f(found, "No valid pipe/output combo found.\n");
>   }
>   
> +/**
> + * SUBTEST: exhaust-fences
> + * Description: This test intends to check for fence leaks exhaustively
> + * Driver requirement: i915
> + * Functionality: rotation
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_plane_rotation_exhaust_fences(data_t *data,
>   					       enum pipe pipe,
>   					       igt_output_t *output,
