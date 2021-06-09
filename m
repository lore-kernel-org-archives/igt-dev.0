Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABDE6EC7E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:30:56 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id z26so17429538pfj.5
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:30:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:29:57 -0500
Message-Id: <20210609043035.102359-12-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/93] lib/i915/gem_engine_topology: Factor
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
