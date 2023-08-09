Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1E10E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 04:06:49 +0000 (UTC)
Message-ID: <5509fa43-64d6-54f6-3bfd-0fb20502953f@intel.com>
Date: Wed, 9 Aug 2023 09:36:34 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-49-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-49-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 48/81] tests/kms_flip: Document each
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

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_flip.c | 178 ++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 176 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index d57990240..dd7921656 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -22,8 +22,9 @@
>    */
>   
>   /**
> - * TEST: Tests for validating modeset, dpms and pageflips
> + * TEST: kms flip
>    * Category: Display
> + * Description: Tests for validating modeset, dpms and pageflips
>    */
>   
>   #include "config.h"
> @@ -39,6 +40,169 @@
>   #include <sys/poll.h>
>   #include <sys/time.h>
>   #include <sys/ioctl.h>
> +/**
> + * SUBTEST: 2x-flip-vs-fences
> + * Description: Test for validating modeset, dpms and pageflips with a pair of connected displays
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
Functionality mentions 'gtt', but description is mostly same as the 
overall test description. Could you please make this more specific?
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-flip-vs-fences-interruptible
> + * Description: Interrupt test for validating modeset, dpms and pageflips with pair of connected displays
> + * Driver requirement: any
> + * Functionality: gtt, vblank
Same as above.
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-vs-fences
> + * Description: Basic test for validating modeset, dpms and pageflips
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
Same as above.
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-vs-fences-interruptible
> + * Description: Interrupt test for validating modeset, dpms and pageflips
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
Same as above.
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: %s
> + * Description: Basic test for validating modeset, dpms and pageflips
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @dpms-off-confusion:
> + * @bo-too-big:
> + */
> +
> +/**
> + * SUBTEST: %s
> + * Description: Basic test for validating modeset, dpms and pageflips
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s
> + * Description: Test for validating modeset, dpms and pageflips with a pair of
> + *              connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @wf_vblank-ts-check:
> + * @blocking-wf_vblank:
> + * @absolute-wf_vblank:
> + * @blocking-absolute-wf_vblank:
> + * @busy-flip:
> + * @plain-flip-ts-check:
> + * @plain-flip-fb-recreate:
> + * @flip-vs-rmfb:
> + * @flip-vs-panning:
> + * @flip-vs-expired-vblank:
> + * @flip-vs-absolute-wf_vblank:
> + * @flip-vs-blocking-wf-vblank:
> + * @flip-vs-modeset-vs-hang:
> + * @flip-vs-panning-vs-hang:
> + * @flip-vs-dpms-off-vs-modeset:
> + * @single-buffer-flip-vs-dpms-off-vs-modeset:
> + * @nonexisting-fb:
> + * @dpms-vs-vblank-race:
> + * @modeset-vs-vblank-race:
> + * @flip-vs-suspend:
> + */
> +
> +/**
> + * SUBTEST: 2x-%s
> + * Description: Test for validating modeset, dpms and pageflips with a pair of
> + *              connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @plain-flip:
> + * @flip-vs-dpms:
> + * @flip-vs-modeset:
> + * @flip-vs-wf_vblank:
> + */
> +
> +/**
> + * SUBTEST: %s-interruptible
> + * Description: Basic test for validating modeset, dpms and pageflips
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @dpms-off-confusion:
> + * @bo-too-big:
> + */
> +
> +/**
> + * SUBTEST: %s-interruptible
> + * Description: Basic test for validating modeset, dpms and pageflips
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s-interruptible
> + * Description: Test for validating modeset, dpms and pageflips with a pair of
> + *              connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @wf_vblank-ts-check:
> + * @absolute-wf_vblank:
> + * @blocking-absolute-wf_vblank:
> + * @plain-flip:
> + * @plain-flip-ts-check:
> + * @plain-flip-fb-recreate:
> + * @flip-vs-rmfb:
> + * @flip-vs-panning:
> + * @flip-vs-expired-vblank:
> + * @flip-vs-absolute-wf_vblank:
> + * @flip-vs-wf_vblank:
> + * @flip-vs-dpms-off-vs-modeset:
> + * @single-buffer-flip-vs-dpms-off-vs-modeset:
> + * @nonexisting-fb:
> + * @dpms-vs-vblank-race:
> + * @modeset-vs-vblank-race:
> + * @flip-vs-suspend:
> + */
> +

All the above subtests are having mostly common/generic descriptions. 
Could you please update this to make it more subtest specific.

Thanks,
Karthik.B.S
>   #ifdef HAVE_LINUX_KD_H
>   #include <linux/kd.h>
>   #elif HAVE_SYS_KD_H
> @@ -1564,6 +1728,7 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   /**
>    * SUBTEST: basic-flip-vs-%s
>    * Description: Basic test to valide %arg[1]
> + * Driver requirement: any
>    * Test category: functionality test
>    * Run type: BAT
>    * Functionality: vblank
> @@ -1577,12 +1742,12 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>    *
>    * SUBTEST: basic-plain-flip
>    * Description: Basic test for validating page flip
> + * Driver requirement: any
>    * Test category: functionality test
>    * Run type: BAT
>    * Functionality: vblank
>    * Mega feature: General Display Features
>    */
> -
>   static void run_test(int duration, int flags)
>   {
>   	struct test_output o;
> @@ -1759,6 +1924,15 @@ static void kms_flip_exit_handler(int sig)
>   		kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
>   }
>   
> +/**
> + * SUBTEST: nonblocking-read
> + * Description: Tests that nonblocking reading fails correctly
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_nonblocking_read(int in)
>   {
>   	char buffer[1024];
