Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B710E0FA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 19:12:28 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 10so17149507lfy.5
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 12:12:28 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 22:11:42 +0300
Message-Id: <20220927191143.22040-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
References: <20220927191143.22040-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/rendercopy: separate intel clear
 color functions
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

separate dg2 style ccs clear color from generic gen12 clear color
same way as how they're separate on rendercopy.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c |  8 +++++++-
 lib/rendercopy.h        |  4 ++++
 lib/rendercopy_gen9.c   | 45 +++++++++++++++++++++++------------------
 3 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ef1b59477..bb2503bbd 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1166,7 +1166,13 @@ igt_vebox_copyfunc_t igt_get_vebox_copyfunc(int devid)
 
 igt_render_clearfunc_t igt_get_render_clearfunc(int devid)
 {
-	return IS_GEN12(devid) ? gen12_render_clearfunc : NULL;
+	if (IS_DG2(devid)) {
+		return gen12p71_render_clearfunc;
+	} else if (IS_GEN12(devid)) {
+		return gen12_render_clearfunc;
+	} else {
+		return NULL;
+	}
 }
 
 /**
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index 3e984a141..480fdee8d 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -23,6 +23,10 @@ static inline void emit_vertex_normalized(struct intel_bb *ibb,
 	intel_bb_out(ibb, u.ui);
 }
 
+void gen12p71_render_clearfunc(struct intel_bb *ibb,
+			       struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
+			       unsigned int width, unsigned int height,
+			       const float clear_color[4]);
 void gen12_render_clearfunc(struct intel_bb *ibb,
 			    struct intel_buf *dst, unsigned int dst_x, unsigned int dst_y,
 			    unsigned int width, unsigned int height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index ae0f775ac..d74f1c999 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1254,24 +1254,29 @@ void gen12_render_clearfunc(struct intel_bb *ibb,
 			    unsigned int width, unsigned int height,
 			    const float clear_color[4])
 {
-	if (!HAS_4TILE(ibb->devid)) {
-		struct aux_pgtable_info pgtable_info = { };
-
-		gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
-
-		_gen9_render_op(ibb, NULL, 0, 0,
-				width, height, dst, dst_x, dst_y,
-				pgtable_info.pgtable_buf,
-				clear_color,
-				gen12_render_copy,
-				sizeof(gen12_render_copy));
-		gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
-	} else {
-			_gen9_render_op(ibb, NULL, 0, 0,
-					width, height, dst, dst_x, dst_y,
-					NULL,
-					clear_color,
-					gen12p71_render_copy,
-					sizeof(gen12p71_render_copy));
-	}
+	struct aux_pgtable_info pgtable_info = { };
+
+	gen12_aux_pgtable_init(&pgtable_info, ibb, NULL, dst);
+
+	_gen9_render_op(ibb, NULL, 0, 0,
+			width, height, dst, dst_x, dst_y,
+			pgtable_info.pgtable_buf,
+			clear_color,
+			gen12_render_copy,
+			sizeof(gen12_render_copy));
+	gen12_aux_pgtable_cleanup(ibb, &pgtable_info);
+}
+
+void gen12p71_render_clearfunc(struct intel_bb *ibb,
+			       struct intel_buf *dst,
+			       unsigned int dst_x, unsigned int dst_y,
+			       unsigned int width, unsigned int height,
+			       const float clear_color[4])
+{
+	_gen9_render_op(ibb, NULL, 0, 0,
+			width, height, dst, dst_x, dst_y,
+			NULL,
+			clear_color,
+			gen12p71_render_copy,
+			sizeof(gen12p71_render_copy));
 }
-- 
2.37.3
