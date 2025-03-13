Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B51C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE6D10E90B;
	Thu, 13 Mar 2025 17:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YTBhXgES";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949B10E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-390effd3e85so1097551f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887227; x=1742492027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzEcL7PrZ8Ts/hDjeu1mgrFA9Nr9xMYAobiPyeDwO+s=;
 b=YTBhXgESkWsYo82nmZPSaJU3+zxzfxnT/2JaVzAZhbmkuPrLyjpWBuTFk29VvXstPZ
 w5lUkoT21viXTDw9BYhYls3jLWaYJyz7Ovrpkd/wZKNbJVklfAU/4lV8UVUbNdPEu9jU
 ceO/FZi1h2NBD7bJcYiNZt3iEAaHnOaoYMHU4a21HXIQBuk0u9N4MDvaUcVL/yFArwfr
 ygcUHl7bOGB4dDIJi9VZoKeVKTKisOYfQEMb4I5xdwSyXCIO2E72yNdQTT6sSEMKzmU1
 dARTRzkXU+kBd0ReAflUSIyDZGsN8fGt/4xttBg/k3mK4T+uImYA/R00GlYuF7pPvF3s
 Rzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887227; x=1742492027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzEcL7PrZ8Ts/hDjeu1mgrFA9Nr9xMYAobiPyeDwO+s=;
 b=xD3xnIEBM3bbsOWI0G8RZPyMBSAWiucCNC59fUy+jvZFHhZgTOrn6DKwE7O56ts86Y
 JwTwUmxNkAqPlqcNrk0sfYr3zAVusSQtSBm9PVzhtfvN3TJ8kSnpzdubizBmg7wTUjSF
 xthMmyB+k2DAvh85G5cu/xE8xsNWM1XRa6ao2giE6Y0bTZMkIjab4ZkH9eT0pNsi3lKa
 PE3MVNce4uD7MnigJD5b82s7/pQskiF/3kKNsFSX0q3AHn+zFMrTXZyQVTmPDA5tddLQ
 3TS4H8ncKlg/xp4uTV1fmBbAAotK6j+ICeJF6havkt4y4MwE073TUiOHjB3gL2880VMb
 vTgQ==
X-Gm-Message-State: AOJu0YyTFxjM1Je091PJx8wq1eO4Iwp236pAnlpLQ+nEtZFPaCiDuXJX
 kgKUgSBjICtXfFrTPcAHkqWXp2PCYnXSElCbO1imxMocq9zri3IFhrbwlEMP
X-Gm-Gg: ASbGnctFnFMeaMt+j1bt5UyJ/rXpeaaaaHSW8HSrEXVVyjVjqxl7sV0IvTW7E0I6RjC
 1qw7Ql0Wj2TJ7TOfLK15t/hII9DK17V2XsRgPZ3Q+n+KPWy0V0X++kR3tsuwna//waXhma3/TZ9
 zFYFRju5qEjCeu1vprDfFuXzZkowJwxTVjQwKsaNUyWhUDpfDmZ2aSXc7oUG9HH8hNjV9pvR0x8
 Wwy8TjlLrh+JqyDJGWcd0c7T0KA+5I/lPa9W2JLbnth2J0lNjrddkM9/IglX67WnNadz/j8FRTA
 Bo2B6DNrZOWzmyQD0UiGRQ2gF/01LSwpD9ndbmZ2TC6+
X-Google-Smtp-Source: AGHT+IHn7CnMUsDW44SNWGcc14xbz0UOV4HN8GEkmTM9zFZAt9q3KYVJqJKJSnTsmOpsrxQy+9o4Fw==
X-Received: by 2002:a5d:6d8a:0:b0:391:46a6:f0db with SMTP id
 ffacd0b85a97d-396c3837fa2mr424103f8f.37.1741887226706; 
 Thu, 13 Mar 2025 10:33:46 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 24/43] tests/vkms_configfs: Test enablement without
 pipeline items
Date: Thu, 13 Mar 2025 18:32:59 +0100
Message-ID: <20250313173318.5818-25-jose.exposito89@gmail.com>
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

It shouldn't be possible to enable a device without creating and
attaching its pipeline items.

Test that the device is not enabled and also that no actual device was
created using libdrm.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c36a795d6..c2cb9dbc0 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -22,6 +22,7 @@
 
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_device_scan.h"
 #include "igt_vkms.h"
 
 struct invalid_value {
@@ -117,6 +118,20 @@ static bool attach(const char *src_path, const char *dst_path,
 	return ret == 0;
 }
 
+static bool find_device(const char *name, struct igt_device_card *card)
+{
+	igt_devices_scan();
+
+	return igt_device_find_card_by_sysname(name, card);
+}
+
+static bool device_exists(const char *name)
+{
+	struct igt_device_card card;
+
+	return find_device(name, &card);
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -774,6 +789,29 @@ static void test_attach_connector_to_encoder(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: enable-no-pipeline-items
+ * Description: Try to enable a VKMS device without adding any pipeline items
+ *              and test that it fails.
+ */
+
+static void test_enable_no_pipeline_items(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	/* Try to enable it and check that the device is not set as enabled */
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+
+	/* Check that no actual device was created*/
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -799,6 +837,7 @@ igt_main
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
+		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 	};
 
 	igt_fixture {
-- 
2.48.1

