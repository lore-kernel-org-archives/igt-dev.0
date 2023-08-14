Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFC810E03B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 10:39:43 +0000 (UTC)
Message-ID: <e3e4e0d3-76be-be10-4fbc-9e24915c3bcb@intel.com>
Date: Mon, 14 Aug 2023 16:09:28 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-26-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-26-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 25/81] tests/i915/kms_pipe_b_c_ivb:
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



On 12-Aug-23 12:15 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_pipe_b_c_ivb.c | 52 +++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> index 192771794..f19355511 100644
> --- a/tests/i915/kms_pipe_b_c_ivb.c
> +++ b/tests/i915/kms_pipe_b_c_ivb.c
> @@ -25,6 +25,58 @@
>    */
>   
>   #include "igt.h"
> +/**
> + * TEST: kms pipe b c ivb
> + * Category: Display
> + * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
> + *              setting different combinations of modes for pipes B and C.
> + *
> + * SUBTEST: disable-pipe-B-enable-pipe-C
> + * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
> + *              and then setting mode on pipe-C.
> + * Driver requirement: i915
> + * Functionality: kms_core

Should this be in obsolete category?

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: enable-pipe-C-while-B-has-3-lanes
> + * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C
> + *              while pipe-B has 3-lanes
> + * Driver requirement: i915
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: from-pipe-C-to-B-with-3-lanes
> + * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
> + *              with 3 lanes from pipe-C.
> + * Driver requirement: i915
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: pipe-B-double-modeset-then-modeset-pipe-C
> + * Description: Tests pipe-B and pipe-C interactions in IVB by enabling two
> + *              different modes on pipe-B and then a single mode on pipe-C.
> + * Driver requirement: i915
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: pipe-B-dpms-off-modeset-pipe-C
> + * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
> + *              with mode that requires 3 lanes and then enabling pipe-c with
> + *              dpms off/on pipe-B.
> + * Driver requirement: i915
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION(
>   "Exercise the FDI lane bifurcation code for IVB in the kernel by setting"
