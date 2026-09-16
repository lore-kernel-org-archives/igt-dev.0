Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799CDC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 09:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2148310E6EF;
	Wed, 16 Sep 2026 09:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="msf5t4qJ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB310E012
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 09:52:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E356441667
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 09:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F97E1F000FF;
 Wed, 16 Sep 2026 09:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789552323;
 bh=568S7vxDv9ZYmNmLQVEvjUoHmYfF26CrmjxO2F0JEj4=;
 h=From:To:Cc:Subject:Date;
 b=msf5t4qJVuvapa6ADXFIM8YFIZUL6V3ybcr9X8Gvo6dUn6b3Rba+rLzuwjgaYGhnr
 0pkry9DS2eF1OgWGAfyazEe6sHFX84z+2+guuHvP4pkegD3n9qk4DA85PXaYuTuBCk
 95DYZGjzPjE/6SMFUw59KSwani5y4Mac+wqrBS/gvlgipHMciWHvkS6Ws3JQOFDPla
 gh8QEC4fpQGgSnmyvx4mmEs8ZWKFjTQN50qC2KdwE3fRIxS36+SfPOW6S9YQCILv/I
 o4oaJ93utosRQVghtjgeQ+M682oLyfrk56kgtbr9uloOh7F8hzntmhFrLXUFtKxARd
 N6hBd6mE99MFw==
From: Maxime Ripard <mripard@kernel.org>
To: igt-dev@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH i-g-t] tests/kms_atomic_reset: Add tests for
 DRM_MODE_ATOMIC_RESET
Date: Wed, 16 Sep 2026 11:51:58 +0200
Message-ID: <20260916095159.2896630-1-mripard@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The kernel gained a DRM_MODE_ATOMIC_RESET flag that resets all KMS
object states to their defaults before applying the properties carried
in a commit. This flag is advertised through DRM_CAP_ATOMIC_RESET.

Add a test exercising the basic semantics of the mechanism:

- cap-atomic-reset: the capability is reported.
- invalid-reset-with-async: ATOMIC_RESET rejects PAGE_FLIP_ASYNC.
- reset-test-only: TEST_ONLY succeeds without altering committed
  state.
- reset-disables-crtc: a bare reset brings ACTIVE back to 0.
- reset-with-crtc-enable: explicit properties in the same commit
  override the reset defaults.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 tests/kms_atomic_reset.c | 282 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 283 insertions(+)
 create mode 100644 tests/kms_atomic_reset.c

diff --git a/tests/kms_atomic_reset.c b/tests/kms_atomic_reset.c
new file mode 100644
index 000000000000..a12b348a3aa7
--- /dev/null
+++ b/tests/kms_atomic_reset.c
@@ -0,0 +1,282 @@
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
+raw_atomic_commit(int fd, uint32_t flags)
+{
+	struct drm_mode_atomic arg = { .flags = flags };
+
+	if (drmIoctl(fd, DRM_IOCTL_MODE_ATOMIC, &arg))
+		return -errno;
+	return 0;
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
2.55.0

