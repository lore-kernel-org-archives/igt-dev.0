Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFC46EA20
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2020 08:31:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 31 Jul 2020 10:30:32 +0200
Message-Id: <20200731083032.28317-19-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200731083032.28317-1-zbigniew.kempczynski@intel.com>
References: <20200731083032.28317-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v20 18/18] HAX: check failing tests in BAT
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
 tests/intel-ci/fast-feedback.testlist | 177 +++++++++++++++++++++++---
 1 file changed, 161 insertions(+), 16 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index b796b264..c0b882b0 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,5 +1,31 @@
 # Keep alphabetically sorted by default
 
+igt@api_intel_bb@blit-noreloc-keep-cache
+igt@api_intel_bb@blit-noreloc-purge-cache
+igt@api_intel_bb@blit-reloc-keep-cache
+igt@api_intel_bb@blit-reloc-purge-cache
+igt@api_intel_bb@check-canonical
+igt@api_intel_bb@full-batch
+igt@api_intel_bb@intel-bb-blit-none
+igt@api_intel_bb@intel-bb-blit-x
+igt@api_intel_bb@intel-bb-blit-y
+igt@api_intel_bb@offset-control
+igt@api_intel_bb@render-ccs
+igt@api_intel_bb@render-none-1024
+igt@api_intel_bb@render-none-512
+igt@api_intel_bb@render-none-reloc-1024
+igt@api_intel_bb@render-none-reloc-512
+igt@api_intel_bb@render-x-1024
+igt@api_intel_bb@render-x-512
+igt@api_intel_bb@render-x-reloc-1024
+igt@api_intel_bb@render-x-reloc-512
+igt@api_intel_bb@render-y-1024
+igt@api_intel_bb@render-y-512
+igt@api_intel_bb@render-y-reloc-1024
+igt@api_intel_bb@render-y-reloc-512
+igt@api_intel_bb@reset-flags
+igt@api_intel_bb@simple-bb
+igt@api_intel_bb@simple-bb-ctx
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@mmap
@@ -14,9 +40,9 @@ igt@gem_ctx_create@basic-files
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
@@ -45,6 +71,10 @@ igt@gem_wait@wait@all
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
@@ -82,17 +112,90 @@ igt@kms_addfb_basic@unused-handle
 igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
+igt@kms_big_fb@linear-16bpp-rotate-0
+igt@kms_big_fb@linear-16bpp-rotate-180
+igt@kms_big_fb@linear-16bpp-rotate-270
+igt@kms_big_fb@linear-16bpp-rotate-90
+igt@kms_big_fb@linear-32bpp-rotate-0
+igt@kms_big_fb@linear-32bpp-rotate-180
+igt@kms_big_fb@linear-32bpp-rotate-270
+igt@kms_big_fb@linear-32bpp-rotate-90
+igt@kms_big_fb@linear-64bpp-rotate-0
+igt@kms_big_fb@linear-64bpp-rotate-180
+igt@kms_big_fb@linear-64bpp-rotate-270
+igt@kms_big_fb@linear-64bpp-rotate-90
+igt@kms_big_fb@linear-8bpp-rotate-0
+igt@kms_big_fb@linear-8bpp-rotate-180
+igt@kms_big_fb@linear-8bpp-rotate-270
+igt@kms_big_fb@linear-8bpp-rotate-90
+igt@kms_big_fb@linear-addfb
+igt@kms_big_fb@x-tiled-16bpp-rotate-0
+igt@kms_big_fb@x-tiled-16bpp-rotate-180
+igt@kms_big_fb@x-tiled-16bpp-rotate-270
+igt@kms_big_fb@x-tiled-16bpp-rotate-90
+igt@kms_big_fb@x-tiled-32bpp-rotate-0
+igt@kms_big_fb@x-tiled-32bpp-rotate-180
+igt@kms_big_fb@x-tiled-32bpp-rotate-270
+igt@kms_big_fb@x-tiled-32bpp-rotate-90
+igt@kms_big_fb@x-tiled-64bpp-rotate-0
+igt@kms_big_fb@x-tiled-64bpp-rotate-180
+igt@kms_big_fb@x-tiled-64bpp-rotate-270
+igt@kms_big_fb@x-tiled-64bpp-rotate-90
+igt@kms_big_fb@x-tiled-8bpp-rotate-0
+igt@kms_big_fb@x-tiled-8bpp-rotate-180
+igt@kms_big_fb@x-tiled-8bpp-rotate-270
+igt@kms_big_fb@x-tiled-8bpp-rotate-90
+igt@kms_big_fb@x-tiled-addfb
+igt@kms_big_fb@x-tiled-addfb-size-offset-overflow
+igt@kms_big_fb@x-tiled-addfb-size-overflow
+igt@kms_big_fb@yf-tiled-16bpp-rotate-0
+igt@kms_big_fb@yf-tiled-16bpp-rotate-180
+igt@kms_big_fb@yf-tiled-16bpp-rotate-270
+igt@kms_big_fb@yf-tiled-16bpp-rotate-90
+igt@kms_big_fb@yf-tiled-32bpp-rotate-0
+igt@kms_big_fb@yf-tiled-32bpp-rotate-180
+igt@kms_big_fb@yf-tiled-32bpp-rotate-270
+igt@kms_big_fb@yf-tiled-32bpp-rotate-90
+igt@kms_big_fb@yf-tiled-64bpp-rotate-0
+igt@kms_big_fb@yf-tiled-64bpp-rotate-180
+igt@kms_big_fb@yf-tiled-64bpp-rotate-270
+igt@kms_big_fb@yf-tiled-64bpp-rotate-90
+igt@kms_big_fb@yf-tiled-8bpp-rotate-0
+igt@kms_big_fb@yf-tiled-8bpp-rotate-180
+igt@kms_big_fb@yf-tiled-8bpp-rotate-270
+igt@kms_big_fb@yf-tiled-8bpp-rotate-90
+igt@kms_big_fb@yf-tiled-addfb
+igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow
+igt@kms_big_fb@yf-tiled-addfb-size-overflow
+igt@kms_big_fb@y-tiled-16bpp-rotate-0
+igt@kms_big_fb@y-tiled-16bpp-rotate-180
+igt@kms_big_fb@y-tiled-16bpp-rotate-270
+igt@kms_big_fb@y-tiled-16bpp-rotate-90
+igt@kms_big_fb@y-tiled-32bpp-rotate-0
+igt@kms_big_fb@y-tiled-32bpp-rotate-180
+igt@kms_big_fb@y-tiled-32bpp-rotate-270
+igt@kms_big_fb@y-tiled-32bpp-rotate-90
+igt@kms_big_fb@y-tiled-64bpp-rotate-0
+igt@kms_big_fb@y-tiled-64bpp-rotate-180
+igt@kms_big_fb@y-tiled-64bpp-rotate-270
+igt@kms_big_fb@y-tiled-64bpp-rotate-90
+igt@kms_big_fb@y-tiled-8bpp-rotate-0
+igt@kms_big_fb@y-tiled-8bpp-rotate-180
+igt@kms_big_fb@y-tiled-8bpp-rotate-270
+igt@kms_big_fb@y-tiled-8bpp-rotate-90
+igt@kms_big_fb@y-tiled-addfb
+igt@kms_big_fb@y-tiled-addfb-size-offset-overflow
+igt@kms_big_fb@y-tiled-addfb-size-overflow
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
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
@@ -114,19 +217,60 @@ igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
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
+igt@kms_psr2_su@frontbuffer
+igt@kms_psr2_su@page_flip
+igt@kms_psr@basic
+igt@kms_psr@cursor_blt
+igt@kms_psr@cursor_mmap_cpu
+igt@kms_psr@cursor_mmap_gtt
 igt@kms_psr@cursor_plane_move
-igt@kms_psr@sprite_plane_onoff
+igt@kms_psr@cursor_plane_move
+igt@kms_psr@cursor_plane_onoff
+igt@kms_psr@cursor_render
+igt@kms_psr@dpms
+igt@kms_psr@no_drrs
+igt@kms_psr@primary_blt
+igt@kms_psr@primary_mmap_cpu
+igt@kms_psr@primary_mmap_gtt
 igt@kms_psr@primary_mmap_gtt
+igt@kms_psr@primary_page_flip
+igt@kms_psr@primary_page_flip
+igt@kms_psr@primary_render
+igt@kms_psr@psr2_basic
+igt@kms_psr@psr2_cursor_blt
+igt@kms_psr@psr2_cursor_mmap_cpu
+igt@kms_psr@psr2_cursor_mmap_gtt
+igt@kms_psr@psr2_cursor_plane_move
+igt@kms_psr@psr2_cursor_plane_onoff
+igt@kms_psr@psr2_cursor_render
+igt@kms_psr@psr2_dpms
+igt@kms_psr@psr2_no_drrs
+igt@kms_psr@psr2_primary_blt
+igt@kms_psr@psr2_primary_mmap_cpu
+igt@kms_psr@psr2_primary_mmap_gtt
+igt@kms_psr@psr2_primary_page_flip
+igt@kms_psr@psr2_primary_render
+igt@kms_psr@psr2_sprite_blt
+igt@kms_psr@psr2_sprite_mmap_cpu
+igt@kms_psr@psr2_sprite_mmap_gtt
+igt@kms_psr@psr2_sprite_plane_move
+igt@kms_psr@psr2_sprite_plane_onoff
+igt@kms_psr@psr2_sprite_render
+igt@kms_psr@psr2_suspend
+igt@kms_psr@sprite_blt
+igt@kms_psr@sprite_mmap_cpu
+igt@kms_psr@sprite_mmap_gtt
+igt@kms_psr@sprite_plane_move
+igt@kms_psr@sprite_plane_onoff
+igt@kms_psr@sprite_plane_onoff
+igt@kms_psr@sprite_render
+igt@kms_psr@suspend
 igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
-igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
@@ -139,7 +283,6 @@ igt@prime_vgem@basic-fence-read
 igt@prime_vgem@basic-gtt
 igt@prime_vgem@basic-read
 igt@prime_vgem@basic-write
-igt@vgem_basic@setversion
 igt@vgem_basic@create
 igt@vgem_basic@debugfs
 igt@vgem_basic@dmabuf-export
@@ -148,6 +291,7 @@ igt@vgem_basic@dmabuf-fence-before
 igt@vgem_basic@dmabuf-mmap
 igt@vgem_basic@mmap
 igt@vgem_basic@second-client
+igt@vgem_basic@setversion
 igt@vgem_basic@sysfs
 
 # All tests that do module unloading and reloading are executed last.
@@ -161,3 +305,4 @@ igt@i915_pm_rpm@module-reload
 # Kernel selftests
 igt@i915_selftest@live
 igt@dmabuf@all
+
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
