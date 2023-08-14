Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30A610E10D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 06:26:27 +0000 (UTC)
Message-ID: <f57905eb-ff37-ef69-eda4-5c983a4cf2d1@intel.com>
Date: Mon, 14 Aug 2023 11:56:23 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-54-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-54-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 53/81] tests/kms_invalid_mode: Document
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

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 12-Aug-23 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Fix test description
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_invalid_mode.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index c26f8befe..c5714c97d 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -22,10 +22,42 @@
>    *
>    */
>   
> +/**
> + * TEST: kms invalid mode
> + * Category: Display
> + * Description: Make sure all modesets are rejected when the requested mode is
> + *              invalid
> + */
>   #include "igt.h"
>   #include <limits.h>
>   #include <stdbool.h>
>   
> +/**
> + * SUBTEST: %s
> + * Description: Make sure all modesets are rejected when the requested mode
> + *              (%arg[1]) is invalid
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @bad-hsync-end:    Bad hsync_end
> + * @bad-hsync-start:  Bad hsync_start
> + * @bad-htotal:       Bad htotal
> + * @bad-vsync-end:    Bad vsync_end
> + * @bad-vsync-start:  Bad vsync_start
> + * @bad-vtotal:       Bad vtotal
> + * @clock-too-high:   High clock
> + * @int-max-clock:    Clock as INT_MAX
> + * @uint-max-clock:   Clock as UINT_MAX
> + * @zero-clock:       Clock as zero
> + * @zero-hdisplay:    hdisplay as zero
> + * @zero-vdisplay:    vdisplay as zero
> + */
> +
>   IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
>   
>   typedef struct _data data_t;
