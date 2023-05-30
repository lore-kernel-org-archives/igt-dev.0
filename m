Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830C710E169
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 15:00:14 +0000 (UTC)
Message-ID: <ab16d720-902e-8ab8-fd16-88173780a1f7@intel.com>
Date: Tue, 30 May 2023 20:30:08 +0530
MIME-Version: 1.0
Content-Language: en-US
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 00/82] Document KMS tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

IMO, functionality and mega feature seems to be redundant
+ * Functionality: vrr
+ * Mega feature: VRR

Any thoughts?

Mauro/Bhanu,
What are our plans for igt_decribe(). It seems desriptions and 
igt_describe() is unneeded.

On 29-May-23 10:57 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> This series also includes:
> - Move all kms helpers to lib
> - New config field to differentiate b/w the drivers
> - Add documentation for all kms tests
> 
> Note: Please ignore patches [1/82] to [3/82], as these patches are
> supposed to float as new series.
> 
> V2: - Include testdisplay.c
> V3: - Improve documentation for kms_fb_coherency.c
>      - Other minor cleanups
> V4: - Rebase
> 
> Bhanuprakash Modem (82):
>    tests/chamelium: Move chamelium helpers to lib
>    tests/dsc: Move dsc helpers to lib
>    tests/color: Move color helpers to lib
>    testplan/kms: Include testdisplay to kms testplan config
>    testplan/kms: Add support to differentiate b/w drivers
>    tests/chamelium/kms_chamelium_audio: Document each subtest for
>      testplan
>    tests/chamelium/kms_chamelium_color: Document each subtest for
>      testplan
>    tests/chamelium/kms_chamelium_edid: Document each subtest for testplan
>    tests/chamelium/kms_chamelium_frames: Document each subtest for
>      testplan
>    tests/chamelium/kms_chamelium_hpd: Document each subtest for testplan
>    tests/i915/kms_big_fb: Document each subtest for testplan
>    tests/i915/kms_big_joiner: Document each subtest for testplan
>    tests/i915/kms_busy: Document each subtest for testplan
>    tests/i915/kms_ccs: Document each subtest for testplan
>    tests/i915/kms_cdclk: Document each subtest for testplan
>    tests/i915/kms_draw_crc: Document each subtest for testplan
>    tests/i915/kms_dsc: Document each subtest for testplan
>    tests/i915/kms_fb_coherency: Document each subtest for testplan
>    tests/i915/kms_fbcon_fbt: Document each subtest for testplan
>    tests/i915/kms_fence_pin_leak: Document each subtest for testplan
>    tests/i915/kms_flip_scaled_crc: Document each subtest for testplan
>    tests/i915/kms_flip_tiling: Document each subtest for testplan
>    tests/i915/kms_frontbuffer_tracking: Document each subtest for
>      testplan
>    tests/i915/kms_legacy_colorkey: Document each subtest for testplan
>    tests/i915/kms_mmap_write_crc: Document each subtest for testplan
>    tests/i915/kms_pipe_b_c_ivb: Document each subtest for testplan
>    tests/i915/kms_psr: Document each subtest for testplan
>    tests/i915/kms_psr2_sf: Document each subtest for testplan
>    tests/i915/kms_psr2_su: Document each subtest for testplan
>    tests/i915/kms_psr_stress_test: Document each subtest for testplan
>    tests/i915/kms_pwrite_crc: Document each subtest for testplan
>    tests/kms_3d: Document each subtest for testplan
>    tests/kms_addfb_basic: Document each subtest for testplan
>    tests/kms_async_flips: Document each subtest for testplan
>    tests/kms_atomic: Document each subtest for testplan
>    tests/kms_atomic_interruptible: Document each subtest for testplan
>    tests/kms_atomic_transition: Document each subtest for testplan
>    tests/kms_bw: Document each subtest for testplan
>    tests/kms_color: Document each subtest for testplan
>    tests/kms_concurrent: Document each subtest for testplan
>    tests/kms_content_protection: Document each subtest for testplan
>    tests/kms_cursor_crc: Document each subtest for testplan
>    tests/kms_cursor_edge_walk: Document each subtest for testplan
>    tests/kms_cursor_legacy: Document each subtest for testplan
>    tests/kms_display_modes: Document each subtest for testplan
>    tests/kms_dither: Document each subtest for testplan
>    tests/kms_dp_aux_dev: Document each subtest for testplan
>    tests/kms_dp_tiled_display: Document each subtest for testplan
>    tests/kms_flip: Document each subtest for testplan
>    tests/kms_flip_event_leak: Document each subtest for testplan
>    tests/kms_force_connector_basic: Document each subtest for testplan
>    tests/kms_getfb: Document each subtest for testplan
>    tests/kms_hdmi_inject: Document each subtest for testplan
>    tests/kms_hdr: Document each subtest for testplan
>    tests/kms_invalid_mode: Document each subtest for testplan
>    tests/kms_lease: Document each subtest for testplan
>    tests/kms_multipipe_modeset: Document each subtest for testplan
>    tests/kms_panel_fitting: Document each subtest for testplan
>    tests/kms_pipe_crc_basic: Document each subtest for testplan
>    tests/kms_plane: Document each subtest for testplan
>    tests/kms_plane_alpha_blend: Document each subtest for testplan
>    tests/kms_plane_cursor: Document each subtest for testplan
>    tests/kms_plane_lowres: Document each subtest for testplan
>    tests/kms_plane_multiple: Document each subtest for testplan
>    tests/kms_plane_scaling: Document each subtest for testplan
>    tests/kms_prime: Document each subtest for testplan
>    tests/kms_prop_blob: Document each subtest for testplan
>    tests/kms_properties: Document each subtest for testplan
>    tests/kms_rmfb: Document each subtest for testplan
>    tests/kms_rotation_crc: Document each subtest for testplan
>    tests/kms_scaling_modes: Document each subtest for testplan
>    tests/kms_selftest: Document each subtest for testplan
>    tests/kms_sequence: Document each subtest for testplan
>    tests/kms_setmode: Document each subtest for testplan
>    tests/kms_sysfs_edid_timing: Document each subtest for testplan
>    tests/kms_tv_load_detect: Document each subtest for testplan
>    tests/kms_universal_plane: Document each subtest for testplan
>    tests/kms_vblank: Document each subtest for testplan
>    tests/kms_vrr: Document each subtest for testplan
>    tests/kms_writeback: Document each subtest for testplan
>    tests/testdisplay: Document each subtest for testplan
>    testplan/kms: Make documentation is mandatory for all kms subtests
> 
>   docs/testplan/meson.build                     |    4 +-
>   .../igt_chamelium_helper.c                    |    4 +-
>   .../igt_chamelium_helper.h                    |    0
>   .../igt_color_helper.c                        |    2 +-
>   .../igt_color_helper.h                        |    0
>   .../kms_dsc_helper.c => lib/igt_dsc_helper.c  |    2 +-
>   .../kms_dsc_helper.h => lib/igt_dsc_helper.h  |    0
>   lib/meson.build                               |    3 +
>   tests/chamelium/kms_chamelium_audio.c         |   46 +-
>   tests/chamelium/kms_chamelium_color.c         |   47 +-
>   tests/chamelium/kms_chamelium_edid.c          |   92 +-
>   tests/chamelium/kms_chamelium_frames.c        |  104 +-
>   tests/chamelium/kms_chamelium_hpd.c           |  188 +-
>   tests/i915/kms_big_fb.c                       |  153 +
>   tests/i915/kms_big_joiner.c                   |   33 +
>   tests/i915/kms_busy.c                         |   62 +
>   tests/i915/kms_ccs.c                          |   89 +
>   tests/i915/kms_cdclk.c                        |   32 +
>   tests/i915/kms_draw_crc.c                     |   71 +-
>   tests/i915/kms_dsc.c                          |   29 +-
>   tests/i915/kms_fb_coherency.c                 |    5 +
>   tests/i915/kms_fbcon_fbt.c                    |   42 +
>   tests/i915/kms_fence_pin_leak.c               |   13 +
>   tests/i915/kms_flip_scaled_crc.c              |  191 +
>   tests/i915/kms_flip_tiling.c                  |   13 +
>   tests/i915/kms_frontbuffer_tracking.c         | 7092 +++++++++++++++++
>   tests/i915/kms_legacy_colorkey.c              |   21 +
>   tests/i915/kms_mmap_write_crc.c               |   14 +
>   tests/i915/kms_pipe_b_c_ivb.c                 |   52 +
>   tests/i915/kms_psr.c                          |  213 +-
>   tests/i915/kms_psr2_sf.c                      |   87 +-
>   tests/i915/kms_psr2_su.c                      |   27 +
>   tests/i915/kms_psr_stress_test.c              |   22 +
>   tests/i915/kms_pwrite_crc.c                   |   15 +
>   tests/kms_3d.c                                |   13 +
>   tests/kms_addfb_basic.c                       |  188 +-
>   tests/kms_async_flips.c                       |   62 +
>   tests/kms_atomic.c                            |  102 +-
>   tests/kms_atomic_interruptible.c              |   50 +
>   tests/kms_atomic_transition.c                 |  100 +
>   tests/kms_bw.c                                |   20 +
>   tests/kms_color.c                             |   93 +-
>   tests/kms_concurrent.c                        |   26 +
>   tests/kms_content_protection.c                |   81 +
>   tests/kms_cursor_crc.c                        |   64 +
>   tests/kms_cursor_edge_walk.c                  |   26 +
>   tests/kms_cursor_legacy.c                     |  217 +-
>   tests/kms_display_modes.c                     |   15 +
>   tests/kms_dither.c                            |   22 +
>   tests/kms_dp_aux_dev.c                        |   13 +
>   tests/kms_dp_tiled_display.c                  |   21 +
>   tests/kms_flip.c                              |  178 +-
>   tests/kms_flip_event_leak.c                   |   19 +
>   tests/kms_force_connector_basic.c             |   15 +-
>   tests/kms_getfb.c                             |   90 +
>   tests/kms_hdmi_inject.c                       |   25 +
>   tests/kms_hdr.c                               |   52 +
>   tests/kms_invalid_mode.c                      |   32 +
>   tests/kms_lease.c                             |  180 +
>   tests/kms_multipipe_modeset.c                 |   14 +
>   tests/kms_panel_fitting.c                     |   21 +
>   tests/kms_pipe_crc_basic.c                    |   30 +-
>   tests/kms_plane.c                             |   58 +
>   tests/kms_plane_alpha_blend.c                 |   55 +
>   tests/kms_plane_cursor.c                      |   30 +
>   tests/kms_plane_lowres.c                      |   32 +
>   tests/kms_plane_multiple.c                    |   33 +
>   tests/kms_plane_scaling.c                     |  261 +
>   tests/kms_prime.c                             |   35 +
>   tests/kms_prop_blob.c                         |   46 +-
>   tests/kms_properties.c                        |   40 +
>   tests/kms_rmfb.c                              |   24 +
>   tests/kms_rotation_crc.c                      |  130 +
>   tests/kms_scaling_modes.c                     |   20 +
>   tests/kms_selftest.c                          |   13 +
>   tests/kms_sequence.c                          |   36 +
>   tests/kms_setmode.c                           |   58 +
>   tests/kms_sysfs_edid_timing.c                 |   21 +
>   tests/kms_test_config.json                    |    7 +-
>   tests/kms_tv_load_detect.c                    |   13 +
>   tests/kms_universal_plane.c                   |   67 +
>   tests/kms_vblank.c                            |   69 +
>   tests/kms_vrr.c                               |   47 +
>   tests/kms_writeback.c                         |   42 +
>   tests/meson.build                             |   41 +-
>   tests/testdisplay.c                           |   13 +
>   86 files changed, 11625 insertions(+), 103 deletions(-)
>   rename tests/chamelium/kms_chamelium_helper.c => lib/igt_chamelium_helper.c (99%)
>   rename tests/chamelium/kms_chamelium_helper.h => lib/igt_chamelium_helper.h (100%)
>   rename tests/kms_color_helper.c => lib/igt_color_helper.c (99%)
>   rename tests/kms_color_helper.h => lib/igt_color_helper.h (100%)
>   rename tests/i915/kms_dsc_helper.c => lib/igt_dsc_helper.c (99%)
>   rename tests/i915/kms_dsc_helper.h => lib/igt_dsc_helper.h (100%)
> 
> --
> 2.40.0
> 

