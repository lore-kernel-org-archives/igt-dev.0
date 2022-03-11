Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D88310E953
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 12:13:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Mar 2022 13:13:16 +0100
Message-Id: <20220311121318.112757-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220311121318.112757-1-zbigniew.kempczynski@intel.com>
References: <20220311121318.112757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] i915/gem_engine_topology: Add helpers
 for checking driver capabilities
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

From: Chris Wilson <chris.p.wilson@intel.com>

If driver is able to report capabilities we want to use them in easy way.
For example it can support blitter "block_copy" (XY_BLOCK_COPY_BLT
command) and reports it in sysfs. We add then capabilities helpers to
read these properties. Helpers allows checking does driver knows
capability (by checking sysfs "known_capabilities" file) and supports it
(by checking sysfs "capabilities" file). Dedicated helper was added to
verify "block_copy" capability.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/gem_engine_topology.c | 39 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  5 +++++
 2 files changed, 44 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index bd12d0bc98..ca3333c252 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -534,6 +534,45 @@ void gem_engine_properties_restore(int fd, const struct gem_engine_properties *s
 	}
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
+	if (!file)
+		return NULL;
+
+	fread(buf, 1, sizeof(buf) - 1, file);
+	fclose(file);
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
index b413aa8aba..987f2bf944 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -133,6 +133,11 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 
 uint32_t gem_engine_mmio_base(int i915, const char *engine);
 
+bool gem_engine_has_capability(int i915, const char *engine, const char *cap);
+bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap);
+
+bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine);
+
 void dyn_sysfs_engines(int i915, int engines, const char *file,
 		       void (*test)(int i915, int engine));
 
-- 
2.32.0
