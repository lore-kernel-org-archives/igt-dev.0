Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0003910E364
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 11:42:43 +0000 (UTC)
Message-ID: <5d171f6c-6799-214c-ed24-3a9b8035b4f8@intel.com>
Date: Wed, 16 Aug 2023 17:12:38 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
 <20230815164815.320904-78-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230815164815.320904-78-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V7 77/81] tests/kms_vblank: Document each
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

On 15-Aug-23 10:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Fix test documentation
> V3: - Driver requirement: s/any/i915, xe/
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vblank.c | 174 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 174 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 1aa8c1083..c2b376d4c 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -40,6 +40,180 @@
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
> + * Driver requirement: i915, xe
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid
> + * Description: Negative test for vblank request
> + * Driver requirement: i915, xe
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: pipe-%s-%s
> + * Description: Check if test run while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + *
> + * arg[2]:
> + *
> + * @accuracy-idle:
> + * @query-idle:
> + * @query-forked:
> + * @query-busy:
> + * @query-forked-busy:
> + * @wait-idle:
> + * @wait-forked:
> + * @wait-busy:
> + * @wait-forked-busy:
> + * @ts-continuation-idle:
> + * @ts-continuation-modeset:
> + */
> +

arg[2] is missing from Description. Even we need to add desc. for each 
subtest.

> +/**
> + * SUBTEST: pipe-%s-ts-continuation-dpms-rpm
> + * Description: Check if test run while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: dpms, hang, rpm, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + */
> +
> +/**
> + * SUBTEST: pipe-%s-ts-continuation-dpms-suspend
> + * Description: Check if test run while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: dpms, hang, suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + */
> +
> +/**
> + * SUBTEST: pipe-%s-ts-continuation-suspend
> + * Description: Check if test run while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + */
> +
> +/**
> + * SUBTEST: pipe-%s-ts-continuation-modeset-rpm
> + * Description: Check if test run while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, rpm, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + */
> +
> +/**
> + * SUBTEST: pipe-%s-%s
> + * Description: Check if injected hang is working properly on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @A:     pipe A
> + * @B:     pipe B
> + * @C:     pipe C
> + * @D:     pipe D
> + * @E:     pipe E
> + * @F:     pipe F
> + * @G:     pipe G
> + * @H:     pipe H
> + *
> + * arg[2]:
> + *
> + * @query-idle-hang:
> + * @query-forked-hang:
> + * @query-busy-hang:
> + * @query-forked-busy-hang:
> + * @wait-idle-hang:
> + * @wait-forked-hang:
> + * @wait-busy-hang:
> + * @wait-forked-busy-hang:
> + * @ts-continuation-idle-hang:
> + * @ts-continuation-modeset-hang:
> + */
>   
>   IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
>   

arg[2] is missing from Description. Even we need to add desc. for each 
subtest.
