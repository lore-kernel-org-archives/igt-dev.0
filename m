Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA510E04E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 10:08:56 +0000 (UTC)
Message-ID: <39dfd7cb-7f1b-94b2-3ffb-ad926422eb99@intel.com>
Date: Tue, 8 Aug 2023 15:38:43 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-48-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-48-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 47/81] tests/kms_dp_tiled_display: Document
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_tiled_display.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index eba1b2764..4652ef4e4 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -36,12 +36,33 @@
>    * the displays supported by the kernel at the moment.
>    */
>   
> +/**
> + * TEST: kms dp tiled display
> + * Category: Display
> + * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
> + */
>   #include "igt.h"
>   #include "poll.h"
>   #include "drm_mode.h"
>   #include "drm_fourcc.h"
>   #include "igt_edid.h"
>   
> +/**
> + * SUBTEST: basic-test-%s
> + * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
> + *              for all tiled CRTCs in one vblank (%arg[1]).
> + * Driver requirement: any
> + * Functionality: tiled_display
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @pattern:                  executes on real panel
> + * @pattern-with-chamelium:   executes on chamelium.
> + */
> +
>   IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
>   
>   typedef struct {
