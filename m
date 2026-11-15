Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4C606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jFRs3kg/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358A710E2DB;
	Mon, 16 Nov 2026 05:31:25 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CED10E3CC
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:18:59 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-54af6c38073so53476221cf.1
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701938; x=1795306738;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Yj0RnOGxJfa0zckkYO1wlSOf/y9NpXiIb/xoFf2o5TM=;
 b=jFRs3kg/B687Tt40lEXADave1IKl0VbZcpu2cMvfKubqMi77KIlMypEPWilzyO2j52
 WARuyZgu5gCq8BVilAAI3ML5wqlwYffif7p0/WXdklVWQnDDuKY7+STaheaD0VDU2FRl
 oVbgQTDYKmxew8NS27XpXPHc102+9pvCbUiiALFc6hqGVjCb2N9ce5VHUPvGRVJfP/yu
 EdHDU4C+4nEvM4Xx2scYNDVe+hPZGEZSSOGUju9Y9gHXNWGKAu+3/XaD/lflxQs0+vqH
 y6VQGNsDouRImp3pprEeIudGNnLaUmXKY4IzsCoMJGkY4UO5L0NMT3Pw+EvKIJdNzpfF
 0Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701938; x=1795306738;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Yj0RnOGxJfa0zckkYO1wlSOf/y9NpXiIb/xoFf2o5TM=;
 b=xfF33FBqDxSLXHnsM+OpHm+HD27GeCMLETN62Qu13Uavn7bnv69ghhDZXgV0DkuLQw
 NKlKikVVpqvcxoGUHs4qWigeo85pwyHpGVZ9FTsV7GOG81XYIkFNekhrTpG8KlIq3OMq
 LayaYBqycMExA6RrYIbkcirBhWhXe2HRmoWbXruwNp//oQC5BVGDzyufa8jmFn4CAl/a
 +er9ciHgrNloAXQ7F0st1RLSFYOQoeiASnV1EFCYmbINyjsbPBMcR6/YXaLx6adAiOzt
 MKCN9ovP7XLGiMGQi1CQ/E3B9JUp+t7mzgEOis0dye9nm51jlnF7JdWQePh2kjgMfkyT
 v04A==
X-Gm-Message-State: APuU4Z/iaZG+aULK7Tlz2pcskMAWRLrW9twMrWzydGch8VkSEa5+beqh
 DVejG3ZyjnhN5Lmoi0jzRAk2JsNiSPAH8tc33R0KSozqhF/FbX0AHj2NOFmiO/jEXn1aKisjpQd
 Fw0aeJPZ0gy0dnAw+BkTOp28NIdu78ZT4ALkSFRRdmUkMu1CJLDpzfFI5RD+nh0EVDf6/jfhabw
 wg/XFBx7sNJSGZR8D+dBB7JrBjDa8ZkWzfbp0v+eWzrzg/VwTm2Fws5494
X-Received: from qvbfo15.prod.google.com ([2002:ad4:5f0f:0:b0:91f:1004:2b99])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:570d:0:b0:530:e682:87c with SMTP id
 d75a77b69052e-55957059cbbmr163031881cf.33.1794701938028; 
 Sat, 14 Nov 2026 16:18:58 -0800 (PST)
Date: Sat, 14 Nov 2026 19:18:54 -0500
In-Reply-To: <20261115001855.2931860-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222902.1404033-1-gildekel@google.com>
 <20261115001855.2931860-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001855.2931860-2-gildekel@google.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Reset leftover COLOR_PIPELINE
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Melissa Wen <mwen@igalia.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Nov 2026 05:17:02 +0000
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
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The plane COLOR_PIPELINE property is only visible to clients that set
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE. Most tests don't, so a pipeline
left active by the previous KMS client stays applied to every plane
they scan out, and IGT has no way to see it. igt_plane_reset() already
resets COLOR_PIPELINE, but only when the test enabled the cap before
igt_display_require().

The kernel keeps plane state when a client closes its fd, so a color
pipeline a compositor selected stays active after it exits unless it
puts the planes back to Bypass first. Anything a test then scans out
on those planes goes through that color transform. On an xe laptop,
two planes were still on non-Bypass pipelines after the compositor was
stopped.

In igt_display_require(), before the planes are initialized, turn the
cap on for a moment and commit COLOR_PIPELINE = 0 on every plane
where it isn't 0. Log any commit failure without aborting, so a driver
that rejects the reset can't break unrelated tests. Then turn the cap
off again, unless a plane already exposed COLOR_PIPELINE, which means
the caller had enabled it. With the cap on the kernel hides and
rejects COLOR_ENCODING and COLOR_RANGE, which tests that don't use
color pipelines still set.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    v2: Apologies for the over-engineered v1 bloat from agent-assisted
        drafting; reuse plane_resources from igt_display_require() and
        build one drmModeAtomicReq inline without temporary id arrays.

 lib/igt_kms.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..33060eaac 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3110,6 +3110,70 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
 	return a->hardware_pipe - b->hardware_pipe;
 }
 
+/*
+ * Put every plane COLOR_PIPELINE back to Bypass (0).
+ *
+ * COLOR_PIPELINE is only visible with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE,
+ * so a pipeline left active by a previous client (e.g. a compositor that
+ * was killed) is invisible to IGT and alters every plane it scans out.
+ * Enable the cap just for this reset, then drop it again unless the
+ * caller had already enabled it: with the cap set the kernel rejects
+ * COLOR_ENCODING and COLOR_RANGE, which legacy tests rely on.
+ */
+static void igt_reset_plane_color_pipelines(int drm_fd,
+					    const drmModePlaneRes *plane_res)
+{
+	drmModeAtomicReq *req = NULL;
+	bool cap_was_set = false;
+
+	for (int i = 0; i < plane_res->count_planes; i++) {
+		if (kmstest_get_property(drm_fd, plane_res->planes[i],
+					 DRM_MODE_OBJECT_PLANE,
+					 "COLOR_PIPELINE", NULL, NULL, NULL)) {
+			cap_was_set = true;
+			break;
+		}
+	}
+
+	if (!cap_was_set &&
+	    drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1))
+		return;
+
+	for (int i = 0; i < plane_res->count_planes; i++) {
+		uint32_t prop_id;
+		uint64_t value;
+
+		if (!kmstest_get_property(drm_fd, plane_res->planes[i],
+					  DRM_MODE_OBJECT_PLANE,
+					  "COLOR_PIPELINE",
+					  &prop_id, &value, NULL) || !value)
+			continue;
+
+		igt_debug("Plane %u: resetting leaked COLOR_PIPELINE %" PRIu64
+			  " to Bypass\n", plane_res->planes[i], value);
+		if (!req) {
+			req = drmModeAtomicAlloc();
+			igt_assert(req);
+		}
+		igt_assert_lte(0, drmModeAtomicAddProperty(req,
+							   plane_res->planes[i],
+							   prop_id, 0));
+	}
+
+	if (req) {
+		int ret = drmModeAtomicCommit(drm_fd, req,
+					      DRM_MODE_ATOMIC_ALLOW_MODESET,
+					      NULL);
+		if (ret)
+			igt_debug("Resetting COLOR_PIPELINE failed: %s\n",
+				  strerror(-ret));
+		drmModeAtomicFree(req);
+	}
+
+	if (!cap_was_set)
+		drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -3198,6 +3262,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
+	/* Before igt_crtc_init(), so plane props are read with the caller's caps. */
+	if (display->is_atomic)
+		igt_reset_plane_color_pipelines(drm_fd, plane_resources);
+
 	display->n_planes = plane_resources->count_planes;
 	display->planes = calloc(display->n_planes, sizeof(igt_plane_t));
 	igt_assert_f(display->planes, "Failed to allocate memory for %d planes\n", display->n_planes);
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

