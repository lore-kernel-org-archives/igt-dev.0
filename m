Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9A010E393
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 12:48:24 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 10 Dec 2021 18:23:05 +0530
Message-Id: <20211210125306.3681902-5-apoorva1.singh@intel.com>
In-Reply-To: <20211210125306.3681902-1-apoorva1.singh@intel.com>
References: <20211210125306.3681902-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3 4/5] i915/gem_engine_topology: Only use the main copy engines
 for XY_BLOCK_COPY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, ramalingam.c@intel.com, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

XY_BLOCK_COPY blt command is used to transfer the ccs data.
So, we can only run the tests on those engines which have
support for the "block_copy" capability.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915/gem_engine_topology.c | 38 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  5 +++++
 2 files changed, 43 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 729f42b0..37b5875e 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -488,6 +488,44 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 	return ret;
 }
 
+static bool
+__gem_engine_has_capability(int i915, const char *engine,
+			    const char *attr, const char *cap)
+{
+	char buf[4096] = {};
+	FILE *file;
+
+	file = __open_attr(igt_sysfs_open(i915), "r",
+			   "engine", engine, attr, NULL);
+	if (file) {
+		fread(buf, 1, sizeof(buf) - 1, file);
+		fclose(file);
+	}
+
+	return strstr(buf, cap);
+}
+
+bool gem_engine_has_capability(int i915, const char *engine, const char *cap)
+{
+	return __gem_engine_has_capability(i915, engine, "capabilities", cap);
+}
+
+bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap)
+{
+	return __gem_engine_has_capability(i915, engine, "known_capabilities", cap);
+}
+
+bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine)
+{
+	if (engine->class != I915_ENGINE_CLASS_COPY)
+		return false;
+
+	if (!gem_engine_has_known_capability(i915, engine->name, "block_copy"))
+		return intel_gen(intel_get_drm_devid(i915)) >= 12;
+
+	return gem_engine_has_capability(i915, engine->name, "block_copy");
+}
+
 uint32_t gem_engine_mmio_base(int i915, const char *engine)
 {
 	unsigned int mmio = 0;
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 4cfab560..d24bc9e8 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -124,6 +124,11 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 
 uint32_t gem_engine_mmio_base(int i915, const char *engine);
 
+bool gem_engine_has_capability(int i915, const char *engine, const char *cap);
+bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap);
+
+bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine);
+
 void dyn_sysfs_engines(int i915, int engines, const char *file,
 		       void (*test)(int i915, int engine));
 
-- 
2.25.1
