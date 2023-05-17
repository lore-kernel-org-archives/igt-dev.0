Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2910E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 10:36:14 +0000 (UTC)
Date: Wed, 17 May 2023 12:36:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230517103609.wvgiuugl64mw5lrf@kamilkon-desk1>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 00/81] Document KMS tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-05-17 at 12:02:02 +0530, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> This series also includes:
> - Move all kms helpers to lib
> - New config field to differentiate b/w the drivers
> - Add documentation for all kms tests
> 
> V2: - Include testdisplay.c
> 
> Bhanuprakash Modem (81):
>   tests/chamelium: Move chamelium helpers to lib
>   tests/dsc: Move dsc helpers to lib
>   tests/color: Move color helpers to lib

imho above three patches should go into separate patch series.

>   testplan/kms: Include testdisplay to kms testplan config
>   testplan/kms: Add support to differentiate b/w drivers
----------------- ^
Please also send this one as separate patch.

Regards,
Kamil

>   tests/chamelium/kms_chamelium_audio: Document each subtest for
>     testplan
>   tests/chamelium/kms_chamelium_color: Document each subtest for
>     testplan
>   tests/chamelium/kms_chamelium_edid: Document each subtest for testplan
>   tests/chamelium/kms_chamelium_frames: Document each subtest for
>     testplan
>   tests/chamelium/kms_chamelium_hpd: Document each subtest for testplan
>   tests/i915/kms_big_fb: Document each subtest for testplan
>   tests/i915/kms_big_joiner: Document each subtest for testplan
>   tests/i915/kms_busy: Document each subtest for testplan
>   tests/i915/kms_ccs: Document each subtest for testplan
>   tests/i915/kms_cdclk: Document each subtest for testplan
>   tests/i915/kms_draw_crc: Document each subtest for testplan
>   tests/i915/kms_dsc: Document each subtest for testplan
>   tests/i915/kms_fbcon_fbt: Document each subtest for testplan
>   tests/i915/kms_fence_pin_leak: Document each subtest for testplan
>   tests/i915/kms_flip_scaled_crc: Document each subtest for testplan
>   tests/i915/kms_flip_tiling: Document each subtest for testplan
>   tests/i915/kms_frontbuffer_tracking: Document each subtest for
>     testplan
>   tests/i915/kms_legacy_colorkey: Document each subtest for testplan
>   tests/i915/kms_mmap_write_crc: Document each subtest for testplan
>   tests/i915/kms_pipe_b_c_ivb: Document each subtest for testplan
>   tests/i915/kms_psr: Document each subtest for testplan
>   tests/i915/kms_psr2_sf: Document each subtest for testplan
>   tests/i915/kms_psr2_su: Document each subtest for testplan
>   tests/i915/kms_psr_stress_test: Document each subtest for testplan
>   tests/i915/kms_pwrite_crc: Document each subtest for testplan
>   tests/kms_3d: Document each subtest for testplan
>   tests/kms_addfb_basic: Document each subtest for testplan
>   tests/kms_async_flips: Document each subtest for testplan
>   tests/kms_atomic: Document each subtest for testplan
>   tests/kms_atomic_interruptible: Document each subtest for testplan
>   tests/kms_atomic_transition: Document each subtest for testplan
>   tests/kms_bw: Document each subtest for testplan
>   tests/kms_color: Document each subtest for testplan
>   tests/kms_concurrent: Document each subtest for testplan
>   tests/kms_content_protection: Document each subtest for testplan
>   tests/kms_cursor_crc: Document each subtest for testplan
>   tests/kms_cursor_edge_walk: Document each subtest for testplan
>   tests/kms_cursor_legacy: Document each subtest for testplan
>   tests/kms_display_modes: Document each subtest for testplan
>   tests/kms_dither: Document each subtest for testplan
>   tests/kms_dp_aux_dev: Document each subtest for testplan
>   tests/kms_dp_tiled_display: Document each subtest for testplan
>   tests/kms_flip: Document each subtest for testplan
>   tests/kms_flip_event_leak: Document each subtest for testplan
>   tests/kms_force_connector_basic: Document each subtest for testplan
>   tests/kms_getfb: Document each subtest for testplan
>   tests/kms_hdmi_inject: Document each subtest for testplan
>   tests/kms_hdr: Document each subtest for testplan
>   tests/kms_invalid_mode: Document each subtest for testplan
>   tests/kms_lease: Document each subtest for testplan
>   tests/kms_multipipe_modeset: Document each subtest for testplan
>   tests/kms_panel_fitting: Document each subtest for testplan
>   tests/kms_pipe_crc_basic: Document each subtest for testplan
>   tests/kms_plane: Document each subtest for testplan
>   tests/kms_plane_alpha_blend: Document each subtest for testplan
>   tests/kms_plane_cursor: Document each subtest for testplan
>   tests/kms_plane_lowres: Document each subtest for testplan
>   tests/kms_plane_multiple: Document each subtest for testplan
>   tests/kms_plane_scaling: Document each subtest for testplan
>   tests/kms_prime: Document each subtest for testplan
>   tests/kms_prop_blob: Document each subtest for testplan
>   tests/kms_properties: Document each subtest for testplan
>   tests/kms_rmfb: Document each subtest for testplan
>   tests/kms_rotation_crc: Document each subtest for testplan
>   tests/kms_scaling_modes: Document each subtest for testplan
>   tests/kms_selftest: Document each subtest for testplan
>   tests/kms_sequence: Document each subtest for testplan
>   tests/kms_setmode: Document each subtest for testplan
>   tests/kms_sysfs_edid_timing: Document each subtest for testplan
>   tests/kms_tv_load_detect: Document each subtest for testplan
>   tests/kms_universal_plane: Document each subtest for testplan
>   tests/kms_vblank: Document each subtest for testplan
>   tests/kms_vrr: Document each subtest for testplan
>   tests/kms_writeback: Document each subtest for testplan
>   tests/testdisplay: Document each subtest for testplan
>   testplan/kms: Make documentation is mandatory for all kms subtests
> 
>  docs/testplan/meson.build                     |    4 +-
>  .../igt_chamelium_helper.c                    |    4 +-
>  .../igt_chamelium_helper.h                    |    0
>  .../igt_color_helper.c                        |    2 +-
>  .../igt_color_helper.h                        |    0
>  .../kms_dsc_helper.c => lib/igt_dsc_helper.c  |    2 +-
>  .../kms_dsc_helper.h => lib/igt_dsc_helper.h  |    0
>  lib/meson.build                               |    3 +
>  tests/chamelium/kms_chamelium_audio.c         |   46 +-
>  tests/chamelium/kms_chamelium_color.c         |   47 +-
>  tests/chamelium/kms_chamelium_edid.c          |   92 +-
>  tests/chamelium/kms_chamelium_frames.c        |  104 +-
>  tests/chamelium/kms_chamelium_hpd.c           |  188 +-
>  tests/i915/kms_big_fb.c                       |  153 +
>  tests/i915/kms_big_joiner.c                   |   33 +
>  tests/i915/kms_busy.c                         |   62 +
>  tests/i915/kms_ccs.c                          |   83 +
>  tests/i915/kms_cdclk.c                        |   32 +
>  tests/i915/kms_draw_crc.c                     |   71 +-
>  tests/i915/kms_dsc.c                          |   29 +-
>  tests/i915/kms_fbcon_fbt.c                    |   42 +
>  tests/i915/kms_fence_pin_leak.c               |   13 +
>  tests/i915/kms_flip_scaled_crc.c              |  191 +
>  tests/i915/kms_flip_tiling.c                  |   13 +
>  tests/i915/kms_frontbuffer_tracking.c         | 7092 +++++++++++++++++
>  tests/i915/kms_legacy_colorkey.c              |   21 +
>  tests/i915/kms_mmap_write_crc.c               |   14 +
>  tests/i915/kms_pipe_b_c_ivb.c                 |   52 +
>  tests/i915/kms_psr.c                          |  213 +-
>  tests/i915/kms_psr2_sf.c                      |   87 +-
>  tests/i915/kms_psr2_su.c                      |   27 +
>  tests/i915/kms_psr_stress_test.c              |   22 +
>  tests/i915/kms_pwrite_crc.c                   |   15 +
>  tests/kms_3d.c                                |   13 +
>  tests/kms_addfb_basic.c                       |  188 +-
>  tests/kms_async_flips.c                       |   62 +
>  tests/kms_atomic.c                            |  102 +-
>  tests/kms_atomic_interruptible.c              |   50 +
>  tests/kms_atomic_transition.c                 |  100 +
>  tests/kms_bw.c                                |   20 +
>  tests/kms_color.c                             |   92 +-
>  tests/kms_concurrent.c                        |   26 +
>  tests/kms_content_protection.c                |   81 +
>  tests/kms_cursor_crc.c                        |   64 +
>  tests/kms_cursor_edge_walk.c                  |   26 +
>  tests/kms_cursor_legacy.c                     |  217 +-
>  tests/kms_display_modes.c                     |   15 +
>  tests/kms_dither.c                            |   22 +
>  tests/kms_dp_aux_dev.c                        |   13 +
>  tests/kms_dp_tiled_display.c                  |   21 +
>  tests/kms_flip.c                              |  178 +-
>  tests/kms_flip_event_leak.c                   |   19 +
>  tests/kms_force_connector_basic.c             |   15 +-
>  tests/kms_getfb.c                             |   90 +
>  tests/kms_hdmi_inject.c                       |   25 +
>  tests/kms_hdr.c                               |   52 +
>  tests/kms_invalid_mode.c                      |   32 +
>  tests/kms_lease.c                             |  180 +
>  tests/kms_multipipe_modeset.c                 |   14 +
>  tests/kms_panel_fitting.c                     |   21 +
>  tests/kms_pipe_crc_basic.c                    |   30 +-
>  tests/kms_plane.c                             |   58 +
>  tests/kms_plane_alpha_blend.c                 |   55 +
>  tests/kms_plane_cursor.c                      |   30 +
>  tests/kms_plane_lowres.c                      |   32 +
>  tests/kms_plane_multiple.c                    |   33 +
>  tests/kms_plane_scaling.c                     |  261 +
>  tests/kms_prime.c                             |   35 +
>  tests/kms_prop_blob.c                         |   46 +-
>  tests/kms_properties.c                        |   40 +
>  tests/kms_rmfb.c                              |   24 +
>  tests/kms_rotation_crc.c                      |  130 +
>  tests/kms_scaling_modes.c                     |   20 +
>  tests/kms_selftest.c                          |   13 +
>  tests/kms_sequence.c                          |   36 +
>  tests/kms_setmode.c                           |   58 +
>  tests/kms_sysfs_edid_timing.c                 |   21 +
>  tests/kms_test_config.json                    |    7 +-
>  tests/kms_tv_load_detect.c                    |   13 +
>  tests/kms_universal_plane.c                   |   67 +
>  tests/kms_vblank.c                            |   69 +
>  tests/kms_vrr.c                               |   47 +
>  tests/kms_writeback.c                         |   42 +
>  tests/meson.build                             |   12 +-
>  tests/testdisplay.c                           |   13 +
>  85 files changed, 11613 insertions(+), 74 deletions(-)
>  rename tests/chamelium/kms_chamelium_helper.c => lib/igt_chamelium_helper.c (99%)
>  rename tests/chamelium/kms_chamelium_helper.h => lib/igt_chamelium_helper.h (100%)
>  rename tests/kms_color_helper.c => lib/igt_color_helper.c (99%)
>  rename tests/kms_color_helper.h => lib/igt_color_helper.h (100%)
>  rename tests/i915/kms_dsc_helper.c => lib/igt_dsc_helper.c (99%)
>  rename tests/i915/kms_dsc_helper.h => lib/igt_dsc_helper.h (100%)
> 
> --
> 2.40.0
> 

