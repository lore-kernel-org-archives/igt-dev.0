Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76E606A326
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=equGwgrv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7151510E02F;
	Wed, 25 Nov 2026 09:54:47 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F1A10E5CC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 19:44:47 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-55db3f05536so8699971cf.3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 11:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795549487; x=1796154287;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SobyAH+7bWUIGs82E6EbHBrLpe+9hArJ+sGmN7UpVLg=;
 b=equGwgrvG0Db8gzBUGwmkGvWqU5cXj3/W4plqmPyezLCTSBjo6H8cHaSqpOqRBgUGZ
 MBpyFSCaiZmzPDleZYi+paj79tG7w9sHwXl+WKhqe2VfjOzO/wa0zmm3F+0MaKsARX9B
 arAIDO36psidVBqwnhIfhqufP72qMHOiL5o0IN9+IJm8fOzP6Ai0ipwbPyx8PrppO3Bn
 21RPJ2NYgpFOYfy0SF9ODUcahJHcqWA7LgQ/OuaOBOTznBMqqcCveyYF3AOMZtByNwvt
 q8W4MOMQU7wBOCwv8uCXLKzV3WUoWVkJUHyJlCNPS82cz3NM4//MllDYX1X+MVSnowTC
 FdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795549487; x=1796154287;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SobyAH+7bWUIGs82E6EbHBrLpe+9hArJ+sGmN7UpVLg=;
 b=FfwLV9fDD4Yhp+Ca77lpCTEgK9FaC/hqhoDyjd9xtFAz9MtUIbshMcdsikUXfAOAmG
 XONPECZCXZXYTW/msNuK4bf4fUMTtsff1avTOpu3nNJOYT8GTO625mGL9E/a7gHqV5bn
 +t1D/AkKnFfEa8KvDI4Hsn5jssOVtGp3rrvpQ5NHgQrmybfhXaPsvUgvDHiLZ+63TttJ
 XuovVj8pbdjtdH5Uk8Q9EXArJsK7pB8ITEfez5k0pRvO9jH5IS/emE+QZIArIYbmYwh0
 x5GyW1im2JePk7Q9YYZmVZsEvrguM6yDoGBWGEA9SUzq+PAuAJ8GPoUTi77z/PoxntKp
 Yppw==
X-Gm-Message-State: APuU4Z90hQVpAvG/X+ho6HLVSw1xUB0mQRAoXTBUbBdYEr38nop+No8I
 2I9TI7HBEhC5KVIgO9RLTNQFVrcUTq2TaiZMHJvJwmlXLLDkSMNNahhA3LW1d+kyo+v/W0adX4d
 e6hR8EiyWfJR0vEhZdXHr1sMTtCyaGscfYQgdzDToyunFkRg5lZvE/pKrnLMmZ6xqYbQnNjr5Iq
 g/C2e1P2l/EEhj63o0gQg/4mhNgcrMU/DKl66SIEGvezgRxuV0/QubhLrv
X-Received: from qtcpa21-n2.prod.google.com
 ([2002:a05:622a:e2d5:20b0:536:68db:4c9f])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:40b:b0:537:af99:ad44 with SMTP id
 d75a77b69052e-55d76b00800mr304163111cf.57.1795549485906; 
 Tue, 24 Nov 2026 11:44:45 -0800 (PST)
Date: Tue, 24 Nov 2026 14:44:40 -0500
In-Reply-To: <20261124194441.314626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124194441.314626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124194441.314626-2-gildekel@google.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_kms: Skip non-scanout connectors
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Jani Nikula <jani.nikula@intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:20 +0000
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

igt_output_is_connected() trusts the connector status alone. Qualcomm's
downstream msm SDE driver exposes its writeback output as an
always-connected DRM_MODE_CONNECTOR_VIRTUAL connector alongside physical
eDP and DP connectors. IGT then picks that connector as a display, its
first modeset fails with -EINVAL because no writeback framebuffer is
attached, and every test calling igt_display_require() fails in its
fixture.

Commit 321448df7fc9 ("lib/igt_kms: Do not treat writeback and virtual
connectors as connected") skipped all virtual connectors. That broke
VKMS, which only exposes virtual connectors, and was reverted.

In igt_display_reset_outputs(), classify each output via standard KMS
uAPI:
- DRM_MODE_CONNECTOR_WRITEBACK connectors, and any connector exposing
  WRITEBACK_FB_ID, are marked non_scanout_sink.
- Devices with only virtual connectors (VKMS, virtio-gpu, vmwgfx) skip
  probing (0 extra ioctls) and keep all virtual connectors as displays.
- Physical-only drivers (i915, xe, amdgpu, nouveau, upstream msm) also
  skip probing (0 extra ioctls).
- Only when a connected VIRTUAL connector coexists with physical
  connectors on the same device, test-commit (DRM_MODE_ATOMIC_TEST_ONLY)
  a linear XRGB8888 primary plane on each compatible CRTC once during
  igt_display_reset_outputs(), marking non_scanout_sink only if every
  CRTC rejects it. If atomic is unavailable or the caller is not DRM
  master (-EACCES), keep the connector.

igt_output_is_connected() checks non_scanout_sink, while kms_writeback
walks for_each_output() directly and still finds writeback connectors.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-fable-5.2
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    v3:
    - Split kms_setmode changes into patch 2/2 (Jani).
    - Use for_each_output() in igt_display_reset_outputs() (Jani).
    - Clarify driver motivation and zero-ioctl CI path in commit
      message (Jani).
    v2:
    - Replace custom libdrm dumb-buffer probing with an
      igt_display_t/igt_fb TEST_ONLY probe.

 lib/igt_kms.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  8 +++--
 2 files changed, 88 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 789da08b3..46049d718 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2839,6 +2839,7 @@ void igt_display_reset(igt_display_t *display)
 
 static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane);
 static void igt_fill_display_format_mod(igt_display_t *display);
+static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_data);
 
 static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
 {
@@ -2899,6 +2900,53 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
 	dump_connector_attrs();
 }
 
+static bool connector_type_is_physical(uint32_t connector_type)
+{
+	return connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
+	       connector_type != DRM_MODE_CONNECTOR_WRITEBACK;
+}
+
+/* Probe whether a VIRTUAL connector accepts a primary-plane scanout modeset. */
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
@@ -2908,9 +2956,11 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
  */
 void igt_display_reset_outputs(igt_display_t *display)
 {
+	igt_output_t *output;
 	igt_crtc_t *crtc;
 	int i;
 	drmModeRes *resources;
+	bool has_physical = false;
 
 	/* Clear any existing outputs*/
 	if (display->n_outputs) {
@@ -2937,9 +2987,10 @@ void igt_display_reset_outputs(igt_display_t *display)
 		     display->n_outputs);
 
 	for (i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
 		drmModeConnector *connector;
 
+		output = &display->outputs[i];
+
 		/*
 		 * We don't assign each output a pipe unless
 		 * a CRTC is set with igt_output_set_crtc().
@@ -2963,9 +3014,38 @@ void igt_display_reset_outputs(igt_display_t *display)
 	 * display. */
 	igt_display_reset(display);
 
-	for_each_crtc(display, crtc) {
-		igt_output_t *output;
+	/* Classify non-scanout sinks before igt_output_is_connected() below. */
+	for_each_output(display, output) {
+		drmModeConnector *c = output->config.connector;
 
+		if (c && connector_type_is_physical(c->connector_type)) {
+			has_physical = true;
+			break;
+		}
+	}
+
+	for_each_output(display, output) {
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
+	for_each_crtc(display, crtc) {
 		if (!igt_crtc_has_valid_output(crtc))
 			continue;
 
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
-- 
Gil Dekel, Senior SWE, Google | Android Laptops & Tablets Display

