Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519A810E112
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:46:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 08:46:35 -0700
Message-Id: <20230519154650.3751855-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
References: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 01/16] i915/gem_engine_topology: Support
 gem_list_engines on platforms prior to MTL
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

gem_list_engines() should list engines correctly on platforms prior to
MTL. But at present it doesn't, it only supports MTL, and it skips on the
'igt_require(IS_METEORLAKE)' check for prior platforms. Fix this by
modifying gem_engine_to_gt_map() to return gt 0 for prior platforms,
because the only multi-gt platform supported at present in MTL.

Fixes: d2f39ce8186a ("lib/i915/gem_engine_topology: list engines specific to gt")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/gem_engine_topology.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 6c8929ec5..7c6cd9ba9 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -372,8 +372,12 @@ mtl_engine_to_gt_map(const struct i915_engine_class_instance *e)
 
 static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
 {
-	igt_require(IS_METEORLAKE(intel_get_drm_devid(i915)));
-	return mtl_engine_to_gt_map(engine);
+	uint32_t devid = intel_get_drm_devid(i915);
+
+	/* Only MTL multi-gt supported at present */
+	igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70));
+
+	return IS_METEORLAKE(devid) ? mtl_engine_to_gt_map(engine) : 0;
 }
 
 /**
-- 
2.36.1
