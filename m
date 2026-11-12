Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935B606A323
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgD9Jw6/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3774A1121FF;
	Thu, 12 Nov 2026 16:23:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCE410E61C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 16:21:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C4E2F62325
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EC31F000CA;
 Thu, 12 Nov 2026 16:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794500513;
 bh=zX0FAzJxjFmIxfPSXT/lIMEL5AW9H7wgeAT56sGAbiQ=;
 h=From:To:Cc:Subject:Date;
 b=GgD9Jw6/0z+EQX16zlkDkPPq+iXDjxG1qhhGdTCYeamgont0JwyuFGKpcqlkvN3M7
 S+0t5cx2GR8FBNHFmhxFbT52PJuhwV8L0JPzU4d8GGAMHwHh1mpGAUn29Ijzs45YMl
 9Vad9QHUgoHO21ZjFo/E0QQ6vyYmSVKqbkxQAkHl1loQpEgAmEE6DR7c2IcuSYW9aO
 P5HoZI+jHtWQhi+/9zJqbFQC/4B1muKjeEl286HCEZloh5ENKTEDYb1v8yEwH0cN8d
 9TIh3NcPEMqB8AeJ2Nb9iPA5xiuPM4H0PGfo25Xm15jZUmQ0BisXN2oyd6PHmMGrjF
 J3mDiaN0DTAcg==
From: Maxime Ripard <mripard@kernel.org>
To: igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH i-g-t v5] tests/kms_atomic_reset: Add tests for
 DRM_MODE_ATOMIC_RESET
Date: Thu, 12 Nov 2026 17:21:46 +0100
Message-ID: <20261112162147.766264-1-mripard@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The kernel gained a DRM_MODE_ATOMIC_RESET flag that resets KMS object
states to their defaults before applying the properties carried in a
commit. This flag is advertised through DRM_CAP_ATOMIC_RESET.

Since the reset is applied before the properties, a commit putting
back the current configuration on top of a reset doesn't change the
state, and thus doesn't require DRM_MODE_ATOMIC_ALLOW_MODESET.
Similarly, a reset commit carries every CRTC, but only the CRTCs that
are active before or after the commit can report a page flip event.

When the commit comes from a lessee, only the objects part of its
lease are reset, and every other object is left untouched. Indeed, a
lessee has no access to the objects outside of its lease, and must not
be able to affect them. Partial pipelines aren't supported either:
resetting a plane or a connector detaches it from the CRTC it is bound
to, and resetting a CRTC disables the planes and connectors bound to
it, so a lease holding only one side of such a pair would have to
reach outside of itself and is rejected with -ENOENT.

Add a test covering the basic semantics of the flag, its interaction
with page flip events, and its interaction with leases:

- cap-atomic-reset: the capability is reported.
- invalid-reset-with-async: ATOMIC_RESET rejects PAGE_FLIP_ASYNC.
- reset-test-only: TEST_ONLY succeeds without altering committed
  state.
- reset-disables-crtc: a bare reset brings ACTIVE back to 0.
- reset-with-crtc-enable: explicit properties in the same commit
  override the reset defaults.
- reset-without-modeset: re-applying the current configuration on
  top of a reset doesn't require ALLOW_MODESET.
- reset-with-flip-event: only the CRTC that ends up active reports a
  page flip event.
- reset-disables-crtc-flip-event: a CRTC turned off by the reset
  still reports its page flip event.
- reset-flip-event-all-disabled: asking for a page flip event while
  every CRTC stays off is rejected.
- lessee-reset: a reset from a lessee shuts down its leased pipeline.
  It is run with the planes added implicitly by the kernel, with only
  the primary plane, and with all the planes of the CRTC.
- lessee-reset-unleased-pipe: a reset from a lessee leaves the
  pipelines outside of its lease untouched.
- lessee-reset-empty-lease: a reset from a lessee holding an empty
  lease resets nothing and succeeds.
- lessee-reset-unleased-connector: a reset from a lessee is rejected
  when its lessor drives an unleased connector or plane on the leased
  CRTC, and leaves both alone.
- lessee-reset-unleased-crtc: a reset from a lessee is rejected when
  one of its leased connectors is bound to an unleased CRTC, and
  leaves that CRTC alone.

reset-with-flip-event, lessee-reset-unleased-pipe and
lessee-reset-unleased-crtc require more than one CRTC, while
lessee-reset-unleased-connector needs a second connector usable on
the first CRTC along with an overlay plane. They will be skipped on
the default vkms instance, and the ones that only need a second CRTC
can be run on vkms by creating an instance with two pipelines through
configfs.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Changes in v5:
- Expect a reset splitting a pipeline across a lease to be rejected
  with -ENOENT, following the kernel change
- Drop the page flip event test for unleased CRTCs, they can't end up
  in a reset commit anymore

Changes in v4:
- Add more lease related tests

Changes in v3:
- Add tests for reset commits without ALLOW_MODESET
- Add tests for PAGE_FLIP_EVENT with ATOMIC_RESET

Changes in v2:
- Add tests for leases
---
 tests/kms_atomic_reset.c | 1031 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |    1 +
 2 files changed, 1032 insertions(+)
 create mode 100644 tests/kms_atomic_reset.c

diff --git a/tests/kms_atomic_reset.c b/tests/kms_atomic_reset.c
new file mode 100644
index 000000000000..01bbd0f21c55
--- /dev/null
+++ b/tests/kms_atomic_reset.c
@@ -0,0 +1,1031 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Maxime Ripard
+ *
+ * Tests for the DRM_MODE_ATOMIC_RESET flag.
+ */
+
+/**
+ * TEST: kms atomic reset
+ * Category: Display
+ * Mega feature: General Display Features
+ * Sub-category: Atomic
+ * Functionality: atomic reset
+ * Description: Tests for the DRM_MODE_ATOMIC_RESET flag, which resets
+ *		all KMS object states to defaults before applying
+ *		properties in a commit.
+ * Driver requirement: any
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+
+#include <drm.h>
+#include <fcntl.h>
+#include <poll.h>
+
+#ifndef DRM_MODE_ATOMIC_RESET
+#define DRM_MODE_ATOMIC_RESET	0x0800
+#endif
+
+#ifndef DRM_CAP_ATOMIC_RESET
+#define DRM_CAP_ATOMIC_RESET	0x16
+#endif
+
+typedef struct {
+	int fd;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	igt_plane_t *primary;
+	igt_fb_t fb;
+} data_t;
+
+static uint32_t
+get_prop_id(int fd, uint32_t obj_id, uint32_t obj_type, const char *name)
+{
+	drmModeObjectPropertiesPtr props;
+	uint32_t id = 0;
+
+	props = drmModeObjectGetProperties(fd, obj_id, obj_type);
+	igt_assert(props);
+
+	for (int i = 0; i < (int)props->count_props; i++) {
+		drmModePropertyPtr prop;
+
+		prop = drmModeGetProperty(fd, props->props[i]);
+		if (prop && !strcmp(prop->name, name))
+			id = props->props[i];
+		drmModeFreeProperty(prop);
+
+		if (id)
+			break;
+	}
+
+	drmModeFreeObjectProperties(props);
+	return id;
+}
+
+static uint64_t
+read_prop(int fd, uint32_t obj_id, uint32_t obj_type, uint32_t prop_id)
+{
+	drmModeObjectPropertiesPtr props;
+	uint64_t val = 0;
+	bool found = false;
+
+	props = drmModeObjectGetProperties(fd, obj_id, obj_type);
+	igt_assert(props);
+
+	for (int i = 0; i < (int)props->count_props; i++) {
+		if (props->props[i] == prop_id) {
+			val = props->prop_values[i];
+			found = true;
+			break;
+		}
+	}
+
+	drmModeFreeObjectProperties(props);
+	igt_assert(found);
+	return val;
+}
+
+static void
+enable_output(data_t *data)
+{
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(data->output, data->crtc);
+	igt_plane_set_fb(data->primary, &data->fb);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+/*
+ * libdrm's drmModeAtomicCommit() returns 0 without issuing the
+ * ioctl when the request carries no properties.  Bypass it so
+ * the kernel sees the flags even on an empty request.
+ */
+static int
+raw_atomic_commit_user_data(int fd, uint32_t flags, void *user_data)
+{
+	struct drm_mode_atomic arg = {
+		.flags = flags,
+		.user_data = (uintptr_t)user_data,
+	};
+
+	if (drmIoctl(fd, DRM_IOCTL_MODE_ATOMIC, &arg))
+		return -errno;
+	return 0;
+}
+
+static int
+raw_atomic_commit(int fd, uint32_t flags)
+{
+	return raw_atomic_commit_user_data(fd, flags, NULL);
+}
+
+static unsigned int
+count_crtcs(data_t *data)
+{
+	drmModeResPtr res;
+	unsigned int count;
+
+	res = drmModeGetResources(data->fd);
+	igt_assert(res);
+
+	count = res->count_crtcs;
+	drmModeFreeResources(res);
+
+	return count;
+}
+
+struct flip_count {
+	unsigned int count;
+	uint32_t crtc_id;
+};
+
+static void
+flip_handler(int fd, unsigned int seq, unsigned int tv_sec,
+	     unsigned int tv_usec, unsigned int crtc_id, void *user_data)
+{
+	struct flip_count *flips = user_data;
+
+	flips->count++;
+	flips->crtc_id = crtc_id;
+}
+
+/*
+ * A reset commit carries every CRTC of the device, so drain the queue
+ * instead of waiting for a single event: what we want to know is how
+ * many CRTCs reported a flip, not whether one did.
+ */
+static void
+drain_flip_events_fd(int fd)
+{
+	drmEventContext evctx = {
+		.version = 3,
+		.page_flip_handler2 = flip_handler,
+	};
+	struct pollfd pfd = {
+		.fd = fd,
+		.events = POLLIN,
+	};
+	int timeout = 1000;
+
+	while (poll(&pfd, 1, timeout) > 0) {
+		igt_assert_eq(drmHandleEvent(fd, &evctx), 0);
+		timeout = 100;
+	}
+}
+
+static void
+drain_flip_events(data_t *data)
+{
+	drain_flip_events_fd(data->fd);
+}
+
+static int
+create_lease(data_t *data, const uint32_t *objects, uint32_t count,
+	     bool universal_planes, int *lease_fd)
+{
+	struct drm_mode_create_lease mcl = {
+		.object_ids = to_user_pointer(objects),
+		.object_count = count,
+		.flags = O_CLOEXEC,
+	};
+	int ret = 0;
+
+	/*
+	 * Without DRM_CLIENT_CAP_UNIVERSAL_PLANES, the kernel
+	 * implicitly adds the primary and cursor planes of each
+	 * leased CRTC.
+	 */
+	if (!universal_planes)
+		igt_assert_eq(drmSetClientCap(data->fd,
+					      DRM_CLIENT_CAP_UNIVERSAL_PLANES,
+					      0), 0);
+
+	if (igt_ioctl(data->fd, DRM_IOCTL_MODE_CREATE_LEASE, &mcl))
+		ret = -errno;
+
+	if (!universal_planes)
+		igt_assert_eq(drmSetClientCap(data->fd,
+					      DRM_CLIENT_CAP_UNIVERSAL_PLANES,
+					      1), 0);
+
+	if (ret)
+		return ret;
+
+	*lease_fd = mcl.fd;
+	return 0;
+}
+
+static bool
+lease_has_object(int lease_fd, uint32_t obj_id)
+{
+	struct drm_mode_get_lease mgl = {};
+	uint32_t *objects;
+	bool found = false;
+
+	do_ioctl(lease_fd, DRM_IOCTL_MODE_GET_LEASE, &mgl);
+
+	objects = calloc(mgl.count_objects, sizeof(*objects));
+	igt_assert(objects);
+
+	mgl.objects_ptr = to_user_pointer(objects);
+	do_ioctl(lease_fd, DRM_IOCTL_MODE_GET_LEASE, &mgl);
+
+	for (uint32_t i = 0; i < mgl.count_objects; i++) {
+		if (objects[i] == obj_id) {
+			found = true;
+			break;
+		}
+	}
+
+	free(objects);
+	return found;
+}
+
+/*
+ * A lessee only has access to the objects in its lease. ATOMIC_RESET
+ * coming from a lessee must thus succeed, but only reset the leased
+ * objects, and leave everything else untouched.
+ */
+static void
+check_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+	   igt_plane_t *primary, igt_fb_t *fb, int lease_fd, bool enabled)
+{
+	uint32_t plane_id = primary->drm_plane->plane_id;
+	uint32_t crtc_id = crtc->crtc_id;
+	uint32_t conn_id = output->id;
+	uint32_t prop;
+
+	prop = get_prop_id(data->fd, crtc_id, DRM_MODE_OBJECT_CRTC, "ACTIVE");
+	igt_assert(prop);
+	igt_assert_eq(read_prop(data->fd, crtc_id, DRM_MODE_OBJECT_CRTC, prop),
+		      enabled);
+
+	prop = get_prop_id(data->fd, conn_id, DRM_MODE_OBJECT_CONNECTOR,
+			   "CRTC_ID");
+	igt_assert(prop);
+	igt_assert_eq(read_prop(data->fd, conn_id, DRM_MODE_OBJECT_CONNECTOR,
+				prop),
+		      enabled ? crtc_id : 0);
+
+	/*
+	 * A lessee reset only disables the primary plane if it's part
+	 * of the lease, so make sure it is. Since the primary plane is
+	 * enabled, an unleased one would also prevent the CRTC from
+	 * being shut down.
+	 */
+	if (lease_fd >= 0)
+		igt_assert(lease_has_object(lease_fd, plane_id));
+
+	prop = get_prop_id(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+			   "FB_ID");
+	igt_assert(prop);
+	igt_assert_eq(read_prop(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+				prop),
+		      enabled ? fb->fb_id : 0);
+
+	prop = get_prop_id(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+			   "CRTC_ID");
+	igt_assert(prop);
+	igt_assert_eq(read_prop(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+				prop),
+		      enabled ? crtc_id : 0);
+}
+
+static void
+lessee_reset(data_t *data, const uint32_t *objects, uint32_t count,
+	     bool universal_planes)
+{
+	int lease_fd;
+
+	enable_output(data);
+
+	igt_assert_eq(create_lease(data, objects, count, universal_planes,
+				   &lease_fd), 0);
+	igt_assert_eq(drmSetClientCap(lease_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET |
+					DRM_MODE_ATOMIC_TEST_ONLY), 0);
+	check_pipe(data, data->crtc, data->output, data->primary, &data->fb,
+		   lease_fd, true);
+
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET), 0);
+	check_pipe(data, data->crtc, data->output, data->primary, &data->fb,
+		   lease_fd, false);
+
+	close(lease_fd);
+}
+
+/*
+ * The lease only lists the CRTC and connector, and is created by a
+ * lessor without DRM_CLIENT_CAP_UNIVERSAL_PLANES. The kernel then adds
+ * the primary and cursor planes of the CRTC to the lease on its own.
+ *
+ * This checks that the objects the kernel implicitly added to the
+ * lease are reset as well, the same way they would be if they were
+ * listed explicitly.
+ */
+static void
+lessee_reset_implicit_planes(data_t *data)
+{
+	uint32_t objects[] = {
+		data->crtc->crtc_id,
+		data->output->id,
+	};
+
+	lessee_reset(data, objects, ARRAY_SIZE(objects), false);
+}
+
+/*
+ * The lease explicitly lists the CRTC, connector and primary plane
+ * only. This is the minimal lease a lessor using universal planes can
+ * create, and leaves the other planes of the CRTC (cursor, overlays)
+ * outside of the lease.
+ *
+ * Those unleased planes are disabled, so there's no state we can
+ * check on them to make sure they haven't been reset. This is covered
+ * by lessee-reset-unleased-pipe instead.
+ */
+static void
+lessee_reset_primary_plane(data_t *data)
+{
+	uint32_t objects[] = {
+		data->crtc->crtc_id,
+		data->output->id,
+		data->primary->drm_plane->plane_id,
+	};
+
+	lessee_reset(data, objects, ARRAY_SIZE(objects), true);
+}
+
+/*
+ * The lease explicitly lists the CRTC, connector and every plane that
+ * can be used with that CRTC (primary, cursor and overlays), so that
+ * the lessee owns the whole pipeline.
+ *
+ * Planes can usually be attached to more than one CRTC, so this also
+ * leases planes that could be in use by another, unleased, CRTC.
+ */
+static void
+lessee_reset_all_planes(data_t *data)
+{
+	uint32_t *objects;
+	uint32_t count = 0;
+	igt_plane_t *plane;
+
+	objects = calloc(2 + data->crtc->n_planes, sizeof(*objects));
+	igt_assert(objects);
+
+	objects[count++] = data->crtc->crtc_id;
+	objects[count++] = data->output->id;
+	for_each_plane_on_crtc(data->crtc, plane)
+		objects[count++] = plane->drm_plane->plane_id;
+
+	lessee_reset(data, objects, count, true);
+	free(objects);
+}
+
+/*
+ * Lease one pipeline out of two active ones, and check that a reset
+ * from the lessee shuts down the leased pipeline only, leaving the
+ * CRTC, connector and plane of the other one untouched.
+ */
+static void
+lessee_reset_unleased_pipe(data_t *data)
+{
+	igt_output_t *output, *other_output = NULL;
+	igt_crtc_t *crtc, *other_crtc = NULL;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	uint32_t objects[3];
+	igt_fb_t other_fb;
+	int lease_fd;
+
+	for_each_connected_output(&data->display, output) {
+		if (output == data->output)
+			continue;
+
+		for_each_crtc(&data->display, crtc) {
+			if (crtc == data->crtc ||
+			    !igt_crtc_connector_valid(crtc, output))
+				continue;
+
+			other_output = output;
+			other_crtc = crtc;
+			break;
+		}
+
+		if (other_output)
+			break;
+	}
+	igt_require_f(other_output, "Needs two usable pipelines\n");
+
+	mode = igt_output_get_mode(other_output);
+	igt_create_color_fb(data->fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 0.0, &other_fb);
+
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(data->output, data->crtc);
+	igt_plane_set_fb(data->primary, &data->fb);
+	igt_output_set_crtc(other_output, other_crtc);
+	primary = igt_crtc_get_plane_type(other_crtc, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &other_fb);
+	igt_require(igt_display_try_commit_atomic(&data->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL) == 0);
+
+	objects[0] = data->crtc->crtc_id;
+	objects[1] = data->output->id;
+	objects[2] = data->primary->drm_plane->plane_id;
+	igt_assert_eq(create_lease(data, objects, ARRAY_SIZE(objects), true,
+				   &lease_fd), 0);
+	igt_assert_eq(drmSetClientCap(lease_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET), 0);
+
+	check_pipe(data, data->crtc, data->output, data->primary, &data->fb,
+		   lease_fd, false);
+	check_pipe(data, other_crtc, other_output, primary, &other_fb,
+		   -1, true);
+
+	close(lease_fd);
+
+	igt_display_reset(&data->display);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->fd, &other_fb);
+}
+
+/*
+ * A lease can be created with no object at all. A reset from such a
+ * lessee has nothing to reset, and must be a successful no-op: an
+ * empty lease isn't a revoked one.
+ */
+static void
+lessee_reset_empty_lease(data_t *data)
+{
+	int lease_fd;
+
+	enable_output(data);
+
+	igt_assert_eq(create_lease(data, NULL, 0, true, &lease_fd), 0);
+	igt_assert_eq(drmSetClientCap(lease_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET |
+					DRM_MODE_ATOMIC_TEST_ONLY), 0);
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET), 0);
+
+	check_pipe(data, data->crtc, data->output, data->primary, &data->fb,
+		   -1, true);
+
+	close(lease_fd);
+}
+
+/*
+ * The lessor drives the CRTC it then leases out with its own connector
+ * and overlay plane, neither of which is part of the lease. A reset
+ * from the lessee disables the leased CRTC, and the unleased connector
+ * and plane can't stay attached to a CRTC that goes inactive: the
+ * connector has to be unbound and the plane disabled.
+ */
+static void
+lessee_reset_unleased_connector(data_t *data)
+{
+	igt_output_t *output, *other_output = NULL;
+	uint32_t plane_id, fb_prop, crtc_prop;
+	igt_plane_t *overlay;
+	igt_fb_t other_fb;
+	drmModeModeInfo *mode;
+	uint32_t objects[3];
+	int lease_fd;
+
+	for_each_connected_output(&data->display, output) {
+		if (output == data->output)
+			continue;
+
+		if (!igt_crtc_connector_valid(data->crtc, output))
+			continue;
+
+		other_output = output;
+		break;
+	}
+	igt_require_f(other_output,
+		      "Needs a second connector usable on the first CRTC\n");
+
+	overlay = igt_crtc_get_plane_type(data->crtc,
+					   DRM_PLANE_TYPE_OVERLAY);
+	igt_require_f(overlay, "Needs an overlay plane on the first CRTC\n");
+
+	mode = igt_output_get_mode(other_output);
+	igt_create_color_fb(data->fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 0.0, &other_fb);
+
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(other_output, data->crtc);
+	igt_plane_set_fb(data->primary, &other_fb);
+	igt_plane_set_fb(overlay, &other_fb);
+	igt_require(igt_display_try_commit_atomic(&data->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL) == 0);
+
+	objects[0] = data->crtc->crtc_id;
+	objects[1] = data->output->id;
+	objects[2] = data->primary->drm_plane->plane_id;
+	igt_assert_eq(create_lease(data, objects, ARRAY_SIZE(objects), true,
+				   &lease_fd), 0);
+	igt_assert_eq(drmSetClientCap(lease_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+
+	/*
+	 * The leased CRTC drives a connector and an overlay plane the
+	 * lease doesn't cover, so the reset would have to disable
+	 * objects outside of it.
+	 */
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET |
+					DRM_MODE_ATOMIC_TEST_ONLY), -ENOENT);
+
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET),
+		      -ENOENT);
+
+	/* Nothing was applied, the pipeline is still up. */
+	check_pipe(data, data->crtc, other_output, data->primary, &other_fb,
+		   lease_fd, true);
+
+	plane_id = overlay->drm_plane->plane_id;
+	fb_prop = get_prop_id(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+			      "FB_ID");
+	igt_assert(fb_prop);
+	crtc_prop = get_prop_id(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+				"CRTC_ID");
+	igt_assert(crtc_prop);
+
+	igt_assert_eq(read_prop(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+				fb_prop), other_fb.fb_id);
+	igt_assert_eq(read_prop(data->fd, plane_id, DRM_MODE_OBJECT_PLANE,
+				crtc_prop), data->crtc->crtc_id);
+
+	close(lease_fd);
+
+	igt_display_reset(&data->display);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->fd, &other_fb);
+}
+
+/*
+ * The lessor drives an unleased CRTC with the connector it then leases
+ * out, as that connector is the CRTC's only one. A reset from the
+ * lessee unbinds the leased connector, and the unleased CRTC can't
+ * stay enabled with no connector left: the reset has to disable it,
+ * and the commit has to go through instead of being rejected.
+ */
+static void
+lessee_reset_unleased_crtc(data_t *data)
+{
+	igt_crtc_t *crtc, *other_crtc = NULL;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	igt_fb_t other_fb;
+	uint32_t objects[3];
+	int lease_fd;
+
+	for_each_crtc(&data->display, crtc) {
+		if (crtc == data->crtc)
+			continue;
+
+		if (!igt_crtc_connector_valid(crtc, data->output))
+			continue;
+
+		other_crtc = crtc;
+		break;
+	}
+	igt_require_f(other_crtc,
+		      "Needs a second CRTC usable with the first connector\n");
+
+	mode = igt_output_get_mode(data->output);
+	igt_create_color_fb(data->fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 0.0, &other_fb);
+
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(data->output, other_crtc);
+	primary = igt_crtc_get_plane_type(other_crtc, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &other_fb);
+	igt_require(igt_display_try_commit_atomic(&data->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL) == 0);
+
+	objects[0] = data->crtc->crtc_id;
+	objects[1] = data->output->id;
+	objects[2] = data->primary->drm_plane->plane_id;
+	igt_assert_eq(create_lease(data, objects, ARRAY_SIZE(objects), true,
+				   &lease_fd), 0);
+	igt_assert_eq(drmSetClientCap(lease_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+
+	/*
+	 * The leased connector is bound to a CRTC the lease doesn't
+	 * cover, so unbinding it would have to reach outside of it.
+	 */
+	igt_assert_eq(raw_atomic_commit(lease_fd,
+					DRM_MODE_ATOMIC_RESET |
+					DRM_MODE_ATOMIC_ALLOW_MODESET),
+		      -ENOENT);
+
+	/* Nothing was applied, the unleased pipeline is still up. */
+	check_pipe(data, other_crtc, data->output, primary, &other_fb,
+		   -1, true);
+
+	close(lease_fd);
+
+	igt_display_reset(&data->display);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->fd, &other_fb);
+}
+
+int igt_main()
+{
+	data_t data = {};
+	uint64_t cap = 0;
+
+	igt_fixture() {
+		data.fd = drm_open_driver_master(DRIVER_ANY | DRIVER_VKMS);
+		igt_require(drmSetClientCap(data.fd,
+					    DRM_CLIENT_CAP_ATOMIC, 1) == 0);
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
+	}
+
+	/**
+	 * SUBTEST: cap-atomic-reset
+	 * Description: Check that DRM_CAP_ATOMIC_RESET is reported.
+	 */
+	igt_describe("Check that DRM_CAP_ATOMIC_RESET is reported.");
+	igt_subtest("cap-atomic-reset") {
+		igt_assert_eq(drmGetCap(data.fd,
+					DRM_CAP_ATOMIC_RESET, &cap), 0);
+		igt_assert_eq(cap, 1);
+	}
+
+	igt_fixture() {
+		drmModeModeInfo *mode;
+
+		igt_require(drmGetCap(data.fd,
+				      DRM_CAP_ATOMIC_RESET, &cap) == 0);
+		igt_require(cap == 1);
+
+		for_each_connected_output(&data.display, data.output)
+			break;
+		igt_require(igt_output_is_connected(data.output));
+		data.crtc = igt_first_crtc(&data.display);
+
+		data.primary = igt_crtc_get_plane_type(data.crtc,
+						       DRM_PLANE_TYPE_PRIMARY);
+		igt_assert(data.primary);
+
+		mode = igt_output_get_mode(data.output);
+		igt_create_color_fb(data.fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 0.0, &data.fb);
+	}
+
+	/**
+	 * SUBTEST: invalid-reset-with-async
+	 * Description: Verify ATOMIC_RESET cannot be combined with
+	 *		PAGE_FLIP_ASYNC.
+	 */
+	igt_describe("Verify ATOMIC_RESET cannot be combined with "
+		     "PAGE_FLIP_ASYNC.");
+	igt_subtest("invalid-reset-with-async") {
+		igt_assert_eq(raw_atomic_commit(data.fd,
+						DRM_MODE_ATOMIC_RESET |
+						DRM_MODE_PAGE_FLIP_ASYNC),
+			      -EINVAL);
+	}
+
+	/**
+	 * SUBTEST: reset-test-only
+	 * Description: ATOMIC_RESET with TEST_ONLY must succeed but leave the
+	 *		committed state unchanged.
+	 */
+	igt_describe("ATOMIC_RESET with TEST_ONLY must succeed but "
+		     "leave the committed state unchanged.");
+	igt_subtest("reset-test-only") {
+		uint32_t crtc_id, active_prop;
+
+		enable_output(&data);
+
+		crtc_id = data.crtc->crtc_id;
+		active_prop = get_prop_id(data.fd, crtc_id,
+					  DRM_MODE_OBJECT_CRTC, "ACTIVE");
+		igt_assert(active_prop);
+
+		igt_assert_eq(raw_atomic_commit(data.fd,
+						DRM_MODE_ATOMIC_RESET |
+						DRM_MODE_ATOMIC_ALLOW_MODESET |
+						DRM_MODE_ATOMIC_TEST_ONLY), 0);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 1);
+	}
+
+	/*
+	 * ACTIVE is a standard CRTC property present on every driver.
+	 * The reset path calls atomic_create_state() for every object
+	 * and replaces the entire state, so verifying any single
+	 * property changed is sufficient to confirm the mechanism
+	 * works. ACTIVE is the most convenient: it is universal and
+	 * has a known non-default value (1) after enable_output().
+	 */
+	/**
+	 * SUBTEST: reset-disables-crtc
+	 * Description: Enable a display pipeline, then reset and verify the
+	 *		CRTC becomes inactive.
+	 */
+	igt_describe("Enable a display pipeline, then reset and verify "
+		     "the CRTC becomes inactive.");
+	igt_subtest("reset-disables-crtc") {
+		uint32_t crtc_id, active_prop;
+
+		enable_output(&data);
+
+		crtc_id = data.crtc->crtc_id;
+		active_prop = get_prop_id(data.fd, crtc_id,
+					  DRM_MODE_OBJECT_CRTC, "ACTIVE");
+		igt_assert(active_prop);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 1);
+
+		igt_assert_eq(raw_atomic_commit(data.fd,
+						DRM_MODE_ATOMIC_RESET |
+						DRM_MODE_ATOMIC_ALLOW_MODESET),
+			      0);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 0);
+	}
+
+	/**
+	 * SUBTEST: reset-with-crtc-enable
+	 * Description: Reset while also re-enabling the CRTC in the same
+	 *		commit; the explicit property must override the default.
+	 */
+	igt_describe("Reset while also re-enabling the CRTC in the "
+		     "same commit; the explicit property must override "
+		     "the default.");
+	igt_subtest("reset-with-crtc-enable") {
+		uint32_t crtc_id, active_prop;
+
+		enable_output(&data);
+
+		crtc_id = data.crtc->crtc_id;
+		active_prop = get_prop_id(data.fd, crtc_id,
+					  DRM_MODE_OBJECT_CRTC, "ACTIVE");
+		igt_assert(active_prop);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 1);
+
+		igt_display_reset(&data.display);
+		igt_output_set_crtc(data.output, data.crtc);
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_display_commit_atomic(&data.display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET |
+					  DRM_MODE_ATOMIC_RESET, NULL);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 1);
+	}
+
+	/**
+	 * SUBTEST: reset-without-modeset
+	 * Description: Re-applying the same configuration on top of a reset
+	 *		must not require ALLOW_MODESET.
+	 */
+	igt_describe("Re-applying the same configuration on top of a "
+		     "reset must not require ALLOW_MODESET.");
+	igt_subtest("reset-without-modeset") {
+		uint32_t crtc_id, active_prop;
+
+		enable_output(&data);
+
+		crtc_id = data.crtc->crtc_id;
+		active_prop = get_prop_id(data.fd, crtc_id,
+					  DRM_MODE_OBJECT_CRTC, "ACTIVE");
+		igt_assert(active_prop);
+
+		/*
+		 * The reset brings every object back to its defaults and
+		 * the request puts the very same configuration back on
+		 * top, so the state doesn't change and a modeset is
+		 * neither needed nor allowed here.
+		 */
+		igt_display_reset(&data.display);
+		igt_output_set_crtc(data.output, data.crtc);
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_assert_eq(igt_display_try_commit_atomic(&data.display,
+							    DRM_MODE_ATOMIC_RESET,
+							    NULL), 0);
+
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 1);
+	}
+
+	/**
+	 * SUBTEST: reset-with-flip-event
+	 * Description: Reset while re-enabling a CRTC and asking for a page
+	 *		flip event; only the CRTC that ends up active must
+	 *		report one.
+	 */
+	igt_describe("Reset while re-enabling a CRTC and asking for a "
+		     "page flip event; only the CRTC that ends up active "
+		     "must report one.");
+	igt_subtest("reset-with-flip-event") {
+		struct flip_count flips = {};
+
+		/*
+		 * A reset commit carries every CRTC of the device, so we
+		 * need one that is off before and after the commit to
+		 * tell whether an event was attached to it.
+		 */
+		igt_require(count_crtcs(&data) > 1);
+
+		enable_output(&data);
+
+		/*
+		 * Mark the configuration as changed again so that it is
+		 * sent a second time, on top of the reset. Going through
+		 * igt_display_reset() would do it too, but it also arms
+		 * first_commit, and igt refuses to ask for an event on
+		 * such a commit.
+		 */
+		igt_output_set_crtc(data.output, data.crtc);
+		igt_plane_set_fb(data.primary, &data.fb);
+		igt_display_commit_atomic(&data.display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET |
+					  DRM_MODE_ATOMIC_RESET |
+					  DRM_MODE_PAGE_FLIP_EVENT, &flips);
+
+		drain_flip_events(&data);
+
+		igt_assert_eq(flips.count, 1);
+		igt_assert_eq(flips.crtc_id, data.crtc->crtc_id);
+	}
+
+	/**
+	 * SUBTEST: reset-disables-crtc-flip-event
+	 * Description: A reset turning an active CRTC off while asking for a
+	 *		page flip event must still report that flip.
+	 */
+	igt_describe("A reset turning an active CRTC off while asking for "
+		     "a page flip event must still report that flip.");
+	igt_subtest("reset-disables-crtc-flip-event") {
+		struct flip_count flips = {};
+		uint32_t crtc_id, active_prop;
+
+		enable_output(&data);
+
+		crtc_id = data.crtc->crtc_id;
+		active_prop = get_prop_id(data.fd, crtc_id,
+					  DRM_MODE_OBJECT_CRTC, "ACTIVE");
+		igt_assert(active_prop);
+
+		/*
+		 * The CRTC is on before the commit and off after it, so it
+		 * can report the flip that turns it off. The CRTCs that
+		 * were already off can't, and must stay silent.
+		 */
+		igt_assert_eq(raw_atomic_commit_user_data(data.fd,
+							  DRM_MODE_ATOMIC_RESET |
+							  DRM_MODE_ATOMIC_ALLOW_MODESET |
+							  DRM_MODE_PAGE_FLIP_EVENT,
+							  &flips), 0);
+
+		drain_flip_events(&data);
+
+		igt_assert_eq(flips.count, 1);
+		igt_assert_eq(flips.crtc_id, crtc_id);
+		igt_assert_eq(read_prop(data.fd, crtc_id,
+					DRM_MODE_OBJECT_CRTC,
+					active_prop), 0);
+	}
+
+	/**
+	 * SUBTEST: reset-flip-event-all-disabled
+	 * Description: A reset asking for a page flip event while every CRTC
+	 *		is off before and after must be rejected instead of
+	 *		leaving userspace waiting for an event.
+	 */
+	igt_describe("A reset asking for a page flip event while every "
+		     "CRTC is off before and after must be rejected "
+		     "instead of leaving userspace waiting for an event.");
+	igt_subtest("reset-flip-event-all-disabled") {
+		/* Turn every pipeline off, so none of them can flip. */
+		igt_display_reset(&data.display);
+		igt_display_commit_atomic(&data.display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		igt_assert_eq(raw_atomic_commit(data.fd,
+						DRM_MODE_ATOMIC_RESET |
+						DRM_MODE_ATOMIC_ALLOW_MODESET |
+						DRM_MODE_PAGE_FLIP_EVENT),
+			      -EINVAL);
+	}
+
+	/**
+	 * SUBTEST: lessee-reset
+	 * Description: Verify that ATOMIC_RESET from a lessee only resets
+	 *		the objects in its lease.
+	 *
+	 * SUBTEST: lessee-reset-unleased-pipe
+	 * Description: Verify that ATOMIC_RESET from a lessee leaves the
+	 *		pipelines outside of its lease untouched.
+	 */
+	igt_describe("Verify that ATOMIC_RESET from a lessee only "
+		     "resets the objects in its lease.");
+	igt_subtest_with_dynamic("lessee-reset") {
+		/* CRTC and connector, planes added by the kernel */
+		igt_dynamic("implicit-planes")
+			lessee_reset_implicit_planes(&data);
+
+		/* CRTC, connector and primary plane */
+		igt_dynamic("primary-plane")
+			lessee_reset_primary_plane(&data);
+
+		/* CRTC, connector and every plane usable on that CRTC */
+		igt_dynamic("all-planes")
+			lessee_reset_all_planes(&data);
+	}
+
+	igt_describe("Verify that ATOMIC_RESET from a lessee leaves "
+		     "the pipelines outside of its lease untouched.");
+	igt_subtest("lessee-reset-unleased-pipe")
+		lessee_reset_unleased_pipe(&data);
+
+	/**
+	 * SUBTEST: lessee-reset-empty-lease
+	 * Description: A reset from a lessee holding an empty lease is a
+	 *		no-op and must succeed.
+	 */
+	igt_describe("A reset from a lessee holding an empty lease is a "
+		     "no-op and must succeed.");
+	igt_subtest("lessee-reset-empty-lease")
+		lessee_reset_empty_lease(&data);
+
+	/**
+	 * SUBTEST: lessee-reset-unleased-connector
+	 * Description: A reset from a lessee must be rejected when its
+	 *		lessor drives an unleased connector or plane on the
+	 *		leased CRTC, and must leave them alone.
+	 */
+	igt_describe("A reset from a lessee must be rejected when its "
+		     "lessor drives an unleased connector or plane on the "
+		     "leased CRTC, and must leave them alone.");
+	igt_subtest("lessee-reset-unleased-connector")
+		lessee_reset_unleased_connector(&data);
+
+	/**
+	 * SUBTEST: lessee-reset-unleased-crtc
+	 * Description: A reset from a lessee must be rejected when one of
+	 *		its leased connectors is bound to an unleased CRTC,
+	 *		and must leave that CRTC alone.
+	 */
+	igt_describe("A reset from a lessee must be rejected when one of "
+		     "its leased connectors is bound to an unleased CRTC, "
+		     "and must leave that CRTC alone.");
+	igt_subtest("lessee-reset-unleased-crtc")
+		lessee_reset_unleased_crtc(&data);
+
+	igt_fixture() {
+		igt_remove_fb(data.fd, &data.fb);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c7c614e7cd06..37d27dd97d4d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -20,10 +20,11 @@ test_progs = [
 	'kms_3d',
 	'kms_addfb_basic',
 	'kms_async_flips',
 	'kms_atomic',
 	'kms_atomic_interruptible',
+	'kms_atomic_reset',
 	'kms_atomic_transition',
 	'kms_bw',
 	'kms_color',
 	'kms_color_pipeline',
 	'kms_concurrent',
-- 
2.56.0

