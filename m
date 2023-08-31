Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05510E050
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 06:10:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu, 31 Aug 2023 11:32:43 +0530
Message-Id: <20230831060243.1048579-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] Revert "tests/intel-ci: Drop tiling tests from xe
 blocklist"
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

As tiling required DPT support, we need to blocklist the tiling
tests until the XE DPT changes landed in the Kernel.

This reverts commit 4dfa4c97c936eb2de0e2d1ed515e596c2ccbee2c.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2df3810af..d90df7505 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -54,6 +54,7 @@ igt@.*@.*pipe-(e|f|g|h).*
 igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
+igt@kms_draw_crc@fill-fb
 igt@kms_pipe_b_c_ivb@.*
 igt@kms_pwrite_crc
 igt@kms_ccs@.*
@@ -64,11 +65,20 @@ igt@kms_busy@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
 igt@kms_legacy_colorkey@basic
 igt@kms_legacy_colorkey@invalid-plane
+igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
+igt@kms_big_fb@(4|x|y|yf)-tiled-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
+igt@kms_addfb_basic@.*-tiling
+igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
+igt@kms_async_flips@.*
+igt@kms_plane_multiple@tiling-(4|x|y|yf)
 igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
+igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
+igt@kms_getfb@.*-ccs
+igt@kms_plane_lowres@tiling-(4|x|y|yf)
 igt@kms_.*@.*hang.*
 ##################################################################
-- 
2.40.0
