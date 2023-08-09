Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0B710E145
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 04:11:33 +0000 (UTC)
Message-ID: <5b86c750-69d5-1d8f-24f0-b7e30eb70ffd@intel.com>
Date: Wed, 9 Aug 2023 09:41:19 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-14-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-14-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 13/81] tests/i915/kms_ccs: Document each
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> V2: - Include mtl ccs tests
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_ccs.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
> index f04552dd7..995e0a589 100644
> --- a/tests/i915/kms_ccs.c
> +++ b/tests/i915/kms_ccs.c
> @@ -22,10 +22,99 @@
>    *
>    */
>   
> +/**
> + * TEST: kms ccs
> + * Category: Display
> + * Description: Test render compression (RC), in which the main surface is
> + *              complemented by a color control surface (CCS) that the display
> + *              uses to interpret the compressed data.
> + */
>   #include "igt.h"
>   
>   #include "i915/gem_create.h"
>   
> +/**
> + * SUBTEST: %s-%s-%s
> + * Description: Test %arg[2] with given %arg[3] modifier
> + * Driver requirement: any
> + * Functionality: ccs
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @pipe-A:                    Pipe A
> + * @pipe-B:                    Pipe B
> + * @pipe-C:                    Pipe C
> + * @pipe-D:                    Pipe D
> + * @pipe-E:                    Pipe E
> + * @pipe-F:                    Pipe F
> + * @pipe-G:                    Pipe G
> + * @pipe-H:                    Pipe H
> + *
> + * arg[2]:
> + *
> + * @bad-aux-stride:            Bad AUX stride
> + * @ccs-on-another-bo:         CCS with different BO
> + * @missing-ccs-buffer:        Missing CCS buffer
> + *
> + * arg[3]:
> + *
> + * @y_tiled_ccs:               Y tiled ccs
> + * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
> + * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
> + * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
> + * @yf_tiled_ccs:              YF tiled ccs
> + * @4_tiled_mtl_mc_ccs:        4 tiled mtl mc ccs
> + * @4_tiled_mtl_rc_ccs:        4 tiled mtl rc ccs
> + * @4_tiled_mtl_rc_ccs_cc:     4 tiled mtl rc ccs cc
> + */
> +
> +/**
> + * SUBTEST: %s-%s-%s
> + * Description: Test %arg[2] with %arg[3] modifier
> + * Driver requirement: any
> + * Functionality: ccs
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @pipe-A:                      Pipe A
> + * @pipe-B:                      Pipe B
> + * @pipe-C:                      Pipe C
> + * @pipe-D:                      Pipe D
> + * @pipe-E:                      Pipe E
> + * @pipe-F:                      Pipe F
> + * @pipe-G:                      Pipe G
> + * @pipe-H:                      Pipe H
> + *
> + * arg[2]:
> + *
> + * @bad-pixel-format:            Bad pixel format
> + * @bad-rotation-90:             90 degree rotation
> + * @crc-primary-basic:           Primary plane CRC compatibility
> + * @crc-primary-rotation-180:    180 degree rotation
> + * @crc-sprite-planes-basic:     Sprite plane CRC compatability
> + * @random-ccs-data:             Random CCS data
> + *
> + * arg[3]:
> + *
> + * @4_tiled_dg2_mc_ccs:        4 tiled mc ccs
> + * @4_tiled_dg2_rc_ccs:        4 tiled dg2 rc ccs
> + * @4_tiled_dg2_rc_ccs_cc:     4 tiled dg2 rc ccs cc
> + * @4_tiled_mtl_mc_ccs:        4 tiled mtl mc ccs
> + * @4_tiled_mtl_rc_ccs:        4 tiled mtl rc ccs
> + * @4_tiled_mtl_rc_ccs_cc:     4 tiled mtl rc ccs cc
> + * @y_tiled_ccs:               Y tiled ccs
> + * @y_tiled_gen12_mc_ccs:      Y tiled gen12 mc ccs
> + * @y_tiled_gen12_rc_ccs:      Y tiled gen12 rc ccs
> + * @y_tiled_gen12_rc_ccs_cc:   Y tiled gen12 rc ccs cc
> + * @yf_tiled_ccs:              YF tiled ccs
> + */
> +
>   #define SDR_PLANE_BASE	3
>   
>   IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
