Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA30F10E4B9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:17:47 +0000 (UTC)
Message-ID: <2dc4c964-2200-4c59-04a2-7a16916f57fc@intel.com>
Date: Thu, 10 Aug 2023 11:47:42 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-47-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230629144910.3055377-47-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5, i-g-t,
 46/81] tests/kms_dp_aux_dev: Document each subtest for testplan
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
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_dp_aux_dev.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 19cbe216a..383a2e0b4 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -31,6 +31,19 @@
>   
>   #include "igt.h"
>   #include "igt_kms.h"
> +/**
> + * TEST: kms dp aux dev
> + * Category: Display
> + * Description: Test that /dev/drm_dp_aux reads work
> + *
> + * SUBTEST:
> + * Description: Test that /dev/drm_dp_aux reads work
> + * Driver requirement: any
> + * Functionality: dp
> + * Mega feature: DP
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
>   
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
