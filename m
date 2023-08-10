Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Date: Thu, 10 Aug 2023 04:11:50 -0000
Message-ID: <169164071086.4960.10528798668865948287@emeril.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBEb2N1?=
 =?utf-8?q?ment_KMS_tests_=28rev13=29?=
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

Series: Document KMS tests (rev13)
URL   : https://patchwork.freedesktop.org/series/117749/
State : failure

== Summary ==

Applying: testplan/kms: Keep category as high level entity
Applying: testplan/kms: Add support to differentiate b/w drivers
Applying: testplan/kms: Include testdisplay to kms testplan config
Applying: testplan/kms: Exclude kms helpers form testplan
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
Using index info to reconstruct a base tree...
M	tests/i915/kms_dsc.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/kms_dsc.c
Applying: tests/i915/kms_fb_coherency: Document each subtest for testplan
Applying: tests/i915/kms_fbcon_fbt: Document each subtest for testplan
Applying: tests/i915/kms_fence_pin_leak: Document each subtest for testplan
Applying: tests/i915/kms_flip_scaled_crc: Document each subtest for testplan
Applying: tests/i915/kms_flip_tiling: Document each subtest for testplan
Applying: tests/i915/kms_frontbuffer_tracking: Document each subtest for testplan
Applying: tests/i915/kms_legacy_colorkey: Document each subtest for testplan
Applying: tests/i915/kms_mmap_write_crc: Document each subtest for testplan
Applying: tests/i915/kms_pipe_b_c_ivb: Document each subtest for testplan
Applying: tests/i915/kms_psr: Document each subtest for testplan
Using index info to reconstruct a base tree...
M	tests/i915/kms_psr.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/kms_psr.c
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
Patch failed at 0055 tests/kms_lease: Document each subtest for testplan
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

