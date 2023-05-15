Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 15 May 2023 19:56:22 -0000
Message-ID: <168418058216.22016.9289225301600101228@emeril.freedesktop.org>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBEb2N1?=
 =?utf-8?q?ment_KMS_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Document KMS tests (rev5)
URL   : https://patchwork.freedesktop.org/series/117749/
State : failure

== Summary ==

Applying: tests/chamelium: Move chamelium helpers to lib
Applying: tests/dsc: Move dsc helpers to lib
Applying: tests/color: Move color helpers to lib
Applying: testplan/kms: Add support to differentiate b/w drivers
Applying: tests/chamelium/kms_chamelium_audio: Document each subtest for testplan
Applying: tests/chamelium/kms_chamelium_color: Document each subtest for testplan
Applying: tests/chamelium/kms_chamelium_edid: Document each subtest for testplan
Applying: tests/chamelium/kms_chamelium_frames: Document each subtest for testplan
Applying: tests/chamelium/kms_chamelium_hpd: Document each subtest for testplan
Applying: tests/i915/kms_big_fb: Document each subtest for testplan
Applying: tests/i915/kms_big_joiner: Document each subtest for testplan
Applying: tests/i915/kms_busy: Document each subtest for testplan
Applying: tests/i915/kms_ccs: Document each subtest for testplan
Applying: tests/i915/kms_cdclk: Document each subtest for testplan
Applying: tests/i915/kms_draw_crc: Document each subtest for testplan
Applying: tests/i915/kms_dsc: Document each subtest for testplan
Applying: tests/i915/kms_fbcon_fbt: Document each subtest for testplan
Applying: tests/i915/kms_fence_pin_leak: Document each subtest for testplan
Applying: tests/i915/kms_flip_scaled_crc: Document each subtest for testplan
Applying: tests/i915/kms_flip_tiling: Document each subtest for testplan
Applying: tests/i915/kms_frontbuffer_tracking: Document each subtest for testplan
Applying: tests/i915/kms_legacy_colorkey: Document each subtest for testplan
Applying: tests/i915/kms_mmap_write_crc: Document each subtest for testplan
Applying: tests/i915/kms_pipe_b_c_ivb: Document each subtest for testplan
Applying: tests/i915/kms_psr: Document each subtest for testplan
Applying: tests/i915/kms_psr2_sf: Document each subtest for testplan
Applying: tests/i915/kms_psr2_su: Document each subtest for testplan
Applying: tests/i915/kms_psr_stress_test: Document each subtest for testplan
Applying: tests/i915/kms_pwrite_crc: Document each subtest for testplan
Applying: tests/kms_3d: Document each subtest for testplan
Applying: tests/kms_addfb_basic: Document each subtest for testplan
Applying: tests/kms_async_flips: Document each subtest for testplan
Applying: tests/kms_atomic: Document each subtest for testplan
Applying: tests/kms_atomic_interruptible: Document each subtest for testplan
Applying: tests/kms_atomic_transition: Document each subtest for testplan
Applying: tests/kms_bw: Document each subtest for testplan
Applying: tests/kms_color: Document each subtest for testplan
Applying: tests/kms_concurrent: Document each subtest for testplan
Applying: tests/kms_content_protection: Document each subtest for testplan
Applying: tests/kms_cursor_crc: Document each subtest for testplan
Applying: tests/kms_cursor_edge_walk: Document each subtest for testplan
Applying: tests/kms_cursor_legacy: Document each subtest for testplan
Applying: tests/kms_display_modes: Document each subtest for testplan
Applying: tests/kms_dither: Document each subtest for testplan
Applying: tests/kms_dp_aux_dev: Document each subtest for testplan
Applying: tests/kms_dp_tiled_display: Document each subtest for testplan
Applying: tests/kms_flip: Document each subtest for testplan
Applying: tests/kms_flip_event_leak: Document each subtest for testplan
Applying: tests/kms_force_connector_basic: Document each subtest for testplan
Applying: tests/kms_getfb: Document each subtest for testplan
Applying: tests/kms_hdmi_inject: Document each subtest for testplan
Applying: tests/kms_hdr: Document each subtest for testplan
Applying: tests/kms_invalid_mode: Document each subtest for testplan
Applying: tests/kms_lease: Document each subtest for testplan
Applying: tests/kms_multipipe_modeset: Document each subtest for testplan
Applying: tests/kms_panel_fitting: Document each subtest for testplan
Applying: tests/kms_pipe_crc_basic: Document each subtest for testplan
Applying: tests/kms_plane: Document each subtest for testplan
Applying: tests/kms_plane_alpha_blend: Document each subtest for testplan
Applying: tests/kms_plane_cursor: Document each subtest for testplan
Applying: tests/kms_plane_lowres: Document each subtest for testplan
Applying: tests/kms_plane_multiple: Document each subtest for testplan
Applying: tests/kms_plane_scaling: Document each subtest for testplan
Applying: tests/kms_prime: Document each subtest for testplan
Applying: tests/kms_prop_blob: Document each subtest for testplan
Applying: tests/kms_properties: Document each subtest for testplan
Applying: tests/kms_rmfb: Document each subtest for testplan
Applying: tests/kms_rotation_crc: Document each subtest for testplan
Applying: tests/kms_scaling_modes: Document each subtest for testplan
Applying: tests/kms_selftest: Document each subtest for testplan
Applying: tests/kms_sequence: Document each subtest for testplan
Applying: tests/kms_setmode: Document each subtest for testplan
Applying: tests/kms_sysfs_edid_timing: Document each subtest for testplan
Applying: tests/kms_tv_load_detect: Document each subtest for testplan
Applying: tests/kms_universal_plane: Document each subtest for testplan
Applying: tests/kms_vblank: Document each subtest for testplan
Applying: tests/kms_vrr: Document each subtest for testplan
Applying: tests/kms_writeback: Document each subtest for testplan
Applying: testplan/kms: Make documentation is mandatory for all kms subtests
Using index info to reconstruct a base tree...
M	docs/testplan/meson.build
Falling back to patching base and 3-way merge...
Auto-merging docs/testplan/meson.build
CONFLICT (content): Merge conflict in docs/testplan/meson.build
Patch failed at 0079 testplan/kms: Make documentation is mandatory for all kms subtests
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

