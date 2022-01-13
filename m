Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 08:59:42 -0800
Message-Id: <20220113165944.1414015-14-John.C.Harrison@Intel.com>
In-Reply-To: <20220113165944.1414015-1-John.C.Harrison@Intel.com>
References: <20220113165944.1414015-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 i-g-t 13/15] lib/i915: Add helper for
 non-destructive engine property updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Various tests want to configure engine properties such as pre-emption
timeout and heartbeat interval. Some don't bother to restore the
original values again afterwards. So, add a helper to make it easier
to do this.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 lib/i915/gem_engine_topology.c | 39 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  9 ++++++++
 2 files changed, 48 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 729f42b0a..3f6a861d3 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -488,6 +488,45 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 	return ret;
 }
 
+/* Ensure fast hang detection */
+void gem_engine_properties_configure(int fd, struct gem_engine_properties *params)
+{
+	int ret;
+	struct gem_engine_properties write = *params;
+
+	ret = gem_engine_property_scanf(fd, write.engine->name,
+					"preempt_timeout_ms",
+					"%d", &params->preempt_timeout);
+	igt_assert_eq(ret, 1);
+	ret = gem_engine_property_scanf(fd, write.engine->name,
+					"heartbeat_interval_ms",
+					"%d", &params->heartbeat_interval);
+	igt_assert_eq(ret, 1);
+
+	ret = gem_engine_property_printf(fd, write.engine->name,
+					 "preempt_timeout_ms", "%d",
+					 write.preempt_timeout);
+	igt_assert_lt(0, ret);
+	ret = gem_engine_property_printf(fd, write.engine->name,
+					 "heartbeat_interval_ms", "%d",
+					 write.heartbeat_interval);
+	igt_assert_lt(0, ret);
+}
+
+void gem_engine_properties_restore(int fd, const struct gem_engine_properties *saved)
+{
+	int ret;
+
+	ret = gem_engine_property_printf(fd, saved->engine->name,
+					 "preempt_timeout_ms", "%d",
+					 saved->preempt_timeout);
+	igt_assert_lt(0, ret);
+	ret = gem_engine_property_printf(fd, saved->engine->name,
+					 "heartbeat_interval_ms", "%d",
+					 saved->heartbeat_interval);
+	igt_assert_lt(0, ret);
+}
+
 uint32_t gem_engine_mmio_base(int i915, const char *engine)
 {
 	unsigned int mmio = 0;
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 4cfab560b..b413aa8ab 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -115,6 +115,15 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 	     ((e__) = intel_get_current_physical_engine(&i__##e__)); \
 	     intel_next_engine(&i__##e__))
 
+struct gem_engine_properties {
+	const struct intel_execution_engine2 *engine;
+	int preempt_timeout;
+	int heartbeat_interval;
+};
+
+void gem_engine_properties_configure(int fd, struct gem_engine_properties *params);
+void gem_engine_properties_restore(int fd, const struct gem_engine_properties *saved);
+
 __attribute__((format(scanf, 4, 5)))
 int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 			      const char *fmt, ...);
-- 
2.25.1
