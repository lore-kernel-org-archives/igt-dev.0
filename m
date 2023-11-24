Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD389DA9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 17:08:18 +0000 (UTC)
Message-ID: <cd91dcb2-db96-465a-a5ec-4e60b3c6f988@intel.com>
Date: Fri, 24 Nov 2023 22:38:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231124093602.2358565-1-bhanuprakash.modem@intel.com>
 <20231124093602.2358565-3-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231124093602.2358565-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 2/5] tests/kms/testplan: Regroup testplan
 documentation
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

On 24-Nov-23 3:05 PM, Bhanuprakash Modem wrote:
> For redability purpose, re-group testplan documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_big_fb.c   |  46 +++++----------
>   tests/intel/kms_busy.c     |  33 ++++++-----
>   tests/intel/kms_draw_crc.c |  16 +++--
>   tests/kms_atomic.c         |  75 ++++++++++--------------
>   tests/kms_cursor_legacy.c  |   7 ---
>   tests/kms_flip.c           | 116 ++++++++++++++++---------------------
>   tests/kms_plane.c          |  16 +++--
>   tests/kms_rotation_crc.c   |  16 +++--
>   8 files changed, 133 insertions(+), 192 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 2fb435ff4..cce7027e9 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -141,51 +141,33 @@
>    */
>   
>   /**
> - * SUBTEST: %s-addfb-size-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> - *              with small bo.
> + * SUBTEST: linear-addfb
> + * Description: Sanity check if addfb ioctl works correctly with Linear modifier
> + *              for given size and strides of fb
>    * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, tiling
> + * Functionality: big_fbs, kms_gem_interop
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * arg[1]:
> - *
> - * @4-tiled:    TILE-4
> - * @x-tiled:    TILE-X
> - * @y-tiled:    TILE-Y
> - * @yf-tiled:   TILE-YF
> - */
> -
> -/**
> - * SUBTEST: %s-addfb-size-offset-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> - *              and offsets with small bo
> + * SUBTEST: %s-addfb
> + * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
> + *              for given size and strides of fb
>    * Driver requirement: i915, xe
>    * Functionality: big_fbs, kms_gem_interop, tiling
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * arg[1]:
> - *
> - * @4-tiled:    TILE-4
> - * @x-tiled:    TILE-X
> - * @y-tiled:    TILE-Y
> - * @yf-tiled:   TILE-YF
> - */
> -
> -/**
> - * SUBTEST: linear-addfb
> - * Description: Sanity check if addfb ioctl works correctly with Linear modifier
> - *              for given size and strides of fb
> + * SUBTEST: %s-addfb-size-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> + *              with small bo.
>    * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop
> + * Functionality: big_fbs, kms_gem_interop, tiling
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: %s-addfb
> - * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
> - *              for given size and strides of fb
> + * SUBTEST: %s-addfb-size-offset-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> + *              and offsets with small bo
>    * Driver requirement: i915, xe
>    * Functionality: big_fbs, kms_gem_interop, tiling
>    * Mega feature: General Display Features
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index c65d71b19..63d1bbf71 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -48,25 +48,14 @@
>    * Functionality: kms_core, hang
>    * Mega feature: General Display Features
>    * Test category: functionality test
> - */
> -
> -/**
> - * SUBTEST: extended-modeset-hang-%s
> + *
> + * SUBTEST: extended-pageflip-modeset-hang-oldfb
>    * Description: Test for basic check of KMS ABI with busy framebuffers.
>    * Driver requirement: i915
>    * Functionality: kms_core, hang
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * arg[1]:
> - *
> - * @newfb:                New framebuffer
> - * @oldfb:                Old framebuffer
> - * @newfb-with-reset:     New framebuffer with reset
> - * @oldfb-with-reset:     Old framebuffer with reset
> - */
> -
> -/**
>    * SUBTEST: extended-pageflip-hang-%s
>    * Description: Test for basic check of KMS ABI with busy framebuffers.
>    * Driver requirement: i915
> @@ -74,19 +63,31 @@
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> + * SUBTEST: extended-modeset-hang-%s
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + * Driver requirement: i915
> + * Functionality: kms_core, hang
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
>    * arg[1]:
>    *
> - * @newfb:     New framebuffer
> - * @oldfb:     Old framebuffer
> + * @newfb:                New framebuffer
> + * @oldfb:                Old framebuffer
>    */
>   
>   /**
> - * SUBTEST: extended-pageflip-modeset-hang-oldfb
> + * SUBTEST: extended-modeset-hang-%s
>    * Description: Test for basic check of KMS ABI with busy framebuffers.
>    * Driver requirement: i915
>    * Functionality: kms_core, hang
>    * Mega feature: General Display Features
>    * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @newfb-with-reset:     New framebuffer with reset
> + * @oldfb-with-reset:     Old framebuffer with reset
>    */
>   
>   IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 7cd4c3ff1..b9d9cd6e4 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -32,6 +32,13 @@
>   #include "igt.h"
>   
>   /**
> + * SUBTEST: fill-fb
> + * Description: This subtest verifies CRC after filling fb with x-tiling or none.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core, tiling
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
>    * SUBTEST: draw-method-%s
>    * Description: Verify that igt draw library works for the %arg[1] method with
>    *              different modifiers & DRM formats.
> @@ -63,15 +70,6 @@
>    * @pwrite:       PWRITE
>    */
>   
> -/**
> - * SUBTEST: fill-fb
> - * Description: This subtest verifies CRC after filling fb with x-tiling or none.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>   #define MAX_CONNECTORS 32
>   
>   int drm_fd;
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 28af27f22..9b69fc892 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -49,6 +49,30 @@
>   #include "sw_sync.h"
>   
>   /**
> + * SUBTEST: atomic-invalid-params
> + * Description: Test abuse the atomic ioctl directly in order to test various
> + *              invalid conditions which the libdrm wrapper won't allow us to
> + *              create.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
> + * SUBTEST: atomic-plane-damage
> + * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
> + * Driver requirement: i915, xe
> + * Functionality: kms_core, plane
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
> + * SUBTEST: test-only
> + * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
> + *              the free-standing state objects and nothing else.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
>    * SUBTEST: plane-primary-overlay-mutable-zpos
>    * Description: Verify that the overlay plane can cover the primary one (and
>    *              vice versa) by changing their zpos property.
> @@ -81,18 +105,8 @@
>    */
>   
>   /**
> - * SUBTEST: test-only
> - * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
> - *              the free-standing state objects and nothing else.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
> -/**
> - * SUBTEST: plane-invalid-%s
> - * Description: Test error handling when invalid %arg[1] are passed
> + * SUBTEST: %s-invalid-%s
> + * Description: Test error handling when invalid %arg[1] %arg[2] are passed
>    * Driver requirement: i915, xe
>    * Functionality: kms_core, plane
>    * Mega feature: General Display Features
> @@ -100,41 +114,16 @@
>    *
>    * arg[1]:
>    *
> - * @params:           plane parameters
> - * @params-fence:     plane fence parameters
> - */
> -
> -/**
> - * SUBTEST: crtc-invalid-%s
> - * Description: Test error handling when invalid %arg[1] are passed
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + * @crtc:             CRTC
> + * @plane:            Plane
>    *
> - * arg[1]:
> + * arg[2]:
>    *
> - * @params:           crtc parameters
> - * @params-fence:     crtc fence parameters
> + * @params:           parameters
> + * @params-fence:     fence parameters
>    */
>   
> -/**
> - * SUBTEST: atomic-invalid-params
> - * Description: Test abuse the atomic ioctl directly in order to test various
> - *              invalid conditions which the libdrm wrapper won't allow us to
> - *              create.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: atomic-plane-damage
> - * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> +
>   
>   #ifndef DRM_CAP_CURSOR_WIDTH
>   #define DRM_CAP_CURSOR_WIDTH 0x8
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 6a4955ef1..2e2710ae4 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -257,13 +257,6 @@
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * arg[1]:
> - *
> - * @atomic:
> - * @legacy:
> - */
> -
> -/**
>    * SUBTEST: flip-vs-cursor-busy-crc-%s
>    * Description: this test perform a busy bo update followed by a cursor update
>    * Driver requirement: i915, xe
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 798103682..9afb78757 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -55,63 +55,53 @@
>   #include "xe/xe_query.h"
>   
>   /**
> - * SUBTEST: 2x-flip-vs-fences
> - * Description: Test to validate pageflips along with avialable fences on a pair
> - *              of connected displays
> + * SUBTEST: %s
> + * Description: %arg[1] test to validate pageflips with available fences
>    * Driver requirement: i915
>    * Functionality: gtt, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: 2x-flip-vs-fences-interruptible
> - * Description: Interrupt test to validate pageflips along with available fences
> + * SUBTEST: 2x-%s
> + * Description: %arg[1] test to validate pageflips along with available fences
>    *              on a pair of connected displays
> - * Driver requirement: i915, xe
> - * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: flip-vs-fences
> - * Description: Basic test to validate pageflips with avialable fences
>    * Driver requirement: i915
>    * Functionality: gtt, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: flip-vs-fences-interruptible
> - * Description: Interrupt test to validate pageflips with available fences
> - * Driver requirement: i915
> - * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + * arg[1]:
>    *
> - * SUBTEST: dpms-off-confusion
> - * Description: Basic test to validate pageflips by disabling other connectors usng dpms
> + * @flip-vs-fences:                 Basic
> + * @flip-vs-fences-interruptible:   Interrupt
> + */
> +
> +/**
> + * SUBTEST: dpms-off-%s
> + * Description: %arg[1] test to validate pageflips by disabling other connectors usng dpms
>    * Driver requirement: i915, xe
>    * Functionality: dpms, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: dpms-off-confusion-interruptible
> - * Description: Interrupt test to validate pageflips by disabling other connectors using dpms
> - * Driver requirement: i915, xe
> - * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + * arg[1]:
>    *
> - * SUBTEST: bo-too-big
> - * Description: Basic test to validate pageflips with large BO in size
> + * @confusion:                      Basic
> + * @confusion-interruptible:        Interrupt
> + */
> +
> +/**
> + * SUBTEST: %s
> + * Description: %arg[1] test to validate pageflips with large BO in size
>    * Driver requirement: i915, xe
>    * Functionality: kms_gem_interop, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: bo-too-big-interruptible
> - * Description: Interrupt test to validate pageflips with large BO in size
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + * arg[1]:
> + *
> + * @bo-too-big:                     Basic
> + * @bo-too-big-interruptible:       Interrupt
>    */
>   
>   /**
> @@ -169,36 +159,28 @@
>    */
>   
>   /**
> - * SUBTEST: flip-vs-suspend
> - * Description: Basic test to validate pageflips with suspend cycle
> - * Driver requirement: i915, xe
> - * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: 2x-flip-vs-suspend
> - * Description: Basic test to validate pageflips with suspend cycle on a pair of
> - *              connected displays
> - * Driver requirement: i915, xe
> - * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: flip-vs-suspend-interruptible
> - * Description: Interrupt test to validate pageflips with suspend cycle
> + * SUBTEST: %s
> + * Description: %arg[1] test to validate pageflips with suspend cycle
>    * Driver requirement: i915, xe
>    * Functionality: suspend, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> - * SUBTEST: 2x-flip-vs-suspend-interruptible
> - * Description: Interrupt test to validate pageflips with suspend cycle on a pair
> + * SUBTEST: 2x-%s
> + * Description: %arg[1] test to validate pageflips with suspend cycle on a pair
>    *              of connected displays
>    * Driver requirement: i915, xe
>    * Functionality: suspend, vblank
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    *
> + * arg[1]:
> + *
> + * @flip-vs-suspend:                   Basic
> + * @flip-vs-suspend-interruptible:     Interrupt
> + */
> +
> +/**
>    * SUBTEST: %s
>    * Description: Basic test to validate %arg[1]
>    * Driver requirement: i915, xe
> @@ -293,6 +275,20 @@
>    */
>   
>   /**
> + * SUBTEST: basic-plain-flip
> + * Description: Basic test for validating page flip
> + * Driver requirement: i915, xe
> + * Test category: functionality test
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: nonblocking-read
> + * Description: Tests that nonblocking reading fails correctly
> + * Driver requirement: i915, xe
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
>    * SUBTEST: basic-flip-vs-dpms
>    * Description: Basic test to valide pageflip with dpms
>    * Driver requirement: i915, xe
> @@ -311,20 +307,6 @@
>    *
>    * @modeset:      modeset
>    * @wf_vblank:    wait for vblank
> - *
> - * SUBTEST: basic-plain-flip
> - * Description: Basic test for validating page flip
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: nonblocking-read
> - * Description: Tests that nonblocking reading fails correctly
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>    */
>   
>   #define TEST_DPMS		(1 << 0)
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 17550e168..29cf45974 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -39,6 +39,13 @@
>   #include "xe/xe_query.h"
>   
>   /**
> + * SUBTEST: planar-pixel-format-settings
> + * Description: verify planar settings for pixel format are handled correctly
> + * Driver requirement: i915, xe
> + * Functionality: pixel_format, plane
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + *
>    * SUBTEST: plane-position-%s
>    * Description: Verify plane position using two planes to create a %arg[1]
>    * Driver requirement: i915, xe
> @@ -96,15 +103,6 @@
>    * @format-source-clamping:          with source clamping
>    */
>   
> -/**
> - * SUBTEST: planar-pixel-format-settings
> - * Description: verify planar settings for pixel format are handled correctly
> - * Driver requirement: i915, xe
> - * Functionality: pixel_format, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>   /*
>    * Throw away enough lsbs in pixel formats tests
>    * to get a match despite some differences between
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index b2e877a4b..bb082af68 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -77,6 +77,13 @@
>    * Functionality: plane, rotation, tiling
>    * Mega feature: General Display Features
>    * Test category: functionality test
> + *
> + * SUBTEST: exhaust-fences
> + * Description: This test intends to check for fence leaks exhaustively
> + * Driver requirement: i915
> + * Functionality: plane, rotation
> + * Mega feature: General Display Features
> + * Test category: functionality test
>    */
>   
>   /**
> @@ -142,15 +149,6 @@
>    * @top:      top
>    */
>   
> -/**
> - * SUBTEST: exhaust-fences
> - * Description: This test intends to check for fence leaks exhaustively
> - * Driver requirement: i915
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>   #define MAX_FENCES 32
>   #define MAXMULTIPLANESAMOUNT 2
>   #define TEST_MAX_WIDTH 640
