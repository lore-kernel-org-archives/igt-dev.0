Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC3610E193
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 16:18:09 +0000 (UTC)
Message-ID: <3252de61-0178-8a1d-86c3-e63db0f13b59@intel.com>
Date: Tue, 30 May 2023 21:40:02 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-79-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-79-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 78/82] tests/kms_vblank: Document each
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



On 29-May-23 10:58 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vblank.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index da0ada78e..1849e8cc5 100644
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

Shouldn't we have separate description for subtests with NOHANG flag and 
injected hang?

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
