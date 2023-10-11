Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E017710E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 05:18:18 +0000 (UTC)
Message-ID: <cd1714fe-365f-f2ea-a41a-d0f8fc0345fa@intel.com>
Date: Wed, 11 Oct 2023 10:48:04 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231010051923.41431-1-swati2.sharma@intel.com>
 <20231010051923.41431-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231010051923.41431-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_vblank: cosmetic changes
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


On 10/10/2023 10:49 AM, Swati Sharma wrote:
> Fix igt_describe() documentation. Remove redundant documentation.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_vblank.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 33e933c22..bcfd8d012 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -21,11 +21,6 @@
>    * IN THE SOFTWARE.
>    */
>   
> -/** @file kms_vblank.c
> - *
> - * This is a test of performance of drmWaitVblank.
> - */
> -
>   #include "igt.h"
>   #include <stdlib.h>
>   #include <stdio.h>
> @@ -46,7 +41,7 @@
>    * Description: Test speed of WaitVblank.
>    *
>    * SUBTEST: crtc-id
> - * Description: check the Vblank and flip events works with given crtc id
> + * Description: Check the vblank and flip events works with given crtc id
>    * Driver requirement: i915, xe
>    * Functionality: vblank
>    * Mega feature: General Display Features
> @@ -623,7 +618,7 @@ static void run_subtests_for_pipe(data_t *data)
>   			if (m->flags & ~(f->valid | NOHANG))
>   				continue;
>   
> -			igt_describe("Check if test run while hanging by introducing NOHANG flag");
> +			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
>   			igt_subtest_f("pipe-%s-%s-%s",
>   				      kmstest_pipe_name(data->pipe),
>   				      f->name, m->name) {
> @@ -645,7 +640,7 @@ static void run_subtests_for_pipe(data_t *data)
>   			if (f->valid & NOHANG || m->flags & NOHANG)
>   				continue;
>   
> -			igt_describe("check if injected hang is working properly");
> +			igt_describe("Check if injected hang is working properly.");
>   			igt_subtest_f("pipe-%s-%s-%s-hang",
>   				      kmstest_pipe_name(data->pipe),
>   				      f->name, m->name) {
> @@ -742,11 +737,11 @@ igt_main
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	igt_describe("Negative test for vblank request");
> +	igt_describe("Negative test for vblank request.");
>   	igt_subtest("invalid")
>   		invalid_subtest(&data, fd);
>   
> -	igt_describe("check the Vblank and flip events works with given crtc id");
> +	igt_describe("Check the vblank and flip events works with given crtc id.");
>   	igt_subtest("crtc-id")
>   		crtc_id_subtest(&data, fd);
>   
