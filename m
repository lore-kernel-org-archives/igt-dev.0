Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB5D6EC70
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:19 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id y32so36061924pga.11
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:35 -0500
Message-Id: <20210423214853.876911-12-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/89] lib/i915/gem_engine_topology: Factor
 out static engine listing
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/i915/gem_engine_topology.c | 51 +++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index ae8d2a33..d1f94761 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -212,6 +212,34 @@ intel_get_current_physical_engine(struct intel_engine_data *ed)
 	return e;
 }
 
+static struct intel_engine_data intel_engine_list_for_static(int fd)
+{
+	const struct intel_execution_engine2 *e2;
+	struct intel_engine_data engine_data = { };
+
+	igt_debug("using pre-allocated engine list\n");
+
+	__for_each_static_engine(e2) {
+		if (igt_only_list_subtests() ||
+		    (fd < 0) ||
+		    gem_has_ring(fd, e2->flags)) {
+			struct intel_execution_engine2 *__e2 =
+				&engine_data.engines[
+				engine_data.nengines];
+
+			strcpy(__e2->name, e2->name);
+			__e2->instance   = e2->instance;
+			__e2->class      = e2->class;
+			__e2->flags      = e2->flags;
+			__e2->is_virtual = false;
+
+			engine_data.nengines++;
+                }
+	}
+
+	return engine_data;
+}
+
 static int gem_topology_get_param(int fd,
 				  struct drm_i915_gem_context_param *p)
 {
@@ -232,28 +260,7 @@ struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
 
 	if (gem_topology_get_param(fd, &param)) {
 		/* if kernel does not support engine/context mapping */
-		const struct intel_execution_engine2 *e2;
-
-		igt_debug("using pre-allocated engine list\n");
-
-		__for_each_static_engine(e2) {
-			if (igt_only_list_subtests() ||
-			    (fd < 0) ||
-			    gem_has_ring(fd, e2->flags)) {
-				struct intel_execution_engine2 *__e2 =
-					&engine_data.engines[
-					engine_data.nengines];
-
-				strcpy(__e2->name, e2->name);
-				__e2->instance   = e2->instance;
-				__e2->class      = e2->class;
-				__e2->flags      = e2->flags;
-				__e2->is_virtual = false;
-
-				engine_data.nengines++;
-                        }
-		}
-		return engine_data;
+		return intel_engine_list_for_static(fd);
 	}
 
 	if (!param.size) {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
