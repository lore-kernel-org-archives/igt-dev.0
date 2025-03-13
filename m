Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B587BC35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4049810E8FF;
	Thu, 13 Mar 2025 17:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4XGMUm6";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7600F10E8FF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1061252f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887206; x=1742492006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9ctsAPhxpAq3WFWnNyU+W+4LtaY96WVPTgTp83rcRI=;
 b=G4XGMUm6//QPD7kb6VerG/Pf4d/X5Bjhx35jhCCMTEM5N8vfjocspye1qW/ytZWblm
 aNVetYuc+FwXR52miOA/y5P5dVjVJONhldxtqlm+Kh/njftT1TJ07sR6yWrKibGVa6gO
 DwsBfSrmG9hD8qeUSWElcvY6SfeFBTUdp9W3gzxZbj3P7m/O83YIW+moNWwhjDh9Ir5i
 a+FXIMuVL8ZujMju+7+sMHNUGmEJdcWK+7KvVtNbwoJ6xgKD8FZPeS5+Bl7m6h73BeTS
 iLCIyyeTlBoLGyFRyUtVpjcLYUZVcfx6LSn//m611MTYMX49Gv5K4MWcaQymRdPM+X2I
 hMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887206; x=1742492006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9ctsAPhxpAq3WFWnNyU+W+4LtaY96WVPTgTp83rcRI=;
 b=epd1NLC11vlzXSfL0AcVc0bQEM+uOgUaHUPOev/4p8HJwtZRz7YjKyGYjAQCD7Oq0V
 MCwAqYdkQRg5t5Fj7ng6o21lA3t5jCw3odt+zFa/r3g8AYLWv9fsP2uDCBFqO0Tf2QYU
 +WiAvbjxGOk2L36PZEWY9uMGsJsGc6qbabQl4+mWebLJl50Qshs7LKvT4U/e9+Iqk9X3
 DWOY1UBFuuNFEyzGsrSY0EimJ/Op4i2uMSfwlcBqRKZkgrlg7/dBtvUygD9XRM2aPSNT
 YAXkyfwaGh+DBfRlAz4Q0Kr6c4GQynNI16VT0KhE2ntlL0NKrJJAseGSJoAnYIQX7HoG
 lR/A==
X-Gm-Message-State: AOJu0YyBMZhv5lyLCsIVAO7udsnG/9GPxpStLvTZ3wKYpiC2TXQhlJ8L
 Ys6hqfxPyIJ8Yvi8S9tYGHwxF47pQntELIpNdNmk1QO/cUwR+Juw+Qu6sjxX
X-Gm-Gg: ASbGnct1Bdl6kYazt9mROaxd8Ny7IKpi3Z9+mow79+UY/7I1Gd8WXZR7DL4y7/J+6FJ
 BeuxfjRmsDQnz28Dpdnbq+rKfCtrOhRIeVG1/awCYtMMHvlxVtBw65HxAKO0RxnCv9Rwe4X0OnN
 Xh9WfNlSocxxSzS2FoK+XKAwuRfNHEwymZMbJhQ05/tRYZprao4/rXvO94wVDB6icSXT1m4LXmB
 pteKtNyW4BUpDIkep/SAOkhUVeTsKGmM8UPE1RkmsdycwXjOk7IlMbMijuEQzL8GzkAWm7tVQf7
 bhy5t70xr4am1JPKiLBCJrsIXiKqUSBwAO3C5LvOo5gQ
X-Google-Smtp-Source: AGHT+IEU1ThdDHtd4YHKqIK/5NmHfSCUFhSU7BwgS39adNgqQx/cqde9t0snpVKC1xCCG+Y7rFluPg==
X-Received: by 2002:a5d:47c1:0:b0:392:bf8:fc96 with SMTP id
 ffacd0b85a97d-396c1c20619mr310307f8f.4.1741887206429; 
 Thu, 13 Mar 2025 10:33:26 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:26 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v2 03/43] lib/igt_configfs: Add helper to mount configfs
Date: Thu, 13 Mar 2025 18:32:38 +0100
Message-ID: <20250313173318.5818-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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

Add a new helper function to mount configfs. Required to test VKMS
configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt.h          |  1 +
 lib/igt_configfs.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_configfs.h | 13 +++++++++++
 lib/meson.build    |  1 +
 4 files changed, 72 insertions(+)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h

diff --git a/lib/igt.h b/lib/igt.h
index 58c39e098..173ca70bf 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -27,6 +27,7 @@
 #include "drmtest.h"
 #include "i915_3d.h"
 #include "igt_aux.h"
+#include "igt_configfs.h"
 #include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_draw.h"
diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
new file mode 100644
index 000000000..cd8674cb5
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Google LLC.
+ * Copyright © 2023 Collabora, Ltd.
+ * Copyright © 2024 Red Hat, Inc.
+ */
+
+#include <sys/mount.h>
+
+#include "igt_aux.h"
+#include "igt_configfs.h"
+
+/**
+ * SECTION:igt_configfs
+ * @short_description: Support code for configfs features
+ * @title: configfs
+ * @include: igt_configfs.h
+ *
+ * This library provides helpers to access configfs features.
+ */
+
+/*
+ * General configfs helpers
+ */
+
+static const char *__igt_configfs_mount(void)
+{
+	if (igt_is_mountpoint("/sys/kernel/config"))
+		return "/sys/kernel/config";
+
+	if (igt_is_mountpoint("/config"))
+		return "/config";
+
+	if (mount("config", "/sys/kernel/config", "configfs", 0, 0))
+		return NULL;
+
+	return "/sys/kernel/config";
+}
+
+/**
+ * igt_configfs_mount:
+ *
+ * This attempts to locate where configfs is mounted on the filesystem,
+ * and if not found, will then try to mount configfs at /sys/kernel/config.
+ *
+ * Returns:
+ * The path to the configfs mount point (e.g. /sys/kernel/config)
+ */
+const char *igt_configfs_mount(void)
+{
+	static const char *path;
+
+	if (!path)
+		path = __igt_configfs_mount();
+
+	return path;
+}
diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
new file mode 100644
index 000000000..4cbe9001e
--- /dev/null
+++ b/lib/igt_configfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Google LLC.
+ * Copyright © 2023 Collabora, Ltd.
+ * Copyright © 2024 Red Hat, Inc.
+ */
+
+#ifndef __IGT_CONFIGFS_H__
+#define __IGT_CONFIGFS_H__
+
+const char *igt_configfs_mount(void);
+
+#endif /* __IGT_CONFIGFS_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index d01c90df9..b595b9979 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -18,6 +18,7 @@ lib_sources = [
 	'i915/i915_crc.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_configfs.c',
 	'igt_facts.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
-- 
2.48.1

