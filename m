Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F3ECCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 16:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EC610E72F;
	Wed,  1 Oct 2025 16:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="holoDA2y";
	dkim-atps=neutral
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C823C10E72F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 16:36:52 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-84a63a0c496so9081185a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Oct 2025 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759336612; x=1759941412;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yjIwC7dm0TP7AX3l2B81aidrNzGdevJgriwsG3Dr2xY=;
 b=holoDA2yZGTFkv1PYZWyAUT6eL3VAr7MbsB/PUP6sTaEsdfFGZ6qOdzlSit0C092MR
 hogWZm2i9dNHIKrbwCfms0JyE/dfsJTqLllJNrECtOnUMrcPYdvGuhR0Qwrfk+BG+1E0
 OYTg03SD9LJ0YjbD7K80hOCq6fuzJ5ED+eiPDE37Rv6JkapIgL69j/H86KDIyhFPlLQw
 vM7c5f0I2OfV9eV+rroJOXIhCzaDQd6slYO1XMpLvX5rq37A3Jh7z38f/bnMFzaIf+tT
 6MK8pHh0swDIB9k7c2ZIhs9csQ8is8UaYyROn7Y19mfE2dSLzv/7yUwTHw6SVfFBBiT0
 EG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759336612; x=1759941412;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yjIwC7dm0TP7AX3l2B81aidrNzGdevJgriwsG3Dr2xY=;
 b=TXmyaX8FAALHmLIS9JzmlNe+HRcvxAnZav4vHxOYGw5jcmdziC8AHsRza7urm3MIbQ
 xuuAPxvaeykrKcndUzCl/vtNjGA6IHKg8XT1GGQC7ZGRwyLH57bjUlLq55i1Nudgm+my
 Of0LtUuuQdJMqWIPi2hpFyxVQlDQwSWJEIuwR2OoGK6AYL+k3J/tHkZrB4R+cOKMXUcr
 1ZmWHresG1xTLW5vhdqPAojmExVE9ATfEVY9g8FRsRUr3ghsEchUq/04tLXljdhBr8OF
 q3vV+JYXZiMR95GqsrhymWiyMdpMiiyzhMCXTFf3KFJGgDo7PhzKppZP+uc6mrXnMM04
 h1Ng==
X-Gm-Message-State: AOJu0YzgscT6sFnftdUFFNbL1QKUmqSvVjtJyv8dzLbKSujkSsUm5iia
 OOomZIiF6gQ7Qi0l9lwv1/1hJ5YJEnb5nP/+tdwU+hQ5fGeFX4wUDMy4H24pvA9VQrq7iHSFQxk
 D7EJrgrzr5+9RZQWkd6ZsJlxGi5qNyUYW5C5H3y6LAkrBXeGPucvC9TgmbgmBD0t+uR4jM2whqI
 X/AfIAh9VT/pf9Ked+188D4ttXMPZ2jo4+6z6SF0qtNBtBZf87/EqwlTq8w8RRxRy4WTM=
X-Google-Smtp-Source: AGHT+IF3r9+pWdQLqrZ0gw/NldkroJ9XDjRCeitVolduhPpJivHrLjQu+6C+y4dt6R8wNiwGXR+fgPtX1BMQtrNU
X-Received: from qkpa20.prod.google.com ([2002:a05:620a:4394:b0:857:6dc3:39a5])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4690:b0:870:39aa:75e3 with SMTP id
 af79cd13be357-873765c01d7mr570835385a.55.1759336610825; 
 Wed, 01 Oct 2025 09:36:50 -0700 (PDT)
Date: Wed,  1 Oct 2025 12:36:34 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001163635.3353517-1-markyacoub@google.com>
Subject: [PATCH i-g-t] lib/drmtest: Allow DRIVER_ANY tests to run on VKMS when
 supported.
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
 lib/drmtest.h | 18 +++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

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
index a9542dde2..32fec584a 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -37,6 +37,7 @@
 #include <xf86drm.h>
 
 #include "igt_core.h"
+#include "config.h"
 
 int __get_drm_device_name(int fd, char *name, int name_size);
 
@@ -58,14 +59,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_VKMS	(1 << 9)
 
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
+#ifdef PREFER_VKMS
+#define DRIVER_ANY	~(DRIVER_VGEM  | DRIVER_VIRTIO)
+#else
+/* Exclude VKMS to prefer hardware drivers if VKMS is not the preferred driver. */
+#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
+#endif
 
 /*
  * Compile friendly enum for i915/xe.
-- 
2.51.0.618.g983fd99d29-goog

