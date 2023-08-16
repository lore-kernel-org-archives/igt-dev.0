Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AAE10E0B0
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 13:06:24 +0000 (UTC)
Message-ID: <54588317-72c2-ff67-b570-fc29dae12b78@intel.com>
Date: Wed, 16 Aug 2023 18:36:12 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230815164815.320904-78-bhanuprakash.modem@intel.com>
 <20230816123712.366294-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230816123712.366294-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V8 77/81] tests/kms_vblank: Document each
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 16-Aug-23 6:07 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Fix test documentation
> V3: - Driver requirement: s/any/i915, xe/
> V4: - Fix test documentation
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vblank.c | 160 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 160 insertions(+)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 1aa8c1083..0cc21bb5f 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -40,6 +40,166 @@
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
> + * SUBTEST: pipe-%s-ts-continuation-dpms-rpm
> + * Description: Test TS continuty with DPMS & RPM while hanging by introducing
> + *              NOHANG flag on %arg[1]
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
> + * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
> + *              NOHANG flag on %arg[1]
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
> + * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
> + *              flag on %arg[1]
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
> + * Description: Test TS continuty during Modeset with Suspend while hanging by
> + *              introducing NOHANG flag on %arg[1]
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
> + * SUBTEST: pipe-%s-accuracy-idle
> + * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
> + *              flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: pipe-%s-%s
> + * Description: Test %arg[2] while hanging by introducing NOHANG flag on %arg[1]
> + * Driver requirement: i915, xe
> + * Functionality: hang, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: pipe-%s-%s-hang
> + * Description: Test %arg[2] with injected hang is working properly on %arg[1]
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
> + * @query-idle:              Time taken to Query vblank counters
> + * @query-forked:            Time taken to Query vblank counters (multithreaded)
> + * @query-busy:              Time taken to Query vblank counters (during V-active)
> + * @query-forked-busy:       Time taken to Query vblank counters (during V-active mutithreaded)
> + * @wait-idle:               Time taken to wait for vblanks
> + * @wait-forked:             Time taken to wait for vblanks (multithreaded)
> + * @wait-busy:               Time taken to wait for vblanks (during V-active)
> + * @wait-forked-busy:        Time taken to wait for vblanks (during V-active mutithreaded)
> + * @ts-continuation-idle:    TS continuty
> + * @ts-continuation-modeset: TS continuty during modeset
> + */
>   
>   IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
>   
