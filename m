Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04B606A326
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XnVoBkRQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35010E29D;
	Wed, 25 Nov 2026 09:53:51 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827C010E270
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 19:44:52 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9493e89d4f9so723308085a.2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795549491; x=1796154291;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NF8ZDIVJX9jzMMe8Ry3vua0oCWN0XPR3qDPE7t+HcN8=;
 b=XnVoBkRQVI+H6oGXv5nqbULlRlWCgl7iRxAiMgaQXTN7VKPJ/ozGaS0iOQacKl2Eil
 eABAcspPFuf6/hqgdpHDWFoArhAD1ewJG4v3c6/OLnIymId560aATZJ8Y6xs8qB429rW
 ruJTFjiaVBfeit1uhew6P3JIpf6m3Mqt0T+9IZvzgcjl69dIJDKtd+9SI2hBq6U4jO+x
 adkveaKLViMdMEfHjynJV/kfb4Mf6sDJ4na58jXYabkviYUSREIkXLw8lHKePrrBc+D4
 QpdwZ/8MlJv4orDO9YhYq6uTA9MdK8FzmxcWi+jQDPYfhRrpRbrzJUNrhb+oP2niZlkH
 TQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795549491; x=1796154291;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NF8ZDIVJX9jzMMe8Ry3vua0oCWN0XPR3qDPE7t+HcN8=;
 b=QAEqeGitbT+TlMSLvLzNEbnmsOUC5A8uSEZCCjv+T5XKvYM40hzjZWNwaZHZvG47m3
 i+p0kWb7hQ8QrGXjJmOBBjk9zLkTR/3EQCqW4XBKQAwYtHqrWqr/VrlsxGjsa4DNLZLB
 mwyenGd4IzrHx+sRQC9Q4NrG1Adb3NJMPU1T6uicdB/2XNLCX8RhiWgI4DgJqNK/bIxa
 RTCWm1VrVA2HnBcZ2jXXUfybcv8jWjia5oNewBXMifKgz0TiELAlo6YMxYWi09mK+mWk
 bZ2ZFRZsgok6dkJZD5ErzviLe4Iw4uL/pKYamnetk08pXImgDfWpDqTk/NVRWdjeXNvZ
 98FA==
X-Gm-Message-State: APuU4Z86vlewynIEGJsg4OQ9QIYdoJMe4zwfqPWTsQVc6UFFkmvJ2i9A
 FnNsA6rQ/C/5BhK2HT194ZQpxsQwJDPGtQjnDjo17DPTjRAKogi1z3V4QWXi/Jgal9F9HyLbhg3
 pwMzvvRa9b5oepJwDmllyefpGp/JIg0lx7h/U74jXmjpVGjvZFU93YJVrpc7mjK9+X7szWF3o+o
 hR1UMs6bkSzSElDwSg/Cdub9YlA21tl25NS6j5YbXDGkDyxi6SUilGSkEX
X-Received: from qkcbb21-n2.prod.google.com
 ([2002:a05:620a:6e95:20b0:93f:13fb:98ca])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:46a5:b0:93f:6c76:215 with SMTP id
 af79cd13be357-949bab157e4mr2770991585a.50.1795549491116; 
 Tue, 24 Nov 2026 11:44:51 -0800 (PST)
Date: Tue, 24 Nov 2026 14:44:41 -0500
In-Reply-To: <20261124194441.314626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261124194441.314626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124194441.314626-3-gildekel@google.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_setmode: Skip non-scanout sinks
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

Unlike tests that iterate igt_display_t outputs via
igt_output_is_connected(), kms_setmode enumerates raw drmModeRes
connector combinations directly on a legacy DRM fd. On drivers that
expose writeback or non-scanout VIRTUAL connectors alongside physical
displays, kms_setmode pairs those connectors with CRTCs and fails its
legacy modeset combinations.

Initialize a temporary igt_display_t once in kms_setmode's fixture to
record output->non_scanout_sink for each connector ID, drop
DRM_CLIENT_CAP_ATOMIC afterwards so legacy setcrtc behavior is
preserved, and skip non-scanout connectors in get_connectors().

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-fable-5.2
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    v3:
    - Split out from patch 1/2 into its own patch (Jani).
    - Match connectors by KMS connector ID via for_each_output().

 tests/kms_setmode.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a65ea8b23..6790f531d 100644
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
 
@@ -1047,6 +1051,36 @@ static void restore_cpu_deep_sleep_at_exit(int sig)
 	igt_pm_enable_cpu_deep_sleep();
 }
 
+/*
+ * kms_setmode enumerates connectors directly on a legacy fd; run
+ * igt_display_require() once in the fixture to classify non-scanout
+ * sinks, then drop DRM_CLIENT_CAP_ATOMIC again.
+ */
+static void find_non_scanout_sinks(void)
+{
+	igt_display_t display;
+	igt_output_t *output;
+
+	non_scanout_sink = calloc(drm_resources->count_connectors,
+				  sizeof(*non_scanout_sink));
+	igt_assert(non_scanout_sink);
+	if (dry_run || !drm_resources->count_connectors ||
+	    !drm_resources->count_crtcs)
+		return;
+
+	igt_display_require(&display, drm_fd);
+	for (int i = 0; i < drm_resources->count_connectors; i++) {
+		for_each_output(&display, output) {
+			if (output->id == drm_resources->connectors[i]) {
+				non_scanout_sink[i] = output->non_scanout_sink;
+				break;
+			}
+		}
+	}
+	igt_display_fini(&display);
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 0);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1103,6 +1137,8 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
 
+		find_non_scanout_sinks();
+
 		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
@@ -1143,6 +1179,7 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
+		free(non_scanout_sink);
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
 	}
-- 
Gil Dekel, Senior SWE, Google | Android Laptops & Tablets Display

