Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417D86EC83
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:30:58 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n12so18339221pgs.13
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:30:58 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:29:58 -0500
Message-Id: <20210609043035.102359-13-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/93] lib/i915/gem_engine_topology: Add an
 iterator which doesn't munge contexts (v2)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

the current for_each_physical_engine iterators smash the set of engines
on the context (or ctx0 for the __ version).  This new one just gets the
list of engines from i915 and iterates over them.

v2 (Jason Ekstrand):
 - Add docs

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/i915/gem_engine_topology.c | 16 ++++++++++++++++
 lib/i915/gem_engine_topology.h | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index d1f94761..6bceb909 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -240,6 +240,22 @@ static struct intel_engine_data intel_engine_list_for_static(int fd)
 	return engine_data;
 }
 
+/**
+ * intel_engine_list_of_physical:
+ * @fd: open i915 drm file descriptor
+ *
+ * Returns the list of all physical engines in the device
+ */
+struct intel_engine_data intel_engine_list_of_physical(int fd)
+{
+	struct intel_engine_data engine_data = { };
+
+	if (__query_engine_list(fd, &engine_data) == 0)
+		return engine_data;
+
+	return intel_engine_list_for_static(fd);
+}
+
 static int gem_topology_get_param(int fd,
 				  struct drm_i915_gem_context_param *p)
 {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 26a7af18..bd93e410 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -50,6 +50,7 @@ struct intel_engine_data {
 };
 
 bool gem_has_engine_topology(int fd);
+struct intel_engine_data intel_engine_list_of_physical(int fd);
 struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
 
 /* iteration functions */
@@ -85,6 +86,21 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 	     ((e__) = intel_get_current_engine(&i__)); \
 	     intel_next_engine(&i__))
 
+/**
+ * for_each_physical_engine
+ * @fd__: open i915 drm file descriptor
+ * @e__: struct intel_execution_engine2 iterator
+ *
+ * Iterates over each physical engine in device.  Be careful when using
+ * this iterator as your context may not have all of these engines and the
+ * intel_execution_engine2::flags field in the iterator may not match your
+ * context configuration.
+ */
+#define for_each_physical_engine(fd__, e__) \
+	for (struct intel_engine_data i__##e__ = intel_engine_list_of_physical(fd__); \
+	     ((e__) = intel_get_current_physical_engine(&i__##e__)); \
+	     intel_next_engine(&i__##e__))
+
 /* needs to replace "for_each_physical_engine" when conflicts are fixed */
 #define ____for_each_physical_engine(fd__, ctx__, e__) \
 	for (struct intel_engine_data i__##e__ = intel_init_engine_list(fd__, ctx__); \
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
