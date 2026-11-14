Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E6606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WtbOL/D2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D5510E16A;
	Mon, 16 Nov 2026 05:17:57 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40D410E027
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:28:58 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f2005ce21so422373385a.3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695337; x=1795300137;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=caysyQJ8CSLUBIc+Ov65oTJYJcE+cflZtPqTjaFhivU=;
 b=WtbOL/D2/U8DPRcrbyFiWEwSMN6KSKL75TZ1nbJPZr1j/Q79FR0JAsSe1JRE/YFdgD
 6UC8O1sD5ikmi/2ixdr9Xnn5Oev4T3UETcWLHnS029aVl/M9HvuhyrTHh+AECSJvtxKY
 N7onsyKZRcXSgjuXlY12C6vT8miuiPjEthH3st255wBI3S63EJooN3Q3EMJLnpSE0GnS
 hJ8L8HIJhxTJ1XZ8g9yMc/ghOFmbIRAj9s+3T4dxrUalyl4TqY2tHU67MrGypfjMghs9
 /ywsjnIh8l8451s0qITqi8/YxZvuZeaXTbTMYa7+d9r0Dul4WxtYuMJHmp4m5TUVVgOq
 wUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695337; x=1795300137;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=caysyQJ8CSLUBIc+Ov65oTJYJcE+cflZtPqTjaFhivU=;
 b=rIchsenFIAy//M9hdL39I8KnriAl49AbGtG1Vb9qnawJ3jh6ehYNADrcAbjn4JV+cd
 PdQ4b4As+sQ7T2EPxtSucWyonJK/BeYflVRruPd55KY/toledLTVbKICmncOkAOMqb9l
 XZ7SjmrdHRv6h4qSk//vvWB50jLC8Ui5EHwF/xbAIDXKx0aJK+CQ3ECuBRktJa5Gtemb
 3iOP2MM5uhiXgc1ffpEjt9ElaNg4A39D119rpt8liUCVPBK7BglNhKYqD4V6O9KqKEwu
 CiCc93/z72gWD+PS+4oVcQjnBpKddUrkVstGi2oO7xTqqsJOqHRyTHLHnEATAVUI0AAT
 s/fg==
X-Gm-Message-State: APuU4Z8Hf8WA68xnShpyEYtddQxkbx7fiT8PzT2J+IDKNCStGLRfagO+
 7RT0yyNoxiFRNyvbEN71rXYpCKZ+wQ0mR0U2TXv4q1A5c1kD879CQjdvFZ7wTqilv5A4JzC8E6s
 B5I4FQPE0UXRGzahfmEtQLOyXZLb1b54aRnn53y1YxMUtqoYobcHmnzEn8n4SVncwSGV6ejApAS
 vvc7EGgEon008Dpu1yvd7Mb+o1A9YWt3vPcOtz9m2NUa2IvzBoU4BhgNTj
X-Received: from qkhm16.prod.google.com ([2002:a05:620a:2210:b0:93e:943c:1b4b])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:7087:b0:93f:5677:9950 with SMTP id
 af79cd13be357-9494bc4b301mr1146778585a.53.1794695336903; 
 Sat, 14 Nov 2026 14:28:56 -0800 (PST)
Date: Sat, 14 Nov 2026 17:28:55 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222855.1403127-1-gildekel@google.com>
Subject: [PATCH i-g-t] lib/igt_kms: Skip connectors that can't scan out
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
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

igt_output_is_connected() trusts the connector status alone. Some
drivers expose writeback outputs as always-connected
DRM_MODE_CONNECTOR_VIRTUAL connectors next to their eDP and DP
connectors; the downstream msm SDE driver is one. IGT then picks such
a connector as a display. Its first modeset fails with -EINVAL because
no writeback framebuffer is attached, and every test that calls
igt_display_require() fails in its fixture.

Commit 321448df7fc9 ("lib/igt_kms: Do not treat writeback and virtual
connectors as connected") skipped all virtual connectors. It broke VKMS,
which has nothing but virtual connectors, and was reverted.

Add kmstest_connector_is_scanout_sink(), which decides from the uAPI
alone:
- Writeback connectors, and any connector exposing WRITEBACK_FB_ID,
  are never scanout sinks.
- On devices that only expose virtual connectors (VKMS, virtio-gpu,
  vmwgfx, ...), the virtual connectors are the displays and are left
  alone.
- Next to physical connectors, a connected virtual connector is hidden
  only if the kernel rejects a TEST_ONLY commit that lights it up with
  a plain XRGB8888 primary plane on every CRTC it can use. If the probe
  can't be sent (no atomic cap, or not DRM master), the connector is
  kept.

igt_display_reset_outputs() caches the result per output, and
igt_output_is_connected() honours it. kms_setmode enumerates
connectors itself on a legacy fd, so it enables the atomic cap just
long enough to classify them in its fixture. kms_writeback walks
for_each_output() and still finds its connector.

Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---
 lib/igt_kms.c       | 466 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h       |  16 +-
 tests/kms_setmode.c |  39 ++++
 3 files changed, 519 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..bae0f386b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2020,6 +2020,449 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 	      comparator);
 }
 
+static bool connector_type_is_physical(uint32_t connector_type)
+{
+	return connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
+	       connector_type != DRM_MODE_CONNECTOR_WRITEBACK;
+}
+
+static bool device_has_physical_connector(int drm_fd, const drmModeRes *res)
+{
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *c;
+		bool physical;
+
+		c = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
+		if (!c)
+			continue;
+
+		physical = connector_type_is_physical(c->connector_type);
+		drmModeFreeConnector(c);
+
+		if (physical)
+			return true;
+	}
+
+	return false;
+}
+
+/* Plane properties used by the scanout probe. */
+enum probe_plane_prop {
+	PROBE_PLANE_FB_ID,
+	PROBE_PLANE_CRTC_ID,
+	PROBE_PLANE_SRC_X,
+	PROBE_PLANE_SRC_Y,
+	PROBE_PLANE_SRC_W,
+	PROBE_PLANE_SRC_H,
+	PROBE_PLANE_CRTC_X,
+	PROBE_PLANE_CRTC_Y,
+	PROBE_PLANE_CRTC_W,
+	PROBE_PLANE_CRTC_H,
+	PROBE_PLANE_TYPE,
+	PROBE_PLANE_NUM_PROPS
+};
+
+static const char * const probe_plane_prop_names[PROBE_PLANE_NUM_PROPS] = {
+	[PROBE_PLANE_FB_ID] = "FB_ID",
+	[PROBE_PLANE_CRTC_ID] = "CRTC_ID",
+	[PROBE_PLANE_SRC_X] = "SRC_X",
+	[PROBE_PLANE_SRC_Y] = "SRC_Y",
+	[PROBE_PLANE_SRC_W] = "SRC_W",
+	[PROBE_PLANE_SRC_H] = "SRC_H",
+	[PROBE_PLANE_CRTC_X] = "CRTC_X",
+	[PROBE_PLANE_CRTC_Y] = "CRTC_Y",
+	[PROBE_PLANE_CRTC_W] = "CRTC_W",
+	[PROBE_PLANE_CRTC_H] = "CRTC_H",
+	[PROBE_PLANE_TYPE] = "type",
+};
+
+struct probe_plane {
+	uint32_t id;
+	uint32_t possible_crtcs;
+	uint32_t props[PROBE_PLANE_NUM_PROPS];
+	uint64_t values[PROBE_PLANE_NUM_PROPS];
+};
+
+struct probe_connector {
+	uint32_t id;
+	uint32_t crtc_id_prop;
+	uint64_t crtc_id;
+};
+
+struct scanout_probe {
+	int drm_fd;
+	const drmModeConnector *connector;
+	uint32_t conn_crtc_id_prop;
+	const drmModeModeInfo *mode;
+	uint32_t mode_blob;
+	uint32_t fb_id;
+	struct probe_connector *others;
+	int n_others;
+	struct probe_plane *planes;
+	int n_planes;
+};
+
+/* Looks up the ids and current values of @n named properties of an object. */
+static bool probe_lookup_props(int drm_fd, uint32_t obj_id, uint32_t obj_type,
+			       const char * const names[], int n,
+			       uint32_t ids[], uint64_t values[])
+{
+	drmModeObjectPropertiesPtr props;
+	int found = 0;
+
+	props = drmModeObjectGetProperties(drm_fd, obj_id, obj_type);
+	if (!props)
+		return false;
+
+	for (int i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop = drmModeGetProperty(drm_fd, props->props[i]);
+
+		if (!prop)
+			continue;
+
+		for (int j = 0; j < n; j++) {
+			if (strcmp(prop->name, names[j]))
+				continue;
+
+			ids[j] = props->props[i];
+			values[j] = props->prop_values[i];
+			found++;
+			break;
+		}
+
+		drmModeFreeProperty(prop);
+	}
+
+	drmModeFreeObjectProperties(props);
+
+	return found == n;
+}
+
+static void probe_add(drmModeAtomicReq *req, uint32_t obj_id,
+		      uint32_t prop_id, uint64_t value)
+{
+	igt_assert_lte(0, drmModeAtomicAddProperty(req, obj_id, prop_id, value));
+}
+
+/* Returns an XRGB8888 dumb framebuffer id for @mode, or 0 on failure. */
+static uint32_t probe_fb_create(int drm_fd, const drmModeModeInfo *mode,
+				uint32_t *handle)
+{
+	struct drm_mode_create_dumb create = {
+		.width = mode->hdisplay,
+		.height = mode->vdisplay,
+		.bpp = 32,
+	};
+	uint32_t handles[4] = { 0 }, pitches[4] = { 0 }, offsets[4] = { 0 };
+	uint32_t fb_id = 0;
+
+	*handle = 0;
+
+	/* The buffer is never mapped, so its pages are never allocated. */
+	if (drmIoctl(drm_fd, DRM_IOCTL_MODE_CREATE_DUMB, &create))
+		return 0;
+
+	handles[0] = create.handle;
+	pitches[0] = create.pitch;
+	if (drmModeAddFB2(drm_fd, mode->hdisplay, mode->vdisplay,
+			  DRM_FORMAT_XRGB8888, handles, pitches, offsets,
+			  &fb_id, 0)) {
+		__kmstest_dumb_destroy(drm_fd, create.handle);
+		return 0;
+	}
+
+	*handle = create.handle;
+
+	return fb_id;
+}
+
+/*
+ * TEST_ONLY commit that lights up the probed connector on @crtc_id with
+ * the probe mode and, if available, the probe fb on a primary plane.
+ * Other connectors and planes on that CRTC are detached in the same
+ * request. No writeback framebuffer is attached.
+ */
+static int probe_scanout_on_crtc(const struct scanout_probe *p,
+				 uint32_t crtc_id, int crtc_idx)
+{
+	static const char * const crtc_prop_names[] = { "MODE_ID", "ACTIVE" };
+	uint32_t crtc_props[2];
+	uint64_t crtc_values[2];
+	bool have_primary = false;
+	drmModeAtomicReq *req;
+	int ret;
+
+	if (!probe_lookup_props(p->drm_fd, crtc_id, DRM_MODE_OBJECT_CRTC,
+				crtc_prop_names, 2, crtc_props, crtc_values))
+		return -EOPNOTSUPP;
+
+	req = drmModeAtomicAlloc();
+	igt_assert(req);
+
+	probe_add(req, crtc_id, crtc_props[0], p->mode_blob);
+	probe_add(req, crtc_id, crtc_props[1], 1);
+	probe_add(req, p->connector->connector_id, p->conn_crtc_id_prop,
+		  crtc_id);
+
+	for (int i = 0; i < p->n_others; i++)
+		if (p->others[i].crtc_id == crtc_id)
+			probe_add(req, p->others[i].id,
+				  p->others[i].crtc_id_prop, 0);
+
+	for (int i = 0; i < p->n_planes; i++) {
+		const struct probe_plane *plane = &p->planes[i];
+		const uint32_t *props = plane->props;
+		const drmModeModeInfo *mode = p->mode;
+
+		if (p->fb_id && !have_primary &&
+		    plane->possible_crtcs & (1u << crtc_idx) &&
+		    plane->values[PROBE_PLANE_TYPE] == DRM_PLANE_TYPE_PRIMARY) {
+			probe_add(req, plane->id, props[PROBE_PLANE_FB_ID],
+				  p->fb_id);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_ID],
+				  crtc_id);
+			probe_add(req, plane->id, props[PROBE_PLANE_SRC_X], 0);
+			probe_add(req, plane->id, props[PROBE_PLANE_SRC_Y], 0);
+			probe_add(req, plane->id, props[PROBE_PLANE_SRC_W],
+				  (uint64_t)mode->hdisplay << 16);
+			probe_add(req, plane->id, props[PROBE_PLANE_SRC_H],
+				  (uint64_t)mode->vdisplay << 16);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_X], 0);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_Y], 0);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_W],
+				  mode->hdisplay);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_H],
+				  mode->vdisplay);
+			have_primary = true;
+		} else if (plane->values[PROBE_PLANE_CRTC_ID] == crtc_id) {
+			probe_add(req, plane->id, props[PROBE_PLANE_FB_ID], 0);
+			probe_add(req, plane->id, props[PROBE_PLANE_CRTC_ID], 0);
+		}
+	}
+
+	ret = drmModeAtomicCommit(p->drm_fd, req,
+				  DRM_MODE_ATOMIC_TEST_ONLY |
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	drmModeAtomicFree(req);
+
+	return ret;
+}
+
+/*
+ * Asks the kernel, with TEST_ONLY commits on each possible CRTC, whether
+ * @connector can be lit up as a display without a writeback framebuffer.
+ *
+ * Returns 0 if a CRTC accepts it, otherwise the last error. -ENOENT,
+ * -EOPNOTSUPP and -EACCES mean no probe reached the atomic check:
+ * @connector is disconnected, @drm_fd lacks the atomic client cap
+ * (atomic properties are hidden), or @drm_fd is not DRM master.
+ */
+static int probe_scanout_sink(int drm_fd, const drmModeRes *res,
+			      const drmModeConnector *connector)
+{
+	struct scanout_probe p = { .drm_fd = drm_fd, .connector = connector };
+	drmModePlaneRes *plane_res;
+	uint32_t possible_crtcs = 0, handle;
+	int ret = -ENODEV;
+
+	if (connector->connection != DRM_MODE_CONNECTED ||
+	    !connector->count_modes)
+		return -ENOENT;
+
+	if (!kmstest_get_property(drm_fd, connector->connector_id,
+				  DRM_MODE_OBJECT_CONNECTOR, "CRTC_ID",
+				  &p.conn_crtc_id_prop, NULL, NULL))
+		return -EOPNOTSUPP;
+
+	for (int i = 0; i < connector->count_encoders; i++) {
+		drmModeEncoder *encoder;
+
+		encoder = drmModeGetEncoder(drm_fd, connector->encoders[i]);
+		if (!encoder)
+			continue;
+
+		possible_crtcs |= encoder->possible_crtcs;
+		drmModeFreeEncoder(encoder);
+	}
+
+	/* The smallest mode keeps the probe framebuffer small. */
+	p.mode = &connector->modes[0];
+	for (int i = 1; i < connector->count_modes; i++) {
+		const drmModeModeInfo *m = &connector->modes[i];
+
+		if (m->hdisplay * m->vdisplay <
+		    p.mode->hdisplay * p.mode->vdisplay)
+			p.mode = m;
+	}
+
+	p.others = calloc(res->count_connectors, sizeof(*p.others));
+	igt_assert(p.others);
+	for (int i = 0; i < res->count_connectors; i++) {
+		struct probe_connector *other = &p.others[p.n_others];
+
+		if (res->connectors[i] == connector->connector_id)
+			continue;
+
+		if (kmstest_get_property(drm_fd, res->connectors[i],
+					 DRM_MODE_OBJECT_CONNECTOR, "CRTC_ID",
+					 &other->crtc_id_prop, &other->crtc_id,
+					 NULL)) {
+			other->id = res->connectors[i];
+			p.n_others++;
+		}
+	}
+
+	plane_res = drmModeGetPlaneResources(drm_fd);
+	if (plane_res && plane_res->count_planes) {
+		p.planes = calloc(plane_res->count_planes, sizeof(*p.planes));
+		igt_assert(p.planes);
+	}
+	for (int i = 0; p.planes && i < plane_res->count_planes; i++) {
+		struct probe_plane *plane = &p.planes[p.n_planes];
+		drmModePlane *drm_plane;
+
+		drm_plane = drmModeGetPlane(drm_fd, plane_res->planes[i]);
+		if (!drm_plane)
+			continue;
+
+		plane->id = drm_plane->plane_id;
+		plane->possible_crtcs = drm_plane->possible_crtcs;
+		drmModeFreePlane(drm_plane);
+
+		if (probe_lookup_props(drm_fd, plane->id, DRM_MODE_OBJECT_PLANE,
+				       probe_plane_prop_names,
+				       PROBE_PLANE_NUM_PROPS, plane->props,
+				       plane->values))
+			p.n_planes++;
+	}
+	drmModeFreePlaneResources(plane_res);
+
+	ret = drmModeCreatePropertyBlob(drm_fd, p.mode, sizeof(*p.mode),
+					&p.mode_blob);
+	if (ret)
+		goto out;
+
+	/* Without an fb, still probe with the CRTC and connector alone. */
+	p.fb_id = probe_fb_create(drm_fd, p.mode, &handle);
+
+	ret = -ENODEV;
+	for (int i = 0; i < res->count_crtcs && i < 32; i++) {
+		if (!(possible_crtcs & (1u << i)))
+			continue;
+
+		ret = probe_scanout_on_crtc(&p, res->crtcs[i], i);
+		if (!ret)
+			break;
+	}
+
+	if (p.fb_id) {
+		drmModeRmFB(drm_fd, p.fb_id);
+		__kmstest_dumb_destroy(drm_fd, handle);
+	}
+	drmModeDestroyPropertyBlob(drm_fd, p.mode_blob);
+out:
+	free(p.planes);
+	free(p.others);
+
+	return ret;
+}
+
+static const char *probe_result_str(int ret)
+{
+	switch (ret) {
+	case -ENOENT:
+		return "disconnected";
+	case -EOPNOTSUPP:
+		return "no atomic client cap";
+	case -EACCES:
+		return "not DRM master";
+	default:
+		return strerror(-ret);
+	}
+}
+
+/* True if @ret means no probe reached the atomic check. */
+static bool probe_inconclusive(int ret)
+{
+	return ret == -ENOENT || ret == -EOPNOTSUPP || ret == -EACCES;
+}
+
+static bool connector_is_scanout_sink(int drm_fd, const drmModeRes *res,
+				      const drmModeConnector *connector,
+				      bool has_writeback_fb_id)
+{
+	int ret;
+
+	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK ||
+	    has_writeback_fb_id)
+		return false;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_VIRTUAL)
+		return true;
+
+	/* On virtual-only devices (VKMS, virtio-gpu, ...) these are the displays. */
+	if (!device_has_physical_connector(drm_fd, res))
+		return true;
+
+	/*
+	 * Next to physical connectors, a virtual connector may be a
+	 * writeback or concurrent writeback sink that rejects any commit
+	 * without an output fb. Only hide it when the kernel says so.
+	 */
+	ret = probe_scanout_sink(drm_fd, res, connector);
+	if (!ret)
+		return true;
+
+	if (probe_inconclusive(ret)) {
+		igt_debug("%s-%d: scanout probe not sent (%s), assuming a scanout sink\n",
+			  kmstest_connector_type_str(connector->connector_type),
+			  connector->connector_type_id, probe_result_str(ret));
+		return true;
+	}
+
+	igt_debug("%s-%d: kernel rejected a plain modeset (%s), not a scanout sink\n",
+		  kmstest_connector_type_str(connector->connector_type),
+		  connector->connector_type_id, probe_result_str(ret));
+
+	return false;
+}
+
+/**
+ * kmstest_connector_is_scanout_sink:
+ * @drm_fd: DRM fd
+ * @res: libdrm resources of @drm_fd
+ * @connector: libdrm connector to check
+ *
+ * Checks whether @connector drives a display that can be lit up with a
+ * plain modeset, as opposed to a memory sink that needs an output
+ * framebuffer on every commit.
+ *
+ * Writeback connectors, and any connector that exposes WRITEBACK_FB_ID,
+ * are never scanout sinks. Physical connectors always are.
+ *
+ * Virtual connectors are scanout sinks on devices that only expose
+ * virtual connectors (VKMS, virtio-gpu, vmwgfx, ...). Next to physical
+ * connectors, where some drivers use them for writeback outputs, a
+ * connected virtual connector is not a scanout sink if the kernel
+ * rejects a TEST_ONLY commit that lights it up with a plain primary
+ * plane on any of its CRTCs. That probe needs DRM master and the atomic
+ * client cap on @drm_fd. Without them the connector is assumed to be a
+ * scanout sink. This function never changes the client caps of @drm_fd.
+ *
+ * Returns: True if @connector is a scanout sink, false otherwise.
+ */
+bool kmstest_connector_is_scanout_sink(int drm_fd, const drmModeRes *res,
+				       const drmModeConnector *connector)
+{
+	bool has_writeback_fb_id =
+		kmstest_get_property(drm_fd, connector->connector_id,
+				     DRM_MODE_OBJECT_CONNECTOR,
+				     "WRITEBACK_FB_ID", NULL, NULL, NULL);
+
+	return connector_is_scanout_sink(drm_fd, res, connector,
+					 has_writeback_fb_id);
+}
+
 /**
  * kmstest_get_connector_default_mode:
  * @drm_fd: DRM fd
@@ -2943,6 +3386,29 @@ void igt_display_reset_outputs(igt_display_t *display)
 		}
 	}
 
+	/*
+	 * Must be known before the first igt_output_is_connected() call
+	 * below, which skips outputs that aren't scanout sinks.
+	 */
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+		drmModeConnector *connector = output->config.connector;
+
+		if (!connector)
+			continue;
+
+		output->non_scanout_sink =
+			!connector_is_scanout_sink(display->drm_fd, resources,
+						   connector,
+						   output->props[IGT_CONNECTOR_WRITEBACK_FB_ID]);
+
+		if (output->non_scanout_sink &&
+		    connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL &&
+		    connector->connection == DRM_MODE_CONNECTED)
+			igt_info("%s: not a scanout sink, not used as a display\n",
+				 output->name);
+	}
+
 	/* Set reasonable default values for every object in the
 	 * display. */
 	igt_display_reset(display);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dfcb91e02..ac28a576e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -285,6 +285,8 @@ bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
 				    unsigned long crtc_idx_mask,
 				    struct kmstest_connector_config *config);
 void kmstest_free_connector_config(struct kmstest_connector_config *config);
+bool kmstest_connector_is_scanout_sink(int drm_fd, const drmModeRes *res,
+				       const drmModeConnector *connector);
 
 void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode);
 bool kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
@@ -512,6 +514,8 @@ typedef struct {
 	struct kmstest_connector_config config;
 	char *name;
 	bool force_reprobe;
+	/* Set by igt_display_reset_outputs(), see kmstest_connector_is_scanout_sink(). */
+	bool non_scanout_sink;
 	igt_crtc_t *pending_crtc;
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
@@ -668,8 +672,12 @@ void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int
  * igt_output_is_connected:
  * @output: #igt_output_t to check.
  *
- * Returns: True if given @output's connection status is CONNECTED,
- * else False.
+ * Outputs that aren't scanout sinks (writeback connectors, and virtual
+ * connectors used as writeback outputs) are never reported as
+ * connected, see kmstest_connector_is_scanout_sink().
+ *
+ * Returns: True if given @output is a scanout sink whose connection
+ * status is CONNECTED, else False.
  */
 static inline bool igt_output_is_connected(igt_output_t *output)
 {
@@ -678,6 +686,10 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	    !output->config.connector->count_modes)
 		return false;
 
+	/* Memory sinks need an output fb and can't be lit up with a modeset. */
+	if (output->non_scanout_sink)
+		return false;
+
 	if (output->config.connector->connection == DRM_MODE_CONNECTED)
 		return true;
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a65ea8b23..f105a6ad1 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -92,6 +92,7 @@
 
 static int drm_fd;
 static drmModeRes *drm_resources;
+static bool *non_scanout_sink;
 static int filter_test_id;
 static bool dry_run;
 static bool extended = false;
@@ -895,6 +896,9 @@ static int get_connectors(drmModeRes *resources, int *connector_idxs,
 		igt_assert_lt(connector_idx, resources->count_connectors);
 		connector_id = resources->connectors[connector_idx];
 
+		if (non_scanout_sink[connector_idx])
+			goto err;
+
 		if (get_one_connector(resources, connector_id, &cconfs[i]) < 0)
 			goto err;
 
@@ -1047,6 +1051,38 @@ static void restore_cpu_deep_sleep_at_exit(int sig)
 	igt_pm_enable_cpu_deep_sleep();
 }
 
+/*
+ * Marks the connectors that can't be lit up with a plain modeset, such
+ * as writeback outputs exposed as virtual connectors. Probing those
+ * needs the atomic cap, so enable it only here: every modeset in this
+ * test stays legacy.
+ */
+static void find_non_scanout_sinks(void)
+{
+	bool atomic = !drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
+
+	non_scanout_sink = calloc(drm_resources->count_connectors,
+				  sizeof(*non_scanout_sink));
+	igt_assert(non_scanout_sink);
+
+	for (int i = 0; i < drm_resources->count_connectors; i++) {
+		drmModeConnector *connector;
+
+		connector = drmModeGetConnector(drm_fd,
+						drm_resources->connectors[i]);
+		if (!connector)
+			continue;
+
+		non_scanout_sink[i] =
+			!kmstest_connector_is_scanout_sink(drm_fd, drm_resources,
+							   connector);
+		drmModeFreeConnector(connector);
+	}
+
+	if (atomic)
+		igt_assert_eq(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1103,6 +1139,8 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
 
+		find_non_scanout_sinks();
+
 		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
@@ -1143,6 +1181,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
+		free(non_scanout_sink);
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
 	}
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

