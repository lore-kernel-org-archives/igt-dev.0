Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31196EC81
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:30:50 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h12-20020a17090aa88cb029016400fd8ad8so624642pjq.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:30:50 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:29:52 -0500
Message-Id: <20210609043035.102359-7-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/93] docs: Add gem_engine_topology.h to
 the docs
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

Also, document a couple things while we're here.  It's nowhere close to
everything but it's more than nothing.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml         |  1 +
 lib/i915/gem_engine_topology.c                   | 16 ++++++++++++++++
 lib/i915/gem_engine_topology.h                   | 15 +++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 192d1df7..2e85f361 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -55,6 +55,7 @@
   <chapter>
     <title>igt/i915 API Reference</title>
     <xi:include href="xml/gem_context.xml"/>
+    <xi:include href="xml/gem_engine_topology.xml"/>
     <xi:include href="xml/gem_scheduler.xml"/>
     <xi:include href="xml/gem_submission.xml"/>
   </chapter>
diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index c12cd920..291fb028 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -32,6 +32,14 @@
 #include "ioctl_wrappers.h"
 
 #include "i915/gem_engine_topology.h"
+/**
+ * SECTION:gem_engine_topology
+ * @short_description: Helpers for dealing engine topology
+ * @title: GEM Engine Topology
+ *
+ * This helper library contains functions used for querying and dealing
+ * with engines in GEM contexts.
+ */
 
 /*
  * Limit what we support for simplicity due limitation in how much we
@@ -276,6 +284,14 @@ int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
 	return 0;
 }
 
+/**
+ * gem_has_engine_topology:
+ * @fd: open i915 drm file descriptor
+ *
+ * Queries whether the engine topology API is supported or not.
+ *
+ * Returns: Engine topology API availability.
+ */
 bool gem_has_engine_topology(int fd)
 {
 	struct drm_i915_gem_context_param param = {
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index f5edcb5d..ac37b19a 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -29,6 +29,15 @@
 
 #define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
 
+/**
+ * intel_engine_data:
+ * @nengines: Number of engines
+ * @n: Current engine index
+ * @current_engine: Current engine
+ * @engines: List of all engines
+ *
+ * This struct acts as an interator for walking over a set of engines.
+ */
 struct intel_engine_data {
 	uint32_t nengines;
 	uint32_t n;
@@ -58,6 +67,12 @@ bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 
 struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 
+/**
+ * __for_each_static_engine:
+ * @e__: struct intel_execution_engine2 iterator
+ *
+ * Iterates over each of the statically defined (legacy) engines.
+ */
 #define __for_each_static_engine(e__) \
 	for ((e__) = intel_execution_engines2; (e__)->name[0]; (e__)++)
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
