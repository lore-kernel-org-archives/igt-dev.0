Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B611D10E545
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:53:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 17:22:55 +0530
Message-Id: <20230601115255.422587-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/intel-ci/xe: Blocklist non-Xe tests
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

To enable the CI for Xe full run, exclude all non-Xe tests.

v2: -create different sections (Kamil)
v3: -rearrange few tests (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 47 ++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 4285881b..1cf4bb2c 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -1,5 +1,50 @@
+###############################################
+igt@meta_test(@.*)?
 ##################################################################
-#Pipe E, F, G and H
+# Non-Xe driver tests
+##################################################################
+igt@amdgpu.*
+igt@i915_.*
+igt@msm_.*
+igt@nouveau_.*
+igt@panfrost_.*
+igt@v3d.*
+igt@vc4.*
+igt@vgem_.*
+igt@vmwgfx.*
+##################################################################
+# Exclude all other i915 tests
+##################################################################
+igt@gem.*
+igt@gen.*
+igt@perf.*
+igt@sysfs_.*
+igt@api.*
+##################################################################
+# Exclude temporarily kselftest
+#################################################################
+igt@dmabuf.*
+igt@drm_buddy.*
+igt@drm_mm.*
+igt@kms_selftest.*
+igt@debugfs.*
+igt@drm.*
+##################################################################
+# Exclude all other non-Xe tests
+##################################################################
+igt@core.*
+igt@debugfs.*
+igt@device_reset
+igt@dumb.*
+igt@fbdev
+igt@feature_discovery
+igt@prime_.*
+igt@sw_sync
+igt@syncobj_.*
+igt@template
+igt@tools_test
+##################################################################
+# Pipe E, F, G and H
 ##################################################################
 igt@.*@.*pipe-(e|f|g|h).*
 ##################################################################
-- 
2.25.1
