Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA3C10E11C
 for <igt-dev@lists.freedesktop.org>; Sun,  7 May 2023 07:58:52 +0000 (UTC)
Date: Sun, 7 May 2023 08:58:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <20230507085846.39a706e3@sal.lan>
In-Reply-To: <20230505103119.3309148-2-bhanuprakash.modem@intel.com>
References: <20230505103119.3309148-1-bhanuprakash.modem@intel.com>
 <20230505103119.3309148-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2 1/2] tests/kms: Document kms subtests for
 XE BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Em Fri,  5 May 2023 16:01:18 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> escreveu:

> Add documentation for kms tests those are in XE BAT which is used
> by IGT test plan documentation.
> 
> Tests included in this patch:
> - tests/chamelium/kms_chamelium_edid.c
> - tests/chamelium/kms_chamelium_frames.c
> - tests/chamelium/kms_chamelium_hpd.c
> - tests/i915/kms_psr.c
> - tests/kms_addfb_basic.c
> - tests/kms_cursor_legacy.c
> - tests/kms_flip.c
> - tests/kms_force_connector_basic.c
> - tests/kms_pipe_crc_basic.c
> - tests/kms_prop_blob.c
> 
> V2: - Fine tune documentation (Mauro)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  tests/chamelium/kms_chamelium_edid.c   |  27 +++++
>  tests/chamelium/kms_chamelium_frames.c |  22 ++++
>  tests/chamelium/kms_chamelium_hpd.c    |  39 +++++++
>  tests/i915/kms_psr.c                   |  31 ++++++
>  tests/kms_addfb_basic.c                | 138 +++++++++++++++++++++++++
>  tests/kms_cursor_legacy.c              |  40 +++++++
>  tests/kms_flip.c                       |  27 +++++
>  tests/kms_force_connector_basic.c      |  29 ++++++
>  tests/kms_pipe_crc_basic.c             |  58 +++++++++++
>  tests/kms_prop_blob.c                  |  12 +++
>  10 files changed, 423 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 7e7262ed3..4a52e6922 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -24,6 +24,11 @@
>   *    Lyude Paul <lyude@redhat.com>
>   */
>  
> +/**
> + * TEST: Tests behaviour of edid & timings using chamelium
> + * Category: Display
> + */
> +
>  #include <fcntl.h>
>  #include <stdint.h>
>  #include <string.h>
> @@ -139,6 +144,28 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
>  	igt_assert(video_params.vsync_polarity == mode_vsync_polarity);
>  }
>  
> +/**
> + * SUBTEST: dp-edid-read
> + * Description: Make sure the EDID exposed by KMS is the same as the screen's
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: dp
> + * Mega feature: DP
> + *
> + * SUBTEST: hdmi-edid-read
> + * Description: Make sure the EDID exposed by KMS is the same as the screen's
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + *
> + * SUBTEST: vga-edid-read
> + * Description: Make sure the EDID exposed by KMS is the same as the screen's
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: vga
> + * Mega feature: VGA
> + */
>  static const char igt_custom_edid_type_read_desc[] =
>  	"Make sure the EDID exposed by KMS is the same as the screen's";
>  static void igt_custom_edid_type_read(chamelium_data_t *data,
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index 008bc34b6..22a7ba936 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -24,6 +24,11 @@
>   *    Lyude Paul <lyude@redhat.com>
>   */
>  
> +/**
> + * TEST: Tests to capture frames using chamelium
> + * Category: Display
> + */
> +
>  #include "igt_eld.h"
>  #include "igt_infoframe.h"
>  #include "kms_chamelium_helper.h"
> @@ -534,6 +539,23 @@ static void prepare_randomized_plane(chamelium_data_t *data,
>  	igt_remove_fb(data->drm_fd, &pattern_fb);
>  }
>  
> +/**
> + * SUBTEST: dp-crc-fast
> + * Description: Pick the first mode of the IGT base EDID, display and capture
> + * 		a few frames, then check captured frames are correct
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: dp
> + * Mega feature: DP
> + *
> + * SUBTEST: hdmi-crc-fast
> + * Description: Pick the first mode of the IGT base EDID, display and capture
> + * 		a few frames, then check captured frames are correct
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + */
>  static const char test_display_one_mode_desc[] =
>  	"Pick the first mode of the IGT base EDID, display and capture a few "
>  	"frames, then check captured frames are correct";
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index 2b17ce29d..efd40ba54 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -24,6 +24,11 @@
>   *    Lyude Paul <lyude@redhat.com>
>   */
>  
> +/**
> + * TEST: Tests behaviour of hpd using chamelium
> + * Category: Display
> + */
> +
>  #include "kms_chamelium_helper.h"
>  
>  #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
> @@ -104,6 +109,31 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
>  	}
>  }
>  
> +/**
> + * SUBTEST: dp-hpd-fast
> + * Description: Check that we get uevents and updated connector status on
> + * 		hotplug and unplug
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: dp_hotplug
> + * Mega feature: DP
> + *
> + * SUBTEST: hdmi-hpd-fast
> + * Description: Check that we get uevents and updated connector status on
> + * 		hotplug and unplug
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hdmi_hotplug
> + * Mega feature: HDMI
> + *
> + * SUBTEST: vga-hpd-fast
> + * Description: Check that we get uevents and updated connector status on
> + * 		hotplug and unplug
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: vga_hotplug
> + * Mega feature: VGA
> + */
>  static const char test_basic_hotplug_desc[] =
>  	"Check that we get uevents and updated connector status on "
>  	"hotplug and unplug";
> @@ -238,6 +268,15 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
>  	igt_cleanup_uevents(mon);
>  }
>  
> +/**
> + * SUBTEST: common-hpd-after-suspend
> + * Description: Toggle HPD during suspend on all connectors, check that uevents
> + * 		are sent and connector status is updated
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: hotplug
> + * Mega feature: General Display Features
> + */
>  static const char test_suspend_resume_hpd_common_desc[] =
>  	"Toggle HPD during suspend on all connectors, check that uevents are "
>  	"sent and connector status is updated";
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 0e8d7f4f0..6c89de45d 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -22,6 +22,11 @@
>   *
>   */
>  
> +/**
> + * TEST: Tests behaviour of PSR & PSR2
> + * Category: Display
> + */
> +
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_psr.h"
> @@ -300,6 +305,32 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
>  	igt_assert(ret == 0 || ret == -ENOSYS);
>  }
>  
> +/**
> + * SUBTEST: cursor_plane_move
> + * Description: Check if psr is detecting the plane operations performed on
> + *		cursor planes
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: psr
> + * Mega feature: PSR
> + *
> + * SUBTEST: primary_page_flip
> + * Description: Check if psr is detecting page-flipping operations performed
> + *		on primary planes
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: psr
> + * Mega feature: PSR
> + *
> + * SUBTEST: sprite_plane_onoff
> + * Description: Check if psr is detecting the plane operations performed on
> + *		sprite planes
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: psr
> + * Mega feature: PSR
> + */
> +
>  static void run_test(data_t *data)
>  {
>  	uint32_t handle = data->fb_white.gem_handle;
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index e4783624f..e375f3ad2 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -25,6 +25,11 @@
>   *
>   */
>  
> +/**
> + * TEST: Sanity test for ioctls DRM_IOCTL_MODE_ADDFB2 & DRM_IOCTL_MODE_RMFB.
> + * Category: Display
> + */
> +
>  #include "igt.h"
>  #include <unistd.h>
>  #include <stdlib.h>
> @@ -60,6 +65,35 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
>  	return err;
>  }
>  
> +/**
> + * SUBTEST: unused-handle
> + * Description: Test that addfb2 call fails correctly for unused handle
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: unused-pitches
> + * Description: Test that addfb2 call fails correctly for unused pitches
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: unused-offsets
> + * Description: Test that addfb2 call fails correctly for unused offset
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: unused-modifier
> + * Description: Test that addfb2 call fails correctly for unused modifier
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + */
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -273,6 +307,30 @@ static void invalid_tests(int fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: no-handle
> + * Description: Test that addfb2 call fails correctly without handle
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: basic
> + * Description: Check if addfb2 call works with given handle
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: bad-pitch-%i
> + * Description: bad-pitch-%arg[1]: Test that addfb2 call fails correctly for bad-pitches
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * arg[1].values: 0, 32, 63, 128, 256, 999, 1024, 65536
> + */
>  static void pitch_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -399,6 +457,42 @@ static void tiling_tests(int fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: size-max
> + * Description: Check if addfb2 call works with max size of buffer object
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: too-wide
> + * Description: Test that addfb2 call fails correctly with increased width of fb
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: too-high
> + * Description: Test that addfb2 call fails correctly with increased height of fb
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: bo-too-small
> + * Description: Test that addfb2 call fails correctly with small size of buffer object
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: small-bo
> + * Description: Check if addfb2 call works for given height
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + */
>  static void size_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -514,6 +608,21 @@ static void size_tests(int fd)
>  	}
>  }
>  
> +/**
> + * SUBTEST: addfb25-modifier-no-flag
> + * Description: Test that addfb2 call fails correctly for x-tiling with given modifier
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: addfb25-bad-modifier
> + * Description: Test that addfb2 call fails correctly for irrelevant modifier
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + */
>  static void addfb25_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -700,6 +809,35 @@ static void addfb25_4tile(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  
> +/**
> + * SUBTEST: invalid-get-prop-any
> + * Description: Test that get-properties ioctl call fails correctly for invalid object type
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: invalid-get-prop
> + * Description: Test that get-properties ioctl call fails correctly for fb mode object
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: invalid-set-prop-any
> + * Description: Test that set-properties ioctl call fails correctly for invalid object type
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: invalid-set-prop
> + * Description: Test that get-properties ioctl call fails correctly for fb mode object
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + */
>  static void prop_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 7df6a6125..f7a6202cf 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -22,6 +22,11 @@
>   *
>   */
>  
> +/**
> + * TEST: Stress legacy cursor ioctl
> + * Category: Display
> + */
> +
>  #include <sched.h>
>  #include <sys/poll.h>
>  
> @@ -536,6 +541,41 @@ enum basic_flip_cursor {
>  
>  #define BASIC_BUSY 0x1
>  
> +/**
> + * SUBTEST: basic-busy-flip-before-cursor-%s
> + * Description: Cursor test with %arg[1] mode
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: cursor
> + * Mega feature: General Display Features
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
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: basic-flip-before-cursor-%s
> + * Description: Cursor test with %arg[1]
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + *
> + * arg[1]:
> + *
> + * @atomic:        atomic mode
> + * @legacy:        legacy mode
> + * @varying-size:  varying size
> + */
>  static void basic_flip_cursor(igt_display_t *display,
>  			      enum flip_test mode,
>  			      enum basic_flip_cursor order,
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index e4c98b8ec..0adb356d6 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -21,6 +21,11 @@
>   * IN THE SOFTWARE.
>   */
>  
> +/**
> + * TEST: Tests for validating modeset, dpms and pageflips
> + * Category: Display
> + */
> +
>  #include "config.h"
>  
>  #include "igt.h"
> @@ -1557,6 +1562,28 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
>  		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
>  }
>  
> +/**
> + * SUBTEST: basic-flip-vs-%s
> + * Description: Basic test to valide %arg[1]
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + *
> + * arg[1]:
> + *
> + * @dpms:         dpms
> + * @modeset:      modeset
> + * @wf_vblank:    wait for vblank
> + *
> + * SUBTEST: basic-plain-flip
> + * Description: Basic test for validating page flip
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: vblank
> + * Mega feature: General Display Features
> + */
> +
>  static void run_test(int duration, int flags)
>  {
>  	struct test_output o;
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index f1508efba..7e35693cf 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -22,6 +22,11 @@
>   *
>   */
>  
> +/**
> + * TEST: Check the debugfs force connector/edid features work correctly
> + * Category: Display
> + */
> +
>  #include "igt.h"
>  
>  IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
> @@ -151,6 +156,14 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
>  	}
>  }
>  
> +/**
> + * SUBTEST: force-connector-state
> + * Description: Test to check the forced connector state
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: force_connector
> + * Mega feature: General Display Features
> + */
>  static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	igt_display_t display;
> @@ -190,6 +203,14 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
>  	igt_display_fini(&display);
>  }
>  
> +/**
> + * SUBTEST: force-edid
> + * Description: Test to check the values after forcing edid
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: force_connector
> + * Mega feature: General Display Features
> + */
>  static void force_edid(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	drmModeConnector *temp;
> @@ -231,6 +252,14 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
>  
>  }
>  
> +/**
> + * SUBTEST: prune-stale-modes
> + * Description: Tests pruning of stale modes
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: force_connector
> + * Mega feature: General Display Features
> + */
>  static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
>  {
>  	int i;
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 65afc9f60..84c73fd7f 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -22,6 +22,11 @@
>   *
>   */
>  
> +/**
> + * TEST: Tests behaviour of CRC
> + * Category: Display
> + */
> +
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include <errno.h>
> @@ -80,6 +85,50 @@ enum {
>  	TEST_HANG = 1 << 3,
>  };
>  
> +/**
> + * SUBTEST: read-crc
> + * Description: Test for pipe CRC reads
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: read-crc-frame-sequence
> + * Description: Tests the pipe CRC read and ensure frame sequence
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: nonblocking-crc
> + * Description: Test for O_NONBLOCK CRC reads
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: nonblocking-crc-frame-sequence
> + * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: suspend-read-crc
> + * Description: Suspend test for pipe CRC reads
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + *
> + * SUBTEST: hang-read-crc
> + * Description: Hang test for pipe CRC read
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + */
> +
>  static void test_read_crc(data_t *data, enum pipe pipe,
>  			  igt_output_t *output, unsigned flags)
>  {
> @@ -177,6 +226,15 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>  	igt_display_commit(display);
>  }
>  
> +/**
> + * SUBTEST: compare-crc-sanitycheck
> + * Description: Basic sanity check for CRC mismatches
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: crc
> + * Mega feature: General Display Features
> + */
> +
>  /*
>   * CRC-sanity test, to make sure there would be no CRC mismatches
>   *
> diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
> index 96aa6d8d6..6a5a5f410 100644
> --- a/tests/kms_prop_blob.c
> +++ b/tests/kms_prop_blob.c
> @@ -25,6 +25,10 @@
>   *   Daniel Stone <daniels@collabora.com>
>   */
>  
> +/**
> + * TEST: Tests behaviour of mass-data 'blob' properties
> + * Category: Display
> + */
>  #include "igt.h"
>  #include <errno.h>
>  #include <stdbool.h>
> @@ -238,6 +242,14 @@ test_core(int fd)
>  	igt_assert_eq(validate_prop(fd, 0), ENOENT);
>  }
>  
> +/**
> + * SUBTEST: basic
> + * Description: Test to ensure property support exists
> + * Test category: functionality test
> + * Run type: BAT
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + */
>  static void
>  test_basic(int fd)
>  {

