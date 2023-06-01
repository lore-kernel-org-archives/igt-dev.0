Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F78910E51F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 06:23:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 11:47:53 +0530
Message-Id: <20230601061753.1028181-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel-ci/xe: Blocklist non-Xe tests
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

To enable the CI for Xe full run, exclude all non-Xe tests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 4285881be07..d035604c1b6 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -1,4 +1,35 @@
 ##################################################################
+# Non-Xe tests
+##################################################################
+igt@amdgpu.*
+igt@api.*
+igt@core.*
+igt@debugfs.*
+igt@device_reset
+igt@dmabuf.*
+igt@drm.*
+igt@dumb.*
+igt@fbdev
+igt@feature_discovery
+igt@gem.*
+igt@gen.*
+igt@i915_.*
+igt@meta_test
+igt@msm_.*
+igt@nouveau_.*
+igt@panfrost_.*
+igt@perf.*
+igt@prime_.*
+igt@sw_sync
+igt@syncobj_.*
+igt@sysfs_.*
+igt@template
+igt@tools_test
+igt@v3d.*
+igt@vc4.*
+igt@vgem_.*
+igt@vmwgfx.*
+##################################################################
 #Pipe E, F, G and H
 ##################################################################
 igt@.*@.*pipe-(e|f|g|h).*
-- 
2.40.0
