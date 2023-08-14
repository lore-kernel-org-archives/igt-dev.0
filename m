Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B8E10E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 04:21:01 +0000 (UTC)
Message-ID: <0aba1be7-ff37-950f-0a2a-33e1a16d6003@intel.com>
Date: Mon, 14 Aug 2023 09:50:40 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-48-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-48-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 47/81] tests/kms_flip: Document each
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


On 8/12/2023 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> V2: - Fix test description
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 267 ++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 264 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 31e875929..80f051305 100755
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
> @@ -39,6 +40,248 @@
>   #include <sys/poll.h>
>   #include <sys/time.h>
>   #include <sys/ioctl.h>
> +
> +/**
> + * SUBTEST: 2x-flip-vs-fences
> + * Description: Test to validate pageflips along with avialable fences on a pair
> + *              of connected displays
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-flip-vs-fences-interruptible
> + * Description: Interrupt test to validate pageflips along with available fences
> + *              on a pair of connected displays
> + * Driver requirement: any
> + * Functionality: gtt, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-vs-fences
> + * Description: Basic test to validate pageflips with avialable fences
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-vs-fences-interruptible
> + * Description: Interrupt test to validate pageflips with available fences
> + * Driver requirement: i915
> + * Functionality: gtt, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-off-confusion
> + * Description: Basic test to validate pageflips by disabling other connectors usng dpms
> + * Driver requirement: any
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: dpms-off-confusion-interruptible
> + * Description: Interrupt test to validate pageflips by disabling other connectors using dpms
> + * Driver requirement: any
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: bo-too-big
> + * Description: Basic test to validate pageflips with large BO in size
> + * Driver requirement: any
> + * Functionality: kms_gem_interop, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: bo-too-big-interruptible
> + * Description: Interrupt test to validate pageflips with large BO in size
> + * Driver requirement: any
> + * Functionality: kms_gem_interop, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: %s
> + * Description: Basic test to validate %arg[1]
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s
> + * Description: Test to validate %arg[1] on a pair of connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @wf_vblank-ts-check:           wait for the vblank and check timestamps
> + * @blocking-wf_vblank:           wait for the vblank synchronous
> + * @absolute-wf_vblank:           wait for the absolute vblank
> + * @blocking-absolute-wf_vblank:  wait for the absolute vblank synchronous
> + * @busy-flip:                    pageflip with busy buffers
> + * @plain-flip-ts-check:          pageflip and check timestamps
> + * @plain-flip-fb-recreate:       pageflip by recreating the fb
> + * @flip-vs-rmfb:                 pageflip by recreating the fb (rmfb)
> + * @flip-vs-panning:              pageflip with panning
> + * @flip-vs-expired-vblank:       pageflip by checking the vbalnk sequence
> + * @flip-vs-absolute-wf_vblank:   pageflip and wait for the absolute vblank
> + * @flip-vs-blocking-wf-vblank:   pageflip and wait for the absolute vblank synchronous
> + * @flip-vs-modeset-vs-hang:      pageflip and modeset by hang injection
> + * @flip-vs-panning-vs-hang:      pageflip with panning by hang injection
> + * @nonexisting-fb:               expired framebuffer
> + * @modeset-vs-vblank-race:       modeset and check for vblank
> + */
> +
> +/**
> + * SUBTEST: flip-vs-suspend
> + * Description: Basic test to validate pageflips with suspend cycle
> + * Driver requirement: any
> + * Functionality: suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-flip-vs-suspend
> + * Description: Basic test to validate pageflips with suspend cycle on a pair of
> + *              connected displays
> + * Driver requirement: any
> + * Functionality: suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-vs-suspend-interruptible
> + * Description: Interrupt test to validate pageflips with suspend cycle
> + * Driver requirement: any
> + * Functionality: suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-flip-vs-suspend-interruptible
> + * Description: Interrupt test to validate pageflips with suspend cycle on a pair
> + *              of connected displays
> + * Driver requirement: any
> + * Functionality: suspend, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: %s
> + * Description: Basic test to validate %arg[1]
> + * Driver requirement: any
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s
> + * Description: Basic test to validate %arg[1] on a pair of connected displays
> + * Driver requirement: any
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: %s-interruptible
> + * Description: Basic test to validate %arg[1]
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s-interruptible
> + * Description: Basic test to validate %arg[1] on a pair of connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @flip-vs-dpms-off-vs-modeset:               pageflips along with modeset and
> + *                                             dpms off.
> + * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same buffer along with
> + *                                             the modeset and dpms off
> + * @dpms-vs-vblank-race:                       vblank along with the dpms & modeset
> + */
> +
> +/**
> + * SUBTEST: 2x-flip-vs-dpms
> + * Description: Basic test to validate pageflip along with dpms on a pair of
> + *              connected displays
> + * Driver requirement: any
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: 2x-%s
> + * Description: Basic test to validate %arg[1] on a pair of connected displays
> + * Driver requirement: any
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @plain-flip:          pageflip
> + * @flip-vs-modeset:     pageflip along with modeset
> + * @flip-vs-wf_vblank:   pageflip along with waiting for vblank
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
> + * @wf_vblank-ts-check:           wait for the vblank and check timestamps
> + * @absolute-wf_vblank:           wait for the absolute vblank
> + * @blocking-absolute-wf_vblank:  wait for the absolute vblank synchronous
> + * @plain-flip:                   pageflip
> + * @plain-flip-ts-check:          pageflip and check timestamps
> + * @plain-flip-fb-recreate:       pageflip by recreating the fb
> + * @flip-vs-rmfb:                 pageflip by recreating the fb (rmfb)
> + * @flip-vs-panning:              pageflip with panning
> + * @flip-vs-expired-vblank:       pageflip by checking the vbalnk sequence
> + * @flip-vs-absolute-wf_vblank:   pageflip and wait for the absolute vblank
> + * @flip-vs-wf_vblank:            pageflip and wait for vblank
> + * @nonexisting-fb:               expired framebuffer
> + * @modeset-vs-vblank-race:       modeset and check for vblank
> + */
> +
>   #ifdef HAVE_LINUX_KD_H
>   #include <linux/kd.h>
>   #elif HAVE_SYS_KD_H
> @@ -1562,8 +1805,17 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>   }
>   
>   /**
> + * SUBTEST: basic-flip-vs-dpms
> + * Description: Basic test to valide pageflip with dpms
> + * Driver requirement: any
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: dpms, vblank
> + * Mega feature: General Display Features
> + *
>    * SUBTEST: basic-flip-vs-%s
> - * Description: Basic test to valide %arg[1]
> + * Description: Basic test to valide pageflip with %arg[1]
> + * Driver requirement: any
>    * Test category: functionality test
>    * Run type: BAT
>    * Functionality: vblank
> @@ -1571,12 +1823,12 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>    *
>    * arg[1]:
>    *
> - * @dpms:         dpms
>    * @modeset:      modeset
>    * @wf_vblank:    wait for vblank
>    *
>    * SUBTEST: basic-plain-flip
>    * Description: Basic test for validating page flip
> + * Driver requirement: any
>    * Test category: functionality test
>    * Run type: BAT
>    * Functionality: vblank
> @@ -1765,6 +2017,15 @@ static void kms_flip_exit_handler(int sig)
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
