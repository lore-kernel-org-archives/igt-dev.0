Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1E606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H8kI6gtz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827E210E201;
	Mon, 16 Nov 2026 05:20:35 +0000 (UTC)
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7C010E290
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Nov 2026 00:18:53 +0000 (UTC)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-67bda487981so3961637d50.2
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 16:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794701932; x=1795306732;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DVjrl6a6YX9X/89JP7RvTu0QF+BOSCzUGTp63AnMjio=;
 b=H8kI6gtzmKBBQNiTrL86CI7BPOtHrBijAnz7PM5lOpcw87M8dC41ml7lCu/L39Xyi5
 qwakVgJCX3CnAPc1QIhjEdIFt7HI7H5tNVo5Ze4xHMVdWhvts/p156Iido3IshtAG9GG
 3K44j1ciOm4tMiMTkWBcB0+ku82CvJNLafoFb0bStPg6qJQxdAAYYNNffh6gNQvJt4Mg
 nxUHgYj3jl3xJTfJtDD9anAhgLeddqHHA5ildbeMOeqFNhI6Y8CmIlAaJ1xhoAwowQ79
 KPJmXgaHiROQ4M2U9Ul6136dNo7Uagq9ZkYUeTD5GQbQRhLDqO9bTbxoapq6h85X12nv
 X8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794701932; x=1795306732;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DVjrl6a6YX9X/89JP7RvTu0QF+BOSCzUGTp63AnMjio=;
 b=YW4LESKQw7UNlTDNHMeBZ/QJssl/OCiksbNFR35b24qMduXjPYTpD5FnF72oODNN2l
 q9zIkhiStLYb72QJODIK9bDDHvCDqgnL7ORmuzTiUQrF+1/32JQU+yJ1Xy28J1Y+ZgFk
 yYNMlsUiLZiBBY5avV5n5+fdidJCShrh1lcY6mpepiL7G1H8hi7WfEb7EE9F9i6kCJ3J
 pJgaNsxfN/u6Xun6oc7n2SrkVH3PpPw1Vksv8lsUNnaiwmrIx7p4LsSGGGtZA4CSGnqR
 j47nKATOodC2XJ+cvc6iS4aJzia5xO6K3m6dJXn03YYYgG6x5hkMGCVm9vl7M3TpsXbQ
 PCgA==
X-Gm-Message-State: APuU4Z8NKWDrifH01P60r9sUQ/mJUYQBOefSNnAEa1Ytjv9ypDjZuN3W
 z0VN0NiDCE7sQJ7+OdU7MaNV8vuwP+XMOWHpZytduJdMN78fIPMIhn3GFMw4hEL1zJ8n5YYsQ9x
 Z2R+r83KG49JKznHLBbM06JM/X+Ix9YZtFxgQcd0FzP7PdBjSjj257S7zJ/NC2cDPfxkLtLWx7A
 kXu8226cdELXhXjITBHa0OgV0/Ga0QzkNB3xn3TnSIgpFIXSinZ3+JnpzM
X-Received: from ywbgn8.prod.google.com ([2002:a05:690c:4388:b0:8ae:2b76:3db0])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:a213:20b0:8b2:e7dc:dff5 with SMTP id
 00721157ae682-8b4aa2e13demr24804037b3.50.1794701931313; 
 Sat, 14 Nov 2026 16:18:51 -0800 (PST)
Date: Sat, 14 Nov 2026 19:18:50 -0500
In-Reply-To: <20261114222855.1403127-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222855.1403127-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115001850.2931093-1-gildekel@google.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Skip connectors that can't scan out
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

In igt_display_reset_outputs(), classify each output from the uAPI
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

igt_output_is_connected() honours non_scanout_sink. kms_setmode
enumerates connectors on a legacy fd, so it initializes a temporary
igt_display_t in its fixture to classify them and drops the atomic cap
afterwards. kms_writeback walks for_each_output() and still finds its
connector.

Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    v2: Apologies for the over-engineered v1 bloat from agent-assisted
        drafting; replace custom libdrm dumb-buffer probing with an
        igt_display_t/igt_fb TEST_ONLY probe in
        igt_display_reset_outputs().

 lib/igt_kms.c       | 79 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h       |  8 +++--
 tests/kms_setmode.c | 26 +++++++++++++++
 3 files changed, 110 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..ba9e39062 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2823,6 +2823,7 @@ void igt_display_reset(igt_display_t *display)
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
+static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_data);
 
 static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
 {
@@ -2883,6 +2884,52 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 	dump_connector_attrs();
 }
 
+static bool connector_type_is_physical(uint32_t connector_type)
+{
+	return connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
+	       connector_type != DRM_MODE_CONNECTOR_WRITEBACK;
+}
+
+static bool virtual_output_can_scanout(igt_display_t *display,
+				       igt_output_t *output)
+{
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	struct igt_fb fb;
+	igt_crtc_t *crtc;
+	int ret = -ENODEV;
+
+	if (!display->is_atomic || !mode ||
+	    igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			  DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb) <= 0)
+		return true;
+
+	for_each_crtc(display, crtc) {
+		igt_plane_t *primary, *orig_ref;
+
+		if (!(output->config.valid_crtc_index_mask &
+		      (1 << crtc->crtc_index)))
+			continue;
+
+		igt_output_set_crtc(output, crtc);
+		primary = igt_output_get_plane_type(output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		orig_ref = primary->ref->ref;
+		igt_plane_set_fb(primary, &fb);
+		ret = igt_atomic_commit(display,
+					DRM_MODE_ATOMIC_TEST_ONLY |
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL);
+		igt_plane_set_fb(primary, NULL);
+		igt_plane_set_crtc(orig_ref, orig_ref->crtc);
+		igt_output_set_crtc(output, NULL);
+		if (!ret || ret == -EACCES)
+			break;
+	}
+
+	igt_remove_fb(display->drm_fd, &fb);
+	return !ret || ret == -EACCES;
+}
+
 /**
  * igt_display_reset_outputs:
  * @display: a pointer to an initialized #igt_display_t structure
@@ -2895,6 +2942,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 	igt_crtc_t *crtc;
 	int i;
 	drmModeRes *resources;
+	bool has_physical = false;
 
 	/* Clear any existing outputs*/
 	if (display->n_outputs) {
@@ -2947,6 +2995,37 @@ void igt_display_reset_outputs(igt_display_t *display)
 	 * display. */
 	igt_display_reset(display);
 
+	for (i = 0; i < display->n_outputs; i++) {
+		drmModeConnector *c = display->outputs[i].config.connector;
+
+		if (c && connector_type_is_physical(c->connector_type)) {
+			has_physical = true;
+			break;
+		}
+	}
+
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+		drmModeConnector *c = output->config.connector;
+
+		if (!c)
+			continue;
+
+		if (c->connector_type == DRM_MODE_CONNECTOR_WRITEBACK ||
+		    output->props[IGT_CONNECTOR_WRITEBACK_FB_ID]) {
+			output->non_scanout_sink = true;
+		} else if (c->connector_type == DRM_MODE_CONNECTOR_VIRTUAL &&
+			   has_physical &&
+			   c->connection == DRM_MODE_CONNECTED &&
+			   c->count_modes) {
+			output->non_scanout_sink =
+				!virtual_output_can_scanout(display, output);
+			if (output->non_scanout_sink)
+				igt_info("%s: not a scanout sink, not used as a display\n",
+					 output->name);
+		}
+	}
+
 	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index dfcb91e02..ae8de13d2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -512,6 +512,7 @@ typedef struct {
 	struct kmstest_connector_config config;
 	char *name;
 	bool force_reprobe;
+	bool non_scanout_sink;
 	igt_crtc_t *pending_crtc;
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
@@ -668,14 +669,15 @@ void igt_wait_for_vblank_ts_seq(igt_crtc_t *crtc, uint64_t *ts_ns, unsigned int
  * igt_output_is_connected:
  * @output: #igt_output_t to check.
  *
- * Returns: True if given @output's connection status is CONNECTED,
- * else False.
+ * Returns: True if given @output is a scanout sink whose connection
+ * status is CONNECTED, else False.
  */
 static inline bool igt_output_is_connected(igt_output_t *output)
 {
 	/* Something went wrong during probe? */
 	if (!output->config.connector ||
-	    !output->config.connector->count_modes)
+	    !output->config.connector->count_modes ||
+	    output->non_scanout_sink)
 		return false;
 
 	if (output->config.connector->connection == DRM_MODE_CONNECTED)
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a65ea8b23..86839fb6f 100644
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
 
@@ -1047,6 +1051,25 @@ static void restore_cpu_deep_sleep_at_exit(int sig)
 	igt_pm_enable_cpu_deep_sleep();
 }
 
+static void find_non_scanout_sinks(void)
+{
+	igt_display_t display;
+
+	non_scanout_sink = calloc(drm_resources->count_connectors,
+				  sizeof(*non_scanout_sink));
+	igt_assert(non_scanout_sink);
+	if (dry_run || !drm_resources->count_connectors ||
+	    !drm_resources->count_crtcs)
+		return;
+
+	igt_display_require(&display, drm_fd);
+	for (int i = 0; i < display.n_outputs &&
+	     i < drm_resources->count_connectors; i++)
+		non_scanout_sink[i] = display.outputs[i].non_scanout_sink;
+	igt_display_fini(&display);
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 0);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1103,6 +1126,8 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
 
+		find_non_scanout_sinks();
+
 		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
@@ -1143,6 +1168,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
+		free(non_scanout_sink);
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
 	}
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

