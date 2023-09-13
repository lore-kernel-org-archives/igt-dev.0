Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E58710E0C9
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 17:16:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 22:37:19 +0530
Message-Id: <20230913170719.2078729-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230913170719.2078729-1-bhanuprakash.modem@intel.com>
References: <20230913170719.2078729-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] intel-ci/xe: Update XE kms blocklist
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

Update XE blocklist with unsuppored subtests.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 48b979565..94267843a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -1,10 +1,10 @@
 ###############################################
 igt@meta_test(@.*)?
 ##################################################################
-# Non-Xe driver tests
+# Non-Intel driver tests
 ##################################################################
 igt@amdgpu.*
-igt@i915_.*
+igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 igt@msm_.*
 igt@nouveau_.*
 igt@panfrost_.*
@@ -13,11 +13,12 @@ igt@vc4.*
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
@@ -51,11 +52,12 @@ igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
 ##################################################################
+igt@kms_addfb_basic@bo-too-small-due-to-tiling
 igt@kms_addfb_basic@clobberred-modifier
+igt@kms_addfb_basic@.*framebuffer-vs-set-tiling
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
 igt@kms_fence_pin_leak
-igt@kms_flip@2x-flip-vs-fences
-igt@kms_flip@flip-vs-fences(-interruptible)
+igt@kms_flip@.*flip-vs-fences.*
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
 igt@kms_legacy_colorkey@.*
@@ -68,5 +70,7 @@ igt@kms_rotation_crc@exhaust-fences
 ##################################################################
 igt@kms_busy@.*
 igt@kms_ccs@.*
-igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
+igt@kms_fbcon_fbt@.*
+igt@kms_prime@.*
+igt@kms_fb_coherency@memset-crc
 ##################################################################
-- 
2.40.0
