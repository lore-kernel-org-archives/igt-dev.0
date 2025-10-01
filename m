Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF77CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 18:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4931310E0E1;
	Wed,  1 Oct 2025 18:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LK4yTXN7";
	dkim-atps=neutral
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FF10E0E1
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 18:50:42 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4d6fc3d74a2so5304851cf.2
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Oct 2025 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759344642; x=1759949442;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RjL3NUAafnws9jrQKZKvzdEODpzmUjwVM5jkBbhElXc=;
 b=LK4yTXN7gQfASkgxseWtXobdh8a/NfWh7OxSCHZJe2QRIrf1T/u2Nl6tMJBKJ3GKNg
 oo4+aEoei/1T6L5UDYLcZQ8LqDgMkfNxXZNbgNSyHvK5eg6emERtj1X/Txm37UeAJoeT
 zqD/S75eKHmxkymPH74SwTTqwkJOLsjUJBzRaQecuQxyM6VDUpiVA9BrdCuxNpEi5C8D
 1puUJrAKwCPjEpQQNBNLBpVQ8BF4wxgx1GODZpVLwJaEpRoFSltI/IbHWLGVQplhpaVj
 tfDJMaGbEyF5a6ofLp0d7AvsMe8B+mOw5HcMAlFjJ7+EE/XuYM2tCsiodPF8Kr8X1CDi
 CZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759344642; x=1759949442;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RjL3NUAafnws9jrQKZKvzdEODpzmUjwVM5jkBbhElXc=;
 b=HwoH6+wlDiIYiagBpuLvgLdwHz0dzz5xOew2jzwRvrP7QwJNIBTZasMFo3+Dh+1Llq
 lPjIygloLfbAXoH+U+L99xgO89nRvl19EunyhG42+9AqjU0pKiWUBx5HgpBKySsTwghA
 v4qMNX1jyuCf6JkhjEpFz+yt5VpOiuncFK6qLAm4QDx0t3ATm9b3Ty9aEkvFtqQf4kj2
 nkdWeCqxBYJlrhEB8QgyzvwZI4szTJG5dJ+mW5oA4jYGPI20jzW8+eS6j5OJ/owWyyYs
 dQGnHpc9HFq4FCMHyb9E9dquCzyVNUc3VJm4tdNISkua4Gj4VNL6TmiUh1Jz3pMXxUYt
 SXrw==
X-Gm-Message-State: AOJu0YyH16bK3eqbWqebQWBOUw9/Xy3gwaL9qV+pnaIlKBpLjU8fNbfT
 fqytewvg+VQq6c4o9ZSmtMtLOoOmvpmfSllbRG9MQASG1l2FXDUliRKDsDGpTyw+Ch9gH9qEv5A
 jTlWX/0pu+UTq5njupswIXMn1QvT018DIaPKQ0zIedl14uPvfZ1xogJp47JCmAjbAkSAbpGZ1UX
 YfWUcrT/1pG+Bhp/CKLSI/BMk8vwyv42IPrgUY6VGv+N4MIwXfyb+lMiFjfxuZ6wDzjoM=
X-Google-Smtp-Source: AGHT+IHUpw5fQJh74Qfwx27e2ZEc9avtD6pFmJu1WZn20+HDNll3BXzuk+dqJmvb6z680eZCADorgN++NdNazLiB
X-Received: from qknqj5.prod.google.com ([2002:a05:620a:8805:b0:814:faa9:8520])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1f9b:b0:4df:1196:f570 with SMTP id
 d75a77b69052e-4e41d8a1430mr58414301cf.53.1759344641599; 
 Wed, 01 Oct 2025 11:50:41 -0700 (PDT)
Date: Wed,  1 Oct 2025 14:50:38 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001185039.3386207-1-markyacoub@google.com>
Subject: [PATCH i-g-t v2] lib/drmtest: Allow DRIVER_ANY tests to run on VKMS
 when supported.
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
Android's VM use virtio-gpu as its default driver, but VKMS can be
enabled on top it.
VKMS is the preferred driver to run IGT.

[How]
To maintain the current way to preferring hardware drivers, introduce a
"PREFER_VKMS" flag which does not remove DRIVER_VKMS from the list of
drivers to be opened. Android will keep this as always true.

Also, added explicit support for virtio-gpu to be explictly filtered
out, making room for VKMS to be the primary driver in use.

Test: kms_bw on AVD
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 lib/drmtest.c |  1 +
 lib/drmtest.h | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 551385867..a1fb0b5ba 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -223,6 +223,7 @@ static const struct module {
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
+	{ DRIVER_VIRTIO, "virtio_gpu" },
 	{ DRIVER_VKMS, "vkms" },
 	{ DRIVER_VMWGFX, "vmwgfx" },
 	{ DRIVER_XE, "xe" },
diff --git a/lib/drmtest.h b/lib/drmtest.h
index a9542dde2..29356041b 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -37,6 +37,7 @@
 #include <xf86drm.h>
 
 #include "igt_core.h"
+#include "config.h"
 
 int __get_drm_device_name(int fd, char *name, int name_size);
 
@@ -56,16 +57,21 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
 #define DRIVER_VKMS	(1 << 9)
+#define DRIVER_VIRTIO	(1 << 10)
 
 /*
- * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
- * with vgem as well as a supported driver, you can end up with a
- * near-100% skip rate if you don't explicitly specify the device,
- * depending on device-load ordering.
- *
- * Exclude VKMS to prefer hardware drivers.
+ * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if
+ * you run on a system with vgem or virtio-gpu as well as a supported driver,
+ * you can end up with a near-100% skip rate if you don't explicitly specify
+ * the device, depending on device-load ordering.
  */
-#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
+/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferred driver. */
+#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
+
+#ifdef PREFER_VKMS
+#undef DRIVER_ANY
+#define DRIVER_ANY	~(DRIVER_VGEM  | DRIVER_VIRTIO)
+#endif
 
 /*
  * Compile friendly enum for i915/xe.
-- 
2.51.0.618.g983fd99d29-goog

