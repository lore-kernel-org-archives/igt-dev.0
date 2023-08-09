Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C06C10E23D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 06:57:39 +0000 (UTC)
Message-ID: <e119dd8f-a211-23c7-13a4-4824226bd191@intel.com>
Date: Wed, 9 Aug 2023 12:27:33 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-21-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-21-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 20/81] tests/i915/kms_flip_scaled_crc:
 Document each subtest for testplan
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
>   tests/i915/kms_flip_scaled_crc.c | 191 +++++++++++++++++++++++++++++++
>   1 file changed, 191 insertions(+)
> 
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 30da1fcf3..f8eefa293 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -22,8 +22,199 @@
>    *
>    */
>   
> +/**
> + * TEST: kms flip scaled crc
> + * Category: Display
> + * Description: Test flipping between scaled/nonscaled framebuffers
> + */
>   #include "igt.h"
>   
> +/**
> + * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
> + * Description: Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank

Add scaling as well in functionality. Applicable for remaining subtests too.

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
> + * Description: Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-linear-to-64bpp-linear-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-%s
> + * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-4tile-to-64bpp-4tile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-xtile-to-64bpp-xtile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-yftile-to-32bpp-yftileccs-%s
> + * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-yftile-to-64bpp-yftile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-yftileccs-to-64bpp-yftile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-ytile-to-32bpp-ytileccs-%s
> + * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-%s
> + * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-ytile-to-64bpp-ytile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-32bpp-ytileccs-to-64bpp-ytile-%s
> + * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
> + *              clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @downscaling:        Downscaled
> + * @upscaling:          Upscaled
> + */
> +
> +/**
> + * SUBTEST: flip-64bpp-4tile-to-%dbpp-4tile-%s
> + * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
> + *              CD clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-xtile-to-%dbpp-xtile-%s
> + * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
> + *              CD clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-yftile-to-%dbpp-yftile-%s
> + * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
> + *              CD clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-ytile-to-%dbpp-ytile-%s
> + * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
> + *              CD clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-64bpp-linear-to-%dbpp-linear-%s
> + * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
> + *              CD clock programming
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1].values: 16, 32
> + * arg[2]:
> + *
> + * @downscaling:        Downscaled
> + * @upscaling:          Upscaled
> + */
> +
>   IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
>   
>   typedef struct {
