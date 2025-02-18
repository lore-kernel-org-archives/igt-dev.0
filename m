Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3707C021BF
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB15610E7BA;
	Wed, 19 Feb 2025 09:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HykjY+xW";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266B310E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:19 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43996e95114so5761465e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897417; x=1740502217; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szagCwKU/YhJabBrlFpW0k/yz9JbCD5BqOjHxJYBAtA=;
 b=HykjY+xWS+jdtaadl1+2hlGgiwtHU7ZsUK36H8NmDNGVz3Z/WBSkTIiHRlMRP5ZyQc
 NZ3tTENOB4T56OaXgRENHQAHxgdwwCtQbKcROs51LhPcX+B/EWRANmgvEvQE0sLQMPks
 4yqnWKIvT49Ffhvn92fDRTGenehs2NTsjAhHvvcbc1/rQeMnAt2oHBHYf8UpuzaAlcbw
 iTngGuBJstNZOhsM+29i7VGXhx2WHAkZOvBfGqNvZ2h48sKXTDKLaRuCZQBOi3HQuGem
 Pyj6ZdjoxfMH6gavbaX3dRiKqb+A4o7nXYK/uSqSNQ6ylfnhV2JUXDwiwabCU9qvMLzk
 OmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897417; x=1740502217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szagCwKU/YhJabBrlFpW0k/yz9JbCD5BqOjHxJYBAtA=;
 b=q7egh5SMrXAFukYCOjWS2Kb3yjrAVPvOSWgcdNPn2RcESzIinIQXqXQeo52qN8FwLj
 dZIZmXSs5I1Zd/szXyDsuBV1QvhZ0nykRrtZb3ImwqcEJbXTzoMguhFWnY6OnO4hfcim
 3ipsTt0K7embD46j6sbUfqlsZUFOgeZM81Dr+f5AdYTgPOyW6IDnww9JBABs9ig9eM+w
 GPI/xjildOqdvH12iIUYVYkGIkgEnb+Kwao0cZ5U+z/T1ZzBQBTUxA0mGGka1RROegFg
 nB896AtMEHQbdJUBad2pyq62377I925q1T8SExYYrWWJdrQqE5Dqu9wGHRtfzacf/jTo
 Jyag==
X-Gm-Message-State: AOJu0YzkqStMI02hNLPLHEwHptHdNtwtGSipyNzlF3gkpyn0WdpuiSdu
 /Wx7484aaD1sensnhojLM23AYPy918wjUVsts4kwPzm0w/Bxt9Pb3FmzBj6T
X-Gm-Gg: ASbGncvhoSBdA5ioH5ysMCOgPlZy7oXLfUfWIQsdI1F0ocIiwpXnNDOYm95lpXNVb+3
 qv+rR4lwC2jEb1Rv+0x4pvjC5v7vWFV2RvdY2LwO/tKRgONgt2Tl4KH+UsCCtNHFjYOlWlSrKu8
 9QOr+Qk8JChh/jJzYzN8THSEokM6DOEm0XzpvFkCwBa0tlYGfOaTePWyJDcSr9U5+jpxoMimB07
 dPPn9gcTa0xgJtvJeZW7E8WZBRo+xtqile/rkvd4YUjt8dvsYiFYf4whiRprPk6cmunxiTDorbk
 ljN7xpfFCAsjFmXwbA==
X-Google-Smtp-Source: AGHT+IHV8m/qa+1pyOk2+AnCWCvXHZKtIAUXp6U1OSqUhlPefn5dRitcVuCvrLaw9nRlWpdvyqg0JQ==
X-Received: by 2002:adf:e74e:0:b0:38d:d767:364 with SMTP id
 ffacd0b85a97d-38f33f1c8bamr11314059f8f.13.1739897417233; 
 Tue, 18 Feb 2025 08:50:17 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t 03/39] lib/igt_configfs: Add helper to mount configfs
Date: Tue, 18 Feb 2025 17:49:35 +0100
Message-ID: <20250218165011.9123-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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
index 9fffdd3c6..201b1fbb4 100644
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

