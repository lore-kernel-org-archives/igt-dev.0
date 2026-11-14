Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288C606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m7xvbRYi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD95E10E16A;
	Mon, 16 Nov 2026 05:18:49 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E83C10E097
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:06 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f26dd2165so704286985a.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695345; x=1795300145;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LyPREl7/l2Jl0SA51ZS64FckK5WvtTo9iYF3kC8s+Wc=;
 b=m7xvbRYiXBNfFdEm7FwSGGTBi8XfOb6KkOoDrWwf4d6vUKkkgQjEAA/umbsjJfr3U6
 yz95zE+wZqchsGQuaIfFuqTM+pMgFTO8i664KU94gYfALssRh3/BgGH1eMrKdxpe27nQ
 tDZhAAk8mxA4qklIAyP9F7rpF3ek2XFhNbYwKMqxBtJ8t8+BBjVTZa7tLn/C+JRCaBT9
 VqNSTidOL5PgXdbFU3olhDRZEV5zGHKFaTaP48pISSBgIlXrGegdNvNDDidAgOjwjstx
 tZKuot4hjgQgC5ei/cwrVpXp5Q7FO1kXXd2FFe6DeZ36HvnbJwB9R80ZgRN8CZlYaWgX
 /aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695345; x=1795300145;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LyPREl7/l2Jl0SA51ZS64FckK5WvtTo9iYF3kC8s+Wc=;
 b=GU/j72KtK+/Oq9I9y9hPoN1FVNWkBRPa6XoUfyVEhBbj3l2i8bu83NaU8iOVgTj9gd
 2WtXolAXx+VchaZjMN7fVxXfvj1ZNOS6cP3kcQpytlDg4qDdBTr5y/YD1badQMk1LtuI
 VV3Mq0Sc9coMBtBVnDXC6vcvYwYkkR2VhKiHB/Oax/7e3Jh4WWzA5dYzxrSujtDIdnYv
 Ol/75Y73t7gOWRmMjJ1PFdG0Vubs+k7QbOWdel4MGkquLgTjEsU5YY0f5wFVCtZ08AfY
 8CcvO5Z6zCYtULzD2ZySxiZulB4T66jL7xEpOWx3SHtdJH11S+81KChXa88lKRA2Io2W
 rhcA==
X-Gm-Message-State: APuU4Z9/cgslZYxwEM36TcWgUuH+jnuPXsOr03IZ6k41qEX0qEEI7vfc
 BCXrg3RwIw8nkRIz/LQPKhvrzACvNwEFxM7XYRATy7pjBy5J1fuKalbiLokcOv5grf1z8paUxBB
 +hGYTF3/laZwK2h1fFJw/0zGnC9A6a3DxQDPJqz8N6FSDuMOmEadON6UqzhT1LNCTkNeY0eoYwS
 Osrwj9fJhc60XLPJccaJowu5VrizHgHP7Qfqkxxtz9SLuy88JBd1kW4mN2
X-Received: from qkbp4.prod.google.com ([2002:a05:620a:6f44:b0:93e:7793:940c])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2685:b0:949:710e:2cd9 with SMTP id
 af79cd13be357-949710e4826mr204159185a.76.1794695344793; 
 Sat, 14 Nov 2026 14:29:04 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:01 -0500
In-Reply-To: <20261114222902.1404033-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222902.1404033-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222902.1404033-2-gildekel@google.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Reset leftover COLOR_PIPELINE
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
where it isn't 0. If that commit fails, retry plane by plane and only
log failures, so a driver that rejects the reset can't break unrelated
tests. Then turn the cap off again, unless a plane already exposed
COLOR_PIPELINE, which means the caller had enabled it. With the cap on
the kernel hides and rejects COLOR_ENCODING and COLOR_RANGE, which
tests that don't use color pipelines still set.

Cc: Melissa Wen <mwen@igalia.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---
 lib/igt_kms.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..541dd8c35 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3110,6 +3110,122 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
 	return a->hardware_pipe - b->hardware_pipe;
 }
 
+static bool planes_expose_color_pipeline(int drm_fd,
+					 const drmModePlaneRes *plane_res)
+{
+	for (int i = 0; i < plane_res->count_planes; i++)
+		if (kmstest_get_property(drm_fd, plane_res->planes[i],
+					 DRM_MODE_OBJECT_PLANE, "COLOR_PIPELINE",
+					 NULL, NULL, NULL))
+			return true;
+
+	return false;
+}
+
+static int commit_plane_color_pipeline_bypass(int drm_fd,
+					      const uint32_t *plane_ids,
+					      const uint32_t *prop_ids,
+					      int count)
+{
+	drmModeAtomicReq *req = drmModeAtomicAlloc();
+	int ret;
+
+	igt_assert(req);
+
+	for (int i = 0; i < count; i++)
+		igt_assert_lte(0, drmModeAtomicAddProperty(req, plane_ids[i],
+							   prop_ids[i], 0));
+
+	ret = drmModeAtomicCommit(drm_fd, req, DRM_MODE_ATOMIC_ALLOW_MODESET,
+				  NULL);
+	drmModeAtomicFree(req);
+
+	return ret;
+}
+
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
+static void igt_reset_plane_color_pipelines(int drm_fd)
+{
+	drmModePlaneRes *plane_res;
+	uint32_t *plane_ids, *prop_ids;
+	bool cap_was_set;
+	int count = 0, ret;
+
+	plane_res = drmModeGetPlaneResources(drm_fd);
+	if (!plane_res)
+		return;
+
+	if (!plane_res->count_planes) {
+		drmModeFreePlaneResources(plane_res);
+		return;
+	}
+
+	cap_was_set = planes_expose_color_pipeline(drm_fd, plane_res);
+	if (!cap_was_set &&
+	    drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1)) {
+		drmModeFreePlaneResources(plane_res);
+		return;
+	}
+
+	plane_ids = calloc(plane_res->count_planes, sizeof(*plane_ids));
+	prop_ids = calloc(plane_res->count_planes, sizeof(*prop_ids));
+	igt_assert(plane_ids && prop_ids);
+
+	for (int i = 0; i < plane_res->count_planes; i++) {
+		uint32_t prop_id;
+		uint64_t value;
+
+		if (!kmstest_get_property(drm_fd, plane_res->planes[i],
+					  DRM_MODE_OBJECT_PLANE, "COLOR_PIPELINE",
+					  &prop_id, &value, NULL) || !value)
+			continue;
+
+		igt_debug("Plane %u: resetting leaked COLOR_PIPELINE %" PRIu64
+			  " to Bypass\n", plane_res->planes[i], value);
+		plane_ids[count] = plane_res->planes[i];
+		prop_ids[count] = prop_id;
+		count++;
+	}
+
+	if (count) {
+		ret = commit_plane_color_pipeline_bypass(drm_fd, plane_ids,
+							 prop_ids, count);
+		if (ret)
+			igt_debug("Resetting %d COLOR_PIPELINE(s) at once failed: %s\n",
+				  count, strerror(-ret));
+
+		/* Retry plane by plane so one bad plane can't block the rest. */
+		for (int i = 0; ret && i < count; i++) {
+			int plane_ret;
+
+			plane_ret = commit_plane_color_pipeline_bypass(drm_fd,
+								       &plane_ids[i],
+								       &prop_ids[i],
+								       1);
+			if (plane_ret)
+				igt_info("Plane %u: failed to reset COLOR_PIPELINE to Bypass: %s\n",
+					 plane_ids[i], strerror(-plane_ret));
+		}
+	}
+
+	free(plane_ids);
+	free(prop_ids);
+
+	if (!cap_was_set)
+		drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
+
+	drmModeFreePlaneResources(plane_res);
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -3195,6 +3311,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	/* Before igt_crtc_init(), so plane props are read with the caller's caps. */
+	if (display->is_atomic)
+		igt_reset_plane_color_pipelines(drm_fd);
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

