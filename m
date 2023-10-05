Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE2310E3F1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 13:08:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:29:48 +0530
Message-Id: <20231005125948.2986826-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231005125948.2986826-1-bhanuprakash.modem@intel.com>
References: <20231005125948.2986826-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/2] intel-ci/xe: Update XE kms blocklist
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

Update XE blocklist with unsupported subtests.

V2: - Rearrange based on the driver support
    - Sort alphabetically
    - Drop kms_ccs & kms_fbcon_fbt

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 34 ++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f4a57aa01..3d5ec1a43 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -1,10 +1,9 @@
 ###############################################
 igt@meta_test(@.*)?
 ##################################################################
-# Non-Xe driver tests
+# Non-Intel driver tests
 ##################################################################
 igt@amdgpu.*
-igt@i915_.*
 igt@msm_.*
 igt@nouveau_.*
 igt@panfrost_.*
@@ -13,11 +12,12 @@ igt@vc4.*
 igt@vgem_.*
 igt@vmwgfx.*
 ##################################################################
-# Exclude all other i915 tests
+# Exclude all i915 tests
 ##################################################################
 igt@api.*
 igt@gem.*
 igt@gen.*
+igt@i915_.*
 igt@perf.*
 igt@sysfs_.*
 ##################################################################
@@ -52,23 +52,27 @@ igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
 ##################################################################
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
+igt@kms_addfb_basic@clobberred-modifier
+igt@kms_addfb_basic@.*framebuffer-vs-set-tiling
+igt@kms_busy@.*
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
-igt@kms_pipe_b_c_ivb@.*
-igt@kms_pwrite_crc
-igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
 igt@kms_fence_pin_leak
-igt@kms_busy@.*
+igt@kms_flip@.*flip-vs-fences.*
+igt@kms_force_connector_basic@force-load-detect
+igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
+igt@kms_legacy_colorkey@.*
+igt@kms_pipe_b_c_ivb@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
-igt@kms_legacy_colorkey@basic
-igt@kms_legacy_colorkey@invalid-plane
-igt@kms_flip@2x-flip-vs-fences
-igt@kms_flip@flip-vs-fences(-interruptible)
-igt@kms_addfb_basic@clobberred-modifier
+igt@kms_pwrite_crc
 igt@kms_rotation_crc@exhaust-fences
-igt@kms_force_connector_basic@force-load-detect
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-igt@kms_ccs@.*
-igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
+igt@kms_fb_coherency@memset-crc
+igt@kms_prime@.*
+##################################################################
+# KMS: Non-Intel tests
+##################################################################
+igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
-- 
2.40.0
