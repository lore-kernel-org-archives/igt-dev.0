Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E1489613
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:25:19 +0000 (UTC)
Message-ID: <38a6d769-92c8-7510-a32e-ca5b4e265a39@intel.com>
Date: Wed, 9 Aug 2023 13:55:01 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-78-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-78-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 77/81] tests/kms_vblank: Document each
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

Hi,

This patch has unaddressed comments on previous revision. Please take a 
look.

Thanks,
Karthik.B.S
On 6/29/2023 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vblank.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 1aa8c1083..86ff5fce8 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -40,6 +40,75 @@
>   #include <sys/wait.h>
>   
>   #include <drm.h>
> +/**
> + * TEST: kms vblank
> + * Category: Display
> + * Description: Test speed of WaitVblank.
> + *
> + * SUBTEST: crtc-id
> + * Description: check the Vblank and flip events works with given crtc id
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid
> + * Description: Negative test for vblank request
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: pipe-%s-%s
> + * Description: Check if test run while hanging by introducing NOHANG flag (or)
> + *              Check if injected hang is working properly
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:
> + * @B:
> + * @C:
> + * @D:
> + * @E:
> + * @F:
> + * @G:
> + * @H:
> + *
> + * arg[2]:
> + *
> + * @accuracy-idle:
> + * @query-busy:
> + * @query-busy-hang:
> + * @query-forked:
> + * @query-forked-busy:
> + * @query-forked-busy-hang:
> + * @query-forked-hang:
> + * @query-idle:
> + * @query-idle-hang:
> + * @ts-continuation-dpms-rpm:
> + * @ts-continuation-dpms-suspend:
> + * @ts-continuation-idle:
> + * @ts-continuation-idle-hang:
> + * @ts-continuation-modeset:
> + * @ts-continuation-modeset-hang:
> + * @ts-continuation-modeset-rpm:
> + * @ts-continuation-suspend:
> + * @wait-busy:
> + * @wait-busy-hang:
> + * @wait-forked:
> + * @wait-forked-busy:
> + * @wait-forked-busy-hang:
> + * @wait-forked-hang:
> + * @wait-idle:
> + * @wait-idle-hang:
> + */
>   
>   IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
>   
