Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8E910E0C9
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 17:16:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 22:37:18 +0530
Message-Id: <20230913170719.2078729-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230913170719.2078729-1-bhanuprakash.modem@intel.com>
References: <20230913170719.2078729-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] intel-ci/xe: Update kms blocklist
 documentation
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

Add justification to kms blocklist.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index e73018ec6..48b979565 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -44,28 +44,29 @@ igt@syncobj_.*
 igt@template
 igt@tools_test
 ##################################################################
-# Pipe E, F, G and H
+# KMS: Pipe E, F, G and H are not available on Intel hardware
 ##################################################################
 igt@.*@.*pipe-(e|f|g|h).*
-##################################################################
-# Multidisplay
-##################################################################
 igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
+# KMS: Tests specific to i915 driver
+##################################################################
+igt@kms_addfb_basic@clobberred-modifier
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
-igt@kms_pipe_b_c_ivb@.*
-igt@kms_pwrite_crc
-igt@kms_ccs@.*
-igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
-igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
 igt@kms_fence_pin_leak
-igt@kms_busy@.*
-igt@kms_psr@.*_mmap_(cpu|gtt)
-igt@kms_legacy_colorkey@basic
-igt@kms_legacy_colorkey@invalid-plane
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
-igt@kms_addfb_basic@clobberred-modifier
-igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
+igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
+igt@kms_legacy_colorkey@.*
+igt@kms_pipe_b_c_ivb@.*
+igt@kms_psr@.*_mmap_(cpu|gtt)
+igt@kms_pwrite_crc
+igt@kms_rotation_crc@exhaust-fences
+##################################################################
+# KMS: Yet to add/missing XE support
+##################################################################
+igt@kms_busy@.*
+igt@kms_ccs@.*
+igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
 ##################################################################
-- 
2.40.0
