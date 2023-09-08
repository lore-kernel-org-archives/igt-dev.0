Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Fri, 08 Sep 2023 11:20:25 -0000
Message-ID: <169417202598.14897.4766504845653164888@emeril.freedesktop.org>
References: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBGaXgg?=
 =?utf-8?q?IGT_Kunit_implementation_issues?=
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

Series: Fix IGT Kunit implementation issues
URL   : https://patchwork.freedesktop.org/series/123434/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee tests/intel-ci/xe.blocklist: Drop hang tests from xe blocklist

Tail of build.log:
[100/1635] Compiling C object 'tests/59830eb@@kms_3d@exe/kms_3d.c.o'.
[101/1635] Compiling C object 'tests/59830eb@@core_auth@exe/core_auth.c.o'.
[102/1635] Generating i915-perf-metrics-mtlgt3 with a custom command.
[103/1635] Compiling C object 'tests/59830eb@@kms_bw@exe/kms_bw.c.o'.
[104/1635] Compiling C object 'tests/59830eb@@drm_read@exe/drm_read.c.o'.
[105/1635] Compiling C object 'tests/59830eb@@kms_flip_event_leak@exe/kms_flip_event_leak.c.o'.
[106/1635] Compiling C object 'tests/59830eb@@kms_invalid_mode@exe/kms_invalid_mode.c.o'.
[107/1635] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color_helper.c.o'.
[108/1635] Generating i915-perf-metrics-acmgt1 with a custom command.
[109/1635] Compiling C object 'tests/59830eb@@device_reset@exe/device_reset.c.o'.
[110/1635] Generating i915-perf-registers-acmgt1 with a custom command.
[111/1635] Compiling C object 'tests/59830eb@@kms_dither@exe/kms_dither.c.o'.
[112/1635] Compiling C object 'tests/59830eb@@kms_hdmi_inject@exe/kms_hdmi_inject.c.o'.
[113/1635] Compiling C object 'tests/59830eb@@kms_display_modes@exe/kms_display_modes.c.o'.
[114/1635] Compiling C object 'tests/59830eb@@kms_plane_cursor@exe/kms_plane_cursor.c.o'.
[115/1635] Compiling C object 'tests/59830eb@@kms_concurrent@exe/kms_concurrent.c.o'.
[116/1635] Compiling C object 'tests/59830eb@@kms_multipipe_modeset@exe/kms_multipipe_modeset.c.o'.
[117/1635] Compiling C object 'tests/59830eb@@kms_atomic_interruptible@exe/kms_atomic_interruptible.c.o'.
[118/1635] Compiling C object 'tests/59830eb@@dmabuf_sync_file@exe/dmabuf_sync_file.c.o'.
[119/1635] Compiling C object 'tests/59830eb@@kms_force_connector_basic@exe/kms_force_connector_basic.c.o'.
[120/1635] Compiling C object 'tests/59830eb@@gem_workarounds@exe/intel_gem_workarounds.c.o'.
[121/1635] Compiling C object 'tests/59830eb@@fbdev@exe/fbdev.c.o'.
[122/1635] Compiling C object 'tests/59830eb@@kms_panel_fitting@exe/kms_panel_fitting.c.o'.
[123/1635] Compiling C object 'tests/59830eb@@kms_cursor_edge_walk@exe/kms_cursor_edge_walk.c.o'.
[124/1635] Compiling C object 'tests/59830eb@@kms_pipe_crc_basic@exe/kms_pipe_crc_basic.c.o'.
[125/1635] Compiling C object 'tests/59830eb@@kms_content_protection@exe/kms_content_protection.c.o'.
[126/1635] Compiling C object 'tests/59830eb@@kms_prime@exe/kms_prime.c.o'.
[127/1635] Compiling C object 'tests/59830eb@@core_hotunplug@exe/core_hotunplug.c.o'.
[128/1635] Compiling C object 'tests/59830eb@@kms_async_flips@exe/kms_async_flips.c.o'.
[129/1635] Compiling C object 'tests/59830eb@@kms_getfb@exe/kms_getfb.c.o'.
[130/1635] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/intel_gem_ctx_isolation.c.o'.
[131/1635] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_scan.c.o'.
[132/1635] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[133/1635] Generating i915-perf-registers-acmgt2 with a custom command.
[134/1635] Compiling C object 'tests/59830eb@@kms_cursor_crc@exe/kms_cursor_crc.c.o'.
[135/1635] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o'.
[136/1635] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
[137/1635] Generating i915-perf-metrics-acmgt2 with a custom command.
[138/1635] Compiling C object 'tests/59830eb@@kms_addfb_basic@exe/kms_addfb_basic.c.o'.
[139/1635] Compiling C object 'tests/59830eb@@kms_plane@exe/kms_plane.c.o'.
[140/1635] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[141/1635] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[142/1635] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[143/1635] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[144/1635] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[145/1635] Generating i915-perf-registers-acmgt3 with a custom command.
[146/1635] Generating i915-perf-metrics-acmgt3 with a custom command.
[147/1635] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[148/1635] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

