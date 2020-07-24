Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2A66E891
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2020 20:23:12 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 24 Jul 2020 22:22:33 +0200
Message-Id: <20200724202233.14952-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200724202233.14952-1-zbigniew.kempczynski@intel.com>
References: <20200724202233.14952-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 14/14] HAX: run rendercopy tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/intel-ci/fast-feedback.testlist | 42 +++++++++++++++++----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..d45fd523 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,5 +1,6 @@
 # Keep alphabetically sorted by default
 
+igt@api_intel_bb
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@mmap
@@ -7,6 +8,7 @@ igt@gem_basic@bad-close
 igt@gem_basic@create-close
 igt@gem_basic@create-fd-close
 igt@gem_busy@busy@all
+igt@gem_caching
 igt@gem_close_race@basic-process
 igt@gem_close_race@basic-threads
 igt@gem_ctx_create@basic
@@ -14,9 +16,9 @@ igt@gem_ctx_create@basic-files
 igt@gem_ctx_exec@basic
 igt@gem_exec_basic@basic
 igt@gem_exec_create@basic
+igt@gem_exec_fence@basic-await
 igt@gem_exec_fence@basic-busy
 igt@gem_exec_fence@basic-wait
-igt@gem_exec_fence@basic-await
 igt@gem_exec_fence@nb-await
 igt@gem_exec_gttfill@basic
 igt@gem_exec_parallel@engines
@@ -32,6 +34,9 @@ igt@gem_huc_copy@huc-copy
 igt@gem_linear_blits@basic
 igt@gem_mmap@basic
 igt@gem_mmap_gtt@basic
+igt@gem_ppgtt
+igt@gem_read_read_speed
+igt@gem_render_copy
 igt@gem_render_linear_blits@basic
 igt@gem_render_tiled_blits@basic
 igt@gem_ringfill@basic-all
@@ -45,6 +50,10 @@ igt@gem_wait@wait@all
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
+igt@i915_pm_backlight@basic-brightness
+igt@i915_pm_rpm@basic-pci-d3-state
+igt@i915_pm_rpm@basic-rte
+igt@i915_pm_rps@basic-api
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
 igt@kms_addfb_basic@addfb25-modifier-no-flag
@@ -82,17 +91,18 @@ igt@kms_addfb_basic@unused-handle
 igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
+igt@kms_big_fb
 igt@kms_busy@basic
-igt@kms_chamelium@dp-hpd-fast
-igt@kms_chamelium@dp-edid-read
+igt@kms_chamelium@common-hpd-after-suspend
 igt@kms_chamelium@dp-crc-fast
-igt@kms_chamelium@hdmi-hpd-fast
-igt@kms_chamelium@hdmi-edid-read
+igt@kms_chamelium@dp-edid-read
+igt@kms_chamelium@dp-hpd-fast
 igt@kms_chamelium@hdmi-crc-fast
-igt@kms_chamelium@vga-hpd-fast
+igt@kms_chamelium@hdmi-edid-read
+igt@kms_chamelium@hdmi-hpd-fast
 igt@kms_chamelium@vga-edid-read
-igt@kms_chamelium@common-hpd-after-suspend
-igt@kms_prop_blob@basic
+igt@kms_chamelium@vga-hpd-fast
+igt@kms_cursor_crc
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
@@ -101,6 +111,7 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_draw_crc
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
@@ -109,24 +120,23 @@ igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_frontbuffer_tracking
 igt@kms_frontbuffer_tracking@basic
 igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
 igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
 igt@kms_pipe_crc_basic@read-crc-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
 igt@kms_pipe_crc_basic@read-crc-pipe-b
 igt@kms_pipe_crc_basic@read-crc-pipe-c
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
 igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
-igt@kms_psr@primary_page_flip
+igt@kms_prop_blob@basic
+igt@kms_psr
 igt@kms_psr@cursor_plane_move
-igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
+igt@kms_psr@primary_page_flip
+igt@kms_psr@sprite_plane_onoff
 igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
@@ -139,7 +149,6 @@ igt@prime_vgem@basic-fence-read
 igt@prime_vgem@basic-gtt
 igt@prime_vgem@basic-read
 igt@prime_vgem@basic-write
-igt@vgem_basic@setversion
 igt@vgem_basic@create
 igt@vgem_basic@debugfs
 igt@vgem_basic@dmabuf-export
@@ -148,6 +157,7 @@ igt@vgem_basic@dmabuf-fence-before
 igt@vgem_basic@dmabuf-mmap
 igt@vgem_basic@mmap
 igt@vgem_basic@second-client
+igt@vgem_basic@setversion
 igt@vgem_basic@sysfs
 
 # All tests that do module unloading and reloading are executed last.
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
