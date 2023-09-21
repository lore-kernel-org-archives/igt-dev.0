Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BED10E4AB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 08:16:18 +0000 (UTC)
Date: Thu, 21 Sep 2023 10:15:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230921081520.2yxegmz3kfo4czvx@kamilkon-desk.igk.intel.com>
References: <20230914131942.2178847-3-bhanuprakash.modem@intel.com>
 <20230921064813.2492586-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921064813.2492586-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 2/2] tests/kms: Optimize KMS testplan
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

Hi Bhanuprakash,

On 2023-09-21 at 12:18:13 +0530, Bhanuprakash Modem wrote:
> Moving all common key:values to TEST level from SUBTEST will
> minimize the maintenance effort.
> 
> Also, to maintain the uniformness, move testplan documentation
> to beginning of the file.
> 
> V2: - Rebase
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel/kms_big_fb.c               |  301 +-
>  tests/intel/kms_big_joiner.c           |   41 +-
>  tests/intel/kms_busy.c                 |   88 +-
>  tests/intel/kms_ccs.c                  |   15 +-
>  tests/intel/kms_cdclk.c                |   41 +-
>  tests/intel/kms_dirtyfb.c              |   23 +-
>  tests/intel/kms_draw_crc.c             |   71 +-
>  tests/intel/kms_dsc.c                  |    8 +-
>  tests/intel/kms_fb_coherency.c         |   21 +-
>  tests/intel/kms_fbcon_fbt.c            |   21 +-
>  tests/intel/kms_fence_pin_leak.c       |   18 +-
>  tests/intel/kms_flip_scaled_crc.c      |   60 +-
>  tests/intel/kms_flip_tiling.c          |   18 +-
>  tests/intel/kms_frontbuffer_tracking.c | 3892 ++++++++++--------------
------------------------------------------- ^^^^
Could you make this in smaller steps? Now it ends up in
one big comment and code move around and is hard for
review.

Regards,
Kamil

>  tests/intel/kms_legacy_colorkey.c      |   17 +-
>  tests/intel/kms_mmap_write_crc.c       |   20 +-
>  tests/intel/kms_pipe_b_c_ivb.c         |   28 +-
>  tests/intel/kms_pm_backlight.c         |   32 +-
>  tests/intel/kms_pm_dc.c                |   38 +-
>  tests/intel/kms_pm_lpsp.c              |   22 +-
>  tests/intel/kms_psr.c                  |   94 +-
>  tests/intel/kms_psr2_sf.c              |   74 +-
>  tests/intel/kms_psr2_su.c              |   19 +-
>  tests/intel/kms_psr_stress_test.c      |   21 +-
>  tests/intel/kms_pwrite_crc.c           |   17 +-
>  tests/kms_3d.c                         |   12 +-
>  tests/kms_addfb_basic.c                |  353 +--
>  tests/kms_async_flips.c                |   81 +-
>  tests/kms_atomic.c                     |  145 +-
>  tests/kms_atomic_interruptible.c       |   88 +-
>  tests/kms_atomic_transition.c          |  148 +-
>  tests/kms_bw.c                         |   18 +-
>  tests/kms_color.c                      |  125 +-
>  tests/kms_concurrent.c                 |   14 +-
>  tests/kms_content_protection.c         |  120 +-
>  tests/kms_cursor_crc.c                 |  129 +-
>  tests/kms_cursor_edge_walk.c           |   19 +-
>  tests/kms_cursor_legacy.c              |  431 ++-
>  tests/kms_display_modes.c              |   34 +-
>  tests/kms_dither.c                     |   27 +-
>  tests/kms_dp_aux_dev.c                 |   18 +-
>  tests/kms_feature_discovery.c          |   41 +-
>  tests/kms_flip.c                       |  155 +-
>  tests/kms_flip_event_leak.c            |   17 +-
>  tests/kms_force_connector_basic.c      |   53 +-
>  tests/kms_getfb.c                      |  142 +-
>  tests/kms_hdmi_inject.c                |   22 +-
>  tests/kms_hdr.c                        |  105 +-
>  tests/kms_invalid_mode.c               |    8 +-
>  tests/kms_lease.c                      |   89 +-
>  tests/kms_multipipe_modeset.c          |   12 +-
>  tests/kms_panel_fitting.c              |   20 +-
>  tests/kms_pipe_crc_basic.c             |  117 +-
>  tests/kms_plane.c                      |  115 +-
>  tests/kms_plane_alpha_blend.c          |   81 +-
>  tests/kms_plane_cursor.c               |   19 +-
>  tests/kms_plane_lowres.c               |   46 +-
>  tests/kms_plane_multiple.c             |   50 +-
>  tests/kms_plane_scaling.c              |  354 +--
>  tests/kms_prime.c                      |   22 +-
>  tests/kms_prop_blob.c                  |   82 +-
>  tests/kms_properties.c                 |   42 +-
>  tests/kms_rmfb.c                       |   24 +-
>  tests/kms_rotation_crc.c               |  204 +-
>  tests/kms_scaling_modes.c              |   10 +-
>  tests/kms_selftest.c                   |   12 +-
>  tests/kms_sequence.c                   |   55 +-
>  tests/kms_setmode.c                    |   41 +-
>  tests/kms_sysfs_edid_timing.c          |   19 +-
>  tests/kms_tiled_display.c              |    9 +-
>  tests/kms_tv_load_detect.c             |   10 +-
>  tests/kms_universal_plane.c            |   28 +-
>  tests/kms_vblank.c                     |   96 +-
>  tests/kms_vrr.c                        |   32 +-
>  tests/kms_writeback.c                  |   36 +-
>  75 files changed, 3611 insertions(+), 5319 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 611e60896..f3184d565 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -25,6 +25,9 @@
>   * TEST: kms big fb
>   * Category: Display
>   * Description: Test big framebuffers
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  
>  #include "igt.h"
> @@ -37,6 +40,130 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +/**
> + * SUBTEST: linear-%dbpp-rotate-%d
> + * Description: Sanity check if addfb ioctl works correctly for given combination
> + *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
> + * Functionality: big_fbs, kms_gem_interop, rotation
> + *
> + * arg[1].values:       8, 16, 32, 64
> + * arg[2].values:       0, 90, 180, 270
> + */
> +
> +/**
> + * SUBTEST: %s-%dbpp-rotate-%d
> + * Description: Sanity check if addfb ioctl works correctly for given combination
> + *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
> + * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> + *
> + * arg[1]:
> + *
> + * @4-tiled:            TILE-4 modifier
> + * @x-tiled:            TILE-X modifier
> + * @y-tiled:            TILE-Y modifier
> + * @yf-tiled:           TILE-YF modifier
> + *
> + * arg[2].values:       8, 16, 32, 64
> + * arg[3].values:       0, 90, 180, 270
> + */
> +
> +/**
> + * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d
> + * Description: Test maximum hardware supported stride length for given combination
> + *              of linear modifier with max hardware stride length, %arg[1]-bpp,
> + *              and %arg[2]-rotation
> + * Functionality: big_fbs, kms_gem_interop, rotation
> + *
> + * arg[1].values:       32, 64
> + * arg[2].values:       0, 180
> + */
> +
> +/**
> + * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
> + * Description: Test maximum hardware supported stride length for given combination
> + *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> + *              and %arg[3]-rotation
> + * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> + *
> + * arg[1]:
> + *
> + * @4-tiled:            TILE-4 modifier
> + * @x-tiled:            TILE-X modifier
> + * @y-tiled:            TILE-Y modifier
> + * @yf-tiled:           TILE-YF modifier
> + *
> + * arg[2].values:       32, 64
> + * arg[3].values:       0, 180
> + */
> +
> +/**
> + * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> + * Description: Test maximum hardware supported stride length for given combination
> + *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> + *              and %arg[3]-rotation with H-flip mode
> + * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> + *
> + * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
> + * Description: Test maximum hardware supported stride length for given combination
> + *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> + *              and %arg[3]-rotation with %arg[4] mode
> + * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
> + *
> + * arg[1]:
> + *
> + * @4-tiled:            TILE-4 modifier
> + * @x-tiled:            TILE-X modifier
> + * @y-tiled:            TILE-Y modifier
> + * @yf-tiled:           TILE-YF modifier
> + *
> + * arg[2].values:       32, 64
> + * arg[3].values:       0, 180
> + *
> + * arg[4]:
> + *
> + * @async-flip:         Async flip
> + * @hflip-async-flip:   Async & H-flip
> + */
> +
> +/**
> + * SUBTEST: linear-addfb-size-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
> + *              with small bo.
> + * Functionality: big_fbs, kms_gem_interop
> + *
> + * SUBTEST: %s-addfb-size-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> + *              with small bo.
> + * Functionality: big_fbs, kms_gem_interop, tiling
> + *
> + * SUBTEST: linear-addfb-size-offset-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
> + *              and offsets with small bo
> + * Functionality: big_fbs, kms_gem_interop
> + *
> + * SUBTEST: %s-addfb-size-offset-overflow
> + * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> + *              and offsets with small bo
> + * Functionality: big_fbs, kms_gem_interop, tiling
> + *
> + * SUBTEST: linear-addfb
> + * Description: Sanity check if addfb ioctl works correctly with Linear modifier
> + *              for given size and strides of fb
> + * Functionality: big_fbs, kms_gem_interop
> + *
> + * SUBTEST: %s-addfb
> + * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
> + *              for given size and strides of fb
> + * Functionality: big_fbs, kms_gem_interop, tiling
> + *
> + * arg[1]:
> + *
> + * @4-tiled:    TILE-4
> + * @x-tiled:    TILE-X
> + * @y-tiled:    TILE-Y
> + * @yf-tiled:   TILE-YF
> + */
> +
>  IGT_TEST_DESCRIPTION("Test big framebuffers");
>  
>  typedef struct {
> @@ -588,108 +715,6 @@ max_hw_stride_async_flip_test(data_t *data)
>  	return true;
>  }
>  
> -/**
> - * SUBTEST: linear-%dbpp-rotate-%d
> - * Description: Sanity check if addfb ioctl works correctly for given combination
> - *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:       8, 16, 32, 64
> - * arg[2].values:       0, 90, 180, 270
> - */
> -
> -/**
> - * SUBTEST: %s-%dbpp-rotate-%d
> - * Description: Sanity check if addfb ioctl works correctly for given combination
> - *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:            TILE-4 modifier
> - * @x-tiled:            TILE-X modifier
> - * @y-tiled:            TILE-Y modifier
> - * @yf-tiled:           TILE-YF modifier
> - *
> - * arg[2].values:       8, 16, 32, 64
> - * arg[3].values:       0, 90, 180, 270
> - */
> -
> -/**
> - * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d
> - * Description: Test maximum hardware supported stride length for given combination
> - *              of linear modifier with max hardware stride length, %arg[1]-bpp,
> - *              and %arg[2]-rotation
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:       32, 64
> - * arg[2].values:       0, 180
> - */
> -
> -/**
> - * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d
> - * Description: Test maximum hardware supported stride length for given combination
> - *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> - *              and %arg[3]-rotation
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:            TILE-4 modifier
> - * @x-tiled:            TILE-X modifier
> - * @y-tiled:            TILE-Y modifier
> - * @yf-tiled:           TILE-YF modifier
> - *
> - * arg[2].values:       32, 64
> - * arg[3].values:       0, 180
> - */
> -
> -/**
> - * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> - * Description: Test maximum hardware supported stride length for given combination
> - *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> - *              and %arg[3]-rotation with H-flip mode
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
> - * Description: Test maximum hardware supported stride length for given combination
> - *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
> - *              and %arg[3]-rotation with %arg[4] mode
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:            TILE-4 modifier
> - * @x-tiled:            TILE-X modifier
> - * @y-tiled:            TILE-Y modifier
> - * @yf-tiled:           TILE-YF modifier
> - *
> - * arg[2].values:       32, 64
> - * arg[3].values:       0, 180
> - *
> - * arg[4]:
> - *
> - * @async-flip:         Async flip
> - * @hflip-async-flip:   Async & H-flip
> - */
>  static void test_scanout(data_t *data)
>  {
>  	igt_output_t *output;
> @@ -735,30 +760,6 @@ static void test_scanout(data_t *data)
>  	igt_skip("unsupported configuration\n");
>  }
>  
> -/**
> - * SUBTEST: linear-addfb-size-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
> - *              with small bo.
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: %s-addfb-size-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> - *              with small bo.
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:    TILE-4
> - * @x-tiled:    TILE-X
> - * @y-tiled:    TILE-Y
> - * @yf-tiled:   TILE-YF
> - */
>  static void
>  test_size_overflow(data_t *data)
>  {
> @@ -803,30 +804,6 @@ test_size_overflow(data_t *data)
>  	gem_close(data->drm_fd, bo);
>  }
>  
> -/**
> - * SUBTEST: linear-addfb-size-offset-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (Linear) modifier
> - *              and offsets with small bo
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: %s-addfb-size-offset-overflow
> - * Description: Sanity check if addfb ioctl fails correctly for (%arg[1]) modifier
> - *              and offsets with small bo
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:    TILE-4
> - * @x-tiled:    TILE-X
> - * @y-tiled:    TILE-Y
> - * @yf-tiled:   TILE-YF
> - */
>  static void
>  test_size_offset_overflow(data_t *data)
>  {
> @@ -885,30 +862,6 @@ static int rmfb(int fd, uint32_t id)
>  	return err;
>  }
>  
> -/**
> - * SUBTEST: linear-addfb
> - * Description: Sanity check if addfb ioctl works correctly with Linear modifier
> - *              for given size and strides of fb
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: %s-addfb
> - * Description: Sanity check if addfb ioctl works correctly with %arg[1] modifier
> - *              for given size and strides of fb
> - * Driver requirement: i915, xe
> - * Functionality: big_fbs, kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4-tiled:    TILE-4
> - * @x-tiled:    TILE-X
> - * @y-tiled:    TILE-Y
> - * @yf-tiled:   TILE-YF
> - */
>  static void
>  test_addfb(data_t *data)
>  {
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 5c9646133..2ae17362f 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -28,9 +28,25 @@
>   * TEST: kms big joiner
>   * Category: Display
>   * Description: Test big joiner
> + * Driver requirement: i915, xe
> + * Functionality: 2p1p
> + * Mega feature: Pipe Joiner
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: basic
> + * Description: Verify the basic modeset on big joiner mode on all pipes
> + *
> + * SUBTEST: invalid-modeset
> + * Description: Verify if the modeset on the adjoining pipe is rejected when
> + *              the pipe is active with a big joiner modeset
> + *
> + * SUBTEST: 2x-modeset
> + * Description: Verify simultaneous modeset on 2 big joiner outputs
> + */
> +
>  #define MAX_HDISPLAY_PER_PIPE 5120
>  
>  IGT_TEST_DESCRIPTION("Test big joiner");
> @@ -45,15 +61,6 @@ typedef struct {
>  	uint32_t big_joiner_output[2];
>  } data_t;
>  
> -/**
> - * SUBTEST: invalid-modeset
> - * Description: Verify if the modeset on the adjoining pipe is rejected when
> - *              the pipe is active with a big joiner modeset
> - * Driver requirement: i915, xe
> - * Functionality: 2p1p
> - * Mega feature: Pipe Joiner
> - * Test category: functionality test
> - */
>  static void test_invalid_modeset(data_t *data)
>  {
>  	igt_output_t *output;
> @@ -94,14 +101,6 @@ static void test_invalid_modeset(data_t *data)
>  	igt_assert_lt(ret, 0);
>  }
>  
> -/**
> - * SUBTEST: basic
> - * Description: Verify the basic modeset on big joiner mode on all pipes
> - * Driver requirement: i915, xe
> - * Functionality: 2p1p
> - * Mega feature: Pipe Joiner
> - * Test category: functionality test
> - */
>  static void test_basic_modeset(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -140,14 +139,6 @@ static void test_basic_modeset(data_t *data)
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
>  
> -/**
> - * SUBTEST: 2x-modeset
> - * Description: Verify simultaneous modeset on 2 big joiner outputs
> - * Driver requirement: i915, xe
> - * Functionality: 2p1p
> - * Mega feature: Pipe Joiner
> - * Test category: functionality test
> - */
>  static void test_dual_display(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 5b620658f..bd79cb88a 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -25,6 +25,10 @@
>   * TEST: kms busy
>   * Category: Display
>   * Description: Basic check of KMS ABI with busy framebuffers.
> + * Driver requirement: i915
> + * Functionality: kms_core, hang
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include <sys/poll.h>
>  #include <signal.h>
> @@ -33,6 +37,38 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: basic
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + * Functionality: kms_core
> + *
> + * SUBTEST: basic-hang
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + *
> + * SUBTEST: extended-modeset-hang-%s
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + *
> + * arg[1]:
> + *
> + * @newfb:                New framebuffer
> + * @oldfb:                Old framebuffer
> + * @newfb-with-reset:     New framebuffer with reset
> + * @oldfb-with-reset:     Old framebuffer with reset
> + */
> +
> +/**
> + * SUBTEST: extended-pageflip-modeset-hang-oldfb
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + *
> + * SUBTEST: extended-pageflip-hang-%s
> + * Description: Test for basic check of KMS ABI with busy framebuffers.
> + *
> + * arg[1]:
> + *
> + * @newfb:     New framebuffer
> + * @oldfb:     Old framebuffer
> + */
> +
>  IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
>  
>  static bool all_pipes = false;
> @@ -136,21 +172,6 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
>  	put_ahnd(ahnd);
>  }
>  
> -/**
> - * SUBTEST: basic
> - * Description: Test for basic check of KMS ABI with busy framebuffers.
> - * Driver requirement: i915
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: basic-hang
> - * Description: Test for basic check of KMS ABI with busy framebuffers.
> - * Driver requirement: i915
> - * Functionality: kms_core, hang
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_flip(igt_display_t *dpy, int pipe,
>  		      igt_output_t *output, bool modeset)
>  {
> @@ -243,35 +264,6 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
>  	put_ahnd(ahnd);
>  }
>  
> -/**
> - * SUBTEST: extended-modeset-hang-%s
> - * Description: Test for basic check of KMS ABI with busy framebuffers.
> - * Driver requirement: i915
> - * Functionality: kms_core, hang
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @newfb:                New framebuffer
> - * @oldfb:                Old framebuffer
> - * @newfb-with-reset:     New framebuffer with reset
> - * @oldfb-with-reset:     Old framebuffer with reset
> - */
> -
> -/**
> - * SUBTEST: extended-pageflip-hang-%s
> - * Description: Test for basic check of KMS ABI with busy framebuffers.
> - * Driver requirement: i915
> - * Functionality: kms_core, hang
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @newfb:     New framebuffer
> - * @oldfb:     Old framebuffer
> - */
>  static void test_hang(igt_display_t *dpy,
>  		      enum pipe pipe, igt_output_t *output,
>  		      bool modeset, bool hang_newfb)
> @@ -319,14 +311,6 @@ static void test_hang(igt_display_t *dpy,
>  	igt_remove_fb(dpy->drm_fd, &fb[0]);
>  }
>  
> -/**
> - * SUBTEST: extended-pageflip-modeset-hang-oldfb
> - * Description: Test for basic check of KMS ABI with busy framebuffers.
> - * Driver requirement: i915
> - * Functionality: kms_core, hang
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  test_pageflip_modeset_hang(igt_display_t *dpy,
>  			   igt_output_t *output, enum pipe pipe)
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 102b193da..9ca5e9a19 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -28,6 +28,10 @@
>   * Description: Test render compression (RC), in which the main surface is
>   *              complemented by a color control surface (CCS) that the display
>   *              uses to interpret the compressed data.
> + * Driver requirement: i915, xe
> + * Functionality: ccs, tiling
> + * Mega feature: E2E Compression
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> @@ -36,10 +40,6 @@
>  /**
>   * SUBTEST: %s-%s-%s
>   * Description: Test %arg[2] with given %arg[3] modifier
> - * Driver requirement: i915, xe
> - * Functionality: ccs, tiling
> - * Mega feature: E2E Compression
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -73,10 +73,6 @@
>  /**
>   * SUBTEST: %s-%s-%s
>   * Description: Test %arg[2] with %arg[3] modifier
> - * Driver requirement: i915, xe
> - * Functionality: ccs, tiling
> - * Mega feature: E2E Compression
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -114,10 +110,7 @@
>  /**
>   * SUBTEST: %s-%s-%s
>   * Description: Test %arg[2] with %arg[3] modifier
> - * Driver requirement: i915, xe
>   * Functionality: ccs, rotation, tiling
> - * Mega feature: E2E Compression
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 71d827dac..5057894ca 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -28,9 +28,26 @@
>   * TEST: kms cdclk
>   * Category: Display
>   * Description: Test cdclk features : crawling and squashing
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: mode-transition-all-outputs
> + * Description: Mode transition (low to high) test to validate cdclk frequency
> + *              change by simultaneous modesets on all pipes with valid outputs.
> + *
> + * SUBTEST: mode-transition
> + * Description: Mode transition (low to high) test to validate cdclk frequency change.
> + *
> + * SUBTEST: plane-scaling
> + * Description: Plane scaling test to validate cdclk frequency change.
> + * Functionality: kms_core, plane, scaling
> + */
> +
>  IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
>  
>  #define HDISPLAY_4K	3840
> @@ -253,15 +270,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>  	igt_remove_fb(display->drm_fd, &fb);
>  }
>  
> -/**
> - * SUBTEST: mode-transition-all-outputs
> - * Description: Mode transition (low to high) test to validate cdclk frequency
> - *              change by simultaneous modesets on all pipes with valid outputs.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_mode_transition_on_all_outputs(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> @@ -358,21 +366,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>  
> -/**
> - * SUBTEST: mode-transition
> - * Description: Mode transition (low to high) test to validate cdclk frequency change.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-scaling
> - * Description: Plane scaling test to validate cdclk frequency change.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void run_cdclk_test(data_t *data, uint32_t flags)
>  {
>  	igt_display_t *display = &data->display;
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index cc9529178..bbf71ca1b 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -3,6 +3,15 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +/**
> + * TEST: kms dirtyfb
> + * Category: Display
> + * Description: Test DIRTYFB ioctl functionality.
> + * Driver requirement: i915, xe
> + * Functionality: dirtyfb, fbc, psr, drrs
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include <sys/types.h>
>  
>  #include "igt.h"
> @@ -13,24 +22,16 @@
>  
>  #include "xe/xe_query.h"
>  
> -IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
> -		     "its related features: FBC, PSR and DRRS");
> -
>  /**
> - * TEST: kms dirtyfb
> - * Category: Display
> - * Description: Test DIRTYFB ioctl functionality.
> - *
>   * SUBTEST: dirtyfb-ioctl
>   * Description: Test DIRTYFB ioctl is working properly using GPU
>   *              frontbuffer rendering with features like FBC, PSR
>   *              and DRRS.
> - * Driver requirement: i915, xe
> - * Functionality: dirtyfb, fbc, psr, drrs
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
> +IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
> +		     "its related features: FBC, PSR and DRRS");
> +
>  #ifndef PAGE_ALIGN
>  #ifndef PAGE_SIZE
>  #define PAGE_SIZE 4096
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 086f64dc8..7f1a1c5ae 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -26,10 +26,42 @@
>   * TEST: kms draw crc
>   * Category: Display
>   * Description: Tests whether the igt_draw library actually works.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core, tiling
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "i915/gem.h"
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: fill-fb
> + * Description: This subtest verifies CRC after filling fb with x-tiling or none.
> + *
> + * SUBTEST: draw-method-%s
> + * Description: Verify that igt draw library works for the %arg[1] method with
> + *              different modifiers & DRM formats.
> + *
> + * arg[1]:
> + *
> + * @blt:          Blitter
> + * @mmap-wc:      MMAP-WC
> + * @render:       Render
> + */
> +
> +/**
> + * SUBTEST: draw-method-%s
> + * Description: Verify that igt draw library works for the %arg[1] method with
> + *              different modifiers & DRM formats.
> + * Driver requirement: i915
> + *
> + * arg[1]:
> + *
> + * @mmap-cpu:     MMAP-CPU
> + * @mmap-gtt:     MMAP-GTT
> + * @pwrite:       PWRITE
> + */
> +
>  #define MAX_CONNECTORS 32
>  
>  int drm_fd;
> @@ -143,37 +175,6 @@ static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
>  	igt_remove_fb(drm_fd, &fb);
>  }
>  
> -/**
> - * SUBTEST: draw-method-%s
> - * Description: Verify that igt draw library works for the %arg[1] method with
> - *              different modifiers & DRM formats.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @blt:          Blitter
> - * @mmap-wc:      MMAP-WC
> - * @render:       Render
> - */
> -
> -/**
> - * SUBTEST: draw-method-%s
> - * Description: Verify that igt draw library works for the %arg[1] method with
> - *              different modifiers & DRM formats.
> - * Driver requirement: i915
> - * Functionality: kms_core, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @mmap-cpu:     MMAP-CPU
> - * @mmap-gtt:     MMAP-GTT
> - * @pwrite:       PWRITE
> - */
>  static void draw_method_subtest(enum igt_draw_method method,
>  				uint32_t format_index, uint64_t modifier)
>  {
> @@ -213,14 +214,6 @@ static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
>  	igt_remove_fb(drm_fd, &fb);
>  }
>  
> -/**
> - * SUBTEST: fill-fb
> - * Description: This subtest verifies CRC after filling fb with x-tiling or none.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void fill_fb_subtest(void)
>  {
>  	int rc;
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index c7dfb509a..3a0b7c0ef 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -34,6 +34,10 @@
>   * TEST: kms dsc
>   * Category: Display
>   * Description: Test to validate display stream compression
> + * Driver requirement: i915, xe
> + * Functionality: dsc
> + * Mega feature: VDSC
> + * Test category: functionality test
>   */
>  #include "kms_dsc_helper.h"
>  
> @@ -41,10 +45,6 @@
>   * SUBTEST: dsc-%s
>   * Description: Tests Display Stream Compression functionality if supported by a
>   *              connector by forcing %arg[1] on all connectors that support it
> - * Driver requirement: i915, xe
> - * Functionality: dsc
> - * Mega feature: VDSC
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> index d0c0df9ee..d854959b4 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -7,6 +7,10 @@
>   * TEST: kms_fb_coherency
>   * Category: Display
>   * Description: Exercise coherency of future scanout buffer objects
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  
>  #include <errno.h>
> @@ -17,6 +21,13 @@
>  
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: memset-crc
> + * Description: Use display controller CRC hardware to validate (non)coherency
> + *		of memset operations on future scanout buffer objects
> + *		mmapped with different mmap methods and different caching modes.
> + */
> +
>  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> @@ -239,16 +250,6 @@ igt_main
>  		select_valid_pipe_output_combo(&data);
>  	}
>  
> -	/**
> -	 * SUBTEST: memset-crc
> -	 * Description: Use display controller CRC hardware to validate (non)coherency
> -	 *		of memset operations on future scanout buffer objects
> -	 *		mmapped with different mmap methods and different caching modes.
> -	 * Mega feature: General Display Features
> -	 * Functionality: kms_core
> -	 * Driver requirement: i915, xe
> -	 * Test category: functionality test
> -	 */
>  	igt_subtest_with_dynamic("memset-crc") {
>  		if (gem_has_mappable_ggtt(data.drm_fd)) {
>  			igt_dynamic("mmap-gtt")
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index e017d5887..d7195b30a 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -24,6 +24,14 @@
>   *
>   */
>  
> +/**
> + * TEST: kms fbcon fbt
> + * Category: Display
> + * Description: Test the relationship between fbcon and the frontbuffer tracking
> + *              infrastructure.
> + * Driver requirement: i915, xe
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_psr.h"
> @@ -33,42 +41,29 @@
>  #include <fcntl.h>
>  
>  /**
> - * TEST: kms fbcon fbt
> - * Category: Display
> - * Description: Test the relationship between fbcon and the frontbuffer tracking
> - *              infrastructure.
> - *
>   * SUBTEST: fbc
>   * Description: Test the relationship between fbcon and the frontbuffer tracking
>   *              infrastructure with fbc enabled.
> - * Driver requirement: i915, xe
>   * Functionality: fbc, fbcon, fbt
>   * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: fbc-suspend
>   * Description: Suspend test to validate  the relationship between fbcon and the
>   *              frontbuffer tracking infrastructure with fbc enabled.
> - * Driver requirement: i915, xe
>   * Functionality: fbc, fbcon, fbt, suspend
>   * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: psr
>   * Description: Test the relationship between fbcon and the frontbuffer tracking
>   *              infrastructure with psr enabled.
> - * Driver requirement: i915, xe
>   * Functionality: fbcon, fbt, psr
>   * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr-suspend
>   * Description: Suspend test to validate the relationship between fbcon and the
>   *              frontbuffer tracking infrastructure with psr enabled.
> - * Driver requirement: i915, xe
>   * Functionality: fbcon, fbt, psr, suspend
>   * Mega feature: PSR
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
> index 03f3990c4..75e3a72de 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -22,6 +22,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms fence pin leak
> + * Category: Display
> + * Description: Exercises full ppgtt fence pin_count leak in the kernel.
> + * Driver requirement: i915
> + * Functionality: kms_core, synchronization
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include <errno.h>
>  #include <limits.h>
>  #include <stdbool.h>
> @@ -30,17 +39,10 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +
>  /**
> - * TEST: kms fence pin leak
> - * Category: Display
> - * Description: Exercises full ppgtt fence pin_count leak in the kernel.
> - *
>   * SUBTEST:
>   * Description: Along with the modeset, validate fence pin_count leakage.
> - * Driver requirement: i915
> - * Functionality: kms_core, synchronization
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 2997b63fa..6015e412b 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -26,6 +26,9 @@
>   * TEST: kms flip scaled crc
>   * Category: Display
>   * Description: Test flipping between scaled/nonscaled framebuffers
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> @@ -33,114 +36,72 @@
>   * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
>   * Description: Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling
>   * Description: Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-linear-to-64bpp-linear-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-%s
>   * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-4tile-to-64bpp-4tile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-xtile-to-64bpp-xtile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-yftile-to-32bpp-yftileccs-%s
>   * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-yftile-to-64bpp-yftile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-yftileccs-to-64bpp-yftile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-ytile-to-32bpp-ytileccs-%s
>   * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-%s
>   * Description: Flip from 32bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-ytile-to-64bpp-ytile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-32bpp-ytileccs-to-64bpp-ytile-%s
>   * Description: Flip from 32bpp non scaled fb to 64bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-%s
>   * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
>   *              clock programming
> - * Driver requirement: i915, xe
>   * Functionality: ccs, scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -152,42 +113,27 @@
>   * SUBTEST: flip-64bpp-4tile-to-%dbpp-4tile-%s
>   * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
>   *              CD clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-xtile-to-%dbpp-xtile-%s
>   * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
>   *              CD clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-yftile-to-%dbpp-yftile-%s
>   * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
>   *              CD clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-ytile-to-%dbpp-ytile-%s
>   * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
>   *              CD clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-64bpp-linear-to-%dbpp-linear-%s
>   * Description: Flip from 64bpp non scaled fb to %arg[1]bpp %arg[2] fb to stress
>   *              CD clock programming
> - * Driver requirement: i915, xe
>   * Functionality: scaling, tiling, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1].values: 16, 32
>   * arg[2]:
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 44121d7cf..3cc0762eb 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -24,23 +24,25 @@
>   *   Ander Conselvan de Oliveira <ander.conselvan.de.oliveira@intel.com>
>   */
>  
> +/**
> + * TEST: kms flip tiling
> + * Category: Display
> + * Description: Test page flips and tiling scenarios
> + * Driver requirement: i915, xe
> + * Functionality: kms_gem_interop, tiling
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <string.h>
>  
>  #include "igt.h"
> +
>  /**
> - * TEST: kms flip tiling
> - * Category: Display
> - * Description: Test page flips and tiling scenarios
> - *
>   * SUBTEST: flip-change-tiling
>   * Description: Check pageflip between modifiers
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 215ecdeef..5bf21308c 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -28,6 +28,9 @@
>   * TEST: kms frontbuffer tracking
>   * Category: Display
>   * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -43,268 +46,1392 @@
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
>  
> -#define TIME SLOW_QUICK(1000, 10000)
> -
> -IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> -		     "its related features: FBC, PSR and DRRS");
> -
> -/*
> - * One of the aspects of this test is that, for every subtest, we try different
> - * combinations of the parameters defined by the struct below. Because of this,
> - * a single addition of a new parameter or subtest function can lead to hundreds
> - * of new subtests.
> +/**
> + * SUBTEST: basic
> + * Description: Do some basic operations regardless of which features are enabled
> + * Functionality: fbt
>   *
> - * In order to reduce the number combinations we cut the cases that don't make
> - * sense, such as writing on the secondary screen when there is only a single
> - * pipe, or flipping when the target is the offscreen buffer. We also hide some
> - * combinations that are somewhat redundant and don't add much value to the
> - * test. For example, since we already do the offscreen testing with a single
> - * pipe enabled, there's no much value in doing it again with dual pipes. If you
> - * still want to try these redundant tests, you need to use the --show-hidden
> - * option.
> + * SUBTEST: drrs-%dp-rte
> + * Description: Sanity test to enable DRRS with %arg[1] panels.
> + * Functionality: fbt, drrs
>   *
> - * The most important hidden thing is the FEATURE_NONE set of tests. Whenever
> - * you get a failure on any test, it is important to check whether the same test
> - * fails with FEATURE_NONE - replace the feature name for "nop". If the nop test
> - * also fails, then it's likely the problem will be on the IGT side instead of
> - * the Kernel side. We don't expose this set of tests by default because (i)
> - * they take a long time to test; and (ii) if the feature tests work, then it's
> - * very likely that the nop tests will also work.
> + * SUBTEST: fbc-%dp-rte
> + * Description: Sanity test to enable FBC with %arg[1] panels.
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-%dp-rte
> + * Description: Sanity test to enable PSR with %arg[1] panels.
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-rte
> + * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-%dp-rte
> + * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-%dp-rte
> + * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
> + * Functionality: fbt, drrs, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-rte
> + * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
> + * Functionality: fbc, fbt, drrs, psr
> + *
> + * arg[1].values:   1, 2
>   */
> -struct test_mode {
> -	/* Are we going to enable just one monitor, or are we going to setup a
> -	 * dual screen environment for the test? */
> -	enum {
> -		PIPE_SINGLE = 0,
> -		PIPE_DUAL,
> -		PIPE_COUNT,
> -	} pipes;
> -
> -	/* The primary screen is the one that's supposed to have the "feature"
> -	 * enabled on, but we have the option to draw on the secondary screen or
> -	 * on some offscreen buffer. We also only theck the CRC of the primary
> -	 * screen. */
> -	enum {
> -		SCREEN_PRIM = 0,
> -		SCREEN_SCND,
> -		SCREEN_OFFSCREEN,
> -		SCREEN_COUNT,
> -	} screen;
> -
> -	/* When we draw, we can draw directly on the primary plane, on the
> -	 * cursor or on the sprite plane. */
> -	enum {
> -		PLANE_PRI = 0,
> -		PLANE_CUR,
> -		PLANE_SPR,
> -		PLANE_COUNT,
> -	} plane;
>  
> -	/* We can organize the screens in a way that each screen has its own
> -	 * framebuffer, or in a way that all screens point to the same
> -	 * framebuffer, but on different places. This includes the offscreen
> -	 * screen. */
> -	enum {
> -		FBS_INDIVIDUAL = 0,
> -		FBS_SHARED,
> -		FBS_COUNT,
> -	} fbs;
> +/**
> + * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + *
> + * arg[2]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -	/* Which features are we going to test now? This is a mask!
> -	 * FEATURE_DEFAULT is a special value which instruct the test to just
> -	 * keep what's already enabled by default in the Kernel. */
> -	enum {
> -		FEATURE_NONE  = 0,
> -		FEATURE_FBC   = 1,
> -		FEATURE_PSR   = 2,
> -		FEATURE_DRRS  = 4,
> -		FEATURE_COUNT = 8,
> -		FEATURE_DEFAULT = 8,
> -	} feature;
> +/**
> + * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + *
> + * arg[2]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
> -	 * only test a few things on the other formats. */
> -	enum pixel_format {
> -		FORMAT_RGB888 = 0,
> -		FORMAT_RGB565,
> -		FORMAT_RGB101010,
> -		FORMAT_COUNT,
> -		FORMAT_DEFAULT = FORMAT_RGB888,
> -	} format;
> +/**
> + * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @cur:            Cursor plane
> + * @pri:            Primary plane
> + * @spr:            Sprite plane
> + *
> + * arg[3]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -	/* There are multiple APIs where we can do the equivalent of a page flip
> -	 * and they exercise slightly different codepaths inside the Kernel. */
> -	enum flip_type {
> -		FLIP_PAGEFLIP,
> -		FLIP_MODESET,
> -		FLIP_PLANES,
> -		FLIP_COUNT,
> -	} flip;
> -
> -	enum tiling_type {
> -		TILING_LINEAR = 0,
> -		TILING_X,
> -		TILING_Y,
> -		TILING_4,
> -		TILING_COUNT,
> -		TILING_DEFAULT = TILING_X,
> -	} tiling;
> -
> -	enum igt_draw_method method;
> -};
> +/**
> + * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @cur:            Cursor plane
> + * @pri:            Primary plane
> + * @spr:            Sprite plane
> + *
> + * arg[3]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -enum color {
> -	COLOR_RED,
> -	COLOR_GREEN,
> -	COLOR_BLUE,
> -	COLOR_MAGENTA,
> -	COLOR_CYAN,
> -	COLOR_SCND_BG,
> -	COLOR_PRIM_BG = COLOR_BLUE,
> -	COLOR_OFFSCREEN_BG = COLOR_SCND_BG,
> -};
> +/**
> + * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -struct rect {
> -	int x;
> -	int y;
> -	int w;
> -	int h;
> -	uint32_t color;
> -};
> +/**
> + * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -struct {
> -	int fd;
> -	int debugfs;
> -	igt_display_t display;
> +/**
> + * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @cur:            Cursor plane
> + * @pri:            Primary plane
> + * @spr:            Sprite plane
> + *
> + * arg[2]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -	struct buf_ops *bops;
> -} drm;
> +/**
> + * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @cur:            Cursor plane
> + * @pri:            Primary plane
> + * @spr:            Sprite plane
> + *
> + * arg[2]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -struct {
> -	bool can_test;
> -
> -	bool supports_last_action;
> +/**
> + * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -	struct timespec last_action;
> -} fbc = {
> -	.can_test = false,
> -	.supports_last_action = false,
> -};
> +/**
> + * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on the screen using the provided method
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -struct {
> -	bool can_test;
> -} psr = {
> -	.can_test = false,
> -};
> +/**
> + * SUBTEST: drrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + */
>  
> -#define MAX_DRRS_STATUS_BUF_LEN 256
> +/**
> + * SUBTEST: drrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @rgb101010:      FORMAT_RGB101010
> + * @rgb565:         FORMAT_RGB565
> + *
> + * arg[2]:
> + *
> + * @blt:            Blitter
> + * @mmap-wc:        MMAP-WC
> + * @render:         Render
> + */
>  
> -struct {
> -	bool can_test;
> -} drrs = {
> -	.can_test = false,
> -};
> +/**
> + * SUBTEST: drrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%s-draw-%s
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @rgb101010:      FORMAT_RGB101010
> + * @rgb565:         FORMAT_RGB565
> + *
> + * arg[2]:
> + *
> + * @mmap-cpu:       MMAP-CPU
> + * @mmap-gtt:       MMAP-GTT
> + * @pwrite:         PWRITE
> + */
>  
> -igt_pipe_crc_t *pipe_crc;
> -igt_crc_t *wanted_crc;
> -struct {
> -	bool initialized;
> -	igt_crc_t crc;
> -} blue_crcs[FORMAT_COUNT];
> +/**
> + * SUBTEST: drrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with DRRS
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-slowdraw
> + * Description: Sleep a little bit between drawing operations with FBC
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-slowdraw
> + * Description: Sleep a little bit between drawing operations with PSR
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with FBC & DRRS
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-slowdraw
> + * Description: Sleep a little bit between drawing operations with FBC & PSR
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with PSR & DRRS
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-slowdraw
> + * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + */
>  
> -/* The goal of this structure is to easily allow us to deal with cases where we
> - * have a big framebuffer and the CRTC is just displaying a subregion of this
> - * big FB. */
> -struct fb_region {
> -	igt_plane_t *plane;
> -	struct igt_fb *fb;
> -	int x;
> -	int y;
> -	int w;
> -	int h;
> -};
> -
> -struct draw_pattern_info {
> -	bool frames_stack;
> -	int n_rects;
> -	struct rect (*get_rect)(struct fb_region *fb, int r);
> -
> -	bool initialized[FORMAT_COUNT];
> -	igt_crc_t *crcs[FORMAT_COUNT];
> -};
> -
> -/* Draw big rectangles on the screen. */
> -struct draw_pattern_info pattern1;
> -/* 64x64 rectangles at x:0,y:0, just so we can draw on the cursor and sprite. */
> -struct draw_pattern_info pattern2;
> -/* 64x64 rectangles at different positions, same color, for the move test. */
> -struct draw_pattern_info pattern3;
> -/* Just a fullscreen green square. */
> -struct draw_pattern_info pattern4;
> -
> -/* Command line parameters. */
> -struct {
> -	bool check_status;
> -	bool check_crc;
> -	bool fbc_check_compression;
> -	bool fbc_check_last_action;
> -	bool no_edp;
> -	bool small_modes;
> -	bool show_hidden;
> -	int step;
> -	int only_pipes;
> -	int shared_fb_x_offset;
> -	int shared_fb_y_offset;
> -	enum tiling_type tiling;
> -} opt = {
> -	.check_status = true,
> -	.check_crc = true,
> -	.fbc_check_compression = true,
> -	.fbc_check_last_action = true,
> -	.no_edp = false,
> -	.small_modes = false,
> -	.show_hidden= false,
> -	.step = 0,
> -	.only_pipes = PIPE_COUNT,
> -	.shared_fb_x_offset = 248,
> -	.shared_fb_y_offset = 500,
> -	.tiling = TILING_DEFAULT,
> -};
> -
> -struct modeset_params {
> -	enum pipe pipe;
> -	igt_output_t *output;
> -	drmModeModeInfo mode;
> -
> -	struct fb_region primary;
> -	struct fb_region cursor;
> -	struct fb_region sprite;
> -};
> -
> -struct modeset_params prim_mode_params;
> -struct modeset_params scnd_mode_params;
> -
> -struct fb_region offscreen_fb;
> -struct screen_fbs {
> -	bool initialized;
> +/**
> + * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + *
> + * arg[3]:
> + *
> + * @ms:             Modeset
> + * @pg:             Page flip
> + * @pl:             Plane change
> + */
>  
> -	struct igt_fb prim_pri;
> -	struct igt_fb prim_cur;
> -	struct igt_fb prim_spr;
> +/**
> + * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
> + * Description: Just exercise page flips with the patterns we have
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + *
> + * arg[2]:
> + *
> + * @ms:             Modeset
> + * @pg:             Page flip
> + * @pl:             Plane change
> + */
>  
> -	struct igt_fb scnd_pri;
> -	struct igt_fb scnd_cur;
> -	struct igt_fb scnd_spr;
> +/**
> + * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + */
>  
> -	struct igt_fb offscreen;
> -	struct igt_fb big;
> -} fbs[FORMAT_COUNT];
> +/**
> + * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
> + * Description: Just move the %arg[2] around
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @spr:            Sprite plane
> + * @cur:            Cursor plane
> + */
>  
> -struct {
> -	pthread_t thread;
> -	bool stop;
> +/**
> + * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
> + * Description: Just move the %arg[1] around
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * arg[1]:
> + *
> + * @spr:            Sprite plane
> + * @cur:            Cursor plane
> + */
>  
> -	uint32_t handle;
> +/**
> + * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[2] a few times
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * arg[1].values:   1, 2
> + *
> + * arg[2]:
> + *
> + * @spr:            Sprite plane
> + * @cur:            Cursor plane
> + */
> +
> +/**
> + * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
> + * Description: Just enable and disable the %arg[1] a few times
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * arg[1]:
> + *
> + * @spr:            Sprite plane
> + * @cur:            Cursor plane
> + */
> +
> +/**
> + * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbt
> + *
> + * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbt, psr
> + *
> + * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen plane covering the whole screen
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * arg[1].values:   1, 2
> + */
> +
> +/**
> + * SUBTEST: drrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: drrs, fbt, scaling
> + *
> + * SUBTEST: fbc-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: fbc, fbt, scaling
> + *
> + * SUBTEST: psr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: fbt, psr, scaling
> + *
> + * SUBTEST: fbcdrrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: drrs, fbc, fbt, scaling
> + *
> + * SUBTEST: fbcpsr-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: fbc, fbt, psr, scaling
> + *
> + * SUBTEST: psrdrrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: drrs, fbt, psr, scaling
> + *
> + * SUBTEST: fbcpsrdrrs-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies
> + * Functionality: drrs, fbc, fbt, psr, scaling
> + *
> + * arg[1]:
> + *
> + * @indfb:          Individual fb
> + * @shrfb:          Shared fb
> + */
> +
> +/**
> + * SUBTEST: drrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
> + * Functionality: drrs, fbt, scaling
> + *
> + * SUBTEST: fbc-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC
> + * Functionality: fbc, fbt, scaling
> + *
> + * SUBTEST: psr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with PSR
> + * Functionality: fbt, psr, scaling
> + *
> + * SUBTEST: fbcdrrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
> + * Functionality: drrs, fbc, fbt, scaling
> + *
> + * SUBTEST: fbcpsr-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
> + * Functionality: fbc, fbt, psr, scaling
> + *
> + * SUBTEST: psrdrrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
> + * Functionality: drrs, fbt, psr, scaling
> + *
> + * SUBTEST: fbcpsrdrrs-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
> + * Functionality: drrs, fbc, fbt, psr, scaling
> + *
> + * SUBTEST: drrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of DRRS
> + * Functionality: drrs, fbt, suspend
> + *
> + * SUBTEST: fbc-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of FBC
> + * Functionality: fbc, fbt, suspend
> + *
> + * SUBTEST: psr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of PSR
> + * Functionality: fbt, psr, suspend
> + *
> + * SUBTEST: fbcdrrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
> + * Functionality: drrs, fbc, fbt, suspend
> + *
> + * SUBTEST: fbcpsr-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
> + * Functionality: fbc, fbt, psr, suspend
> + *
> + * SUBTEST: psrdrrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
> + * Functionality: drrs, fbt, psr, suspend
> + *
> + * SUBTEST: fbcpsrdrrs-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
> + * Functionality: drrs, fbc, fbt, psr, suspend
> + *
> + * SUBTEST: drrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core
> + *
> + * SUBTEST: fbc-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core
> + *
> + * SUBTEST: psr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: fbt, kms_core, psr
> + *
> + * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core
> + *
> + * SUBTEST: fbcpsr-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: psrdrrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: drrs, fbt, kms_core, psr
> + *
> + * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible
> + * Driver requirement: i915
> + * Functionality: drrs, fbc, fbt, kms_core, psr
> + *
> + * SUBTEST: fbc-badstride
> + * Description: Try to use buffers with strides that are not supported
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: fbcdrrs-badstride
> + * Description: Try to use buffers with strides that are not supported
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-badstride
> + * Description: Try to use buffers with strides that are not supported
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-badstride
> + * Description: Try to use buffers with strides that are not supported
> + * Functionality: drrs, fbc, fbt, psr
> + *
> + * SUBTEST: fbc-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + * Functionality: fbc, fbt
> + *
> + * SUBTEST: fbcdrrs-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + * Functionality: drrs, fbc, fbt
> + *
> + * SUBTEST: fbcpsr-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + * Functionality: fbc, fbt, psr
> + *
> + * SUBTEST: fbcpsrdrrs-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset
> + * Functionality: drrs, fbc, fbt, psr
> + */
> +
> +/**
> + * SUBTEST: fbc-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + *              basic drawing test, else set the mode & test if FBC is disabled
> + * Functionality: fbc, fbt, tiling
> + *
> + * SUBTEST: fbcdrrs-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + *              basic drawing test, else set the mode & test if FBC is disabled
> + * Functionality: drrs, fbc, fbt, tiling
> + *
> + * SUBTEST: fbcpsr-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + *              basic drawing test, else set the mode & test if FBC is disabled
> + * Functionality: fbc, fbt, psr, tiling
> + *
> + * SUBTEST: fbcpsrdrrs-tiling-%s
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + *              basic drawing test, else set the mode & test if FBC is disabled
> + * Functionality: drrs, fbc, fbt, psr, tiling
> + *
> + * arg[1]:
> + *
> + * @4:              4 tiling
> + * @linear:         Linear tiling
> + * @y:              Y tiling
> + */
> +#define TIME SLOW_QUICK(1000, 10000)
> +
> +IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> +		     "its related features: FBC, PSR and DRRS");
> +
> +/*
> + * One of the aspects of this test is that, for every subtest, we try different
> + * combinations of the parameters defined by the struct below. Because of this,
> + * a single addition of a new parameter or subtest function can lead to hundreds
> + * of new subtests.
> + *
> + * In order to reduce the number combinations we cut the cases that don't make
> + * sense, such as writing on the secondary screen when there is only a single
> + * pipe, or flipping when the target is the offscreen buffer. We also hide some
> + * combinations that are somewhat redundant and don't add much value to the
> + * test. For example, since we already do the offscreen testing with a single
> + * pipe enabled, there's no much value in doing it again with dual pipes. If you
> + * still want to try these redundant tests, you need to use the --show-hidden
> + * option.
> + *
> + * The most important hidden thing is the FEATURE_NONE set of tests. Whenever
> + * you get a failure on any test, it is important to check whether the same test
> + * fails with FEATURE_NONE - replace the feature name for "nop". If the nop test
> + * also fails, then it's likely the problem will be on the IGT side instead of
> + * the Kernel side. We don't expose this set of tests by default because (i)
> + * they take a long time to test; and (ii) if the feature tests work, then it's
> + * very likely that the nop tests will also work.
> + */
> +struct test_mode {
> +	/* Are we going to enable just one monitor, or are we going to setup a
> +	 * dual screen environment for the test? */
> +	enum {
> +		PIPE_SINGLE = 0,
> +		PIPE_DUAL,
> +		PIPE_COUNT,
> +	} pipes;
> +
> +	/* The primary screen is the one that's supposed to have the "feature"
> +	 * enabled on, but we have the option to draw on the secondary screen or
> +	 * on some offscreen buffer. We also only theck the CRC of the primary
> +	 * screen. */
> +	enum {
> +		SCREEN_PRIM = 0,
> +		SCREEN_SCND,
> +		SCREEN_OFFSCREEN,
> +		SCREEN_COUNT,
> +	} screen;
> +
> +	/* When we draw, we can draw directly on the primary plane, on the
> +	 * cursor or on the sprite plane. */
> +	enum {
> +		PLANE_PRI = 0,
> +		PLANE_CUR,
> +		PLANE_SPR,
> +		PLANE_COUNT,
> +	} plane;
> +
> +	/* We can organize the screens in a way that each screen has its own
> +	 * framebuffer, or in a way that all screens point to the same
> +	 * framebuffer, but on different places. This includes the offscreen
> +	 * screen. */
> +	enum {
> +		FBS_INDIVIDUAL = 0,
> +		FBS_SHARED,
> +		FBS_COUNT,
> +	} fbs;
> +
> +	/* Which features are we going to test now? This is a mask!
> +	 * FEATURE_DEFAULT is a special value which instruct the test to just
> +	 * keep what's already enabled by default in the Kernel. */
> +	enum {
> +		FEATURE_NONE  = 0,
> +		FEATURE_FBC   = 1,
> +		FEATURE_PSR   = 2,
> +		FEATURE_DRRS  = 4,
> +		FEATURE_COUNT = 8,
> +		FEATURE_DEFAULT = 8,
> +	} feature;
> +
> +	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
> +	 * only test a few things on the other formats. */
> +	enum pixel_format {
> +		FORMAT_RGB888 = 0,
> +		FORMAT_RGB565,
> +		FORMAT_RGB101010,
> +		FORMAT_COUNT,
> +		FORMAT_DEFAULT = FORMAT_RGB888,
> +	} format;
> +
> +	/* There are multiple APIs where we can do the equivalent of a page flip
> +	 * and they exercise slightly different codepaths inside the Kernel. */
> +	enum flip_type {
> +		FLIP_PAGEFLIP,
> +		FLIP_MODESET,
> +		FLIP_PLANES,
> +		FLIP_COUNT,
> +	} flip;
> +
> +	enum tiling_type {
> +		TILING_LINEAR = 0,
> +		TILING_X,
> +		TILING_Y,
> +		TILING_4,
> +		TILING_COUNT,
> +		TILING_DEFAULT = TILING_X,
> +	} tiling;
> +
> +	enum igt_draw_method method;
> +};
> +
> +enum color {
> +	COLOR_RED,
> +	COLOR_GREEN,
> +	COLOR_BLUE,
> +	COLOR_MAGENTA,
> +	COLOR_CYAN,
> +	COLOR_SCND_BG,
> +	COLOR_PRIM_BG = COLOR_BLUE,
> +	COLOR_OFFSCREEN_BG = COLOR_SCND_BG,
> +};
> +
> +struct rect {
> +	int x;
> +	int y;
> +	int w;
> +	int h;
> +	uint32_t color;
> +};
> +
> +struct {
> +	int fd;
> +	int debugfs;
> +	igt_display_t display;
> +
> +	struct buf_ops *bops;
> +} drm;
> +
> +struct {
> +	bool can_test;
> +
> +	bool supports_last_action;
> +
> +	struct timespec last_action;
> +} fbc = {
> +	.can_test = false,
> +	.supports_last_action = false,
> +};
> +
> +struct {
> +	bool can_test;
> +} psr = {
> +	.can_test = false,
> +};
> +
> +#define MAX_DRRS_STATUS_BUF_LEN 256
> +
> +struct {
> +	bool can_test;
> +} drrs = {
> +	.can_test = false,
> +};
> +
> +igt_pipe_crc_t *pipe_crc;
> +igt_crc_t *wanted_crc;
> +struct {
> +	bool initialized;
> +	igt_crc_t crc;
> +} blue_crcs[FORMAT_COUNT];
> +
> +/* The goal of this structure is to easily allow us to deal with cases where we
> + * have a big framebuffer and the CRTC is just displaying a subregion of this
> + * big FB. */
> +struct fb_region {
> +	igt_plane_t *plane;
> +	struct igt_fb *fb;
> +	int x;
> +	int y;
> +	int w;
> +	int h;
> +};
> +
> +struct draw_pattern_info {
> +	bool frames_stack;
> +	int n_rects;
> +	struct rect (*get_rect)(struct fb_region *fb, int r);
> +
> +	bool initialized[FORMAT_COUNT];
> +	igt_crc_t *crcs[FORMAT_COUNT];
> +};
> +
> +/* Draw big rectangles on the screen. */
> +struct draw_pattern_info pattern1;
> +/* 64x64 rectangles at x:0,y:0, just so we can draw on the cursor and sprite. */
> +struct draw_pattern_info pattern2;
> +/* 64x64 rectangles at different positions, same color, for the move test. */
> +struct draw_pattern_info pattern3;
> +/* Just a fullscreen green square. */
> +struct draw_pattern_info pattern4;
> +
> +/* Command line parameters. */
> +struct {
> +	bool check_status;
> +	bool check_crc;
> +	bool fbc_check_compression;
> +	bool fbc_check_last_action;
> +	bool no_edp;
> +	bool small_modes;
> +	bool show_hidden;
> +	int step;
> +	int only_pipes;
> +	int shared_fb_x_offset;
> +	int shared_fb_y_offset;
> +	enum tiling_type tiling;
> +} opt = {
> +	.check_status = true,
> +	.check_crc = true,
> +	.fbc_check_compression = true,
> +	.fbc_check_last_action = true,
> +	.no_edp = false,
> +	.small_modes = false,
> +	.show_hidden= false,
> +	.step = 0,
> +	.only_pipes = PIPE_COUNT,
> +	.shared_fb_x_offset = 248,
> +	.shared_fb_y_offset = 500,
> +	.tiling = TILING_DEFAULT,
> +};
> +
> +struct modeset_params {
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	drmModeModeInfo mode;
> +
> +	struct fb_region primary;
> +	struct fb_region cursor;
> +	struct fb_region sprite;
> +};
> +
> +struct modeset_params prim_mode_params;
> +struct modeset_params scnd_mode_params;
> +
> +struct fb_region offscreen_fb;
> +struct screen_fbs {
> +	bool initialized;
> +
> +	struct igt_fb prim_pri;
> +	struct igt_fb prim_cur;
> +	struct igt_fb prim_spr;
> +
> +	struct igt_fb scnd_pri;
> +	struct igt_fb scnd_cur;
> +	struct igt_fb scnd_spr;
> +
> +	struct igt_fb offscreen;
> +	struct igt_fb big;
> +} fbs[FORMAT_COUNT];
> +
> +struct {
> +	pthread_t thread;
> +	bool stop;
> +
> +	uint32_t handle;
>  	uint32_t size;
>  	uint32_t stride;
>  	int width;
> @@ -1683,898 +2810,233 @@ static void set_region_for_test(const struct test_mode *t,
>  	fill_fb_region(reg, COLOR_PRIM_BG);
>  
>  	igt_plane_set_fb(reg->plane, reg->fb);
> -	igt_plane_set_position(reg->plane, 0, 0);
> -	igt_plane_set_size(reg->plane, reg->w, reg->h);
> -	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
> -
> -	igt_display_commit(&drm.display);
> -	do_assertions(ASSERT_NO_ACTION_CHANGE);
> -}
> -
> -static bool enable_features_for_test(const struct test_mode *t)
> -{
> -	bool ret = false;
> -
> -	if (t->feature == FEATURE_DEFAULT)
> -		return false;
> -
> -	if (t->feature & FEATURE_FBC)
> -		intel_fbc_enable(drm.fd);
> -	if (t->feature & FEATURE_PSR)
> -		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
> -	if (t->feature & FEATURE_DRRS)
> -		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
> -
> -	return ret;
> -}
> -
> -static void check_test_requirements(const struct test_mode *t)
> -{
> -	int ver;
> -
> -	if (t->pipes == PIPE_DUAL)
> -		igt_require_f(scnd_mode_params.output,
> -			    "Can't test dual pipes with the current outputs\n");
> -
> -	if (t->feature & FEATURE_FBC)
> -		igt_require_f(fbc.can_test,
> -			      "Can't test FBC with this chipset\n");
> -
> -	if (t->feature & FEATURE_PSR) {
> -		igt_require_f(psr.can_test,
> -			      "Can't test PSR with the current outputs\n");
> -	}
> -
> -	if (t->feature & FEATURE_DRRS)
> -		igt_require_f(drrs.can_test,
> -			      "Can't test DRRS with the current outputs\n");
> -
> -	/*
> -	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
> -	 * case needs DRRS + PSR enabled, that will be skipped.
> -	 */
> -	igt_require_f(!((t->feature & FEATURE_PSR) &&
> -		      (t->feature & FEATURE_DRRS)),
> -		      "Can't test PSR and DRRS together\n");
> -
> -	if (opt.only_pipes != PIPE_COUNT)
> -		igt_require(t->pipes == opt.only_pipes);
> -
> -	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
> -	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
> -	if (ver >= 12 && ver <= 13)
> -		igt_require_f(!((t->feature & FEATURE_PSR) &&
> -				(t->feature & FEATURE_FBC)),
> -			      "Can't test PSR and FBC together\n");
> -
> -}
> -
> -static void set_crtc_fbs(const struct test_mode *t)
> -{
> -	struct screen_fbs *s = &fbs[t->format];
> -
> -	create_fbs(t->format, t->tiling);
> -
> -	switch (t->fbs) {
> -	case FBS_INDIVIDUAL:
> -		prim_mode_params.primary.fb = &s->prim_pri;
> -		scnd_mode_params.primary.fb = &s->scnd_pri;
> -		offscreen_fb.fb = &s->offscreen;
> -
> -		prim_mode_params.primary.x = 0;
> -		scnd_mode_params.primary.x = 0;
> -		offscreen_fb.x = 0;
> -
> -		prim_mode_params.primary.y = 0;
> -		scnd_mode_params.primary.y = 0;
> -		offscreen_fb.y = 0;
> -		break;
> -	case FBS_SHARED:
> -		/* Please see the comment at the top of create_shared_fb(). */
> -		prim_mode_params.primary.fb = &s->big;
> -		scnd_mode_params.primary.fb = &s->big;
> -		offscreen_fb.fb = &s->big;
> -
> -		prim_mode_params.primary.x = opt.shared_fb_x_offset;
> -		scnd_mode_params.primary.x = opt.shared_fb_x_offset;
> -		offscreen_fb.x = opt.shared_fb_x_offset;
> -
> -		prim_mode_params.primary.y = opt.shared_fb_y_offset;
> -		scnd_mode_params.primary.y = prim_mode_params.primary.y +
> -					prim_mode_params.primary.h;
> -		offscreen_fb.y = scnd_mode_params.primary.y + scnd_mode_params.primary.h;
> -		break;
> -	default:
> -		igt_assert(false);
> -	}
> -
> -	prim_mode_params.cursor.fb = &s->prim_cur;
> -	prim_mode_params.sprite.fb = &s->prim_spr;
> -	scnd_mode_params.cursor.fb = &s->scnd_cur;
> -	scnd_mode_params.sprite.fb = &s->scnd_spr;
> -}
> -
> -static void prepare_subtest_data(const struct test_mode *t,
> -				 struct draw_pattern_info *pattern)
> -{
> -	bool need_modeset;
> -
> -	check_test_requirements(t);
> -
> -	stop_busy_thread();
> -
> -	need_modeset = disable_features(t);
> -	set_crtc_fbs(t);
> -
> -	if (t->screen == SCREEN_OFFSCREEN)
> -		fill_fb_region(&offscreen_fb, COLOR_OFFSCREEN_BG);
> -
> -	igt_display_reset(&drm.display);
> -	if (need_modeset)
> -		igt_display_commit(&drm.display);
> -
> -	init_blue_crc(t->format, t->tiling);
> -	if (pattern)
> -		init_crcs(t->format, t->tiling, pattern);
> -
> -	need_modeset = enable_features_for_test(t);
> -	if (need_modeset)
> -		igt_display_commit(&drm.display);
> -}
> -
> -static void prepare_subtest_screens(const struct test_mode *t)
> -{
> -	if (t->pipes == PIPE_DUAL)
> -		enable_both_screens_and_wait(t);
> -	else
> -		enable_prim_screen_and_wait(t);
> -
> -	if (t->screen == SCREEN_PRIM) {
> -		if (t->plane == PLANE_CUR)
> -			set_region_for_test(t, &prim_mode_params.cursor);
> -		if (t->plane == PLANE_SPR)
> -			set_region_for_test(t, &prim_mode_params.sprite);
> -	}
> -
> -	if (t->pipes == PIPE_DUAL && t->screen == SCREEN_SCND) {
> -		if (t->plane == PLANE_CUR)
> -			set_region_for_test(t, &scnd_mode_params.cursor);
> -		if (t->plane == PLANE_SPR)
> -			set_region_for_test(t, &scnd_mode_params.sprite);
> -	}
> -}
> -
> -static void prepare_subtest(const struct test_mode *t,
> -			    struct draw_pattern_info *pattern)
> -{
> -	prepare_subtest_data(t, pattern);
> -	prepare_subtest_screens(t);
> -}
> -
> -/**
> - * SUBTEST: drrs-%dp-rte
> - * Description: Sanity test to enable DRRS with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbt, drrs
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-rte
> - * Description: Sanity test to enable FBC with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-rte
> - * Description: Sanity test to enable PSR with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-rte
> - * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-rte
> - * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-rte
> - * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbt, drrs, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-rte
> - * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, drrs, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - */
> -
> -/*
> - * rte - the basic sanity test
> - *
> - * METHOD
> - *   Just disable all screens, assert everything is disabled, then enable all
> - *   screens - including primary, cursor and sprite planes - and assert that
> - *   the tested feature is enabled.
> - *
> - * EXPECTED RESULTS
> - *   Blue screens and t->feature enabled.
> - *
> - * FAILURES
> - *   A failure here means that every other subtest will probably fail too. It
> - *   probably means that the Kernel is just not enabling the feature we want.
> - */
> -static void rte_subtest(const struct test_mode *t)
> -{
> -	prepare_subtest_data(t, NULL);
> +	igt_plane_set_position(reg->plane, 0, 0);
> +	igt_plane_set_size(reg->plane, reg->w, reg->h);
> +	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
>  
> -	unset_all_crtcs();
> -	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
> -		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
> +	igt_display_commit(&drm.display);
> +	do_assertions(ASSERT_NO_ACTION_CHANGE);
> +}
>  
> -	if (t->pipes == PIPE_SINGLE)
> -		enable_prim_screen_and_wait(t);
> -	else
> -		enable_both_screens_and_wait(t);
> +static bool enable_features_for_test(const struct test_mode *t)
> +{
> +	bool ret = false;
>  
> -	set_region_for_test(t, &prim_mode_params.cursor);
> -	set_region_for_test(t, &prim_mode_params.sprite);
> +	if (t->feature == FEATURE_DEFAULT)
> +		return false;
>  
> -	if (t->pipes == PIPE_DUAL) {
> -		set_region_for_test(t, &scnd_mode_params.cursor);
> -		set_region_for_test(t, &scnd_mode_params.sprite);
> -	}
> +	if (t->feature & FEATURE_FBC)
> +		intel_fbc_enable(drm.fd);
> +	if (t->feature & FEATURE_PSR)
> +		ret = psr_enable(drm.fd, drm.debugfs, PSR_MODE_1);
> +	if (t->feature & FEATURE_DRRS)
> +		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
> +
> +	return ret;
>  }
>  
> -static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
> +static void check_test_requirements(const struct test_mode *t)
>  {
> -	if (t->screen == SCREEN_PRIM)
> -		wanted_crc = crc;
> +	int ver;
> +
> +	if (t->pipes == PIPE_DUAL)
> +		igt_require_f(scnd_mode_params.output,
> +			    "Can't test dual pipes with the current outputs\n");
> +
> +	if (t->feature & FEATURE_FBC)
> +		igt_require_f(fbc.can_test,
> +			      "Can't test FBC with this chipset\n");
> +
> +	if (t->feature & FEATURE_PSR) {
> +		igt_require_f(psr.can_test,
> +			      "Can't test PSR with the current outputs\n");
> +	}
> +
> +	if (t->feature & FEATURE_DRRS)
> +		igt_require_f(drrs.can_test,
> +			      "Can't test DRRS with the current outputs\n");
> +
> +	/*
> +	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
> +	 * case needs DRRS + PSR enabled, that will be skipped.
> +	 */
> +	igt_require_f(!((t->feature & FEATURE_PSR) &&
> +		      (t->feature & FEATURE_DRRS)),
> +		      "Can't test PSR and DRRS together\n");
> +
> +	if (opt.only_pipes != PIPE_COUNT)
> +		igt_require(t->pipes == opt.only_pipes);
> +
> +	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
> +	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
> +	if (ver >= 12 && ver <= 13)
> +		igt_require_f(!((t->feature & FEATURE_PSR) &&
> +				(t->feature & FEATURE_FBC)),
> +			      "Can't test PSR and FBC together\n");
> +
>  }
>  
> -static bool op_disables_psr(const struct test_mode *t,
> -			    enum igt_draw_method method)
> +static void set_crtc_fbs(const struct test_mode *t)
>  {
> -	if (method != IGT_DRAW_MMAP_GTT)
> -		return false;
> -	if (t->screen == SCREEN_PRIM)
> -		return true;
> -	/* On FBS_SHARED, even if the target is not the PSR screen
> -	 * (SCREEN_PRIM), all primary planes share the same frontbuffer, so a
> -	 * write to the second screen primary plane - or offscreen plane - will
> -	 * touch the framebuffer that's also used by the primary screen. */
> -	if (t->fbs == FBS_SHARED && t->plane == PLANE_PRI)
> -		return true;
> +	struct screen_fbs *s = &fbs[t->format];
>  
> -	return false;
> +	create_fbs(t->format, t->tiling);
> +
> +	switch (t->fbs) {
> +	case FBS_INDIVIDUAL:
> +		prim_mode_params.primary.fb = &s->prim_pri;
> +		scnd_mode_params.primary.fb = &s->scnd_pri;
> +		offscreen_fb.fb = &s->offscreen;
> +
> +		prim_mode_params.primary.x = 0;
> +		scnd_mode_params.primary.x = 0;
> +		offscreen_fb.x = 0;
> +
> +		prim_mode_params.primary.y = 0;
> +		scnd_mode_params.primary.y = 0;
> +		offscreen_fb.y = 0;
> +		break;
> +	case FBS_SHARED:
> +		/* Please see the comment at the top of create_shared_fb(). */
> +		prim_mode_params.primary.fb = &s->big;
> +		scnd_mode_params.primary.fb = &s->big;
> +		offscreen_fb.fb = &s->big;
> +
> +		prim_mode_params.primary.x = opt.shared_fb_x_offset;
> +		scnd_mode_params.primary.x = opt.shared_fb_x_offset;
> +		offscreen_fb.x = opt.shared_fb_x_offset;
> +
> +		prim_mode_params.primary.y = opt.shared_fb_y_offset;
> +		scnd_mode_params.primary.y = prim_mode_params.primary.y +
> +					prim_mode_params.primary.h;
> +		offscreen_fb.y = scnd_mode_params.primary.y + scnd_mode_params.primary.h;
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	prim_mode_params.cursor.fb = &s->prim_cur;
> +	prim_mode_params.sprite.fb = &s->prim_spr;
> +	scnd_mode_params.cursor.fb = &s->scnd_cur;
> +	scnd_mode_params.sprite.fb = &s->scnd_spr;
>  }
>  
> -/**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - *
> - * arg[2]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> +static void prepare_subtest_data(const struct test_mode *t,
> +				 struct draw_pattern_info *pattern)
> +{
> +	bool need_modeset;
>  
> -/**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - *
> - * arg[2]:
> - *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> - */
> +	check_test_requirements(t);
> +
> +	stop_busy_thread();
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @cur:            Cursor plane
> - * @pri:            Primary plane
> - * @spr:            Sprite plane
> - *
> - * arg[3]:
> - *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> - */
> +	need_modeset = disable_features(t);
> +	set_crtc_fbs(t);
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @cur:            Cursor plane
> - * @pri:            Primary plane
> - * @spr:            Sprite plane
> - *
> - * arg[3]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> +	if (t->screen == SCREEN_OFFSCREEN)
> +		fill_fb_region(&offscreen_fb, COLOR_OFFSCREEN_BG);
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> +	igt_display_reset(&drm.display);
> +	if (need_modeset)
> +		igt_display_commit(&drm.display);
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> - */
> +	init_blue_crc(t->format, t->tiling);
> +	if (pattern)
> +		init_crcs(t->format, t->tiling, pattern);
> +
> +	need_modeset = enable_features_for_test(t);
> +	if (need_modeset)
> +		igt_display_commit(&drm.display);
> +}
>  
> -/**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cur:            Cursor plane
> - * @pri:            Primary plane
> - * @spr:            Sprite plane
> - *
> - * arg[2]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> +static void prepare_subtest_screens(const struct test_mode *t)
> +{
> +	if (t->pipes == PIPE_DUAL)
> +		enable_both_screens_and_wait(t);
> +	else
> +		enable_prim_screen_and_wait(t);
>  
> -/**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cur:            Cursor plane
> - * @pri:            Primary plane
> - * @spr:            Sprite plane
> - *
> - * arg[2]:
> - *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> - */
> +	if (t->screen == SCREEN_PRIM) {
> +		if (t->plane == PLANE_CUR)
> +			set_region_for_test(t, &prim_mode_params.cursor);
> +		if (t->plane == PLANE_SPR)
> +			set_region_for_test(t, &prim_mode_params.sprite);
> +	}
>  
> -/**
> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> +	if (t->pipes == PIPE_DUAL && t->screen == SCREEN_SCND) {
> +		if (t->plane == PLANE_CUR)
> +			set_region_for_test(t, &scnd_mode_params.cursor);
> +		if (t->plane == PLANE_SPR)
> +			set_region_for_test(t, &scnd_mode_params.sprite);
> +	}
> +}
>  
> -/**
> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> +static void prepare_subtest(const struct test_mode *t,
> +			    struct draw_pattern_info *pattern)
> +{
> +	prepare_subtest_data(t, pattern);
> +	prepare_subtest_screens(t);
> +}
> +
> +/*
> + * rte - the basic sanity test
>   *
> - * arg[1]:
> + * METHOD
> + *   Just disable all screens, assert everything is disabled, then enable all
> + *   screens - including primary, cursor and sprite planes - and assert that
> + *   the tested feature is enabled.
>   *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> + * EXPECTED RESULTS
> + *   Blue screens and t->feature enabled.
> + *
> + * FAILURES
> + *   A failure here means that every other subtest will probably fail too. It
> + *   probably means that the Kernel is just not enabling the feature we want.
>   */
> +static void rte_subtest(const struct test_mode *t)
> +{
> +	prepare_subtest_data(t, NULL);
> +
> +	unset_all_crtcs();
> +	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
> +		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
> +
> +	if (t->pipes == PIPE_SINGLE)
> +		enable_prim_screen_and_wait(t);
> +	else
> +		enable_both_screens_and_wait(t);
> +
> +	set_region_for_test(t, &prim_mode_params.cursor);
> +	set_region_for_test(t, &prim_mode_params.sprite);
> +
> +	if (t->pipes == PIPE_DUAL) {
> +		set_region_for_test(t, &scnd_mode_params.cursor);
> +		set_region_for_test(t, &scnd_mode_params.sprite);
> +	}
> +}
> +
> +static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
> +{
> +	if (t->screen == SCREEN_PRIM)
> +		wanted_crc = crc;
> +}
> +
> +static bool op_disables_psr(const struct test_mode *t,
> +			    enum igt_draw_method method)
> +{
> +	if (method != IGT_DRAW_MMAP_GTT)
> +		return false;
> +	if (t->screen == SCREEN_PRIM)
> +		return true;
> +	/* On FBS_SHARED, even if the target is not the PSR screen
> +	 * (SCREEN_PRIM), all primary planes share the same frontbuffer, so a
> +	 * write to the second screen primary plane - or offscreen plane - will
> +	 * touch the framebuffer that's also used by the primary screen. */
> +	if (t->fbs == FBS_SHARED && t->plane == PLANE_PRI)
> +		return true;
> +
> +	return false;
> +}
>  
>  /*
>   * draw - draw a set of rectangles on the screen using the provided method
> @@ -2649,59 +3111,6 @@ static void draw_subtest(const struct test_mode *t)
>  	}
>  }
>  
> -/**
> - * SUBTEST: drrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - */
> -
>  /*
>   * multidraw - draw a set of rectangles on the screen using alternated drawing
>   *             methods
> @@ -2832,147 +3241,23 @@ static bool format_is_valid(int feature_flags,
>   */
>  static void badformat_subtest(const struct test_mode *t)
>  {
> -	bool fbc_valid = format_is_valid(FEATURE_FBC, t->format);
> -	bool psr_valid = format_is_valid(FEATURE_PSR, t->format);
> -	int assertions = ASSERT_NO_ACTION_CHANGE;
> -
> -	prepare_subtest_data(t, NULL);
> -
> -	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
> -	set_mode_for_params(&prim_mode_params);
> -
> -	wanted_crc = &blue_crcs[t->format].crc;
> -
> -	if (!fbc_valid)
> -		assertions |= ASSERT_FBC_DISABLED;
> -	if (!psr_valid)
> -		assertions |= ASSERT_PSR_DISABLED;
> -	do_assertions(assertions);
> -}
> -
> -/**
> - * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @rgb101010:      FORMAT_RGB101010
> - * @rgb565:         FORMAT_RGB565
> - *
> - * arg[2]:
> - *
> - * @blt:            Blitter
> - * @mmap-wc:        MMAP-WC
> - * @render:         Render
> - */
> -
> -/**
> - * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @rgb101010:      FORMAT_RGB101010
> - * @rgb565:         FORMAT_RGB565
> - *
> - * arg[2]:
> - *
> - * @mmap-cpu:       MMAP-CPU
> - * @mmap-gtt:       MMAP-GTT
> - * @pwrite:         PWRITE
> - */
> +	bool fbc_valid = format_is_valid(FEATURE_FBC, t->format);
> +	bool psr_valid = format_is_valid(FEATURE_PSR, t->format);
> +	int assertions = ASSERT_NO_ACTION_CHANGE;
> +
> +	prepare_subtest_data(t, NULL);
> +
> +	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
> +	set_mode_for_params(&prim_mode_params);
> +
> +	wanted_crc = &blue_crcs[t->format].crc;
> +
> +	if (!fbc_valid)
> +		assertions |= ASSERT_FBC_DISABLED;
> +	if (!psr_valid)
> +		assertions |= ASSERT_PSR_DISABLED;
> +	do_assertions(assertions);
> +}
>  
>  /*
>   * format_draw - test pixel formats that are not FORMAT_DEFAULT
> @@ -3017,57 +3302,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>  	}
>  }
>  
> -/**
> - * SUBTEST: drrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC & PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /*
>   * slow_draw - sleep a little bit between drawing operations
>   *
> @@ -3174,132 +3408,6 @@ static void page_flip_for_params(struct modeset_params *params,
>  	}
>  }
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - *
> - * arg[3]:
> - *
> - * @ms:             Modeset
> - * @pg:             Page flip
> - * @pl:             Plane change
> - */
> -
> -/**
> - * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - *
> - * arg[2]:
> - *
> - * @ms:             Modeset
> - * @pg:             Page flip
> - * @pl:             Plane change
> - */
> -
>  /*
>   * flip - just exercise page flips with the patterns we have
>   *
> @@ -3334,68 +3442,31 @@ static void flip_subtest(const struct test_mode *t)
>  		bg_color = COLOR_SCND_BG;
>  		break;
>  	default:
> -		igt_assert(false);
> -	}
> -
> -	prepare_subtest(t, pattern);
> -
> -	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
> -		  t->tiling, t->plane, &fb2);
> -	fill_fb(&fb2, bg_color);
> -	orig_fb = params->primary.fb;
> -
> -	for (r = 0; r < pattern->n_rects; r++) {
> -		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
> -
> -		if (r != 0)
> -			draw_rect(pattern, &params->primary, t->method, r - 1);
> -		draw_rect(pattern, &params->primary, t->method, r);
> -		update_wanted_crc(t, &pattern->crcs[t->format][r]);
> -
> -		page_flip_for_params(params, t->flip);
> -
> -		do_assertions(assertions);
> -	}
> -
> -	igt_remove_fb(drm.fd, &fb2);
> -}
> -
> -/**
> - * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - */
> +		igt_assert(false);
> +	}
> +
> +	prepare_subtest(t, pattern);
> +
> +	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
> +		  t->tiling, t->plane, &fb2);
> +	fill_fb(&fb2, bg_color);
> +	orig_fb = params->primary.fb;
> +
> +	for (r = 0; r < pattern->n_rects; r++) {
> +		params->primary.fb = (r % 2 == 0) ? &fb2 : orig_fb;
> +
> +		if (r != 0)
> +			draw_rect(pattern, &params->primary, t->method, r - 1);
> +		draw_rect(pattern, &params->primary, t->method, r);
> +		update_wanted_crc(t, &pattern->crcs[t->format][r]);
> +
> +		page_flip_for_params(params, t->flip);
> +
> +		do_assertions(assertions);
> +	}
> +
> +	igt_remove_fb(drm.fd, &fb2);
> +}
>  
>  /*
>   * fliptrack - check if the hardware tracking works after page flips
> @@ -3445,120 +3516,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
>  	igt_remove_fb(drm.fd, &fb2);
>  }
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @spr:            Sprite plane
> - * @cur:            Cursor plane
> - */
> -
> -/**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @spr:            Sprite plane
> - * @cur:            Cursor plane
> - */
> -
>  /*
>   * move - just move the sprite or cursor around
>   *
> @@ -3608,123 +3565,9 @@ static void move_subtest(const struct test_mode *t)
>  		if (r+1 == pattern->n_rects && !repeat) {
>  			repeat = true;
>  			r--;
> -		}
> -	}
> -}
> -
> -/**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - *
> - * arg[2]:
> - *
> - * @spr:            Sprite plane
> - * @cur:            Cursor plane
> - */
> -
> -/**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @spr:            Sprite plane
> - * @cur:            Cursor plane
> - */
> +		}
> +	}
> +}
>  
>  /*
>   * onoff - just enable and disable the sprite or cursor plane a few times
> @@ -3785,108 +3628,6 @@ static bool prim_plane_disabled(void)
>  	return !prim_mode_params.primary.plane->values[IGT_PLANE_FB_ID];
>  }
>  
> -/**
> - * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1].values:   1, 2
> - */
> -
>  /*
>   * fullscreen_plane - put a fullscreen plane covering the whole screen
>   *
> @@ -3948,62 +3689,6 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
>  	igt_remove_fb(drm.fd, &fullscreen_fb);
>  }
>  
> -/**
> - * SUBTEST: drrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @indfb:          Individual fb
> - * @shrfb:          Shared fb
> - */
> -
>  /*
>   * scaledprimary - try different primary plane scaling strategies
>   *
> @@ -4064,101 +3749,51 @@ static void scaledprimary_subtest(const struct test_mode *t)
>  	do_assertions(DONT_ASSERT_CRC);
>  
>  	/* Source upscaling. */
> -	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> -	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC);
> -
> -	/* Destination doesn't fill the entire CRTC, no scaling. */
> -	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> -	igt_plane_set_position(reg->plane,
> -			       params->mode.hdisplay / 4,
> -			       params->mode.vdisplay / 4);
> -	igt_plane_set_size(reg->plane,
> -			   params->mode.hdisplay / 2,
> -			   params->mode.vdisplay / 2);
> -	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC);
> -
> -	/* Destination doesn't fill the entire CRTC, upscaling. */
> -	igt_fb_set_position(&new_fb, reg->plane,
> -			    reg->x + reg->w / 4, reg->y + src_y_upscale);
> -	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> -	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC);
> -
> -	/*
> -	 * On gen >= 9 HW, FBC is not enabled on a plane with a Y offset
> -	 * that isn't divisible by 4, because it causes FIFO underruns.
> -	 *
> -	 * Check that FBC is disabled.
> -	 */
> -	igt_fb_set_position(&new_fb, reg->plane,
> -			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
> -	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> -	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(DONT_ASSERT_CRC | (gen >= 9 ? ASSERT_FBC_DISABLED : 0));
> -
> -	/* Back to the good and old blue fb. */
> -	igt_plane_set_fb(reg->plane, old_fb);
> -	igt_plane_set_position(params->primary.plane, 0, 0);
> -	igt_plane_set_size(reg->plane, params->mode.hdisplay, params->mode.vdisplay);
> -	igt_fb_set_position(reg->fb, reg->plane, reg->x, reg->y);
> -	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
> -	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> -	do_assertions(0);
> -
> -	igt_remove_fb(drm.fd, &new_fb);
> -}
> -
> -/**
> - * SUBTEST: drrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr, scaling
> - * Mega feature: General Display Features
> - */
> +	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> +	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> +	do_assertions(DONT_ASSERT_CRC);
> +
> +	/* Destination doesn't fill the entire CRTC, no scaling. */
> +	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> +	igt_plane_set_position(reg->plane,
> +			       params->mode.hdisplay / 4,
> +			       params->mode.vdisplay / 4);
> +	igt_plane_set_size(reg->plane,
> +			   params->mode.hdisplay / 2,
> +			   params->mode.vdisplay / 2);
> +	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> +	do_assertions(DONT_ASSERT_CRC);
> +
> +	/* Destination doesn't fill the entire CRTC, upscaling. */
> +	igt_fb_set_position(&new_fb, reg->plane,
> +			    reg->x + reg->w / 4, reg->y + src_y_upscale);
> +	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> +	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> +	do_assertions(DONT_ASSERT_CRC);
> +
> +	/*
> +	 * On gen >= 9 HW, FBC is not enabled on a plane with a Y offset
> +	 * that isn't divisible by 4, because it causes FIFO underruns.
> +	 *
> +	 * Check that FBC is disabled.
> +	 */
> +	igt_fb_set_position(&new_fb, reg->plane,
> +			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
> +	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> +	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> +	do_assertions(DONT_ASSERT_CRC | (gen >= 9 ? ASSERT_FBC_DISABLED : 0));
> +
> +	/* Back to the good and old blue fb. */
> +	igt_plane_set_fb(reg->plane, old_fb);
> +	igt_plane_set_position(params->primary.plane, 0, 0);
> +	igt_plane_set_size(reg->plane, params->mode.hdisplay, params->mode.vdisplay);
> +	igt_fb_set_position(reg->fb, reg->plane, reg->x, reg->y);
> +	igt_fb_set_size(reg->fb, reg->plane, reg->w, reg->h);
> +	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> +	do_assertions(0);
> +
> +	igt_remove_fb(drm.fd, &new_fb);
> +}
>  
>  /**
>   * modesetfrombusy - modeset from a busy buffer to a non-busy buffer
> @@ -4203,57 +3838,6 @@ static void modesetfrombusy_subtest(const struct test_mode *t)
>  	igt_remove_fb(drm.fd, &fb2);
>  }
>  
> -/**
> - * SUBTEST: drrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbt, psr, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbt, psr, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /**
>   * suspend - make sure suspend/resume keeps us on the same state
>   *
> @@ -4286,57 +3870,6 @@ static void suspend_subtest(const struct test_mode *t)
>  	do_assertions(0);
>  }
>  
> -/**
> - * SUBTEST: drrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbc-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: psrdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /**
>   * farfromfence - test drawing as far from the fence start as possible
>   *
> @@ -4433,36 +3966,6 @@ static void try_invalid_strides(void)
>  	gem_close(drm.fd, gem_handle);
>  }
>  
> -/**
> - * SUBTEST: fbc-badstride
> - * Description: Try to use buffers with strides that are not supported
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-badstride
> - * Description: Try to use buffers with strides that are not supported
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-badstride
> - * Description: Try to use buffers with strides that are not supported
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-badstride
> - * Description: Try to use buffers with strides that are not supported
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /**
>   * badstride - try to use buffers with strides that are not supported
>   *
> @@ -4531,36 +4034,6 @@ static void badstride_subtest(const struct test_mode *t)
>  	igt_remove_fb(drm.fd, &wide_fb);
>  }
>  
> -/**
> - * SUBTEST: fbc-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /**
>   * stridechange - change the frontbuffer stride by doing a modeset
>   *
> @@ -4625,46 +4098,6 @@ static void stridechange_subtest(const struct test_mode *t)
>  	do_assertions(rc ? 0 : DONT_ASSERT_FBC_STATUS);
>  }
>  
> -/**
> - * SUBTEST: fbc-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, psr, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: fbcpsrdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - * Driver requirement: i915, xe
> - * Functionality: drrs, fbc, fbt, psr, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4:              4 tiling
> - * @linear:         Linear tiling
> - * @y:              Y tiling
> - */
> -
>  /**
>   * tiling_disable_fbc_subtest - Check if tiling is unsupported by FBC
>   *
> @@ -4714,15 +4147,6 @@ static void tiling_disable_fbc_subtest(const struct test_mode *t)
>  	igt_remove_fb(drm.fd, &new_fb);
>  }
>  
> -/**
> - * SUBTEST: basic
> - * Description: Do some basic operations regardless of which features are enabled
> - * Driver requirement: i915, xe
> - * Functionality: fbt
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /*
>   * basic - do some basic operations regardless of which features are enabled
>   *
> diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
> index 877a6799a..6d11ecd79 100644
> --- a/tests/intel/kms_legacy_colorkey.c
> +++ b/tests/intel/kms_legacy_colorkey.c
> @@ -21,27 +21,24 @@
>   * IN THE SOFTWARE.
>   */
>  
> -#include "igt.h"
> -#include <errno.h>
> -
>  /**
>   * TEST: kms legacy colorkey
>   * Category: Display
>   * Description: Test to check the legacy set colorkey ioctl on sprite planes.
> - *
> - * SUBTEST: basic
> - * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
>   * Driver requirement: i915
>   * Functionality: plane, xorg_xv
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +#include <errno.h>
> +
> +/**
> + * SUBTEST: basic
> + * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
>   *
>   * SUBTEST: invalid-plane
>   * Description: Check invalid plane id's, zero and outrange
> - * Driver requirement: i915
> - * Functionality: plane, xorg_xv
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
> index 17d72ee32..34c9fafd5 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -24,6 +24,16 @@
>   *    Tiago Vignatti <tiago.vignatti at intel.com>
>   */
>  
> +/**
> + * TEST: kms mmap write crc
> + * Category: Display
> + * Description: Use the display CRC support to validate mmap write to an already
> + *              uncached future scanout buffer.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core, kms_gem_interop
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include <errno.h>
>  #include <limits.h>
>  #include <stdbool.h>
> @@ -37,18 +47,10 @@
>  #include "intel_chipset.h"
>  #include "ioctl_wrappers.h"
>  #include "igt_aux.h"
> +
>  /**
> - * TEST: kms mmap write crc
> - * Category: Display
> - * Description: Use the display CRC support to validate mmap write to an already
> - *              uncached future scanout buffer.
> - *
>   * SUBTEST: main
>   * Description: Tests that caching mode has become UC/WT and flushed using mmap write
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION(
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
> index 386f3003a..3d7e5a5af 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -24,53 +24,39 @@
>   *   Ander Conselvan de Oliveira <ander.conselvan.de.oliveira@intel.com>
>   */
>  
> -#include "igt.h"
>  /**
>   * TEST: kms pipe b c ivb
>   * Category: Display
>   * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
>   *              setting different combinations of modes for pipes B and C.
> - *
> - * SUBTEST: disable-pipe-B-enable-pipe-C
> - * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
> - *              and then setting mode on pipe-C.
>   * Driver requirement: i915
>   * Functionality: kms_core, obsolete
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: disable-pipe-B-enable-pipe-C
> + * Description: Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B
> + *              and then setting mode on pipe-C.
>   *
>   * SUBTEST: enable-pipe-C-while-B-has-3-lanes
>   * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C
>   *              while pipe-B has 3-lanes
> - * Driver requirement: i915
> - * Functionality: kms_core, obsolete
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: from-pipe-C-to-B-with-3-lanes
>   * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
>   *              with 3 lanes from pipe-C.
> - * Driver requirement: i915
> - * Functionality: kms_core, obsolete
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: pipe-B-double-modeset-then-modeset-pipe-C
>   * Description: Tests pipe-B and pipe-C interactions in IVB by enabling two
>   *              different modes on pipe-B and then a single mode on pipe-C.
> - * Driver requirement: i915
> - * Functionality: kms_core, obsolete
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: pipe-B-dpms-off-modeset-pipe-C
>   * Description: Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B
>   *              with mode that requires 3 lanes and then enabling pipe-c with
>   *              dpms off/on pipe-B.
> - * Driver requirement: i915
> - * Functionality: kms_core, obsolete
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION(
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 9bfbf365a..1eddab7fd 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -25,6 +25,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms pm backlight
> + * Category: Display
> + * Description: Basic backlight sysfs test
> + * Driver requirement: i915, xe
> + * Functionality: backlight
> + * Mega feature: Display Power Management
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <limits.h>
>  #include <sys/types.h>
> @@ -36,45 +45,24 @@
>  #include <time.h>
>  #include "igt_device.h"
>  #include "igt_device_scan.h"
> +
>  /**
> - * TEST: kms pm backlight
> - * Category: Display
> - * Description: Basic backlight sysfs test
> - *
>   * SUBTEST: bad-brightness
>   * Description: Test the bad brightness.
> - * Driver requirement: i915, xe
> - * Functionality: backlight
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: basic-brightness
>   * Description: Test the basic brightness.
> - * Driver requirement: i915, xe
> - * Functionality: backlight
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: fade
>   * Description: Test basic fade.
> - * Driver requirement: i915, xe
> - * Functionality: backlight
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: fade-with-dpms
>   * Description: Test the fade with DPMS.
> - * Driver requirement: i915, xe
>   * Functionality: dpms, backlight
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: fade-with-suspend
>   * Description: Test the fade with suspend.
> - * Driver requirement: i915, xe
>   * Functionality: backlight, suspend
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   */
>  
>  struct context {
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 0a9ed40a3..e78acaf91 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -22,6 +22,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms pm dc
> + * Category: Display
> + * Description: Tests to validate display power DC states.
> + * Driver requirement: i915, xe
> + * Functionality: dpms, pm_dc
> + * Mega feature: Display Power Management
> + * Test category: functionality test
> + */
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <stdbool.h>
> @@ -39,62 +48,33 @@
>  #include "xe/xe_query.h"
>  
>  /**
> - * TEST: kms pm dc
> - * Category: Display
> - * Description: Tests to validate display power DC states.
> - *
>   * SUBTEST: dc3co-vpb-simulation
>   * Description: Make sure that system enters DC3CO when PSR2 is active and system
>   *              is in SLEEP state
> - * Driver requirement: i915, xe
>   * Functionality: dc3co, pm_dc, psr2
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc5-dpms
>   * Description: Validate display engine entry to DC5 state while all connectors's
>   *              DPMS property set to OFF
> - * Driver requirement: i915, xe
> - * Functionality: dpms, pm_dc
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc5-dpms-negative
>   * Description: Validate negative scenario of DC5 display engine entry to DC5 state
>   *              while all connectors's DPMS property set to ON
> - * Driver requirement: i915, xe
> - * Functionality: dpms, pm_dc
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc5-psr
>   * Description: This test validates display engine entry to DC5 state while PSR is active
> - * Driver requirement: i915, xe
>   * Functionality: pm_dc, psr
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc6-dpms
>   * Description: Validate display engine entry to DC6 state while all connectors's
>   *              DPMS property set to OFF
> - * Driver requirement: i915, xe
> - * Functionality: dpms, pm_dc
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc6-psr
>   * Description: This test validates display engine entry to DC6 state while PSR is active
> - * Driver requirement: i915, xe
>   * Functionality: pm_dc, psr
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: dc9-dpms
>   * Description: This test validates display engine entry to DC9 state
> - * Driver requirement: i915, xe
> - * Functionality: dpms, pm_dc
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   */
>  
>  /* DC State Flags */
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 65516438a..62fbee43a 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -24,6 +24,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms pm lpsp
> + * Category: Display
> + * Description: These tests validates display Low Power Single Pipe configurations
> + * Driver requirement: i915, xe
> + * Functionality: pm_lpsp
> + * Mega feature: Display Power Management
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "igt_kmod.h"
>  #include "igt_pm.h"
> @@ -32,24 +41,13 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <unistd.h>
> +
>  /**
> - * TEST: kms pm lpsp
> - * Description: These tests validates display Low Power Single Pipe configurations
> - * Category: Display
> - *
>   * SUBTEST: kms-lpsp
>   * Description: This test validates lpsp on all connected outputs on low power PIPE_A
> - * Driver requirement: i915, xe
> - * Functionality: pm_lpsp
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   *
>   * SUBTEST: screens-disabled
>   * Description: This test validates lpsp while all crtc are disabled
> - * Driver requirement: i915
> - * Functionality: pm_lpsp
> - * Mega feature: Display Power Management
> - * Test category: functionality test
>   */
>  
>  #define MAX_SINK_LPSP_INFO_BUF_LEN	4096
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index ffecc5222..8ab14dabb 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -26,6 +26,9 @@
>   * TEST: kms psr
>   * Category: Display
>   * Description: Tests behaviour of PSR & PSR2
> + * Driver requirement: i915, xe
> + * Mega feature: PSR
> + * Test category: functionality test
>   */
>  
>  #include "igt.h"
> @@ -41,18 +44,12 @@
>  /**
>   * SUBTEST: basic
>   * Description: Basic check for psr if it is detecting changes made in planes
> - * Driver requirement: i915, xe
>   * Functionality: psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: %s_%s
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on %arg[1]
> - * Driver requirement: i915
>   * Functionality: kms_core, plane, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -70,18 +67,12 @@
>   * SUBTEST: sprite_plane_move
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on sprite planes
> - * Driver requirement: i915, xe
>   * Functionality: plane, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: %s_%s
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on %arg[1] planes
> - * Driver requirement: i915, xe
>   * Functionality: kms_core, plane, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -99,10 +90,7 @@
>   * SUBTEST: primary_%s
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on %arg[1] planes
> - * Driver requirement: i915, xe
>   * Functionality: kms_core, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -114,63 +102,39 @@
>   * SUBTEST: dpms
>   * Description: Check if psr is detecting changes when rendering operation is
>   *              performed  with dpms enabled or disabled
> - * Driver requirement: i915, xe
>   * Functionality: dpms, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: no_drrs
>   * Description: Check if psr is detecting changes when drrs is disabled
> - * Driver requirement: i915, xe
>   * Functionality: drrs, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: suspend
>   * Description: Check if psr is detecting changes when plane operation
>   *              is performed with suspend resume cycles
> - * Driver requirement: i915, xe
>   * Functionality: psr, suspend
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_dpms
>   * Description: Check if psr is detecting changes when rendering operation
>   *              is performed  with dpms enabled or disabled
> - * Driver requirement: i915, xe
>   * Functionality: dpms, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_no_drrs
>   * Description: Check if psr is detecting changes when drrs is disabled
> - * Driver requirement: i915, xe
>   * Functionality: drrs, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_suspend
>   * Description: Check if psr is detecting changes when plane operation is
>   *              performed with suspend resume cycles
> - * Driver requirement: i915, xe
>   * Functionality: psr, psr2, suspend
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_basic
>   * Description: Basic check for psr if it is detecting changes made in planes
> - * Driver requirement: i915, xe
>   * Functionality: psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_%s_%s
>   * Description: Check if psr2 is detecting memory mapping, rendering and plane
>   *              operations performed on %arg[1] planes
> - * Driver requirement: i915
>   * Functionality: kms_core, plane, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -188,18 +152,12 @@
>   * SUBTEST: psr2_primary_page_flip
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on primary planes
> - * Driver requirement: i915, xe
>   * Functionality: plane, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2_primary_%s
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on primary planes
> - * Driver requirement: i915, xe
>   * Functionality: kms_core, plane, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -211,10 +169,7 @@
>   * SUBTEST: psr2_%s_%s
>   * Description: Check if psr is detecting memory mapping, rendering and plane
>   *              operations performed on %arg[1] planes
> - * Driver requirement: i915, xe
>   * Functionality: kms_core, plane, psr, psr2
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -229,6 +184,23 @@
>   * @plane_move:         Move plane position
>   */
>  
> +/**
> + * SUBTEST: cursor_plane_move
> + * Description: Check if psr is detecting the plane operations performed on
> + *		cursor planes
> + * Functionality: psr
> + *
> + * SUBTEST: primary_page_flip
> + * Description: Check if psr is detecting page-flipping operations performed
> + *		on primary planes
> + * Functionality: psr
> + *
> + * SUBTEST: sprite_plane_onoff
> + * Description: Check if psr is detecting the plane operations performed on
> + *		sprite planes
> + * Functionality: psr
> + */
> +
>  enum operations {
>  	PAGE_FLIP,
>  	MMAP_GTT,
> @@ -501,32 +473,6 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
>  	igt_assert(ret == 0 || ret == -ENOSYS);
>  }
>  
> -/**
> - * SUBTEST: cursor_plane_move
> - * Description: Check if psr is detecting the plane operations performed on
> - *		cursor planes
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: psr
> - * Mega feature: PSR
> - *
> - * SUBTEST: primary_page_flip
> - * Description: Check if psr is detecting page-flipping operations performed
> - *		on primary planes
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: psr
> - * Mega feature: PSR
> - *
> - * SUBTEST: sprite_plane_onoff
> - * Description: Check if psr is detecting the plane operations performed on
> - *		sprite planes
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: psr
> - * Mega feature: PSR
> - */
> -
>  static void run_test(data_t *data)
>  {
>  	uint32_t handle = data->fb_white.gem_handle;
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index d7a746211..01bf6e4bd 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -22,90 +22,62 @@
>   *
>   */
>  
> -#include "igt.h"
> -#include "igt_sysfs.h"
> -#include "igt_psr.h"
> -#include "kms_dsc_helper.h"
> -#include <errno.h>
> -#include <stdbool.h>
> -#include <stdio.h>
> -#include <string.h>
>  /**
>   * TEST: kms psr2 sf
>   * Category: Display
>   * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
>   *              areas
> - *
> - * SUBTEST: %s-plane-move-continuous-%s
> - * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
> - *              visible area (no update)
>   * Driver requirement: i915, xe
>   * Functionality: plane, psr2, selective_fetch
>   * Mega feature: PSR
>   * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cursor:               Cursor
> - * @overlay:              Overlay
> - *
> - * arg[2]:
> - *
> - * @exceed-fully-sf:      exceeding fully
> - * @exceed-sf:            exceeding paritally
> - * @sf:                   default
>   */
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "igt_psr.h"
> +#include "kms_dsc_helper.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
>  
>  /**
>   * SUBTEST: cursor-plane-update-sf
>   * Description: Test that selective fetch works on cursor plane
> - * Driver requirement: i915, xe
> - * Functionality: cursor, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: overlay-plane-update-continuous-sf
>   * Description: Test that selective fetch works on overlay plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: overlay-plane-update-sf-dmg-area
>   * Description: Test that selective fetch works on overlay plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: overlay-primary-update-sf-dmg-area
>   * Description: Test that selective fetch works on primary plane with blended
>   *              overlay plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: plane-move-sf-dmg-area
>   * Description: Test that selective fetch works on moving overlay plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: primary-plane-update-sf-dmg-area
>   * Description: Test that selective fetch works on primary plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
>   * Description: Test that selective fetch works on primary plane with big fb
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
> - * Mega feature: PSR
> - * Test category: functionality test
> + *
> + * SUBTEST: %s-plane-move-continuous-%s
> + * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
> + *              visible area (no update)
> + *
> + * arg[1]:
> + *
> + * @cursor:               Cursor
> + * @overlay:              Overlay
> + *
> + * arg[2]:
> + *
> + * @exceed-fully-sf:      exceeding fully
> + * @exceed-sf:            exceeding paritally
> + * @sf:                   default
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 321144d6b..89d3127dc 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -22,6 +22,14 @@
>   *
>   */
>  
> +/**
> + * TEST: kms psr2 su
> + * Category: Display
> + * Description: Test PSR2 selective update
> + * Driver requirement: i915, xe
> + * Mega feature: PSR
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
> @@ -30,24 +38,15 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <sys/timerfd.h>
> +
>  /**
> - * TEST: kms psr2 su
> - * Category: Display
> - * Description: Test PSR2 selective update
> - *
>   * SUBTEST: frontbuffer-XRGB8888
>   * Description: Test that selective update works when screen changes
> - * Driver requirement: i915, xe
>   * Functionality: fbt, psr2, selective_update
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: page_flip-%s
>   * Description: Test the selective update with %arg[1] when screen changes
> - * Driver requirement: i915, xe
>   * Functionality: pixel-format, psr2, selective_update
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
> index b6759eece..ac1cccfab 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -1,3 +1,12 @@
> +
> +/**
> + * TEST: kms psr stress test
> + * Category: Display
> + * Driver requirement: i915, xe
> + * Functionality: plane, psr
> + * Mega feature: PSR
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
> @@ -7,25 +16,15 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <sys/timerfd.h>
> +
>  /**
> - * TEST: kms psr stress test
> - * Category: Display
> - *
>   * SUBTEST: flip-primary-invalidate-overlay
>   * Description: Mix page flips in primary plane and frontbuffer writes to overlay
>   *              plane and check for warnings, underruns or PSR state changes
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: invalidate-primary-flip-overlay
>   * Description: Mix frontbuffer writes to the primary plane and page flips in the
>   *              overlay plane and check for warnings, underruns or PSR state changes
> - * Driver requirement: i915, xe
> - * Functionality: plane, psr
> - * Mega feature: PSR
> - * Test category: functionality test
>   */
>  
>  #define INVALIDATES_PER_SEC 15
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index 50df18aa3..72ea2df39 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -22,6 +22,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms pwrite crc
> + * Category: Display
> + * Description: Test to validate pwrite buffer using the display CRC
> + * Driver requirement: i915
> + * Functionality: crc, kms_core, kms_gem_interop
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <errno.h>
>  #include <limits.h>
> @@ -30,17 +39,9 @@
>  #include <string.h>
>  
>  /**
> - * TEST: kms pwrite crc
> - * Category: Display
> - * Description: Test to validate pwrite buffer using the display CRC
> - *
>   * SUBTEST:
>   * Description: Use the display CRC support to validate pwrite to an already
>   *              uncached future scanout buffer.
> - * Driver requirement: i915
> - * Functionality: crc, kms_core, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION(
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index fa73d0cc6..567115065 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -22,20 +22,22 @@
>   *
>   */
>  
> -#include "igt.h"
> -#include "xe/xe_query.h"
>  /**
>   * TEST: kms 3d
>   * Category: Display
>   * Description: Tests 3D mode setting.
> - *
> - * SUBTEST:
> - * Description: Tests 3D mode setting.
>   * Driver requirement: i915, xe
>   * Functionality: stereoscopic
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
> +#include "igt.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * SUBTEST:
> + * Description: Tests 3D mode setting.
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
>  
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index fc16b8814..1befdc2e3 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -29,6 +29,10 @@
>   * TEST: kms addfb basic
>   * Category: Display
>   * Description: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & DRM_IOCTL_MODE_RMFB.
> + * Driver requirement: i915, xe
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  
>  #include "igt.h"
> @@ -50,58 +54,27 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> -static uint32_t gem_bo;
> -static uint32_t gem_bo_small;
> -static igt_display_t display;
> -
> -static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
> -{
> -	int err;
> -
> -	err = 0;
> -	if (igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB, arg))
> -		err = -errno;
> -
> -	errno = 0;
> -	return err;
> -}
> -
>  /**
> + * SUBTEST: master-rmfb
> + * Description: Check that only master can rmfb
> + *
>   * SUBTEST: unused-%s
>   * Description: Test that addfb2 call fails correctly for unused %arg[1]
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
>   *
>   * SUBTEST: unused-modifier
>   * Description: Test that addfb2 call fails correctly for unused modifier
> - * Driver requirement: i915, xe
> - * Test category: functionality test
>   * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
>   *
>   * SUBTEST: clobberred-modifier
>   * Description: Check if addfb2 call works for clobbered modifier
> - * Driver requirement: i915
>   * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid-smem-bo-on-discrete
>   * Description: Check if addfb2 with a system memory gem object fails correctly
>   *              if device requires local memory framebuffers
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: legacy-format
>   * Description: Check if addfb2 call works for legacy formats
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -109,6 +82,133 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
>   * @pitches:      Pitches
>   * @offsets:      Offsets
>   */
> +
> +/**
> + * SUBTEST: no-handle
> + * Description: Test that addfb2 call fails correctly without handle
> + *
> + * SUBTEST: basic
> + * Description: Check if addfb2 call works with given handle
> + *
> + * SUBTEST: bad-pitch-%i
> + * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
> + *
> + * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
> + */
> +
> +/**
> + * SUBTEST: basic-%s-tiled-legacy
> + * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: framebuffer-vs-set-tiling
> + * Description: Check if addfb2 call works for x and y tiling
> + * Driver requirement: i915
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: tile-pitch-mismatch
> + * Description: Test that addfb2 call fails correctly for pitches mismatch
> + * Functionality: kms_gem_interop, tiling
> + *
> + * arg[1]:
> + *
> + * @x:        x-tiling
> + * @y:        y-tiling
> + */
> +
> +/**
> + * SUBTEST: size-max
> + * Description: Check if addfb2 call works with max size of buffer object
> + *
> + * SUBTEST: too-wide
> + * Description: Test that addfb2 call fails correctly with increased width of fb
> + *
> + * SUBTEST: too-high
> + * Description: Test that addfb2 call fails correctly with increased height of fb
> + *
> + * SUBTEST: bo-too-small
> + * Description: Test that addfb2 call fails correctly with small size of buffer object
> + *
> + * SUBTEST: small-bo
> + * Description: Check if addfb2 call works for given height
> + *
> + * SUBTEST: bo-too-small-due-to-tiling
> + * Description: Test that addfb2 call fails correctly with small buffer object
> + *              after changing tile
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-modifier-no-flag
> + * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-bad-modifier
> + * Description: Test that addfb2 call fails correctly for irrelevant modifier
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-x-tiled-mismatch-legacy
> + * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-x-tiled-legacy
> + * Description: Check if addfb2 call works for x-tiling
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-framebuffer-vs-set-tiling
> + * Description: Check if addfb2 call works for relevant combination of tiling and fbs
> + * Driver requirement: i915
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-4-tiled
> + * Description: Check if addfb2 call works for tiling-4
> + * Functionality: kms_gem_interop, tiling
> + */
> +
> +/**
> + * SUBTEST: addfb25-y-tiled-%s
> + * Description: Check if addfb2 call works for y-tiling %arg[1]
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: addfb25-yf-tiled-legacy
> + * Description: Check if addfb2 call works for yf-tiling
> + * Functionality: kms_gem_interop, tiling
> + *
> + * arg[1]:
> + *
> + * @legacy:               with default size
> + * @small-legacy:         with given size & modifier
> + */
> +
> +/**
> + * SUBTEST: invalid-%s-%s
> + * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
> + *
> + * arg[1]:
> + *
> + * @get:           get-properties
> + * @set:           set-properties
> + *
> + * arg[2]:
> + *
> + * @prop:          fb mode
> + * @prop-any:      invalid
> + */
> +
> +static uint32_t gem_bo;
> +static uint32_t gem_bo_small;
> +static igt_display_t display;
> +
> +static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
> +{
> +	int err;
> +
> +	err = 0;
> +	if (igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB, arg))
> +		err = -errno;
> +
> +	errno = 0;
> +	return err;
> +}
> +
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -322,30 +422,6 @@ static void invalid_tests(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: no-handle
> - * Description: Test that addfb2 call fails correctly without handle
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: basic
> - * Description: Check if addfb2 call works with given handle
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: bad-pitch-%i
> - * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
> - */
>  static void pitch_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -393,33 +469,6 @@ static void pitch_tests(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  
> -/**
> - * SUBTEST: basic-%s-tiled-legacy
> - * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: framebuffer-vs-set-tiling
> - * Description: Check if addfb2 call works for x and y tiling
> - * Driver requirement: i915
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: tile-pitch-mismatch
> - * Description: Test that addfb2 call fails correctly for pitches mismatch
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * arg[1]:
> - *
> - * @x:        x-tiling
> - * @y:        y-tiling
> - */
>  static void tiling_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -506,50 +555,6 @@ static void tiling_tests(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: size-max
> - * Description: Check if addfb2 call works with max size of buffer object
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: too-wide
> - * Description: Test that addfb2 call fails correctly with increased width of fb
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: too-high
> - * Description: Test that addfb2 call fails correctly with increased height of fb
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: bo-too-small
> - * Description: Test that addfb2 call fails correctly with small size of buffer object
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: small-bo
> - * Description: Check if addfb2 call works for given height
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: bo-too-small-due-to-tiling
> - * Description: Test that addfb2 call fails correctly with small buffer object
> - *              after changing tile
> - * Driver requirement: i915
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - */
>  static void size_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -665,42 +670,6 @@ static void size_tests(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: addfb25-modifier-no-flag
> - * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: addfb25-bad-modifier
> - * Description: Test that addfb2 call fails correctly for irrelevant modifier
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: addfb25-x-tiled-mismatch-legacy
> - * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: addfb25-x-tiled-legacy
> - * Description: Check if addfb2 call works for x-tiling
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: addfb25-framebuffer-vs-set-tiling
> - * Description: Check if addfb2 call works for relevant combination of tiling and fbs
> - * Driver requirement: i915
> - * Test category: functionality test
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - */
>  static void addfb25_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -786,26 +755,6 @@ static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
>  					  f->modifier[0]) ? 0 : -1;
>  }
>  
> -/**
> - * SUBTEST: addfb25-y-tiled-%s
> - * Description: Check if addfb2 call works for y-tiling %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: addfb25-yf-tiled-legacy
> - * Description: Check if addfb2 call works for yf-tiling
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @legacy:               with default size
> - * @small-legacy:         with given size & modifier
> - */
>  static void addfb25_ytile(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -872,14 +821,6 @@ static void addfb25_ytile(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: addfb25-4-tiled
> - * Description: Check if addfb2 call works for tiling-4
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void addfb25_4tile(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -918,24 +859,6 @@ static void addfb25_4tile(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  
> -/**
> - * SUBTEST: invalid-%s-%s
> - * Description: Test that %arg[1] ioctl call fails correctly for %arg[2] object
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - *
> - * arg[1]:
> - *
> - * @get:           get-properties
> - * @set:           set-properties
> - *
> - * arg[2]:
> - *
> - * @prop:          fb mode
> - * @prop-any:      invalid
> - */
>  static void prop_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -1001,14 +924,6 @@ static void prop_tests(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: master-rmfb
> - * Description: Check that only master can rmfb
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void master_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6c97558be..fa9cef937 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -29,6 +29,10 @@
>   * TEST: kms async flips
>   * Category: Display
>   * Description: Test asynchronous page flips.
> + * Driver requirement: i915, xe
> + * Functionality: async_flips, vblank
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "igt_aux.h"
> @@ -37,6 +41,32 @@
>  #include <sys/time.h>
>  #include <poll.h>
>  
> +/**
> + * SUBTEST: alternate-sync-async-flip
> + * Description: Verify the async flip functionality and the fps during async flips
> + *              Alternate between sync and async flips
> + *
> + * SUBTEST: async-flip-with-page-flip-events
> + * Description: Verify the async flip functionality and the fps during async flips
> + *              Wait for page flip events in between successive asynchronous flips
> + *
> + * SUBTEST: crc
> + * Description: Use CRC to verify async flip scans out the correct framebuffer
> + * Functionality: async_flips, crc, vblank
> + *
> + * SUBTEST: invalid-async-flip
> + * Description: Negative case to verify if changes in fb are rejected from kernel as expected
> + *
> + * SUBTEST: test-time-stamp
> + * Description: Verify the async flip functionality and the fps during async flips
> + *              Verify that the async flip timestamp does not coincide with either
> + *              previous or next vblank
> + *
> + * SUBTEST: test-cursor
> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
> + * Functionality: async_flips, cursor, vblank
> + */
> +
>  #define CURSOR_POS 128
>  
>  /*
> @@ -203,23 +233,6 @@ static void test_init_fbs(data_t *data)
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  }
>  
> -/**
> - * SUBTEST: alternate-sync-async-flip
> - * Description: Verify the async flip functionality and the fps during async flips
> - *              Alternate between sync and async flips
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: async-flip-with-page-flip-events
> - * Description: Verify the async flip functionality and the fps during async flips
> - *              Wait for page flip events in between successive asynchronous flips
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_async_flip(data_t *data)
>  {
>  	int ret, frame;
> @@ -315,16 +328,6 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
>  	*seq = wait_vbl.reply.sequence;
>  }
>  
> -/**
> - * SUBTEST: test-time-stamp
> - * Description: Verify the async flip functionality and the fps during async flips
> - *              Verify that the async flip timestamp does not coincide with either
> - *              previous or next vblank
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_timestamp(data_t *data)
>  {
>  	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> @@ -369,14 +372,6 @@ static void test_timestamp(data_t *data)
>  		     "Async flip time stamp is expected to be in between 2 vblank time stamps\n");
>  }
>  
> -/**
> - * SUBTEST: test-cursor
> - * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, cursor, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_cursor(data_t *data)
>  {
>  	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> @@ -529,14 +524,6 @@ static unsigned int clock_ms(void)
>  	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
>  }
>  
> -/**
> - * SUBTEST: crc
> - * Description: Use CRC to verify async flip scans out the correct framebuffer
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, crc, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_crc(data_t *data)
>  {
>  	unsigned int frame = 0;
> @@ -599,14 +586,6 @@ static void test_crc(data_t *data)
>  	igt_assert_lt(data->frame_count * 2, data->flip_count);
>  }
>  
> -/**
> - * SUBTEST: invalid-async-flip
> - * Description: Negative case to verify if changes in fb are rejected from kernel as expected
> - * Driver requirement: i915, xe
> - * Functionality: async_flips, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void run_test(data_t *data, void (*test)(data_t *))
>  {
>  	igt_display_t *display = &data->display;
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index d1511716a..44e6c4902 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -31,6 +31,10 @@
>   * TEST: kms atomic
>   * Category: Display
>   * Description: Test atomic modesetting API
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  
>  #include <unistd.h>
> @@ -48,6 +52,59 @@
>  #include "igt_aux.h"
>  #include "sw_sync.h"
>  
> +/**
> + * SUBTEST: atomic-invalid-params
> + * Description: Test abuse the atomic ioctl directly in order to test various
> + *              invalid conditions which the libdrm wrapper won't allow us to
> + *              create.
> + *
> + * SUBTEST: atomic_plane_damage
> + * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
> + *
> + * SUBTEST: plane-primary-overlay-mutable-zpos
> + * Description: Verify that the overlay plane can cover the primary one (and
> + *              vice versa) by changing their zpos property.
> + * Functionality: kms_core, plane
> + *
> + * SUBTEST: plane-immutable-zpos
> + * Description: Verify the reported zpos property of planes by making sure only
> + *              higher zpos planes cover the lower zpos ones.
> + * Functionality: kms_core, plane
> + *
> + * SUBTEST: test-only
> + * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
> + *              the free-standing state objects and nothing else.
> + */
> +
> +/**
> + * SUBTEST: plane-%s-legacy
> + * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
> + *              between legacy and atomic interfaces.
> + * Functionality: kms_core, plane
> + *
> + * arg[1]:
> + *
> + * @cursor:         Cursor plane
> + * @overlay:        Overlay plane
> + * @primary:        Primary plane
> + */
> +
> +/**
> + * SUBTEST: %s-invalid-%s
> + * Description: Test error handling when invalid %arg[1] %arg[2] are passed
> + * Functionality: kms_core, plane
> + *
> + * arg[1]:
> + *
> + * @crtc:             crtc
> + * @plane:            plane
> + *
> + * arg[2]:
> + *
> + * @params:           parameters
> + * @params-fence:     fence parameters
> + */
> +
>  #ifndef DRM_CAP_CURSOR_WIDTH
>  #define DRM_CAP_CURSOR_WIDTH 0x8
>  #endif
> @@ -289,15 +346,6 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
>  	return 0;
>  }
>  
> -/**
> - * SUBTEST: plane-primary-overlay-mutable-zpos
> - * Description: Verify that the overlay plane can cover the primary one (and
> - *              vice versa) by changing their zpos property.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>  				   igt_plane_t *primary, igt_plane_t *overlay,
> @@ -380,15 +428,6 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>  	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
>  }
>  
> -/**
> - * SUBTEST: plane-immutable-zpos
> - * Description: Verify the reported zpos property of planes by making sure only
> - *              higher zpos planes cover the lower zpos ones.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>  		     igt_output_t *output)
> @@ -524,21 +563,6 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>  	igt_remove_fb(display->drm_fd, &fb_upper);
>  }
>  
> -/**
> - * SUBTEST: plane-%s-legacy
> - * Description: Test for KMS atomic modesetting on %arg[1] and ensure coherency
> - *              between legacy and atomic interfaces.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cursor:         Cursor plane
> - * @overlay:        Overlay plane
> - * @primary:        Primary plane
> - */
>  static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
>  {
>  	drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -613,16 +637,6 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>  	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
>  }
>  
> -/**
> - * SUBTEST: test-only
> - * Description: Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches
> - *              the free-standing state objects and nothing else.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>   * free-standing state objects and nothing else.
>   */
> @@ -731,19 +745,6 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
>  	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>  }
>  
> -/**
> - * SUBTEST: plane-invalid-%s
> - * Description: Test error handling when invalid %arg[1] are passed
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @params:           plane parameters
> - * @params-fence:     plane fence parameters
> - */
>  static void plane_invalid_params(igt_pipe_t *pipe,
>  				 igt_output_t *output,
>  				 igt_plane_t *plane,
> @@ -833,19 +834,6 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
>  	close(timeline);
>  }
>  
> -/**
> - * SUBTEST: crtc-invalid-%s
> - * Description: Test error handling when invalid %arg[1] are passed
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @params:           crtc parameters
> - * @params-fence:     crtc fence parameters
> - */
>  static void crtc_invalid_params(igt_pipe_t *pipe,
>  				igt_output_t *output,
>  				igt_plane_t *plane,
> @@ -993,17 +981,6 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
>  	igt_assert(pipe->out_fence_fd != -1);
>  }
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
> - */
> -
>  /* Abuse the atomic ioctl directly in order to test various invalid conditions,
>   * which the libdrm wrapper won't allow us to create. */
>  static void atomic_invalid_params(igt_pipe_t *pipe,
> @@ -1145,14 +1122,6 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
>  	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EFAULT);
>  }
>  
> -/**
> - * SUBTEST: atomic_plane_damage
> - * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *fb)
>  {
>  	struct drm_mode_rect damage[2];
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index 0ae2435f9..582b80c42 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -25,6 +25,10 @@
>   * TEST: kms atomic interruptible
>   * Category: Display
>   * Description: Tests that interrupt various atomic ioctls.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include <signal.h>
>  
> @@ -32,6 +36,40 @@
>  #include "drmtest.h"
>  #include "sw_sync.h"
>  
> +/**
> + * SUBTEST: legacy-cursor
> + * Description: Tests the interrupt properties for Cursor
> + * Functionality: cursor, kms_core
> + *
> + * SUBTEST: legacy-dpms
> + * Description: Tests the interrupt properties for DPMS
> + * Functionality: dpms, kms_core
> + *
> + * SUBTEST: legacy-pageflip
> + * Description: Tests the interrupt properties for page flip
> + */
> +
> +/**
> + * SUBTEST: %s-setmode
> + * Description: Tests the interrupt properties of %arg[1] modeset
> + *
> + * arg[1]:
> + *
> + * @atomic:      atomic
> + * @legacy:      legacy
> + */
> +
> +/**
> + * SUBTEST: universal-setplane-%s
> + * Description: Tests the interrupt properties for %arg[1]
> + * Functionality: kms_core, plane
> + *
> + * arg[1]:
> + *
> + * @cursor:         Cursor plane
> + * @primary:        Primary plane
> + */
> +
>  IGT_TEST_DESCRIPTION("Tests that interrupt various atomic ioctls.");
>  
>  enum plane_test_type
> @@ -79,56 +117,6 @@ static drmEventContext drm_events = {
>  	.page_flip_handler = ev_page_flip
>  };
>  
> -/**
> - * SUBTEST: %s-setmode
> - * Description: Tests the interrupt properties of %arg[1] modeset
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:      atomic
> - * @legacy:      legacy
> - */
> -
> -/**
> - * SUBTEST: legacy-cursor
> - * Description: Tests the interrupt properties for Cursor
> - * Driver requirement: i915, xe
> - * Functionality: cursor, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: legacy-dpms
> - * Description: Tests the interrupt properties for DPMS
> - * Driver requirement: i915, xe
> - * Functionality: dpms, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: legacy-pageflip
> - * Description: Tests the interrupt properties for page flip
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
> -/**
> - * SUBTEST: universal-setplane-%s
> - * Description: Tests the interrupt properties for %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cursor:         Cursor plane
> - * @primary:        Primary plane
> - */
>  static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
>  			   enum plane_test_type test_type, unsigned plane_type)
>  {
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index f5f21f925..bf1c244ef 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -24,6 +24,10 @@
>  /**
>   * TEST: kms atomic transition
>   * Category: Display
> + * Driver requirement: i915, xe
> + * Functionality: plane, watermark
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "igt_rand.h"
> @@ -37,6 +41,61 @@
>  #include <time.h>
>  #include <poll.h>
>  
> +/**
> + * SUBTEST: plane-primary-toggle-with-vblank-wait
> + * Description: Check toggling of primary plane with vblank
> + * Functionality: plane, vblank, watermark
> + */
> +
> +/**
> + * SUBTEST: plane-all-modeset-%s
> + * Description: Modeset test for all plane combinations %arg[1]
> + *
> + * arg[1]:
> + *
> + * @transition:                           default
> + * @transition-fencing:                   with fencing commit
> + */
> +
> +/**
> + * SUBTEST: plane-all-modeset-%s
> + * Description: Modeset test for all plane combinations %arg[1]
> + * Mega feature: eDP
> + *
> + * arg[1]:
> + *
> + * @transition-fencing-internal-panels:   on internal panels with fencing commit
> + * @transition-internal-panels:           on internal panels
> + */
> +
> +/**
> + * SUBTEST: plane-all-%s
> + * Description: Transition test for all plane combinations %arg[1]
> + *
> + * SUBTEST: modeset-%s
> + * Description: Modeset transition tests for combinations of crtc enabled %arg[1]
> + *
> + * arg[1]:
> + *
> + * @transition:                           default
> + * @transition-fencing:                   with fencing commit
> + * @transition-nonblocking:               with non-blocking commit
> + * @transition-nonblocking-fencing:       with non-blocking & fencing commit
> + */
> +
> +/**
> + * SUBTEST: plane-toggle-modeset-transition
> + * Description: Check toggling and modeset transition on plane
> + *
> + * SUBTEST: plane-use-after-nonblocking-%s
> + * Description: Transition test with non %arg[1] and make sure commit of disabled
> + *              plane has to complete before atomic commit on that plane
> + *
> + * arg[1]:
> + *
> + * @unbind:           blocking commit
> + * @unbind-fencing:   blocking commit with fencing
> + */
>  #ifndef DRM_CAP_CURSOR_WIDTH
>  #define DRM_CAP_CURSOR_WIDTH 0x8
>  #endif
> @@ -62,14 +121,6 @@ int *timeline;
>  pthread_t *thread;
>  int *seqno;
>  
> -/**
> - * SUBTEST: plane-primary-toggle-with-vblank-wait
> - * Description: Check toggling of primary plane with vblank
> - * Driver requirement: i915, xe
> - * Functionality: plane, vblank, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
> @@ -482,72 +533,6 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
>  	}
>  }
>  
> -/**
> - * SUBTEST: plane-all-modeset-%s
> - * Description: Modeset test for all plane combinations %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @transition:                           default
> - * @transition-fencing:                   with fencing commit
> - */
> -
> -/**
> - * SUBTEST: plane-all-modeset-%s
> - * Description: Modeset test for all plane combinations %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: eDP
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @transition-fencing-internal-panels:   on internal panels with fencing commit
> - * @transition-internal-panels:           on internal panels
> - */
> -
> -/**
> - * SUBTEST: plane-all-%s
> - * Description: Transition test for all plane combinations %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @transition:                           default
> - * @transition-fencing:                   with fencing commit
> - * @transition-nonblocking:               with non-blocking commit
> - * @transition-nonblocking-fencing:       with non-blocking & fencing commit
> - */
> -
> -/**
> - * SUBTEST: plane-toggle-modeset-transition
> - * Description: Check toggling and modeset transition on plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-use-after-nonblocking-%s
> - * Description: Transition test with non %arg[1] and make sure commit of disabled
> - *              plane has to complete before atomic commit on that plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @unbind:           blocking commit
> - * @unbind-fencing:   blocking commit with fencing
> - */
> -
>  /*
>   * 1. Set primary plane to a known fb.
>   * 2. Make sure getcrtc returns the correct fb id.
> @@ -1041,21 +1026,6 @@ retry:
>  	}
>  }
>  
> -/**
> - * SUBTEST: modeset-%s
> - * Description: Modeset transition tests for combinations of %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane, watermark
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @transition:                     crtc enabled
> - * @transition-fencing:             crtc enabled with fencing commit
> - * @transition-nonblocking:         crtc enabled with nonblocking commit
> - * @transition-nonblocking-fencing: crtc enabled with nonblocking & fencing commit
> - */
>  static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
>  {
>  	igt_output_t *outputs[IGT_MAX_PIPES] = {};
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 5f9a020da..b8422058e 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -20,22 +20,24 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include "drm_mode.h"
> -#include "igt.h"
> -#include "drm.h"
> -#include <stdio.h>
> -#include <xf86drmMode.h>
>  /**
>   * TEST: kms bw
>   * Category: Display
>   * Description: BW test with different resolutions
> - *
> - * SUBTEST: linear-tiling-%d-displays-%s
> - * Description: bw test with %arg[2]
>   * Driver requirement: i915, xe
>   * Functionality: kms_core
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "drm_mode.h"
> +#include "igt.h"
> +#include "drm.h"
> +#include <stdio.h>
> +#include <xf86drmMode.h>
> +
> +/**
> + * SUBTEST: linear-tiling-%d-displays-%s
> + * Description: bw test with %arg[2]
>   *
>   * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
>   *
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 4809481bc..cf3eb4ac8 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -26,19 +26,61 @@
>   * TEST: kms color
>   * Category: Display
>   * Description: Test Color Features at Pipe level
> + * Driver requirement: i915, xe
> + * Functionality: colorspace
> + * Mega feature: Color Management
> + * Test category: functionality test
>   */
>  #include "kms_color_helper.h"
>  
> -IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> -
>  /**
>   * SUBTEST: degamma
>   * Description: Verify that degamma LUT transformation works correctly
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> + *
> + * SUBTEST: gamma
> + * Description: Verify that gamma LUT transformation works correctly
> + *
> + * SUBTEST: legacy-gamma
> + * Description: Verify that legacy gamma LUT transformation works correctly
> + *
> + * SUBTEST: legacy-gamma-reset
> + * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
> + *              set through GAMMA_LUT property
> + *
> + * SUBTEST: deep-color
> + * Description: Verify that deep color works correctly
>   */
> +
> +/**
> + * SUBTEST: ctm-%s
> + * Description: Check the color transformation %arg[1]
> + *
> + * arg[1]:
> + *
> + * @0-25:           for 0.25 transparency
> + * @0-50:           for 0.50 transparency
> + * @0-75:           for 0.75 transparency
> + * @blue-to-red:    from blue to red
> + * @green-to-red:   from green to red
> + * @max:            for maximum transparency
> + * @negative:       for negative transparency
> + * @red-to-blue:    from red to blue
> + * @signed:         for correct signed handling
> + */
> +
> +/**
> + * SUBTEST: invalid-%s-sizes
> + * Description: Negative check for %arg[1] sizes
> + *
> + * arg[1]:
> + *
> + * @ctm-matrix:         Color transformation matrix
> + * @degamma-lut:        Degamma LUT
> + * @gamma-lut:          Gamma LUT
> + */
> +
> +IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
> +
>  static bool test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> @@ -127,15 +169,6 @@ static bool test_pipe_degamma(data_t *data,
>  	return ret;
>  }
>  
> -/**
> - * SUBTEST: gamma
> - * Description: Verify that gamma LUT transformation works correctly
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - */
> -
>  /*
>   * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
>   * LUT and verify we have the same CRC as drawing solid color rectangles.
> @@ -224,15 +257,6 @@ static bool test_pipe_gamma(data_t *data,
>  	return ret;
>  }
>  
> -/**
> - * SUBTEST: legacy-gamma
> - * Description: Verify that legacy gamma LUT transformation works correctly
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - */
> -
>  /*
>   * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
>   * gamma LUT and verify we have the same CRC as drawing solid color rectangles
> @@ -345,16 +369,6 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	return ret;
>  }
>  
> -/**
> - * SUBTEST: legacy-gamma-reset
> - * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
> - *              set through GAMMA_LUT property
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - */
> -
>  /*
>   * Verify that setting the legacy gamma LUT resets the gamma LUT set
>   * through the GAMMA_LUT property.
> @@ -489,27 +503,6 @@ end:
>  	return ret;
>  }
>  
> -/**
> - * SUBTEST: ctm-%s
> - * Description: Check the color transformation %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:           for 0.25 transparency
> - * @0-50:           for 0.50 transparency
> - * @0-75:           for 0.75 transparency
> - * @blue-to-red:    from blue to red
> - * @green-to-red:   from green to red
> - * @max:            for maximum transparency
> - * @negative:       for negative transparency
> - * @red-to-blue:    from red to blue
> - * @signed:         for correct signed handling
> - */
> -
>  /*
>   * Draw 3 rectangles using before colors with the ctm matrix apply and verify
>   * the CRC is equal to using after colors with an identify ctm matrix.
> @@ -869,14 +862,6 @@ out:
>  	test_cleanup(data);
>  }
>  
> -/**
> - * SUBTEST: deep-color
> - * Description: Verify that deep color works correctly
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - */
>  static void
>  run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>  {
> @@ -978,20 +963,6 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>  	test_cleanup(data);
>  }
>  
> -/**
> - * SUBTEST: invalid-%s-sizes
> - * Description: Negative check for %arg[1] sizes
> - * Driver requirement: i915, xe
> - * Functionality: colorspace
> - * Mega feature: Color Management
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @ctm-matrix:         Color transformation matrix
> - * @degamma-lut:        Degamma LUT
> - * @gamma-lut:          Gamma LUT
> - */
>  static void
>  run_invalid_tests_for_pipe(data_t *data)
>  {
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index d9cb197de..dcba7b12e 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -22,21 +22,23 @@
>   *
>   */
>  
> -#include "igt.h"
> -#include "drmtest.h"
>  /**
>   * TEST: kms concurrent
>   * Category: Display
>   * Description: Test atomic mode setting concurrently with multiple planes and
>   *              screen resolution
> - *
> - * SUBTEST: pipe-%s
> - * Description: Test atomic mode setting concurrently with multiple planes and
> - *              screen resolution on %arg[1].
>   * Driver requirement: i915, xe
>   * Functionality: kms_core
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +#include "drmtest.h"
> +
> +/**
> + * SUBTEST: pipe-%s
> + * Description: Test atomic mode setting concurrently with multiple planes and
> + *              screen resolution on %arg[1].
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 9378a76c1..1ae443c6c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -26,6 +26,10 @@
>   * TEST: kms content protection
>   * Category: Display
>   * Description: Test content protection (HDCP)
> + * Driver requirement: i915, xe
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Test category: functionality test
>   */
>  #include <poll.h>
>  #include <fcntl.h>
> @@ -37,6 +41,53 @@
>  #include "igt_kms.h"
>  #include "igt_kmod.h"
>  
> +/**
> + * SUBTEST: LIC
> + * Description: Test for the integrity of link.
> + *
> + * SUBTEST: content_type_change
> + * Description: Test the content type change when the content protection already
> + *              enabled
> + * Functionality: hdcp1.4, hdcp2.2
> + *
> + * SUBTEST: mei_interface
> + * Description: Test the teardown and rebuild of the interface between Intel
> + *              and mei hdcp.
> + * Functionality: hdcp1.4, hdcp2.2
> + *
> + * SUBTEST: srm
> + * Description: This test writes the facsimile SRM into the /lib/firmware/ and
> + *              check the kernel parsing of it by invoking the hdcp authentication.
> + *
> + * SUBTEST: uevent
> + * Description: Test to detect the HDCP status change when we are reading the
> + *              uevent sent with the corresponding connector id and property id.
> + *
> + * SUBTEST: %s
> + * Description: Test content protection with %arg[1]
> + *
> + * arg[1]:
> + *
> + * @atomic:         atomic modesetting
> + * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
> + * @legacy:         legacy style commit
> + * @type1:          content type 1 that can be handled only through HDCP2.2.
> + */
> +
> +/**
> + * SUBTEST: dp-mst-%s
> + * Description: Test Content protection %arg[1] over DP MST.
> + * Functionality: hdcp1.4, mst
> + * Mega feature: DP, HDCP
> + *
> + * arg[1]:
> + *
> + * @lic-type-0:   Type 0 with LIC
> + * @lic-type-1:   Type 1 with LIC.
> + * @type-0:       Type 0
> + * @type-1:       Type 1
> + */
> +
>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>  
>  struct data {
> @@ -490,60 +541,6 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>  	igt_display_commit2(&data.display, s);
>  }
>  
> -/**
> - * SUBTEST: LIC
> - * Description: Test for the integrity of link.
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * SUBTEST: content_type_change
> - * Description: Test the content type change when the content protection already
> - *              enabled
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4, hdcp2.2
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * SUBTEST: mei_interface
> - * Description: Test the teardown and rebuild of the interface between Intel
> - *              and mei hdcp.
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4, hdcp2.2
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * SUBTEST: srm
> - * Description: This test writes the facsimile SRM into the /lib/firmware/ and
> - *              check the kernel parsing of it by invoking the hdcp authentication.
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * SUBTEST: uevent
> - * Description: Test to detect the HDCP status change when we are reading the
> - *              uevent sent with the corresponding connector id and property id.
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * SUBTEST: %s
> - * Description: Test content protection with %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:         atomic modesetting
> - * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
> - * @legacy:         legacy style commit
> - * @type1:          content type 1 that can be handled only through HDCP2.2.
> - */
>  static void
>  test_content_protection(enum igt_commit_style s, int content_type)
>  {
> @@ -631,21 +628,6 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
>  	}
>  }
>  
> -/**
> - * SUBTEST: dp-mst-%s
> - * Description: Test Content protection %arg[1] over DP MST.
> - * Driver requirement: i915, xe
> - * Functionality: hdcp1.4, mst
> - * Mega feature: HDCP
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @lic-type-0:   Type 0 with LIC
> - * @lic-type-1:   Type 1 with LIC.
> - * @type-0:       Type 0
> - * @type-1:       Type 1
> - */
>  static void
>  test_content_protection_mst(int content_type)
>  {
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 76c01f557..674db3ed7 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -22,13 +22,6 @@
>   *
>   */
>  
> -#include "igt.h"
> -#include <errno.h>
> -#include <limits.h>
> -#include <stdbool.h>
> -#include <stdio.h>
> -#include <string.h>
> -
>  /**
>   * TEST: kms cursor crc
>   * Category: Display
> @@ -40,8 +33,67 @@
>   *              compares it with the CRC value obtained when the cursor plane
>   *              was disabled and its drawing is directly inserted on the PF by
>   *              software.
> + * Driver requirement: i915, xe
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> +#include "igt.h"
> +#include <errno.h>
> +#include <limits.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
>  
> +/**
> + * SUBTEST: cursor-dpms
> + * Description: Check random placement of a cursor with DPMS.
> + * Functionality: cursor, dpms
> + *
> + * SUBTEST: cursor-suspend
> + * Description: Check random placement of a cursor with suspend.
> + * Functionality: cursor, suspend
> + *
> + * SUBTEST: cursor-%s
> + * Description: %arg[1]
> + *
> + * arg[1]:
> + *
> + * @alpha-opaque:       Validates the composition of a fully opaque cursor plane,
> + *                      i.e., alpha channel equal to 1.0.
> + * @alpha-transparent:  Validates the composition of a fully transparent cursor
> + *                      plane, i.e., alpha channel equal to 0.0.
> + * @size-change:        Create a maximum size cursor, then change the size in
> + *                      flight to smaller ones to see that the size is applied
> + *                      correctly.
> + */
> +
> +/**
> + * SUBTEST: cursor-%s-%s
> + * Description: Check if a %arg[2] cursor is %arg[1].
> + *
> + * arg[1]:
> + *
> + * @offscreen:             well-positioned outside the screen
> + * @onscreen:              well-positioned inside the screen
> + * @random:                randomly placed
> + * @rapid-movement:        rapidly udates for movements
> + * @sliding:               smooth for horizontal, vertical & diagonal movements
> + *
> + * arg[2]:
> + *
> + * @128x128:               128x128 size
> + * @128x42:                128x42 size
> + * @256x256:               256x256 size
> + * @256x85:                256x85 size
> + * @32x10:                 32x10 size
> + * @32x32:                 32x32 size
> + * @512x170:               512x170 size
> + * @512x512:               512x512 size
> + * @64x21:                 64x21 size
> + * @64x64:                 64x64 size
> + * @max-size:              Max supported size
> + */
>  IGT_TEST_DESCRIPTION(
>     "Use the display CRC support to validate cursor plane functionality. "
>     "The test will position the cursor plane either fully onscreen, "
> @@ -654,38 +706,6 @@ static bool require_cursor_size(data_t *data, int w, int h)
>  	return !!ret;
>  }
>  
> -/**
> - * SUBTEST: cursor-dpms
> - * Description: Check random placement of a cursor with DPMS.
> - * Driver requirement: i915, xe
> - * Functionality: cursor, dpms
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: cursor-suspend
> - * Description: Check random placement of a cursor with suspend.
> - * Driver requirement: i915, xe
> - * Functionality: cursor, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: cursor-%s
> - * Description: %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @alpha-opaque:       Validates the composition of a fully opaque cursor plane,
> - *                      i.e., alpha channel equal to 1.0.
> - * @alpha-transparent:  Validates the composition of a fully transparent cursor
> - *                      plane, i.e., alpha channel equal to 0.0.
> - * @size-change:        Create a maximum size cursor, then change the size in
> - *                      flight to smaller ones to see that the size is applied
> - *                      correctly.
> - */
>  static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
>  {
>  	prepare_crtc(data, cursor_w, cursor_h);
> @@ -782,37 +802,6 @@ static bool execution_constraint(enum pipe pipe)
>  	return false;
>  }
>  
> -
> -/**
> - * SUBTEST: cursor-%s-%s
> - * Description: Check if a %arg[2] cursor is %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @offscreen:             well-positioned outside the screen
> - * @onscreen:              well-positioned inside the screen
> - * @random:                randomly placed
> - * @rapid-movement:        rapidly udates for movements
> - * @sliding:               smooth for horizontal, vertical & diagonal movements
> - *
> - * arg[2]:
> - *
> - * @128x128:               128x128 size
> - * @128x42:                128x42 size
> - * @256x256:               256x256 size
> - * @256x85:                256x85 size
> - * @32x10:                 32x10 size
> - * @32x32:                 32x32 size
> - * @512x170:               512x170 size
> - * @512x512:               512x512 size
> - * @64x21:                 64x21 size
> - * @64x64:                 64x64 size
> - * @max-size:              Max supported size
> - */
>  static void run_size_tests(data_t *data, int w, int h)
>  {
>  	enum pipe pipe;
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 1e233306d..ae09b5d91 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -22,24 +22,25 @@
>   *
>   */
>  
> +/**
> + * TEST: kms cursor edge walk
> + * Category: Display
> + * Description: Test to check different cursor sizes by walking different edges of screen
> + * Driver requirement: i915, xe
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <errno.h>
>  #include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <string.h>
> +
>  /**
> - * TEST: kms cursor edge walk
> - * Category: Display
> - * Description: Exercise CHV pipe C cursor fail
> - * Description: Test to check different cursor sizes by walking different edges of screen
> - *
>   * SUBTEST: %s-%s
>   * Description: Checking cursor size %arg[1] by walking %arg[2] of screen
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 861581c93..fbef7d248 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -26,8 +26,11 @@
>   * TEST: kms cursor legacy
>   * Category: Display
>   * Description: Stress legacy cursor ioctl
> + * Driver requirement: i915, xe
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> -
>  #include <sched.h>
>  #include <sys/poll.h>
>  
> @@ -37,6 +40,189 @@
>  #include "igt_rand.h"
>  #include "igt_stats.h"
>  
> +/**
> + * SUBTEST: %s-%s
> + * Description: Test checks how many cursor updates we can fit between vblanks
> + *              on single/all pipes with different modes, priority and number
> + *              of processes
> + *
> + * arg[1]:
> + *
> + * @single:      Single
> + * @torture:     Torture
> + * @forked:      Forked
> + *
> + * arg[2]:
> + *
> + * @bo:          BO
> + * @move:        Move
> + */
> +
> +/**
> + * SUBTEST: basic-busy-flip-before-cursor-%s
> + * Description: Cursor test with %arg[1] mode
> + * Functionality: cursor, hang
> + *
> + * SUBTEST: basic-busy-flip-before-cursor-varying-size
> + * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
> + * Functionality: cursor, hang
> + *
> + * arg[1]:
> + *
> + * @atomic:	atomic
> + * @legacy:	legacy
> + */
> +
> +/**
> + * SUBTEST: basic-flip-after-cursor-%s
> + * Description: Cursor test with %arg[1]
> + *
> + * SUBTEST: basic-flip-before-cursor-%s
> + * Description: Cursor test with %arg[1]
> + *
> + * arg[1]:
> + *
> + * @atomic:        atomic mode
> + * @legacy:        legacy mode
> + * @varying-size:  varying size
> + */
> +
> +/**
> + * SUBTEST: %s-flip-before-cursor-%s
> + * Description: Adds variety of tests:
> + *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
> + *		- atomic-transition: alternates between a full screen sprite plane
> + *		                     and full screen primary plane.\n"
> + *		- toggle: which toggles cursor visibility and make sure cursor moves
> + *		          between updates.
> + *
> + * arg[1]:
> + *
> + * @short:
> + * @short-busy:
> + *
> + * arg[2]:
> + *
> + * @atomic-transitions:
> + * @atomic-transitions-varying-size:
> + * @toggle:
> + */
> +
> +/**
> + * SUBTEST: short-flip-after-cursor-%s
> + * Description: Adds variety of tests:
> + *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
> + *		- atomic-transition: alternates between a full screen sprite plane
> + *		                     and full screen primary plane.\n"
> + *		- toggle: which toggles cursor visibility and make sure cursor moves
> + *		          between updates.
> + *
> + * arg[1]:
> + *
> + * @atomic-transitions:
> + * @atomic-transitions-varying-size:
> + * @toggle:
> + */
> +
> +/**
> + * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
> + * Description: Test checks how many cursor updates we can fit between vblanks
> + *              on all pipes with different modes, priority and number of processes
> + *
> + * SUBTEST: nonblocking-modeset-vs-cursor-atomic
> + * Description: Test checks how many cursor updates we can fit between vblanks
> + *              on all pipes with different modes, priority and number of processes
> + */
> +
> +/**
> + * SUBTEST: 2x-%s-%s
> + * Description: This test executes flips on both CRTCs while running cursor
> + *              updates in parallel
> + *
> + * arg[1]:
> + *
> + * @flip-vs-cursor:
> + * @flip-vs-cursor:
> + * @long-flip-vs-cursor:
> + * @long-flip-vs-cursor:
> + *
> + * arg[2]:
> + *
> + * @atomic:
> + * @legacy:
> + */
> +
> +/**
> + * SUBTEST: 2x-%s-atomic
> + * Description: This test executes flips on both CRTCs while running cursor
> + *              updates in parallel
> + *
> + * arg[1]:
> + *
> + * @long-nonblocking-modeset-vs-cursor:
> + * @nonblocking-modeset-vs-cursor:
> + */
> +
> +/**
> + * SUBTEST: %s-%s
> + * Description: The essence of the basic test is that neither the cursor nor the
> + *              nonblocking flip stall the application of the next
> + *
> + * arg[1]:
> + *
> + * @cursor-vs-flip:
> + * @cursorA-vs-flipA:
> + * @cursorA-vs-flipB:
> + * @cursorB-vs-flipA:
> + * @cursorB-vs-flipB:
> + * @flip-vs-cursor:
> + *
> + * arg[2]:
> + *
> + * @atomic:
> + * @atomic-transitions:
> + * @atomic-transitions-varying-size:
> + * @legacy:
> + * @toggle:
> + * @varying-size:
> + */
> +
> +/**
> + * SUBTEST: 2x-%s-%s
> + * Description: This test executes flips on both CRTCs while running cursor updates in parallel
> + *
> + * arg[1]:
> + *
> + * @cursor-vs-flip:
> + * @cursor-vs-flip:
> + * @long-cursor-vs-flip:
> + * @long-cursor-vs-flip:
> + *
> + * arg[2]:
> + *
> + * @atomic:
> + * @legacy:
> + */
> +
> +/**
> + * SUBTEST: flip-vs-cursor-crc-%s
> + * Description: this test perform a page flip followed by a cursor update
> + *
> + * SUBTEST: flip-vs-cursor-busy-crc-%s
> + * Description: this test perform a busy bo update followed by a cursor update
> + * Functionality: cursor, hang
> + *
> + * arg[1]:
> + *
> + * @atomic:
> + * @legacy:
> + */
> +
> +/**
> + * SUBTEST: modeset-atomic-cursor-hotspot
> + * Description: Test changes the cursor hotspot and checks that the property is
> + *              updated accordignly
> + */
>  #if defined(__x86_64__) || defined(__i386__)
>  #define cpu_relax()	__builtin_ia32_pause()
>  #else
> @@ -78,27 +264,6 @@ static void override_output_modes(igt_display_t *display,
>  	igt_output_set_pipe(output2, PIPE_NONE);
>  }
>  
> -/**
> - * SUBTEST: %s-%s
> - * Description: Test checks how many cursor updates we can fit between vblanks
> - *              on single/all pipes with different modes, priority and number
> - *              of processes
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @single:      Single
> - * @torture:     Torture
> - * @forked:      Forked
> - *
> - * arg[2]:
> - *
> - * @bo:          BO
> - * @move:        Move
> - */
>  static void stress(igt_display_t *display,
>  		   enum pipe pipe, int num_children, unsigned mode,
>  		   int timeout)
> @@ -569,93 +734,6 @@ enum basic_flip_cursor {
>  
>  #define BASIC_BUSY 0x1
>  
> -/**
> - * SUBTEST: basic-busy-flip-before-cursor-%s
> - * Description: Cursor test with %arg[1] mode
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: basic-busy-flip-before-cursor-varying-size
> - * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:	atomic
> - * @legacy:	legacy
> - */
> -
> -/**
> - * SUBTEST: basic-flip-after-cursor-%s
> - * Description: Cursor test with %arg[1]
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: basic-flip-before-cursor-%s
> - * Description: Cursor test with %arg[1]
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - *
> - * arg[1]:
> - *
> - * @atomic:        atomic mode
> - * @legacy:        legacy mode
> - * @varying-size:  varying size
> - */
> -
> -/**
> - * SUBTEST: %s-flip-before-cursor-%s
> - * Description: Adds variety of tests:
> - *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
> - *		- atomic-transition: alternates between a full screen sprite plane
> - *		                     and full screen primary plane.\n"
> - *		- toggle: which toggles cursor visibility and make sure cursor moves
> - *		          between updates.
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @short:
> - * @short-busy:
> - *
> - * arg[2]:
> - *
> - * @atomic-transitions:
> - * @atomic-transitions-varying-size:
> - * @toggle:
> - */
> -
> -/**
> - * SUBTEST: short-flip-after-cursor-%s
> - * Description: Adds variety of tests:
> - *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
> - *		- atomic-transition: alternates between a full screen sprite plane
> - *		                     and full screen primary plane.\n"
> - *		- toggle: which toggles cursor visibility and make sure cursor moves
> - *		          between updates.
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic-transitions:
> - * @atomic-transitions-varying-size:
> - * @toggle:
> - */
>  static void basic_flip_cursor(igt_display_t *display,
>  			      enum flip_test mode,
>  			      enum basic_flip_cursor order,
> @@ -977,23 +1055,6 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>  		igt_remove_fb(display->drm_fd, &cursor_fb2);
>  }
>  
> -/**
> - * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
> - * Description: Test checks how many cursor updates we can fit between vblanks
> - *              on all pipes with different modes, priority and number of processes
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: nonblocking-modeset-vs-cursor-atomic
> - * Description: Test checks how many cursor updates we can fit between vblanks
> - *              on all pipes with different modes, priority and number of processes
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
>  {
>  	struct igt_fb fb_info, cursor_fb;
> @@ -1093,42 +1154,6 @@ static void wait_for_modeset(igt_display_t *display, unsigned flags, int timeout
>  	igt_reset_timeout();
>  }
>  
> -/**
> - * SUBTEST: 2x-%s-%s
> - * Description: This test executes flips on both CRTCs while running cursor
> - *              updates in parallel
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @flip-vs-cursor:
> - * @flip-vs-cursor:
> - * @long-flip-vs-cursor:
> - * @long-flip-vs-cursor:
> - *
> - * arg[2]:
> - *
> - * @atomic:
> - * @legacy:
> - */
> -
> -/**
> - * SUBTEST: 2x-%s-atomic
> - * Description: This test executes flips on both CRTCs while running cursor
> - *              updates in parallel
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @long-nonblocking-modeset-vs-cursor:
> - * @nonblocking-modeset-vs-cursor:
> - */
>  static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool modeset, bool atomic)
>  {
>  	struct drm_mode_cursor arg1[2], arg2[2];
> @@ -1316,33 +1341,6 @@ done:
>  	munmap((void *)shared, PAGE_SIZE);
>  }
>  
> -/**
> - * SUBTEST: %s-%s
> - * Description: The essence of the basic test is that neither the cursor nor the
> - *              nonblocking flip stall the application of the next
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cursor-vs-flip:
> - * @cursorA-vs-flipA:
> - * @cursorA-vs-flipB:
> - * @cursorB-vs-flipA:
> - * @cursorB-vs-flipB:
> - * @flip-vs-cursor:
> - *
> - * arg[2]:
> - *
> - * @atomic:
> - * @atomic-transitions:
> - * @atomic-transitions-varying-size:
> - * @legacy:
> - * @toggle:
> - * @varying-size:
> - */
>  static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloops)
>  {
>  	struct drm_mode_cursor arg[2];
> @@ -1455,26 +1453,6 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>  		igt_remove_fb(display->drm_fd, &cursor_fb2);
>  }
>  
> -/**
> - * SUBTEST: 2x-%s-%s
> - * Description: This test executes flips on both CRTCs while running cursor updates in parallel
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @cursor-vs-flip:
> - * @cursor-vs-flip:
> - * @long-cursor-vs-flip:
> - * @long-cursor-vs-flip:
> - *
> - * arg[2]:
> - *
> - * @atomic:
> - * @legacy:
> - */
>  static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool atomic)
>  {
>  	struct drm_mode_cursor arg[2][2];
> @@ -1603,19 +1581,6 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
>  	munmap((void *)shared, PAGE_SIZE);
>  }
>  
> -/**
> - * SUBTEST: flip-vs-cursor-crc-%s
> - * Description: this test perform a page flip followed by a cursor update
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:
> - * @legacy:
> - */
>  static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>  {
>  	struct drm_mode_cursor arg[2];
> @@ -1688,19 +1653,6 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
>  	igt_remove_fb(display->drm_fd, &cursor_fb);
>  }
>  
> -/**
> - * SUBTEST: flip-vs-cursor-busy-crc-%s
> - * Description: this test perform a busy bo update followed by a cursor update
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:
> - * @legacy:
> - */
>  static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  {
>  	struct drm_mode_cursor arg[2];
> @@ -1813,15 +1765,6 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>  	put_ahnd(ahnd);
>  }
>  
> -/**
> - * SUBTEST: modeset-atomic-cursor-hotspot
> - * Description: Test changes the cursor hotspot and checks that the property is
> - *              updated accordignly
> - * Driver requirement: i915, xe
> - * Functionality: cursor
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void modeset_atomic_cursor_hotspot(igt_display_t *display)
>  {
>  	struct igt_fb cursor_fb;
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f44d452b7..d1b58df82 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -28,9 +28,25 @@
>   * TEST: kms display modes
>   * Category: Display
>   * Description: Test Display Modes
> + * Driver requirement: i915, xe
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: extended-mode-basic
> + * Description: Test for validating display extended mode with a pair of connected
> + *              displays
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: mst-extended-mode-negative
> + * Description: Negative test for validating display extended mode with a pair
> + *		of connected 2k-4k or 4k-4k displays.
> + * Functionality: kms_core, mst
> + * Mega feature: DP
> + */
> +
>  #define HDISPLAY_4K	3840
>  #define VDISPLAY_4K	2160
>  
> @@ -205,15 +221,6 @@ static void run_extendedmode_basic(data_t *data,
>  	for_each_connected_output_local((display), (output)) \
>  		for_each_if (igt_pipe_connector_valid((pipe), (output)))
>  
> -/**
> - * SUBTEST: extended-mode-basic
> - * Description: Test for validating display extended mode with a pair of connected
> - *              displays
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void run_extendedmode_test(data_t *data) {
>  	enum pipe pipe1, pipe2;
>  	igt_output_t *output1, *output2;
> @@ -259,15 +266,6 @@ static void run_extendedmode_test(data_t *data) {
>  	}
>  }
>  
> -/**
> - * SUBTEST: mst-extended-mode-negative
> - * Description: Negative test for validating display extended mode with a pair
> - *		of connected 2k-4k or 4k-4k displays.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, mst
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
>  {
>  	struct igt_fb fbs[2];
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index c41961937..57b45b083 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -29,12 +29,24 @@
>   * TEST: kms dither
>   * Category: Display
>   * Description: Test Dithering block status
> + * Driver requirement: i915, xe
> + * Functionality: colorspace, kms_gem_interop
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <fcntl.h>
>  #include <termios.h>
>  #include <unistd.h>
>  
> +/**
> + * SUBTEST: FB-8BPC-Vs-Panel-6BPC
> + * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
> + *
> + * SUBTEST: FB-8BPC-Vs-Panel-8BPC
> + * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
> + */
> +
>  IGT_TEST_DESCRIPTION("Test Dithering block status");
>  
>  /* Connector BPC */
> @@ -186,21 +198,6 @@ static bool is_supported(igt_output_t *output)
>  		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>  }
>  
> -/**
> - * SUBTEST: FB-8BPC-Vs-Panel-6BPC
> - * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: FB-8BPC-Vs-Panel-8BPC
> - * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>  {
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index e6a67e22e..1d63a5daa 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -22,6 +22,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms dp aux dev
> + * Category: Display
> + * Description: Test that /dev/drm_dp_aux reads work
> + * Driver requirement: i915, xe
> + * Functionality: dp_aux
> + * Mega feature: DP
> + * Test category: functionality test
> + */
>  #include "config.h"
>  
>  #include <sys/types.h>
> @@ -31,17 +40,10 @@
>  
>  #include "igt.h"
>  #include "igt_kms.h"
> +
>  /**
> - * TEST: kms dp aux dev
> - * Category: Display
> - * Description: Test that /dev/drm_dp_aux reads work
> - *
>   * SUBTEST:
>   * Description: Test that /dev/drm_dp_aux reads work
> - * Driver requirement: i915, xe
> - * Functionality: dp_aux
> - * Mega feature: DP
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 3a1f6d21d..5603e5fb6 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -28,63 +28,52 @@
>   * Description: A metatest that checks for \"features\" presence.
>   *		The subtests here should only skip or pass,
>   *		anything else means we have a serious problem.
> - *
> + * Driver requirement: i915, xe
> + * Functionality: feature_discovery
> + * Test category: functionality test
> + */
> +#include "igt.h"
> +#ifdef HAVE_CHAMELIUM
> +#include "igt_chamelium.h"
> +#endif
> +#include "igt_kms.h"
> +#include "igt_psr.h"
> +#include "igt_sysfs.h"
> +#include "igt_types.h"
> +
> +/**
>   * SUBTEST: display
>   * Description: Make sure that we have display support with
>   * 		some outputs connected.
> - * Driver requirement: i915, xe
> - * Functionality: feature_discovery
>   * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: display-%dx
>   * Description: Make sure that we have display support with %arg[1]
>   * 		outputs connected.
> - * Driver requirement: i915, xe
> - * Functionality: feature_discovery
>   * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: chamelium
>   * Description: Make sure that Chamelium is configured and reachable.
> - * Driver requirement: i915, xe
>   * Functionality: feature_discovery, chamelium
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: psr1
>   * Description: Make sure that we have eDP panel with PSR1 support.
> - * Driver requirement: i915, xe
>   * Functionality: feature_discovery, psr1, eDP
>   * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: psr2
>   * Description: Make sure that we have eDP panel with PSR2 support.
> - * Driver requirement: i915, xe
>   * Functionality: feature_discovery, psr2, eDP
>   * Mega feature: PSR
> - * Test category: functionality test
>   *
>   * SUBTEST: dp-mst
>   * Description: Make sure that we have DP-MST configuration.
> - * Driver requirement: i915, xe
>   * Functionality: feature_discovery, mst
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + * Mega feature: DP
>   *
>   * arg[1].values: 2, 3, 4
>   */
>  
> -#include "igt.h"
> -#ifdef HAVE_CHAMELIUM
> -#include "igt_chamelium.h"
> -#endif
> -#include "igt_kms.h"
> -#include "igt_psr.h"
> -#include "igt_sysfs.h"
> -#include "igt_types.h"
> -
>  static igt_display_t display;
>  
>  IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 2c60cdf6d..1a19fe85e 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -25,8 +25,10 @@
>   * TEST: kms flip
>   * Category: Display
>   * Description: Tests for validating modeset, dpms and pageflips
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> -
>  #include "config.h"
>  
>  #include "igt.h"
> @@ -41,80 +43,66 @@
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
>  
> +#ifdef HAVE_LINUX_KD_H
> +#include <linux/kd.h>
> +#elif HAVE_SYS_KD_H
> +#include <sys/kd.h>
> +#endif
> +#include <time.h>
> +#include <pthread.h>
> +
> +#include "i915/gem_create.h"
> +#include "igt_stats.h"
> +#include "xe/xe_query.h"
> +
>  /**
>   * SUBTEST: 2x-flip-vs-fences
>   * Description: Test to validate pageflips along with avialable fences on a pair
>   *              of connected displays
>   * Driver requirement: i915
>   * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-flip-vs-fences-interruptible
>   * Description: Interrupt test to validate pageflips along with available fences
>   *              on a pair of connected displays
> - * Driver requirement: i915, xe
> + * Driver requirement: i915
>   * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-vs-fences
>   * Description: Basic test to validate pageflips with avialable fences
>   * Driver requirement: i915
>   * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-vs-fences-interruptible
>   * Description: Interrupt test to validate pageflips with available fences
>   * Driver requirement: i915
>   * Functionality: gtt, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: dpms-off-confusion
>   * Description: Basic test to validate pageflips by disabling other connectors usng dpms
> - * Driver requirement: i915, xe
>   * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: dpms-off-confusion-interruptible
>   * Description: Interrupt test to validate pageflips by disabling other connectors using dpms
> - * Driver requirement: i915, xe
>   * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: bo-too-big
>   * Description: Basic test to validate pageflips with large BO in size
> - * Driver requirement: i915, xe
>   * Functionality: kms_gem_interop, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: bo-too-big-interruptible
>   * Description: Interrupt test to validate pageflips with large BO in size
> - * Driver requirement: i915, xe
>   * Functionality: kms_gem_interop, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  /**
>   * SUBTEST: %s
>   * Description: Basic test to validate %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: hang, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s
>   * Description: Test to validate %arg[1] on a pair of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: hang, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -125,17 +113,11 @@
>  /**
>   * SUBTEST: %s
>   * Description: Basic test to validate %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s
>   * Description: Test to validate %arg[1] on a pair of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -158,61 +140,37 @@
>  /**
>   * SUBTEST: flip-vs-suspend
>   * Description: Basic test to validate pageflips with suspend cycle
> - * Driver requirement: i915, xe
>   * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-flip-vs-suspend
>   * Description: Basic test to validate pageflips with suspend cycle on a pair of
>   *              connected displays
> - * Driver requirement: i915, xe
>   * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-vs-suspend-interruptible
>   * Description: Interrupt test to validate pageflips with suspend cycle
> - * Driver requirement: i915, xe
>   * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-flip-vs-suspend-interruptible
>   * Description: Interrupt test to validate pageflips with suspend cycle on a pair
>   *              of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: %s
>   * Description: Basic test to validate %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s
>   * Description: Basic test to validate %arg[1] on a pair of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: %s-interruptible
>   * Description: Basic test to validate %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s-interruptible
>   * Description: Basic test to validate %arg[1] on a pair of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -227,17 +185,11 @@
>   * SUBTEST: 2x-flip-vs-dpms
>   * Description: Basic test to validate pageflip along with dpms on a pair of
>   *              connected displays
> - * Driver requirement: i915, xe
>   * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s
>   * Description: Basic test to validate %arg[1] on a pair of connected displays
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -249,18 +201,12 @@
>  /**
>   * SUBTEST: %s-interruptible
>   * Description: Basic test for validating modeset, dpms and pageflips
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: 2x-%s-interruptible
>   * Description: Test for validating modeset, dpms and pageflips with a pair of
>   *              connected displays
> - * Driver requirement: i915, xe
>   * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -279,17 +225,28 @@
>   * @modeset-vs-vblank-race:       modeset and check for vblank
>   */
>  
> -#ifdef HAVE_LINUX_KD_H
> -#include <linux/kd.h>
> -#elif HAVE_SYS_KD_H
> -#include <sys/kd.h>
> -#endif
> -#include <time.h>
> -#include <pthread.h>
> -
> -#include "i915/gem_create.h"
> -#include "igt_stats.h"
> -#include "xe/xe_query.h"
> +/**
> + * SUBTEST: basic-plain-flip
> + * Description: Basic test for validating page flip
> + * Functionality: vblank
> + *
> + * SUBTEST: nonblocking-read
> + * Description: Tests that nonblocking reading fails correctly
> + * Functionality: vblank
> + *
> + * SUBTEST: basic-flip-vs-dpms
> + * Description: Basic test to valide pageflip with dpms
> + * Functionality: dpms, vblank
> + *
> + * SUBTEST: basic-flip-vs-%s
> + * Description: Basic test to valide pageflip with %arg[1]
> + * Functionality: vblank
> + *
> + * arg[1]:
> + *
> + * @modeset:      modeset
> + * @wf_vblank:    wait for vblank
> + */
>  
>  #define TEST_DPMS		(1 << 0)
>  
> @@ -1804,34 +1761,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>  		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
>  }
>  
> -/**
> - * SUBTEST: basic-flip-vs-dpms
> - * Description: Basic test to valide pageflip with dpms
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: dpms, vblank
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: basic-flip-vs-%s
> - * Description: Basic test to valide pageflip with %arg[1]
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - *
> - * arg[1]:
> - *
> - * @modeset:      modeset
> - * @wf_vblank:    wait for vblank
> - *
> - * SUBTEST: basic-plain-flip
> - * Description: Basic test for validating page flip
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - */
> -
>  static void run_test(int duration, int flags)
>  {
>  	struct test_output o;
> @@ -2016,14 +1945,6 @@ static void kms_flip_exit_handler(int sig)
>  		kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
>  }
>  
> -/**
> - * SUBTEST: nonblocking-read
> - * Description: Tests that nonblocking reading fails correctly
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_nonblocking_read(int in)
>  {
>  	char buffer[1024];
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index 57f6f64f7..bee2913a8 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -22,6 +22,15 @@
>   *
>   */
>  
> +/**
> + * TEST: kms flip event leak
> + * Category: Display
> + * Description: Test to validate flip event leak
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <errno.h>
>  #include <stdbool.h>
> @@ -32,19 +41,11 @@
>  #include "xe/xe_query.h"
>  
>  /**
> - * TEST: kms flip event leak
> - * Category: Display
> - * Description: Test to validate flip event leak
> - *
>   * SUBTEST: basic
>   * Description: This test tries to provoke the kernel into leaking a pending
>   *              page flip event when the fd is closed before the flip has
>   *              completed. The test itself won't fail even if the kernel leaks
>   *              the event, but the resulting dmesg WARN will indicate a failure.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  typedef struct {
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index e3b9034db..b24491d89 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -26,10 +26,29 @@
>   * TEST: kms force connector basic
>   * Category: Display
>   * Description: Check the debugfs force connector/edid features work correctly.
> + * Driver requirement: i915, xe
> + * Functionality: force_connector
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> -
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: force-load-detect
> + * Description: Test to detect forced load.
> + * Driver requirement: i915
> + * Functionality: force_connector, vga
> + *
> + * SUBTEST: force-connector-state
> + * Description: Test to check the forced connector state
> + *
> + * SUBTEST: force-edid
> + * Description: Test to check the values after forcing edid
> + *
> + * SUBTEST: prune-stale-modes
> + * Description: Tests pruning of stale modes
> + */
> +
>  IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
>  		     " correctly.");
>  
> @@ -69,14 +88,6 @@ static void reset_connectors(void)
>  	drm_close_driver(drm_fd);
>  }
>  
> -/**
> - * SUBTEST: force-load-detect
> - * Description: Test to detect forced load.
> - * Driver requirement: i915
> - * Functionality: force_connector, vga
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
>  {
>  	int i, j, w = 64, h = 64;
> @@ -165,14 +176,6 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
>  	}
>  }
>  
> -/**
> - * SUBTEST: force-connector-state
> - * Description: Test to check the forced connector state
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: force_connector
> - * Mega feature: General Display Features
> - */
>  static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	igt_display_t display;
> @@ -212,14 +215,6 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
>  	igt_display_fini(&display);
>  }
>  
> -/**
> - * SUBTEST: force-edid
> - * Description: Test to check the values after forcing edid
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: force_connector
> - * Mega feature: General Display Features
> - */
>  static void force_edid(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	drmModeConnector *temp;
> @@ -261,14 +256,6 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
>  
>  }
>  
> -/**
> - * SUBTEST: prune-stale-modes
> - * Description: Tests pruning of stale modes
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: force_connector
> - * Mega feature: General Display Features
> - */
>  static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	int i;
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index 059f66d99..171b97429 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -31,6 +31,9 @@
>   * TEST: kms getfb
>   * Category: Display
>   * Description: Tests GETFB and GETFB2 ioctls.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <unistd.h>
> @@ -50,6 +53,67 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_ioctl.h"
>  
> +/**
> + * SUBTEST: getfb-handle-%s
> + * Description: Tests error handling %arg[1]
> + * Functionality: kms_gem_interop
> + *
> + * arg[1]:
> + *
> + * @closed:       when passing a handle that has been closed.
> + * @not-fb:       when passing an invalid handle.
> + * @valid:        when passing an valid handle.
> + * @zero:         for a zero'd input.
> + */
> +
> +/**
> + * SUBTEST: getfb-reject-ccs
> + * Description: Tests error handling while requesting CCS buffers it should
> + *              refuse because getfb supports returning a single buffer handle.
> + * Functionality: ccs, kms_gem_interop, tiling
> + *
> + * SUBTEST: getfb-%s-different-handles
> + * Description: Tests error handling while requesting for two different handles
> + *              from %arg[1].
> + * Functionality: kms_gem_interop
> + *
> + * arg[1]:
> + *
> + * @addfb:           same fd
> + * @repeated:        different fd
> + */
> +
> +/**
> + * SUBTEST: getfb2-accept-ccs
> + * Description: Tests outputs are correct when retrieving a CCS framebuffer.
> + * Functionality: ccs, kms_gem_interop, tiling
> + *
> + * SUBTEST: getfb2-into-addfb2
> + * Description: Output check by passing the output of GETFB2 into ADDFB2.
> + * Functionality: kms_gem_interop
> + *
> + * SUBTEST: getfb2-handle-%s
> + * Description: Tests error handling %arg[1].
> + * Functionality: kms_gem_interop
> + *
> + * arg[1]:
> + *
> + * @closed:                  when passing a handle that has been closed
> + * @not-fb:                  when passing an invalid handle
> + * @zero:                    for a zero'd input
> + */
> +
> +/**
> + * SUBTEST: %s-handle-protection
> + * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
> + * Functionality: kms_gem_interop
> + *
> + * arg[1]:
> + *
> + * @getfb:      GETFB ioctl
> + * @getfb2:     GETFB2 ioctl
> + */
> +
>  IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
>  
>  static bool has_getfb_iface(int fd)
> @@ -178,21 +242,6 @@ static uint32_t get_any_prop_id(int fd)
>  	return 0;
>  }
>  
> -/**
> - * SUBTEST: getfb-handle-%s
> - * Description: Tests error handling %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @closed:       when passing a handle that has been closed.
> - * @not-fb:       when passing an invalid handle.
> - * @valid:        when passing an valid handle.
> - * @zero:         for a zero'd input.
> - */
>  static void test_handle_input(int fd)
>  {
>  	struct drm_mode_fb_cmd2 add = {};
> @@ -248,28 +297,6 @@ static void test_handle_input(int fd)
>  		gem_close(fd, add.handles[0]);
>  }
>  
> -/**
> - * SUBTEST: getfb-reject-ccs
> - * Description: Tests error handling while requesting CCS buffers it should
> - *              refuse because getfb supports returning a single buffer handle.
> - * Driver requirement: i915, xe
> - * Functionality: ccs, kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: getfb-%s-different-handles
> - * Description: Tests error handling while requesting for two different handles
> - *              from %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @addfb:           same fd
> - * @repeated:        different fd
> - */
>  static void test_duplicate_handles(int fd)
>  {
>  	struct drm_mode_fb_cmd2 add = {};
> @@ -335,34 +362,6 @@ static void test_duplicate_handles(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: getfb2-accept-ccs
> - * Description: Tests outputs are correct when retrieving a CCS framebuffer.
> - * Driver requirement: i915, xe
> - * Functionality: ccs, kms_gem_interop, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: getfb2-into-addfb2
> - * Description: Output check by passing the output of GETFB2 into ADDFB2.
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: getfb2-handle-%s
> - * Description: Tests error handling %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @closed:                  when passing a handle that has been closed
> - * @not-fb:                  when passing an invalid handle
> - * @zero:                    for a zero'd input
> - */
>  static void test_getfb2(int fd)
>  {
>  	struct drm_mode_fb_cmd2 add_basic = {};
> @@ -471,19 +470,6 @@ static void test_getfb2(int fd)
>  	}
>  }
>  
> -/**
> - * SUBTEST: %s-handle-protection
> - * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @getfb:      GETFB ioctl
> - * @getfb2:     GETFB2 ioctl
> - */
>  static void test_handle_protection(void) {
>  	int non_master_fd;
>  	struct drm_mode_fb_cmd2 non_master_add = {};
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index 61f62fa7c..2ca995577 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -22,6 +22,16 @@
>   *
>   */
>  
> +/**
> + * TEST: kms hdmi inject
> + * Category: Display
> + * Description: Test that in-kernel EDID parsing is producing expected results
> + *              by forcing a HDMI connector with a known EDID and checking that
> + *              the metadata exposed to user space matches.
> + * Driver requirement: i915, xe
> + * Mega feature: HDMI
> + * Test category: functionality test
> + */
>  #include "config.h"
>  
>  #include <dirent.h>
> @@ -32,27 +42,15 @@
>  #include "xe/xe_query.h"
>  
>  /**
> - * TEST: kms hdmi inject
> - * Category: Display
> - * Description: Test that in-kernel EDID parsing is producing expected results
> - *              by forcing a HDMI connector with a known EDID and checking that
> - *              the metadata exposed to user space matches.
> - *
>   * SUBTEST: inject-4k
>   * Description: Make sure that 4K modes exposed by DRM match the forced EDID and
>   *              modesetting using it succeed.
> - * Driver requirement: i915, xe
>   * Functionality: force_connector, hdmi_edid
> - * Mega feature: HDMI
> - * Test category: functionality test
>   *
>   * SUBTEST: inject-audio
>   * Description: Make sure that audio information exposed by ALSA match the forced
>   *              EDID.
> - * Driver requirement: i915, xe
>   * Functionality: audio, force_connector
> - * Mega feature: HDMI
> - * Test category: functionality test
>   */
>  
>  #define HDISPLAY_4K	3840
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index ed98a0c26..552a12e62 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -24,6 +24,9 @@
>   * TEST: kms hdr
>   * Category: Display
>   * Description: Test HDR metadata interfaces and bpc switch
> + * Driver requirement: i915, xe
> + * Mega feature: HDR
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <fcntl.h>
> @@ -31,6 +34,45 @@
>  #include <unistd.h>
>  #include "igt_edid.h"
>  
> +/**
> + * SUBTEST: bpc-switch
> + * Description: Tests switching between different display output bpc modes
> + * Functionality: colorspace, hdr
> + *
> + * SUBTEST: bpc-switch-dpms
> + * Description: Tests switching between different display output bpc modes with dpms
> + * Functionality: colorspace, dpms, hdr
> + *
> + * SUBTEST: bpc-switch-suspend
> + * Description: Tests switching between different display output bpc modes with suspend
> + * Functionality: colorspace, hdr, suspend
> + *
> + * SUBTEST: invalid-hdr
> + * Description: Test to ensure HDR is not enabled on non-HDR panel
> + * Functionality: colorspace, hdr
> + *
> + * SUBTEST: invalid-metadata-sizes
> + * Description: Tests invalid HDR metadata sizes
> + * Functionality: colorspace, hdr
> + *
> + * SUBTEST: static-toggle-dpms
> + * Description: Tests static toggle with dpms
> + * Functionality: colorspace, dpms, hdr
> + *
> + * SUBTEST: static-toggle-suspend
> + * Description: Tests static toggle with suspend
> + * Functionality: colorspace, hdr, suspend
> + *
> + * SUBTEST: static-%s
> + * Description: Tests %arg[1].
> + * Functionality: colorspace, hdr
> + *
> + * arg[1]:
> + *
> + * @swap:                    swapping static HDR metadata
> + * @toggle:                  entering and exiting HDR mode
> + */
> +
>  IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>  
>  /* HDR EDID parsing. */
> @@ -213,28 +255,6 @@ static bool has_max_bpc(igt_output_t *output)
>  	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>  }
>  
> -/**
> - * SUBTEST: bpc-switch
> - * Description: Tests switching between different display output bpc modes
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: bpc-switch-dpms
> - * Description: Tests switching between different display output bpc modes with dpms
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, dpms, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: bpc-switch-suspend
> - * Description: Tests switching between different display output bpc modes with suspend
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr, suspend
> - * Mega feature: HDR
> - * Test category: functionality test
> - */
>  static void test_bpc_switch(data_t *data, uint32_t flags)
>  {
>  	igt_display_t *display = &data->display;
> @@ -588,47 +608,6 @@ static bool has_hdr(igt_output_t *output)
>  	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>  }
>  
> -/**
> - * SUBTEST: invalid-hdr
> - * Description: Test to ensure HDR is not enabled on non-HDR panel
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: invalid-metadata-sizes
> - * Description: Tests invalid HDR metadata sizes
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: static-toggle-dpms
> - * Description: Tests static toggle with dpms
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, dpms, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: static-toggle-suspend
> - * Description: Tests static toggle with suspend
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr, suspend
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * SUBTEST: static-%s
> - * Description: Tests %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: colorspace, hdr
> - * Mega feature: HDR
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @swap:                    swapping static HDR metadata
> - * @toggle:                  entering and exiting HDR mode
> - */
>  static void test_hdr(data_t *data, uint32_t flags)
>  {
>  	igt_display_t *display = &data->display;
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 017c2c195..0fe1d6ef9 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -27,6 +27,10 @@
>   * Category: Display
>   * Description: Make sure all modesets are rejected when the requested mode is
>   *              invalid
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <limits.h>
> @@ -36,10 +40,6 @@
>   * SUBTEST: %s
>   * Description: Make sure all modesets are rejected when the requested mode
>   *              (%arg[1]) is invalid
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 9ada6d5ea..8f10eee5d 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -30,8 +30,11 @@
>   * TEST: kms lease
>   * Category: Display
>   * Description: Test of CreateLease.
> + * Driver requirement: i915, xe
> + * Functionality: lease
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> -
>  #include "igt.h"
>  #include <stdlib.h>
>  #include <stdio.h>
> @@ -53,155 +56,71 @@
>  /**
>   * SUBTEST: atomic_implicit_crtc
>   * Description: Negative test by using a different crtc with atomic ioctl
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: cursor_implicit_plane
>   * Description: Negative test by using a non-primary plane with setcursor ioctl
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: empty_lease
>   * Description: Check that creating an empty lease works
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: implicit-plane-lease
>   * Description: Tests the implicitly added planes.
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid-create-leases
>   * Description: Tests error handling while creating invalid corner-cases for
>   *              create-lease ioctl
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease-uevent
>   * Description: Tests all the uevent cases
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_again
>   * Description: Tests leasing objects more than once
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_get
>   * Description: Tests getting the required contents of a lease
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_invalid_connector
>   * Description: Tests leasing an invalid connector
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_invalid_crtc
>   * Description: Tests leasing an invalid crtc
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_invalid_plane
>   * Description: Tests leasing an invalid plane
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_revoke
>   * Description: Tests revocation of lease
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_unleased_connector
>   * Description: Negative test by trying to use an unleased connector
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lease_unleased_crtc
>   * Description: Negative test by trying to use an unleased crtc
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: lessee_list
>   * Description: Check if listed lease is same as created one
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: master-vs-lease
>   * Description: Tests the drop/set_master interactions.
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: multimaster-lease
>   * Description: Tests that the 2nd master can only create leases while being
>   *              active master, and that leases on the first master don't prevent
>   *              lease creation for the 2nd master.
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: page_flip_implicit_plane
>   * Description: Negative test by using a non-primary plane with the page flip ioctl
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: possible-crtcs-filtering
>   * Description: Tests that  possible_crtcs logically match between master and
>   *              lease, and that the values are correctly renumbered on the lease
>   *              side.
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: setcrtc_implicit_plane
>   * Description: Negative test by using a non-primary plane with the setcrtc ioctl
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: simple_lease
>   * Description: Check if create lease ioctl call works
> - * Driver requirement: i915, xe
> - * Functionality: lease
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test of CreateLease.");
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index a968a3513..9da689538 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -24,20 +24,22 @@
>   *  Karthik B S <karthik.b.s@intel.com>
>   */
>  
> -#include "igt.h"
>  /**
>   * TEST: kms multipipe modeset
>   * Category: Display
>   * Description: Test simultaneous modeset on all the supported pipes
> - *
> - * SUBTEST: basic-max-pipe-crc-check
> - * Description: Verify if simultaneous modesets on all the supported pipes is
> - *              successful. Validate using CRC verification
>   * Driver requirement: i915, xe
>   * Functionality: kms_core
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: basic-max-pipe-crc-check
> + * Description: Verify if simultaneous modesets on all the supported pipes is
> + *              successful. Validate using CRC verification
> + */
>  
>  IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
>  
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index a583e1435..347b146e8 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -22,28 +22,26 @@
>   *
>   */
>  
> -#include "igt.h"
> -#include <limits.h>
> -#include <math.h>
> -#include <sys/stat.h>
>  /**
>   * TEST: kms panel fitting
>   * Category: Display
>   * Description: Test display panel fitting
> - *
> - * SUBTEST: atomic-fastset
> - * Description: Tests panel fitting usages with atomic fastset.
>   * Driver requirement: i915, xe
>   * Functionality: eDP, panel_fitting, scaling
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +#include <limits.h>
> +#include <math.h>
> +#include <sys/stat.h>
> +
> +/**
> + * SUBTEST: atomic-fastset
> + * Description: Tests panel fitting usages with atomic fastset.
>   *
>   * SUBTEST: legacy
>   * Description: Tests panel fitting usages with legacy style commit.
> - * Driver requirement: i915, xe
> - * Functionality: eDP, panel_fitting, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test display panel fitting");
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index d980c3786..30181b677 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -26,8 +26,11 @@
>   * TEST: kms pipe crc basic
>   * Category: Display
>   * Description: Tests behaviour of CRC
> + * Driver requirement: i915, xe
> + * Functionality: crc
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
> -
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include <errno.h>
> @@ -36,6 +39,44 @@
>  #include <string.h>
>  #include <fcntl.h>
>  
> +/**
> + * SUBTEST: disable-crc-after-crtc
> + * Description: Check that disabling CRCs on a CRTC after having disabled the
> + *              CRTC does not cause issues.
> + *
> + * SUBTEST: bad-source
> + * Description: Tests error handling when the bad source is set.
> + *
> + * SUBTEST: read-crc
> + * Description: Test for pipe CRC reads
> + *
> + * SUBTEST: read-crc-frame-sequence
> + * Description: Tests the pipe CRC read and ensure frame sequence
> + *
> + * SUBTEST: nonblocking-crc
> + * Description: Test for O_NONBLOCK CRC reads
> + *
> + * SUBTEST: nonblocking-crc-frame-sequence
> + * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
> + *
> + * SUBTEST: suspend-read-crc
> + * Description: Suspend test for pipe CRC reads
> + * Functionality: crc, suspend
> + *
> + * SUBTEST: hang-read-crc
> + * Description: Hang test for pipe CRC read
> + * Functionality: crc, hang
> + *
> + * SUBTEST: compare-crc-sanitycheck-%s
> + * Description: Basic sanity check for CRC mismatches with %arg[1]
> + * Functionality: crc, pixel_format
> + *
> + * arg[1]:
> + *
> + * @xr24:	XR24 format
> + * @nv12:	NV12 format
> + */
> +
>  static bool extended;
>  static enum pipe active_pipes[IGT_MAX_PIPES];
>  static uint32_t last_pipe;
> @@ -65,14 +106,6 @@ static bool simulation_constraint(enum pipe pipe)
>  	return false;
>  }
>  
> -/**
> - * SUBTEST: bad-source
> - * Description: Tests error handling when the bad source is set.
> - * Driver requirement: i915, xe
> - * Functionality: crc
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_bad_source(data_t *data)
>  {
>  	errno = 0;
> @@ -94,49 +127,6 @@ enum {
>  	TEST_HANG = 1 << 3,
>  };
>  
> -/**
> - * SUBTEST: read-crc
> - * Description: Test for pipe CRC reads
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: read-crc-frame-sequence
> - * Description: Tests the pipe CRC read and ensure frame sequence
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: nonblocking-crc
> - * Description: Test for O_NONBLOCK CRC reads
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: nonblocking-crc-frame-sequence
> - * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: suspend-read-crc
> - * Description: Suspend test for pipe CRC reads
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc, suspend
> - * Mega feature: General Display Features
> - *
> - * SUBTEST: hang-read-crc
> - * Description: Hang test for pipe CRC read
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc, hang
> - * Mega feature: General Display Features
> - */
>  static void test_read_crc(data_t *data, enum pipe pipe,
>  			  igt_output_t *output, unsigned flags)
>  {
> @@ -234,20 +224,6 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>  	igt_display_commit(display);
>  }
>  
> -/**
> - * SUBTEST: compare-crc-sanitycheck-%s
> - * Description: Basic sanity check for CRC mismatches with %arg[1]
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: crc, pixel_format
> - * Mega feature: General Display Features
> - *
> - * arg[1]:
> - *
> - * @xr24:	XR24 format
> - * @nv12:	NV12 format
> - */
> -
>  /*
>   * CRC-sanity test, to make sure there would be no CRC mismatches
>   *
> @@ -313,15 +289,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
>  	igt_remove_fb(data->drm_fd, &fb1);
>  }
>  
> -/**
> - * SUBTEST: disable-crc-after-crtc
> - * Description: Check that disabling CRCs on a CRTC after having disabled the
> - *              CRTC does not cause issues.
> - * Driver requirement: i915, xe
> - * Functionality: crc
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
>  					igt_output_t *output)
>  {
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9a515559c..6511e55ec 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -28,6 +28,9 @@
>   * TEST: kms plane
>   * Category: Display
>   * Description: Testes for KMS Plane
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "igt_vec.h"
> @@ -37,6 +40,55 @@
>  #include <string.h>
>  #include "xe/xe_query.h"
>  
> +/**
> + * SUBTEST: plane-position-%s
> + * Description: Verify plane position using two planes to create a %arg[1]
> + * Functionality: plane
> + *
> + * SUBTEST: plane-position-hole-dpms
> + * Description: Verify plane position using two planes to create a partially
> + *              covered screen and check for DPMS
> + * Functionality: dpms, plane
> + *
> + * arg[1]:
> + *
> + * @covered:           fully covered screen
> + * @hole:              partially covered screen
> + */
> +
> +/**
> + * SUBTEST: plane-panning-%s
> + * Description: Verify plane panning at %arg[1] using primary plane
> + * Functionality: plane
> + *
> + * SUBTEST: plane-panning-bottom-right-suspend
> + * Description: Verify plane panning at bottom-right position with suspend using
> + *              primary plane
> + * Functionality: plane, suspend
> + *
> + * arg[1]:
> + *
> + * @bottom-right:               bottom-right position
> + * @top-left:                   top-left position
> + */
> +
> +/**
> + * SUBTEST: pixel-%s
> + * Description: verify the pixel formats for given plane and pipe
> + * Functionality: pixel_format, plane
> + *
> + * arg[1]:
> + *
> + * @format:
> + * @format-source-clamping:          with source clamping
> + */
> +
> +/**
> + * SUBTEST: invalid-pixel-format-settings
> + * Description: verify invalid settings for pixel format are not accepted
> + * Functionality: pixel_format, plane
> + */
> +
>  /*
>   * Throw away enough lsbs in pixel formats tests
>   * to get a match despite some differences between
> @@ -284,27 +336,6 @@ test_plane_position_with_output(data_t *data,
>  	igt_remove_fb(data->drm_fd, &sprite_fb);
>  }
>  
> -/**
> - * SUBTEST: plane-position-%s
> - * Description: Verify plane position using two planes to create a %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-position-hole-dpms
> - * Description: Verify plane position using two planes to create a partially
> - *              covered screen and check for DPMS
> - * Driver requirement: i915, xe
> - * Functionality: dpms, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @covered:           fully covered screen
> - * @hole:              partially covered screen
> - */
>  static void
>  test_plane_position(data_t *data, enum pipe pipe)
>  {
> @@ -413,27 +444,6 @@ test_plane_panning_with_output(data_t *data,
>  	igt_remove_fb(data->drm_fd, &primary_fb);
>  }
>  
> -/**
> - * SUBTEST: plane-panning-%s
> - * Description: Verify plane panning at %arg[1] using primary plane
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-panning-bottom-right-suspend
> - * Description: Verify plane panning at bottom-right position with suspend using
> - *              primary plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, suspend
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @bottom-right:               bottom-right position
> - * @top-left:                   top-left position
> - */
>  static void
>  test_plane_panning(data_t *data, enum pipe pipe)
>  {
> @@ -1159,19 +1169,6 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
>  	return index != 0 && index != 3 && index != 5;
>  }
>  
> -/**
> - * SUBTEST: pixel-%s
> - * Description: verify the pixel formats for given plane and pipe
> - * Driver requirement: i915, xe
> - * Functionality: pixel_format, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @format:
> - * @format-source-clamping:          with source clamping
> - */
>  static void
>  test_pixel_formats(data_t *data, enum pipe pipe)
>  {
> @@ -1228,14 +1225,6 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_assert_f(result, "At least one CRC mismatch happened\n");
>  }
>  
> -/**
> - * SUBTEST: invalid-pixel-format-settings
> - * Description: verify invalid settings for pixel format are not accepted
> - * Driver requirement: i915, xe
> - * Functionality: pixel_format, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_invalid_settings(data_t *data)
>  {
>  	enum pipe pipe = PIPE_A;
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index bff624ebe..81a3f7122 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -28,9 +28,44 @@
>   * TEST: kms plane alpha blend
>   * Category: Display
>   * Description: Test plane alpha and blending mode properties
> + * Driver requirement: i915, xe
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  
> +/**
> + * SUBTEST: alpha-%s
> + * Description: Test to %arg[1]
> + *
> + * arg[1]:
> + *
> + * @7efc:                validate alpha values 0x7e and 0xfc are swappable on
> + *                       pre-multiplied blend mode.
> + * @basic:               basic plane alpha properties.
> + * @opaque-fb:           alpha properties with opaque fb.
> + * @transparent-fb:      alpha property with transparent fb.
> + */
> +
> +/**
> + * SUBTEST: coverage-vs-premult-vs-constant
> + * Description: Tests pipe coverage blending properties.
> + *
> + * SUBTEST: coverage-7efc
> + * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
> + *              plane_alpha are swappable on coverage blend mode.
> + *
> + * SUBTEST: constant-alpha-%s
> + * Description: Tests plane alpha and blending properties with %arg[1].
> + *
> + * arg[1]:
> + *
> + * @max:            maximum alpha value
> + * @mid:            medium  alpha value
> + * @min:            minimum alpha value
> + */
> +
>  IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
>  
>  static bool extended;
> @@ -482,52 +517,6 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
>  	igt_pipe_crc_stop(data->pipe_crc);
>  }
>  
> -/**
> - * SUBTEST: alpha-%s
> - * Description: Test to %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @7efc:                validate alpha values 0x7e and 0xfc are swappable on
> - *                       pre-multiplied blend mode.
> - * @basic:               basic plane alpha properties.
> - * @opaque-fb:           alpha properties with opaque fb.
> - * @transparent-fb:      alpha property with transparent fb.
> - */
> -
> -/**
> - * SUBTEST: coverage-vs-premult-vs-constant
> - * Description: Tests pipe coverage blending properties.
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: coverage-7efc
> - * Description: Uses alpha values 0x7e and 0xfc to validate fg.alpha and
> - *              plane_alpha are swappable on coverage blend mode.
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: constant-alpha-%s
> - * Description: Tests plane alpha and blending properties with %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @max:            maximum alpha value
> - * @mid:            medium  alpha value
> - * @min:            minimum alpha value
> - */
>  static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *output,
>  				    bool blend, bool must_multiply,
>  				    void(*test)(data_t *, enum pipe, igt_plane_t *))
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 22c5a709d..6c9d7cfdf 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -20,34 +20,27 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include "igt.h"
> -
>  /**
>   * TEST: kms plane cursor
>   * Category: Display
>   * Description: Tests cursor interactions with primary and overlay planes.
> - *
> - * SUBTEST: overlay
> - * Description: Tests atomic cursor positioning on primary plane and overlay plane
>   * Driver requirement: i915, xe
>   * Functionality: cursor, plane
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: overlay
> + * Description: Tests atomic cursor positioning on primary plane and overlay plane
>   *
>   * SUBTEST: primary
>   * Description: Tests atomic cursor positioning on primary plane
> - * Driver requirement: i915, xe
> - * Functionality: cursor, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: viewport
>   * Description: Tests atomic cursor positioning on primary plane and overlay plane
>   *              with buffer larger than viewport used for display
> - * Driver requirement: i915, xe
> - * Functionality: cursor, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  /*
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index d9a175c9b..06b1c93bf 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -27,6 +27,9 @@
>   * Category: Display
>   * Description: Test atomic mode setting with a plane by switching between high
>   *              and low resolutions
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "drmtest.h"
> @@ -36,6 +39,25 @@
>  #include <string.h>
>  #include <time.h>
>  
> +/**
> + * SUBTEST: tiling-none
> + * Description: Tests the visibility of the planes when switching between high
> + *              and low resolution with Linear buffer (no tiling)
> + * Functionality: plane
> + *
> + * SUBTEST: tiling-%s
> + * Description: Tests the visibility of the planes when switching between high
> + *              and low resolution with %arg[1]
> + * Functionality: plane, tiling
> + *
> + * arg[1]:
> + *
> + * @4:           4-tiling
> + * @x:           x-tiling
> + * @y:           y-tiling
> + * @yf:          yf-tiling
> + */
> +
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between high and low resolutions");
>  
>  #define SDR_PLANE_BASE 3
> @@ -267,30 +289,6 @@ static void test_cleanup(data_t *data)
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>  
> -/**
> - * SUBTEST: tiling-none
> - * Description: Tests the visibility of the planes when switching between high
> - *              and low resolution with Linear buffer (no tiling)
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: tiling-%s
> - * Description: Tests the visibility of the planes when switching between high
> - *              and low resolution with %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4:           4-tiling
> - * @x:           x-tiling
> - * @y:           y-tiling
> - * @yf:          yf-tiling
> - */
>  static void run_test(data_t *data, uint64_t modifier)
>  {
>  	enum pipe pipe;
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index b1ae35161..f0910ac61 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -26,6 +26,9 @@
>   * TEST: kms plane multiple
>   * Category: Display
>   * Description: Test atomic mode setting with multiple planes.
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "drmtest.h"
> @@ -35,6 +38,27 @@
>  #include <string.h>
>  #include <time.h>
>  
> +/**
> + * SUBTEST: tiling-none
> + * Description: Check that the kernel handles atomic updates of multiple planes
> + *              correctly by changing their geometry and making sure the changes
> + *              are reflected immediately after each commit.
> + * Functionality: plane
> + *
> + * SUBTEST: tiling-%s
> + * Description: Check that the kernel handles atomic updates of multiple planes
> + *              correctly by changing their geometry and making sure the changes
> + *              are reflected immediately after each commit.
> + * Functionality: plane, tiling
> + *
> + * arg[1]:
> + *
> + * @4:           4-tiling
> + * @x:           x-tiling
> + * @y:           y-tiling
> + * @yf:          yf-tiling
> + */
> +
>  IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
>  
>  #define SIZE_PLANE      256
> @@ -378,32 +402,6 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
>  					n_planes, modifier);
>  }
>  
> -/**
> - * SUBTEST: tiling-none
> - * Description: Check that the kernel handles atomic updates of multiple planes
> - *              correctly by changing their geometry and making sure the changes
> - *              are reflected immediately after each commit.
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: tiling-%s
> - * Description: Check that the kernel handles atomic updates of multiple planes
> - *              correctly by changing their geometry and making sure the changes
> - *              are reflected immediately after each commit.
> - * Driver requirement: i915, xe
> - * Functionality: plane, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4:           4-tiling
> - * @x:           x-tiling
> - * @y:           y-tiling
> - * @yf:          yf-tiling
> - */
>  static void run_test(data_t *data, uint64_t modifier)
>  {
>  	enum pipe pipe;
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 299f55960..1cfc70da6 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -26,11 +26,129 @@
>   * TEST: kms plane scaling
>   * Category: Display
>   * Description: Test display plane scaling
> + * Driver requirement: i915, xe
> + * Functionality: plane, scaling
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "igt_vec.h"
>  #include <math.h>
>  
> +/**
> + * SUBTEST: plane-scaler-with-modifiers-unity-scaling
> + * Description: Tests scaling with modifiers, unity scaling.
> + *
> + * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
> + * Description: Tests scaling with clipping and clamping, modifiers.
> + *
> + * SUBTEST: plane-upscale-with-modifiers-%s
> + * Description: Tests upscaling with modifiers %arg[1].
> + *
> + * SUBTEST: plane-upscale-with-rotation-%s
> + * Description: Tests upscaling with rotation %arg[1].
> + *
> + * SUBTEST: plane-upscale-with-pixel-format-%s
> + * Description: Tests upscaling with pixel formats %arg[1].
> + * Functionality: pixel_formats, plane, scaling
> + *
> + * SUBTEST: planes-upscale-%s
> + * Description: Tests upscaling of 2 planes %arg[1].
> + *
> + * arg[1]:
> + *
> + * @20x20:          from 20x20 fb
> + * @factor-0-25:    for 0.25 scaling factor
> + */
> +
> +/**
> + * SUBTEST: plane-downscale-with-modifiers-factor-%s
> + * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
> + *
> + * SUBTEST: plane-downscale-with-rotation-factor-%s
> + * Description: Tests downscaling with rotation for %arg[1] scaling factor.
> + *
> + * SUBTEST: plane-downscale-with-pixel-format-factor-%s
> + * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
> + * Functionality: pixel_formats, plane, scaling
> + *
> + * SUBTEST: planes-downscale-factor-%s
> + * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
> + *
> + * arg[1]:
> + *
> + * @0-25:   0.25
> + * @0-5:    0.5
> + * @0-75:   0.75
> + */
> +
> +/**
> + * SUBTEST: plane-scaler-with-rotation-unity-scaling
> + * Description: Tests scaling with rotation, unity scaling.
> + *
> + * SUBTEST: plane-scaler-with-clipping-clamping-rotation
> + * Description: Tests scaling with clipping and clamping, rotation.
> + *
> + * SUBTEST: plane-scaler-with-pixel-format-unity-scaling
> + * Description: Tests scaling with pixel formats, unity scaling.
> + * Functionality: pixel_formats, plane, scaling
> + *
> + * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
> + * Description: Tests scaling with clipping and clamping, pixel formats.
> + * Functionality: pixel_formats, plane, scaling
> + *
> + * SUBTEST: planes-scaler-unity-scaling
> + * Description: Tests scaling of 2 planes, unity scaling.
> + *
> + * SUBTEST: invalid-num-scalers
> + * Description: Negative test for number of scalers per pipe.
> + *
> + * SUBTEST: 2x-scaler-multi-pipe
> + * Description: Tests scaling with multi-pipe.
> + *
> + * SUBTEST: invalid-parameters
> + * Description: Test parameters which should not be accepted
> + *
> + * SUBTEST: intel-max-src-size
> + * Description: Test for validating max source size.
> + */
> +
> +/**
> + * SUBTEST: planes-downscale-factor-%s-%s
> + * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
> + *              of 2 planes.
> + *
> + * arg[1]:
> + *
> + * @0-25:  0.25
> + * @0-5:   0.5
> + * @0-75:  0.75
> + *
> + * arg[2]:
> + *
> + * @upscale-20x20:           upscale 20x20
> + * @upscale-factor-0-25:     scaling factor 0.25
> + * @unity-scaling:           Unity
> + */
> +
> +/**
> + * SUBTEST: planes-%s-downscale-factor-%s
> + * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
> + *              of 2 planes.
> + *
> + * arg[1]:
> + *
> + * @unity-scaling:           Unity
> + * @upscale-factor-0-25:     scaling factor 0.25
> + * @upscale-20x20:           upscale 20x20
> + *
> + * arg[2]:
> + *
> + * @0-25:  0.25
> + * @0-5:   0.5
> + * @0-75:  0.75
> + */
> +
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
>  
>  enum scaler_combo_test_type {
> @@ -529,48 +647,6 @@ static const uint64_t modifiers[] = {
>  	I915_FORMAT_MOD_4_TILED
>  };
>  
> -/**
> - * SUBTEST: plane-scaler-with-modifiers-unity-scaling
> - * Description: Tests scaling with modifiers, unity scaling.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-scaler-with-clipping-clamping-modifiers
> - * Description: Tests scaling with clipping and clamping, modifiers.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-upscale-with-modifiers-%s
> - * Description: Tests upscaling with modifiers %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @20x20:          from 20x20 fb
> - * @factor-0-25:    for 0.25 scaling factor
> - */
> -
> -/**
> - * SUBTEST: plane-downscale-with-modifiers-factor-%s
> - * Description: Tests downscaling with modifiers for %arg[1] scaling factor.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:   0.25
> - * @0-5:    0.5
> - * @0-75:   0.75
> - */
>  static void test_scaler_with_modifier_pipe(data_t *d,
>  					   int width, int height,
>  					   bool is_upscale,
> @@ -603,48 +679,6 @@ static void test_scaler_with_modifier_pipe(data_t *d,
>  	}
>  }
>  
> -/**
> - * SUBTEST: plane-scaler-with-rotation-unity-scaling
> - * Description: Tests scaling with rotation, unity scaling.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-scaler-with-clipping-clamping-rotation
> - * Description: Tests scaling with clipping and clamping, rotation.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-upscale-with-rotation-%s
> - * Description: Tests upscaling with rotation %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @20x20:          from 20x20 fb
> - * @factor-0-25:    for 0.25 scaling factor
> - */
> -
> -/**
> - * SUBTEST: plane-downscale-with-rotation-factor-%s
> - * Description: Tests downscaling with rotation for %arg[1] scaling factor.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:   0.25
> - * @0-5:    0.5
> - * @0-75:   0.75
> - */
>  static void test_scaler_with_rotation_pipe(data_t *d,
>  					   int width, int height,
>  					   bool is_upscale,
> @@ -678,48 +712,6 @@ static void test_scaler_with_rotation_pipe(data_t *d,
>  	}
>  }
>  
> -/**
> - * SUBTEST: plane-scaler-with-pixel-format-unity-scaling
> - * Description: Tests scaling with pixel formats, unity scaling.
> - * Driver requirement: i915, xe
> - * Functionality: pixel_formats, plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
> - * Description: Tests scaling with clipping and clamping, pixel formats.
> - * Driver requirement: i915, xe
> - * Functionality: pixel_formats, plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: plane-upscale-with-pixel-format-%s
> - * Description: Tests upscaling with pixel formats %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: pixel_formats, plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @20x20:          from 20x20 fb
> - * @factor-0-25:    for 0.25 scaling factor
> - */
> -
> -/**
> - * SUBTEST: plane-downscale-with-pixel-format-factor-%s
> - * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
> - * Driver requirement: i915, xe
> - * Functionality: pixel_formats, plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:   0.25
> - * @0-5:    0.5
> - * @0-75:   0.75
> - */
>  static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
>  					       enum pipe pipe, igt_output_t *output)
>  {
> @@ -855,83 +847,6 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>  		      fb);
>  }
>  
> -/**
> - * SUBTEST: planes-downscale-factor-%s
> - * Description: Tests downscaling of 2 planes for %arg[1] scaling factor.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:  0.25
> - * @0-5:   0.5
> - * @0-75:  0.75
> - */
> -/**
> - * SUBTEST: planes-downscale-factor-%s-%s
> - * Description: Tests downscaling (scaling factor %arg[1]) and upscaling (%arg[2])
> - *              of 2 planes.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @0-25:  0.25
> - * @0-5:   0.5
> - * @0-75:  0.75
> - *
> - * arg[2]:
> - *
> - * @upscale-20x20:           upscale 20x20
> - * @upscale-factor-0-25:     scaling factor 0.25
> - * @unity-scaling:           Unity
> - */
> -/**
> - * SUBTEST: planes-scaler-unity-scaling
> - * Description: Tests scaling of 2 planes, unity scaling.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: planes-upscale-%s
> - * Description: Tests upscaling of 2 planes %arg[1].
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @20x20:          from 20x20 fb
> - * @factor-0-25:    for 0.25 scaling factor
> - */
> -/**
> - * SUBTEST: planes-%s-downscale-factor-%s
> - * Description: Tests scaling (%arg[1]) and downscaling (scaling factor %arg[2])
> - *              of 2 planes.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @unity-scaling:           Unity
> - * @upscale-factor-0-25:     scaling factor 0.25
> - * @upscale-20x20:           upscale 20x20
> - *
> - * arg[2]:
> - *
> - * @0-25:  0.25
> - * @0-5:   0.5
> - * @0-75:  0.75
> - */
> -
>  static void
>  test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  			  enum pipe pipe, igt_output_t *output,
> @@ -990,14 +905,6 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  	cleanup_fbs(d);
>  }
>  
> -/**
> - * SUBTEST: invalid-num-scalers
> - * Description: Negative test for number of scalers per pipe.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void
>  test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>  {
> @@ -1063,14 +970,6 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>  	cleanup_fbs(d);
>  }
>  
> -/**
> - * SUBTEST: 2x-scaler-multi-pipe
> - * Description: Tests scaling with multi-pipe.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_scaler_with_multi_pipe_plane(data_t *d)
>  {
>  	igt_display_t *display = &d->display;
> @@ -1155,14 +1054,6 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>  	igt_assert_eq(ret1 && ret2, 0);
>  }
>  
> -/**
> - * SUBTEST: invalid-parameters
> - * Description: Test parameters which should not be accepted
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void invalid_parameter_tests(data_t *d)
>  {
>  	enum pipe pipe = PIPE_A;
> @@ -1243,15 +1134,6 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
>  	return mode;
>  }
>  
> -/**
> - * SUBTEST: intel-max-src-size
> - * Description: Test for validating max source size.
> - * Driver requirement: i915, xe
> - * Functionality: plane, scaling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
>  /*
>   *	Max source/destination width/height for intel driver.
>   *	These numbers are coming from
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 14e44869d..36cb7f601 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -21,6 +21,14 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: kms prime
> + * Category: Display
> + * Description: Prime tests, focusing on KMS side
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_debugfs.h"
> @@ -30,32 +38,20 @@
>  #include <sys/ioctl.h>
>  #include <sys/poll.h>
>  #include <time.h>
> +
>  /**
> - * TEST: kms prime
> - * Category: Display
> - * Description: Prime tests, focusing on KMS side
> - *
>   * SUBTEST: D3hot
>   * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
> - * Driver requirement: i915, xe
>   * Functionality: hybrid, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: basic-modeset-hybrid
>   * Description: Basic modeset on the one device when the other device is active
> - * Driver requirement: i915, xe
>   * Functionality: hybrid, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: basic-crc-%s
>   * Description: Make a dumb color buffer, export to another device and compare
>   *              the CRCs with a buffer native to that device
> - * Driver requirement: i915, xe
>   * Functionality: crc, hybrid, kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
> index c92525227..8ec9a2e6a 100644
> --- a/tests/kms_prop_blob.c
> +++ b/tests/kms_prop_blob.c
> @@ -29,6 +29,10 @@
>   * TEST: kms prop blob
>   * Category: Display
>   * Description: Tests behaviour of mass-data 'blob' properties.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <errno.h>
> @@ -36,6 +40,37 @@
>  #include <stdio.h>
>  #include <string.h>
>  
> +/**
> + * SUBTEST: basic
> + * Description: Test to ensure property support exists
> + *
> + * SUBTEST: blob-multiple
> + * Description: Test validates destroying multiple properties explicitly works as needed.
> + *
> + * SUBTEST: invalid-%s-%s
> + * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
> + *
> + * arg[1]:
> + *
> + * @get:            fetched
> + * @set:            set
> + *
> + * arg[2]:
> + *
> + * @prop:           blob object type
> + * @prop-any:       object of any type
> + */
> +
> +/**
> + * SUBTEST: blob-prop-%s
> + * Description: Tests validates the %arg[1] of the properties created.
> + *
> + * arg[1]:
> + *
> + * @core:        validity
> + * @lifetime:    lifetime
> + * @validate:    blob size
> + */
>  IGT_TEST_DESCRIPTION("Tests behaviour of mass-data 'blob' properties.");
>  
>  static const struct drm_mode_modeinfo test_mode_valid = {
> @@ -123,27 +158,6 @@ destroy_prop(int fd, uint32_t prop_id)
>  	return 0;
>  }
>  
> -/**
> - * SUBTEST: blob-multiple
> - * Description: Test validates destroying multiple properties explicitly works as needed.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: blob-prop-%s
> - * Description: Tests validates the %arg[1] of the properties created.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @core:        validity
> - * @lifetime:    lifetime
> - * @validate:    blob size
> - */
>  static void
>  test_validate(int fd)
>  {
> @@ -264,14 +278,6 @@ test_core(int fd)
>  	igt_assert_eq(validate_prop(fd, 0), ENOENT);
>  }
>  
> -/**
> - * SUBTEST: basic
> - * Description: Test to ensure property support exists
> - * Driver requirement: i915, xe
> - * Test category: functionality test
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - */
>  static void
>  test_basic(int fd)
>  {
> @@ -282,24 +288,6 @@ test_basic(int fd)
>  	igt_assert_eq(destroy_prop(fd, prop_id), 0);
>  }
>  
> -/**
> - * SUBTEST: invalid-%s-%s
> - * Description: Tests error handling when invalid properties are %ar[1] with %arg[2].
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @get:            fetched
> - * @set:            set
> - *
> - * arg[2]:
> - *
> - * @prop:           blob object type
> - * @prop-any:       object of any type
> - */
>  static void prop_tests(int fd)
>  {
>  	struct drm_mode_obj_get_properties get_props = {};
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 328436622..3b5b3c95e 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -21,6 +21,15 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: kms properties
> + * Category: Display
> + * Description: Test to validate the properties of all planes, crtc and connectors
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "drmtest.h"
>  #include <errno.h>
> @@ -28,17 +37,10 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <time.h>
> +
>  /**
> - * TEST: kms properties
> - * Category: Display
> - * Description: Test to validate the properties of all planes, crtc and connectors
> - *
>   * SUBTEST: %s-properties-%s
>   * Description: Tests %arg[1] properties with %arg[2] commit
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -53,6 +55,16 @@
>   * @legacy:          legacy
>   */
>  
> +/**
> + * SUBTEST: get_properties-sanity-%s
> + * Description: Test validates the properties of all planes, crtc and connectors
> + *              with %arg[1] commit
> + *
> + * arg[1]:
> + *
> + * @atomic:          atomic
> + * @non-atomic:      legacy
> + */
>  
>  struct additional_test {
>  	const char *name;
> @@ -712,20 +724,6 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
>  	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
>  }
>  
> -/**
> - * SUBTEST: get_properties-sanity-%s
> - * Description: Test validates the properties of all planes, crtc and connectors
> - *              with %arg[1] commit
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @atomic:          atomic
> - * @non-atomic:      legacy
> - */
>  static void get_prop_sanity(igt_display_t *display, bool atomic)
>  {
>  	int fd = display->drm_fd;
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index 6c6cdffba..9b135c008 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -21,6 +21,16 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: kms rmfb
> + * Category: Display
> + * Description: This tests rmfb and close-fd behavior. In these casesthe
> + *              framebuffers should be removed from the crtc.
> + * Driver requirement: i915, xe
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include "drmtest.h"
>  #include <errno.h>
> @@ -28,27 +38,15 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <time.h>
> +
>  /**
> - * TEST: kms rmfb
> - * Category: Display
> - * Description: This tests rmfb and close-fd behavior. In these casesthe
> - *              framebuffers should be removed from the crtc.
> - *
>   * SUBTEST: close-fd
>   * Description: RMFB is supposed to free the framebuffers from any and all planes
>   *              so test this and make sure it works with fd close and reopen.
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: rmfb-ioctl
>   * Description: RMFB is supposed to free the framebuffers from any and all planes
>   *              so test this and make sure it works.
> - * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  #ifndef DRM_CAP_CURSOR_WIDTH
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index f171fcd22..dec1c5619 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -26,11 +26,98 @@
>   * TEST: kms rotation crc
>   * Category: Display
>   * Description: Tests different rotations with different planes & formats
> + * Driver requirement: i915, xe
> + * Functionality: plane, rotation
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "igt_vec.h"
>  #include <math.h>
>  
> +/**
> + * SUBTEST: %s-rotation-180
> + * Description: Rotation test with 180 degree for %arg[1] planes
> + *
> + * arg[1]:
> + *
> + * @primary:    primary
> + * @sprite:     sprite
> + * @cursor:     cursor
> + */
> +
> +/**
> + * SUBTEST: %s-rotation-%d
> + * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
> + *
> + * arg[1]:
> + *
> + * @primary:    primary
> + * @sprite:     sprite
> + *
> + * arg[2].values: 90, 270
> + */
> +
> +/**
> + * SUBTEST: bad-pixel-format
> + * Description: Checking unsupported pixel format for gen9+ with 90 degree of rotation
> + *
> + * SUBTEST: bad-tiling
> + * Description: Checking unsupported tiling for gen9+ with 90 degree of rotation
> + * Functionality: plane, rotation, tiling
> + */
> +
> +/**
> + * SUBTEST: primary-%s-tiled-reflect-x-%d
> + * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> + * Functionality: plane, rotation, tiling
> + *
> + * arg[1]:
> + *
> + * @4:      4 tiling
> + * @x:      x tiling
> + * @y:      y tiling
> + * @yf:     yf tiling
> + *
> + * arg[2].values: 0, 180
> + */
> +
> +/**
> + * SUBTEST: sprite-rotation-90-pos-100-0
> + * Description: Rotation test with 90 degree for a plane of gen9+ with given position
> + *
> + * SUBTEST: primary-%s-tiled-reflect-x-%d
> + * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> + * Functionality: plane, rotation, tiling
> + *
> + * arg[1]:
> + *
> + * @y:      y tiling
> + * @yf:     yf tiling
> + *
> + * arg[2].values: 90, 270
> + */
> +
> +/**
> + * SUBTEST: multiplane-rotation
> + * Description: Rotation test on both planes by making them fully visible
> + *
> + * SUBTEST: multiplane-rotation-cropping-%s
> + * Description: Rotation test on both planes by cropping left/%arg[1] corner of
> + *              primary plane and right/%arg[1] corner of sprite plane
> + *
> + * arg[1]:
> + *
> + * @bottom:   bottom
> + * @top:      top
> + */
> +
> +/**
> + * SUBTEST: exhaust-fences
> + * Description: This test intends to check for fence leaks exhaustively
> + * Driver requirement: i915
> + */
> +
>  #define MAX_FENCES 32
>  #define MAXMULTIPLANESAMOUNT 2
>  #define TEST_MAX_WIDTH 640
> @@ -479,93 +566,6 @@ static bool test_format(data_t *data,
>  	return true;
>  }
>  
> -/**
> - * SUBTEST: %s-rotation-180
> - * Description: Rotation test with 180 degree for %arg[1] planes
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @primary:    primary
> - * @sprite:     sprite
> - * @cursor:     cursor
> - */
> -
> -/**
> - * SUBTEST: %s-rotation-%d
> - * Description: Rotation test with %arg[2] degree for %arg[1] planes of gen9+
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @primary:    primary
> - * @sprite:     sprite
> - *
> - * arg[2].values: 90, 270
> - */
> -
> -/**
> - * SUBTEST: bad-pixel-format
> - * Description: Checking unsupported pixel format for gen9+ with 90 degree of rotation
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: bad-tiling
> - * Description: Checking unsupported tiling for gen9+ with 90 degree of rotation
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
> -/**
> - * SUBTEST: primary-%s-tiled-reflect-x-%d
> - * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @4:      4 tiling
> - * @x:      x tiling
> - * @y:      y tiling
> - * @yf:     yf tiling
> - *
> - * arg[2].values: 0, 180
> - */
> -
> -/**
> - * SUBTEST: primary-%s-tiled-reflect-x-%d
> - * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation, tiling
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @y:      y tiling
> - * @yf:     yf tiling
> - *
> - * arg[2].values: 90, 270
> - *
> - * SUBTEST: sprite-rotation-90-pos-100-0
> - * Description: Rotation test with 90 degree for a plane of gen9+ with given position
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
>  {
>  	igt_display_t *display = &data->display;
> @@ -885,28 +885,6 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
>  	return true;
>  }
>  
> -/**
> - * SUBTEST: multiplane-rotation
> - * Description: Rotation test on both planes by making them fully visible
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * SUBTEST: multiplane-rotation-cropping-%s
> - * Description: Rotation test on both planes by cropping left/%arg[1] corner of
> - *              primary plane and right/%arg[1] corner of sprite plane
> - * Driver requirement: i915, xe
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @bottom:   bottom
> - * @top:      top
> - */
> -
>  /*
>   * Here is pipe parameter which is now used only for first pipe.
>   * It is left here if this test ever was wanted to be run on
> @@ -1104,14 +1082,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>  	igt_require_f(found, "No valid pipe/output combo found.\n");
>  }
>  
> -/**
> - * SUBTEST: exhaust-fences
> - * Description: This test intends to check for fence leaks exhaustively
> - * Driver requirement: i915
> - * Functionality: plane, rotation
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
>  static void test_plane_rotation_exhaust_fences(data_t *data,
>  					       enum pipe pipe,
>  					       igt_output_t *output,
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index bd7ed7e56..cfb79e7c6 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -24,18 +24,20 @@
>   *     Swati Sharma <swati2.sharma@intel.com>
>   */
>  
> -#include "igt.h"
>  /**
>   * TEST: kms scaling modes
>   * Category: Display
>   * Description: Test display scaling modes
> - *
> - * SUBTEST: scaling-mode-%s
> - * Description: Tests %arg[1] display scaling mode
>   * Driver requirement: i915, xe
>   * Functionality: eDP, plane, scaling
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: scaling-mode-%s
> + * Description: Tests %arg[1] display scaling mode
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
> index 080ffdf2c..a65c76cb4 100644
> --- a/tests/kms_selftest.c
> +++ b/tests/kms_selftest.c
> @@ -21,19 +21,21 @@
>   * IN THE SOFTWARE.
>   */
>  
> -#include "igt.h"
> -#include "igt_kmod.h"
>  /**
>   * TEST: kms selftest
>   * Category: Display
>   * Description: Basic sanity check of KMS selftests.
> - *
> - * SUBTEST: %s
> - * Description: Basic sanity check of KMS selftest %arg[1].
>   * Driver requirement: i915, xe
>   * Functionality: kms_core
>   * Mega feature: General Display Features
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +/**
> + * SUBTEST: %s
> + * Description: Basic sanity check of KMS selftest %arg[1].
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9476203e9..f1dcb13be 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -31,6 +31,10 @@
>   * TEST: kms sequence
>   * Category: Display
>   * Description: Test CrtcGetSequence and CrtcQueueSequence.
> + * Driver requirement: i915, xe
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include <stdlib.h>
> @@ -47,6 +51,28 @@
>  
>  #include <drm.h>
>  
> +/**
> + * SUBTEST: get-%s
> + * Description: This is a test of drmCrtcGetSequence with %arg[1]
> + *
> + * arg[1]:
> + *
> + * @busy:         busy
> + * @forked:       forked bo
> + * @forked-busy:  forked bo & busy
> + * @idle:         idle
> + */
> +
> +/**
> + * SUBTEST: queue-%s
> + * Description: This is a test of drmCrtcQueueSequence with %arg[1]
> + *
> + * arg[1]:
> + *
> + * @busy:         busy
> + * @idle:         idle
> + */
> +
>  IGT_TEST_DESCRIPTION("Test CrtcGetSequence and CrtcQueueSequence.");
>  
>  typedef struct {
> @@ -141,35 +167,6 @@ static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
>  	return err;
>  }
>  
> -/**
> - * SUBTEST: get-%s
> - * Description: This is a test of drmCrtcGetSequence with %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @busy:         busy
> - * @forked:       forked bo
> - * @forked-busy:  forked bo & busy
> - * @idle:         idle
> - */
> -
> -/**
> - * SUBTEST: queue-%s
> - * Description: This is a test of drmCrtcQueueSequence with %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
> - *
> - * @busy:         busy
> - * @idle:         idle
> - */
>  static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
>  {
>  	int nchildren =
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 32a6fb690..e613fb464 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -20,6 +20,17 @@
>   * Authors:
>   *    Imre Deak <imre.deak@intel.com>
>   */
> +
> +/**
> + * TEST: kms setmode
> + * Category: Display
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "config.h"
>  
>  #include "igt.h"
> @@ -31,59 +42,31 @@
>  #include <sys/time.h>
>  #include <math.h>
>  #include "xe/xe_query.h"
> +
>  /**
> - * TEST: kms setmode
> - * Category: Display
> - * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> - *              combinations
> - *
>   * SUBTEST: basic
>   * Description: Tests the vblank timing by iterating through all valid crtc/connector
>   *              combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: basic-clone-single-crtc
>   * Description: Tests the mode by cloning the single crtc by iterating through all
>   *              valid crtc/connector combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: clone-exclusive-crtc
>   * Description: Tests the mode by cloning the exclusive crtc by iterating through
>   *              all valid crtc/connector combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid-clone-exclusive-crtc
>   * Description: Tests the mode by cloning the exclusive crtc by iterating through
>   *              all invalid crtc/connector combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid-clone-single-crtc
>   * Description: Tests the mode by cloning the single crtc by iterating through all
>   *              invalid crtc/connector combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid-clone-single-crtc-stealing
>   * Description: Tests the stealing mode by cloning the single crtc by iterating
>   *              through all invalid crtc/connector combinations
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  #define MAX_CONNECTORS  10
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index ee47a024e..a070bbf01 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -20,26 +20,29 @@
>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>   * IN THE SOFTWARE.
>   */
> +
> +/**
> + * TEST: kms sysfs edid timing
> + * Category: Display
> + * Description: Test to check the time it takes to reprobe each connector.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  
>  #include <dirent.h>
>  #include <fcntl.h>
>  #include <sys/stat.h>
> +
>  /**
> - * TEST: kms sysfs edid timing
> - * Category: Display
> - * Description: Test to check the time it takes to reprobe each connector.
> - *
>   * SUBTEST:
>   * Description: This test checks the time it takes to reprobe each connector and
>   *              fails if either the time it takes for one reprobe is too long or
>   *              if the mean time it takes to reprobe one connector is too long.
>   *              Additionally, make sure that the mean time for all connectors is
>   *              not too long.
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  #define THRESHOLD_PER_CONNECTOR		150
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 519c3754c..1a32574c7 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -40,6 +40,9 @@
>   * TEST: kms tiled display
>   * Category: Display
>   * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + * Test category: functionality test
>   */
>  #include "igt.h"
>  #include "poll.h"
> @@ -51,18 +54,12 @@
>   * SUBTEST: basic-test-pattern
>   * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
>   *              for all tiled CRTCs in one vblank (executes on real panel).
> - * Driver requirement: i915, xe
>   * Functionality: tiled_display
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: basic-test-pattern-with-chamelium
>   * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
>   *              for all tiled CRTCs in one vblank (executes on chamelium).
> - * Driver requirement: i915, xe
>   * Functionality: chamelium, tiled_display
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index 67dbb242e..ae3a5661e 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -22,19 +22,21 @@
>   *
>   */
>  
> -#include "igt.h"
>  /**
>   * TEST: kms tv load detect
>   * Category: Display
>   * Description: Test to check tv load detection.
> - *
> - * SUBTEST: load-detect
> - * Description: Check tv load detection works correctly.
>   * Driver requirement: i915, xe
>   * Functionality: obsolete
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
> +#include "igt.h"
> +
> +/**
> + * SUBTEST: load-detect
> + * Description: Check tv load detection works correctly.
> + */
>  
>  IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
>  
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8aa43a929..8d424d6fd 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -21,6 +21,15 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: kms universal plane
> + * Category: Display
> + * Description: Check pageflip & modeset on universal plane
> + * Driver requirement: i915, xe
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <errno.h>
>  #include <stdbool.h>
> @@ -29,31 +38,16 @@
>  #include <fcntl.h>
>  
>  /**
> - * TEST: kms universal plane
> - * Category: Display
> - * Description: Check pageflip & modeset on universal plane
> - *
>   * SUBTEST: cursor-fb-leak-pipe-%s
>   * Description: Check for cursor leaks after performing cursor operations on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: cursor, plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: disable-primary-vs-flip-pipe-%s
>   * Description: Check pageflips while primary plane is disabled before IOCTL or
>   *              between IOCTL and pageflip execution on %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
>   * Description: Check if pageflip succeeds in windowed setting on %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> @@ -70,10 +64,6 @@
>  /**
>   * SUBTEST: universal-plane-pipe-%s-%s
>   * Description: Check %arg[2] on %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: plane
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 33e933c22..79cf024ed 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -26,6 +26,15 @@
>   * This is a test of performance of drmWaitVblank.
>   */
>  
> +/**
> + * TEST: kms vblank
> + * Category: Display
> + * Description: Test speed of WaitVblank.
> + * Driver requirement: i915, xe
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include "igt.h"
>  #include <stdlib.h>
>  #include <stdio.h>
> @@ -40,97 +49,38 @@
>  #include <sys/wait.h>
>  
>  #include <drm.h>
> +
>  /**
> - * TEST: kms vblank
> - * Category: Display
> - * Description: Test speed of WaitVblank.
> - *
>   * SUBTEST: crtc-id
>   * Description: check the Vblank and flip events works with given crtc id
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: invalid
>   * Description: Negative test for vblank request
> - * Driver requirement: i915, xe
> - * Functionality: vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - */
> -
> -/**
> + *
>   * SUBTEST: pipe-%s-ts-continuation-dpms-rpm
>   * Description: Test TS continuty with DPMS & RPM while hanging by introducing
>   *              NOHANG flag on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: dpms, hang, rpm, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
>   *
> - * @A:     pipe A
> - * @B:     pipe B
> - * @C:     pipe C
> - * @D:     pipe D
> - * @E:     pipe E
> - * @F:     pipe F
> - * @G:     pipe G
> - * @H:     pipe H
> - */
> -
> -/**
>   * SUBTEST: pipe-%s-ts-continuation-dpms-suspend
>   * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
>   *              NOHANG flag on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: dpms, hang, suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
> - * arg[1]:
> - *
> - * @A:     pipe A
> - * @B:     pipe B
> - * @C:     pipe C
> - * @D:     pipe D
> - * @E:     pipe E
> - * @F:     pipe F
> - * @G:     pipe G
> - * @H:     pipe H
> - */
> -
> -/**
>   * SUBTEST: pipe-%s-ts-continuation-suspend
>   * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
>   *              flag on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: hang, suspend, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
> - * arg[1]:
>   *
> - * @A:     pipe A
> - * @B:     pipe B
> - * @C:     pipe C
> - * @D:     pipe D
> - * @E:     pipe E
> - * @F:     pipe F
> - * @G:     pipe G
> - * @H:     pipe H
> - */
> -
> -/**
>   * SUBTEST: pipe-%s-ts-continuation-modeset-rpm
>   * Description: Test TS continuty during Modeset with Suspend while hanging by
>   *              introducing NOHANG flag on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: hang, rpm, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> + *
> + * SUBTEST: pipe-%s-accuracy-idle
> + * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
> + *              flag on %arg[1]
> + * Functionality: hang, vblank
>   *
>   * arg[1]:
>   *
> @@ -145,27 +95,13 @@
>   */
>  
>  /**
> - * SUBTEST: pipe-%s-accuracy-idle
> - * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
> - *              flag on %arg[1]
> - * Driver requirement: i915, xe
> - * Functionality: hang, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
>   * SUBTEST: pipe-%s-%s
>   * Description: Test %arg[2] while hanging by introducing NOHANG flag on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: hang, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: pipe-%s-%s-hang
>   * Description: Test %arg[2] with injected hang is working properly on %arg[1]
> - * Driver requirement: i915, xe
>   * Functionality: hang, vblank
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * arg[1]:
>   *
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index e203fd4d5..0850e5c43 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -20,52 +20,40 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include "igt.h"
> -#include "sw_sync.h"
> -#include <fcntl.h>
> -#include <signal.h>
>  /**
>   * TEST: kms vrr
>   * Category: Display
>   * Description: Test to validate diffent features of VRR
> - *
> - * SUBTEST: flip-basic
> - * Description: Tests that VRR is enabled and that the difference between flip
> - *              timestamps converges to the requested rate
>   * Driver requirement: i915, xe
>   * Functionality: adaptive_sync
>   * Mega feature: VRR
>   * Test category: functionality test
> + */
> +#include "igt.h"
> +#include "sw_sync.h"
> +#include <fcntl.h>
> +#include <signal.h>
> +
> +/**
> + * SUBTEST: flip-basic
> + * Description: Tests that VRR is enabled and that the difference between flip
> + *              timestamps converges to the requested rate
>   *
>   * SUBTEST: flip-dpms
>   * Description: Tests with DPMS that VRR is enabled and that the difference
>   *              between flip timestamps converges to the requested rate.
> - * Driver requirement: i915, xe
>   * Functionality: adaptive_sync, dpms
> - * Mega feature: VRR
> - * Test category: functionality test
>   *
>   * SUBTEST: flip-suspend
>   * Description: Tests that VRR is enabled and that the difference between flip
>   *              timestamps converges to the requested rate in a suspend test
> - * Driver requirement: i915, xe
>   * Functionality: adaptive_sync, suspend
> - * Mega feature: VRR
> - * Test category: functionality test
>   *
>   * SUBTEST: flipline
>   * Description: Make sure that flips happen at flipline decision boundary.
> - * Driver requirement: i915, xe
> - * Functionality: adaptive_sync
> - * Mega feature: VRR
> - * Test category: functionality test
>   *
>   * SUBTEST: negative-basic
>   * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
> - * Driver requirement: i915, xe
> - * Functionality: adaptive_sync
> - * Mega feature: VRR
> - * Test category: functionality test
>   */
>  
>  #define NSECS_PER_SEC (1000000000ull)
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index a69cf6609..469c17e2d 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -22,6 +22,18 @@
>   *
>   */
>  
> +/**
> + * TEST: kms writeback
> + * Category: Display
> + * Description: This test validates the expected behavior of the writeback
> + *              connectors feature by checking if the target device support
> + *              writeback; it validates bad and good combination, check color
> + *              format, and check the output result by using CRC.
> + * Driver requirement: i915, xe
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -32,43 +44,21 @@
>  #include "igt_core.h"
>  #include "igt_fb.h"
>  #include "sw_sync.h"
> +
>  /**
> - * TEST: kms writeback
> - * Category: Display
> - * Description: This test validates the expected behavior of the writeback
> - *              connectors feature by checking if the target device support
> - *              writeback; it validates bad and good combination, check color
> - *              format, and check the output result by using CRC.
> - *
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: writeback-invalid-parameters
>   * Description: Writeback has a couple of parameters linked together(output
>   *              framebuffer and fence); this test goes throughthe combination
>   *              of possible bad options
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   *
>   * SUBTEST: writeback-pixel-formats
>   * Description: Check the writeback format
> - * Driver requirement: i915, xe
> - * Functionality: kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
>   */
>  
>  IGT_TEST_DESCRIPTION(
> -- 
> 2.40.0
> 
