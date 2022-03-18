Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9843F10EA21
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 16:05:05 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 17:04:44 +0100
Message-Id: <20220318160445.27986-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
References: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_engine_topology: add
 iterator for choosing one random engine from each class
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

In new GPUs there are many engines so tests with fixed timeout
which iterate over all engines can take much longer than on older
gens. Add new iterator for_one_random_cfg_ctx_engine, which will
iterate over each class of engines and will choose one from each
class at random.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/gem_engine_topology.c | 64 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h | 19 ++++++++++
 2 files changed, 83 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ca3333c2..52a2f3ef 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -208,6 +208,70 @@ void intel_next_engine(struct intel_engine_data *ed)
 	}
 }
 
+static void __intel_random_init(void)
+{
+	struct timespec start;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	igt_debug("seed %d\n", (int)start.tv_nsec);
+	srand((int)start.tv_nsec);
+}
+
+static void __intel_find_random_engine(struct intel_engine_data *ed)
+{
+	struct intel_execution_engine2 *ce = ed->current_engine;
+	struct intel_execution_engine2 *next = ce;
+	uint16_t class = ce->class;
+	uint32_t i;
+	uint32_t n;
+
+	n = ed->n;
+	while (class == next->class && n < ed->nengines) {
+		++next;
+		++n;
+	}
+
+	i = n - ed->n;
+	if (i > 1)
+		ed->n += rand() % i;
+
+	ed->current_engine = &ed->engines[ed->n];
+}
+
+struct intel_execution_engine2 *
+intel_get_random_engine(struct intel_engine_data *ed)
+{
+	if (!ed->n) {
+		__intel_random_init();
+		ed->current_engine = &ed->engines[0];
+		__intel_find_random_engine(ed);
+	}
+
+	return ed->current_engine;
+}
+
+void intel_next_random_engine(struct intel_engine_data *ed)
+{
+	struct intel_execution_engine2 *ce = ed->current_engine;
+	uint16_t class;
+
+	if (!ce)
+		return;
+
+	class = ce->class;
+	while (ce->class == class && ed->n < ed->nengines) {
+		ed->n++;
+		++ce;
+	}
+
+	if (ed->n == ed->nengines)
+		ed->current_engine = NULL;
+	else {
+		ed->current_engine = ce;
+		__intel_find_random_engine(ed);
+	}
+}
+
 struct intel_execution_engine2 *
 intel_get_current_physical_engine(struct intel_engine_data *ed)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 987f2bf9..cad5b46b 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,6 +61,10 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
+struct intel_execution_engine2 *
+intel_get_random_engine(struct intel_engine_data *ed);
+void intel_next_random_engine(struct intel_engine_data *ed);
+
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 			 const struct intel_execution_engine2 *e2);
 
@@ -89,6 +93,21 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 	     ((e__) = intel_get_current_engine(&i__##e__)); \
 	     intel_next_engine(&i__##e__))
 
+/**
+ * for_one_random_ctx_cfg_engine
+ * @fd__: open i915 drm file descriptor
+ * @ctx_cfg__: Intel context config
+ * @e__: struct intel_execution_engine2 iterator
+ *
+ * Choose one random engine from each class of physical engine in the context
+ * config
+ */
+#define for_one_random_ctx_cfg_engine(fd__, ctx_cfg__, e__) \
+	for (struct intel_engine_data i__##e__ = \
+		intel_engine_list_for_ctx_cfg(fd__, ctx_cfg__); \
+	     ((e__) = intel_get_random_engine(&i__##e__)); \
+	     intel_next_random_engine(&i__##e__))
+
 /**
  * for_each_ctx_engine
  * @fd__: open i915 drm file descriptor
-- 
2.32.0
