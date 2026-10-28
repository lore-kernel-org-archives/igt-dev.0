Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D29606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cKmqPlyd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F092B10FD1D;
	Wed, 28 Oct 2026 14:59:23 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEA810FD11
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:53:10 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-cd8ba7c2694so459392a12.1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199190; x=1793803990; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Tds66M0rETMQeKpRB8g0y9hLq21m6K/e4mj9NJE2ns=;
 b=cKmqPlydpL7tY7TyXoWSMHelDAHaKuwTHCkEr5pfxDyRcMS22mDsqGA6xwDAJE6j9t
 wQ8rhRXGdH8XheSrov4Ld7tyIXp2CRaWV5jE+72xxrQ7pmNIzuV0PYsOj57OEdnrUquP
 q2IVuxOd5LPxzAieYfp5pTfm1ZP68zTOC767wuAgVi5dZd+9/oLh73EqSevtbu8I2Gjy
 OWmIziVsDFzQaaKPL5lAGBzrXSsxulwf6j3QP8M15nFWSmKB2m9JWbtjLtEBIJdoVIv8
 r10SCBcvn7fnh8hatsBg0T5SHQhKn2uh+jFqiavPL016Y4VkL5Gm+WACCHGCRChXIjTp
 MunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199190; x=1793803990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Tds66M0rETMQeKpRB8g0y9hLq21m6K/e4mj9NJE2ns=;
 b=KsnejsSXn8fC1q6ED3+noYjEDPlYqeOnjTxn5GoPmGax8N6g/51YHeQJ+jXsjGZBT4
 684/8LxcPgrVEqWVS8pe4LlzFvwVRLPHZnAJ9J6Hp7hG2ehBl3T3QLN4+EeFsaOGw5wb
 J8BWmCZuKBUYnIZ3wGr8co+Z/v0PxEWyNL34ihJSGG504KWHFIXBqE679yg2B99Cpi7/
 oVbL7R81JBpvRL4D0Oy8zKwThOthp0ljWaGBsi1LIuEFMG5BucEBzBvY9LBlCAWUGAKC
 fkx66GJa+luJop2KuPYM+D6HdXyfrxbymEemoKxyDnJnmH5C/XoSwGEJitKUKBd/HMjV
 h97A==
X-Gm-Message-State: AFq9FYI0uLRRaKhByka+kh2evSqSlc6X+RY8I8EB6Z9aOs9qeMWiZU6g
 U6PjS6FSnDD+i6IkfQ9BnzB84SctE+JCRhdnwg7xaLpZ+Mm+RBIJcjYHKKBAw+lr0jI=
X-Gm-Gg: AYBFou1Wdab3tqkdBUt/4Dz/DFDFOOlR+zoqHNGHUhuS+DnygQYM0Exwgnn4r8yw08q
 oQuj3R0It/G1Jt8lMp+SxWJswJH1uok8X7kr1XObjc01V4lVMZclfl8dHEYK7m+C4QPwK7+nmUt
 LBj6XxBfzq+XLyIBFXrSDEt/mcb3LYyJB3a6HunPV2bMw0Wr/NE1IhBhdNpl7jxmCPs9lHK06sl
 /3TUZCt3mJqzWU9lP5MS34Q5BfIu9A6GCyJUDV4HOTBag+I7OZxswdO7kvURZZuqrw0w3xpGpFp
 5si5TSRELxLBjwOG4Dr8JQXq8AVpDNwqJNWdtI3NuUWCbvT8AxJFvm7xhEmqAma6r3IDcWJ9pja
 p1DNzqne6aesJTgQ2UjcVym2Pu9NyrFgM5QbX+yaeJT+XFWpC6QYYZ1If7jvAqm5fCOpGcRx4gh
 DygpNKmQh3Xu64timoNFO5wc3i75lidWd1TPbn7QoeBnKbZ68N+dGjnJibMlG65CeGr+GuZ4Bak
 tR4IKPSKEo9m8r1lATHruQuBEhWuoGD7mQv8Q0b/gUYFP9N542QlPMS8vNf5XTzFy8GiAAueIJF
 oJrBBy14KKRVUwRm+eyldocaH5pL8CsxJIq9GzKCoZiDLFXc+AE6YJNGgmB03Svzog+5KbzIx9/
 LpfzXb3/4gGcp
X-Received: by 2002:a05:6300:4083:b0:3e2:b561:2b28 with SMTP id
 adf61e73a8af0-3e902306de7mr1972647637.36.1793199189433; 
 Wed, 28 Oct 2026 07:53:09 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdac68402a1sm3367673a12.1.2026.10.28.07.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:53:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 08/10] tests/kms_plane_scaling: test overlay plane in
 plane-*-max-crc
Date: Wed, 28 Oct 2026 16:52:00 +0200
Message-ID: <20261028145202.3128915-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After primary plane, put first overlay plane alone in place of primary at
the same scaling limit and check it produces the same crc as the unscaled
reference. If overlay does not accept primary plane limits,
search its own limit and report difference. Overlay is skipped if it does
not support the format, modifier or rotation under test.

With at least two scalers on pipe, also scale primary and overlay at
the same time into adjacent bands and compare against both planes unscaled,
so second scaler on pipe gets crc checked as well.

Each failing step is reported by axis and plane in the final assert.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 160 ++++++++++++++++++++++++++++++--------
 1 file changed, 129 insertions(+), 31 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 506c03393..dfd19b1f5 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -901,7 +901,8 @@ struct scale_axis {
 	bool scale_width;
 	struct igt_fb fb;
 	int dst_w, dst_h, dst_scaled, limit;
-	bool tested, failed;
+	int align, cap;
+	bool tested;
 };
 
 /* 90/270 rotation swaps which source axis lands on the scaled dst axis. */
@@ -1024,6 +1025,50 @@ static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 	free(lut);
 }
 
+static bool scale_has_headroom(enum scale_dir dir, int limit, int dst)
+{
+	if (limit < 0)
+		return false;
+
+	return dir == SCALE_DOWN ? limit > dst : limit < dst;
+}
+
+static void scale_plane_set(igt_plane_t *plane, struct scale_axis *a,
+			    igt_rotation_t rot, int len, int x, int y)
+{
+	int w, h;
+
+	scale_src_size(a, rot, len, &w, &h);
+	igt_plane_set_fb(plane, &a->fb);
+	igt_plane_set_rotation(plane, rot);
+	igt_fb_set_position(&a->fb, plane, 0, 0);
+	igt_fb_set_size(&a->fb, plane, w, h);
+	igt_plane_set_position(plane, x, y);
+	igt_plane_set_size(plane, a->dst_w, a->dst_h);
+}
+
+static bool scale_try_commit(igt_display_t *display)
+{
+	return igt_display_try_commit_atomic(display,
+					     DRM_MODE_ATOMIC_TEST_ONLY |
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL) == 0;
+}
+
+static void scale_crc_check(const igt_crc_t *ref, const igt_crc_t *crc,
+			    const char *axis, const char *step,
+			    char *failures, size_t len)
+{
+	size_t used = strlen(failures);
+
+	if (igt_check_crc_equal(ref, crc))
+		return;
+
+	igt_critical("CRC mismatch on %s %s\n", axis, step);
+	snprintf(failures + used, len - used, "%s%s %s",
+		 used ? ", " : "", axis, step);
+}
+
 static void
 check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 			uint32_t format, uint64_t modifier, enum scale_dir dir,
@@ -1036,10 +1081,11 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		{ .name = "vertical", .scale_width = false },
 	};
 	igt_pipe_crc_t *pipe_crc;
-	igt_crc_t ref_crc, scaled_crc;
+	igt_crc_t ref_crc, both_ref_crc, crc;
 	drmModeModeInfo mode;
-	igt_plane_t *plane;
-	int halign, valign, dalign;
+	igt_plane_t *plane, *overlay = NULL;
+	int halign, valign, dalign, num_scalers;
+	char failures[256] = "";
 	char limits[128] = "";
 	bool any_tested = false;
 	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
@@ -1067,6 +1113,18 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_require(plane);
 
+	if (igt_crtc_count_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY) > 0)
+		overlay = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY);
+	if (overlay && (!igt_plane_has_format_mod(overlay, format, modifier) ||
+			!igt_plane_has_rotation(overlay, rot))) {
+		igt_debug("Overlay plane skipped, no " IGT_FORMAT_FMT " "
+			  IGT_MODIFIER_FMT " rotation %s support\n",
+			  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			  igt_plane_rotation_name(rot));
+		overlay = NULL;
+	}
+	num_scalers = igt_crtc_num_scalers(crtc);
+
 	yuv_src_alignment(d, format, rot, &halign, &valign);
 	/* Each dst side is also a source side at 1:1, possibly rotated. */
 	dalign = max(halign, valign);
@@ -1085,6 +1143,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 		a->dst_scaled = a->scale_width ? a->dst_w : a->dst_h;
 
 		cap = scale_src_cap(d, dir, src_width, a->dst_scaled, align);
+		a->align = align;
+		a->cap = cap;
 
 		/* Every probed and committed source is a crop of this fb. */
 		scale_src_size(a, rot, cap, &w, &h);
@@ -1093,9 +1153,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 		a->limit = find_scale_src_limit(d, plane, &a->fb, dir, a, rot,
 						align, cap);
-		if (a->limit < 0 ||
-		    (dir == SCALE_DOWN ? a->limit <= a->dst_scaled :
-					 a->limit >= a->dst_scaled)) {
+		if (!scale_has_headroom(dir, a->limit, a->dst_scaled)) {
 			igt_debug("No %s %s headroom (limit src %d, dst %d)\n",
 				  a->name, scale_dir_name(dir),
 				  a->limit, a->dst_scaled);
@@ -1132,36 +1190,81 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 
 	for (int i = 0; i < ARRAY_SIZE(axes); i++) {
 		struct scale_axis *a = &axes[i];
-		int w, h;
+		/* The overlay band sits right next to the primary band. */
+		int ox = a->scale_width ? 0 : a->dst_w;
+		int oy = a->scale_width ? a->dst_h : 0;
+		int ovl_limit;
 
 		if (!a->tested)
 			continue;
 
 		/* Reference: unscaled crop of exactly the destination size. */
-		scale_src_size(a, rot, a->dst_scaled, &w, &h);
-		igt_plane_set_fb(plane, &a->fb);
-		igt_plane_set_rotation(plane, rot);
-		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane, w, h);
-		igt_plane_set_position(plane, 0, 0);
-		igt_plane_set_size(plane, a->dst_w, a->dst_h);
+		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
-		/* Test: limit sized crop scaled into the same rectangle. */
-		scale_src_size(a, rot, a->limit, &w, &h);
-		igt_fb_set_position(&a->fb, plane, 0, 0);
-		igt_fb_set_size(&a->fb, plane, w, h);
+		/* Primary: limit sized crop scaled into the same rectangle. */
+		scale_plane_set(plane, a, rot, a->limit, 0, 0);
 		igt_display_commit2(display, COMMIT_ATOMIC);
-		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		scale_crc_check(&ref_crc, &crc, a->name, "primary",
+				failures, sizeof(failures));
+
+		if (!overlay)
+			continue;
+
+		/* Overlay alone in the primary's place, at primary's limit. */
+		igt_plane_set_fb(plane, NULL);
+		ovl_limit = a->limit;
+		scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
+		if (!scale_try_commit(display)) {
+			ovl_limit = find_scale_src_limit(d, overlay, &a->fb,
+							 dir, a, rot,
+							 a->align, a->cap);
+			igt_info("Overlay %s %s limit %d, primary %d\n",
+				 a->name, scale_dir_name(dir), ovl_limit,
+				 a->limit);
+			if (!scale_has_headroom(dir, ovl_limit,
+						a->dst_scaled))
+				continue;
+			scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
+		}
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		scale_crc_check(&ref_crc, &crc, a->name, "overlay",
+				failures, sizeof(failures));
+
+		if (num_scalers < 2) {
+			igt_plane_set_fb(overlay, NULL);
+			continue;
+		}
+
+		/* Both planes scaled at once, each into its own band. */
+		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
+		scale_plane_set(overlay, a, rot, a->dst_scaled, ox, oy);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &both_ref_crc);
+
+		scale_plane_set(plane, a, rot, a->limit, 0, 0);
+		scale_plane_set(overlay, a, rot, ovl_limit, ox, oy);
+		if (scale_try_commit(display)) {
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_pipe_crc_collect_crc(pipe_crc, &crc);
+			scale_crc_check(&both_ref_crc, &crc, a->name,
+					"primary+overlay", failures,
+					sizeof(failures));
+		} else {
+			igt_info("Primary and overlay %s %s at their limits "
+				 "rejected together\n",
+				 a->name, scale_dir_name(dir));
+		}
 
-		a->failed = !igt_check_crc_equal(&ref_crc, &scaled_crc);
-		if (a->failed)
-			igt_critical("CRC mismatch on %s %s\n",
-				     a->name, scale_dir_name(dir));
+		igt_plane_set_fb(overlay, NULL);
 	}
 
 	igt_plane_set_fb(plane, NULL);
+	if (overlay)
+		igt_plane_set_fb(overlay, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_reset_fifo_underrun_reporting(display->drm_fd);
@@ -1173,13 +1276,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	if (mask_lut)
 		set_legacy_lut(d, crtc, 0xffff);
 
-	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
-		     igt_skip_crc_compare,
-		     "%s%s%s %s CRC mismatch\n",
-		     axes[0].failed ? axes[0].name : "",
-		     axes[0].failed && axes[1].failed ? " and " : "",
-		     axes[1].failed ? axes[1].name : "",
-		     scale_dir_name(dir));
+	igt_assert_f(!failures[0] || igt_skip_crc_compare,
+		     "%s CRC mismatch on: %s\n", scale_dir_name(dir), failures);
 }
 
 static void
-- 
2.43.0

