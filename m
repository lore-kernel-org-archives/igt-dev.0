Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013DB10E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 03:18:04 +0000 (UTC)
Message-ID: <30d30fed-ae5a-7e5f-2aa6-d6c6a9d713d4@intel.com>
Date: Wed, 9 Aug 2023 08:47:52 +0530
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

Just noticed that there is a small error on the subject line. 
'kms_dp_tiled_display -> kms_tiled_display'. Please update this before 
merging.

Thanks,
Karthik.B.S

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
