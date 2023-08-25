Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6AB10E626
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 07:39:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:00:56 +0530
Message-Id: <20230825073059.856371-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
References: <20230825073059.856371-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 13/16] tests/intel-ci: Drop tiling tests from
 xe blocklist
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

Drop tiling tests from the xe blocklist, since those are
no more invalid for XE.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 1778e91f1..ef48edf4c 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -54,7 +54,6 @@ igt@.*@.*pipe-(e|f|g|h).*
 igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
-igt@kms_draw_crc@fill-fb
 igt@kms_pipe_b_c_ivb@.*
 igt@kms_pwrite_crc
 igt@kms_ccs@.*
@@ -65,20 +64,11 @@ igt@kms_busy@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
 igt@kms_legacy_colorkey@basic
 igt@kms_legacy_colorkey@invalid-plane
-igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
-igt@kms_big_fb@(4|x|y|yf)-tiled-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-igt@kms_addfb_basic@.*-tiling
-igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
-igt@kms_async_flips@.*
-igt@kms_plane_multiple@tiling-(4|x|y|yf)
 igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
-igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
-igt@kms_getfb@.*-ccs
-igt@kms_plane_lowres@tiling-(4|x|y|yf)
 igt@kms_.*@.*hang.*
 ##################################################################
-- 
2.40.0
