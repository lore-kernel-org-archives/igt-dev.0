Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801156EC7D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:30:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id h16so622955pjv.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:30:55 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:29:56 -0500
Message-Id: <20210609043035.102359-11-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/93] lib/i915/gem_engine_topology: Rework
 query_engine_list()
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

This gives us a no-assert version.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_engine_topology.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index eb7a4c26..ae8d2a33 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -95,13 +95,6 @@ int __gem_query_engines(int fd,
 	return __gem_query(fd, &query);
 }
 
-static void query_engines(int fd,
-			  struct drm_i915_query_engine_info *query_engines,
-			  int length)
-{
-	igt_assert_eq(__gem_query_engines(fd, query_engines, length), 0);
-}
-
 static void ctx_map_engines(int fd, struct intel_engine_data *ed,
 			    struct drm_i915_gem_context_param *param)
 {
@@ -160,14 +153,16 @@ static void init_engine(struct intel_execution_engine2 *e2,
 	igt_assert(ret < sizeof(e2->name));
 }
 
-static void query_engine_list(int fd, struct intel_engine_data *ed)
+static int __query_engine_list(int fd, struct intel_engine_data *ed)
 {
 	uint8_t buff[SIZEOF_QUERY] = { };
 	struct drm_i915_query_engine_info *query_engine =
 			(struct drm_i915_query_engine_info *) buff;
-	int i;
+	int i, err;
 
-	query_engines(fd, query_engine, SIZEOF_QUERY);
+	err = __gem_query_engines(fd, query_engine, SIZEOF_QUERY);
+	if (err)
+		return err;
 
 	for (i = 0; i < query_engine->num_engines; i++)
 		init_engine(&ed->engines[i],
@@ -175,6 +170,13 @@ static void query_engine_list(int fd, struct intel_engine_data *ed)
 			    query_engine->engines[i].engine.engine_instance, i);
 
 	ed->nengines = query_engine->num_engines;
+
+	return 0;
+}
+
+static void query_engine_list(int fd, struct intel_engine_data *ed)
+{
+	igt_assert_eq(__query_engine_list(fd, ed), 0);
 }
 
 struct intel_execution_engine2 *
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
