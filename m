Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702DDFED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203C010F649;
	Fri, 24 Apr 2026 17:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AtI8OEQ8";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9950C8961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 52BBAC5EF2F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F3C9604EB;
 Fri, 24 Apr 2026 16:55:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C83E10720A14; 
 Fri, 24 Apr 2026 18:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6ykcEy6AN6AQFWoBgohBQ7qdsLnSR5AYcSA6tOLfa04=;
 b=AtI8OEQ8AQxO7iX0/nTSh447iLtaUPvcVt2JEKkNTlbFHpkqHayuAxtNVSIMC2L3TDFBUu
 h813ZXk2s+MkEPD8xXD5wnFOmUr/00Fn61V2eIZkkwDLZjWWrXplDiVIwgZnhY+PYfoPQ0
 j0SFzRW2cbltKA0vbTHraq3nlHNpBJDDOirt9U33DCpl0cBnUh8pmjQRgXEXGKvJPsdqeb
 lYlDd55fjL8XckYh46OWP/aVOC24CEJPWFskj0TiJZAHLQX04V2At3+Dmmxd59nhSIruno
 9wXtIakRcTS9TghkPnSa9KoLep7KS35XmHraY5dG7rjGQ1/3qFeVKoJUUOqMUQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:20 +0200
Subject: [PATCH i-g-t v11 45/49] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-45-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3
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

As unigraf can emulate 1, 2 or 4 lanes display port connections, add
helpers to configure the number of lanes.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 8c091219bd40..80b4395eaaff 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -550,6 +550,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 }
 
 /**
@@ -809,3 +810,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
 	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
 	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
 }
+
+/**
+ * unigraf_set_max_lane_count() - Set the maximum number of lanes advertised to the DUT
+ * @count: The maximum number of lanes to configure on the device
+ *
+ * This function sets the maximum number of lanes that the device will advertise on the DP link.
+ * The actual number of lanes used may be less than the requested count if the
+ * DUT does not support/use it.
+ */
+void unigraf_set_max_lane_count(uint32_t count)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LANES, count);
+}
+
+/**
+ * unigraf_get_max_lane_count() - Get the maximum number of lanes supported by the device
+ *
+ * Returns: The maximum number of lanes supported by the device.
+ */
+int unigraf_get_max_lane_count(void)
+{
+	int max_lanes;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_MAX_LANES,
+					     &max_lanes, sizeof(max_lanes)));
+	return max_lanes;
+}
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index f3ea499292be..56a9d910dcb1 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -81,4 +81,8 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
 void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
 
+int unigraf_get_max_lane_count(void);
+
+void unigraf_set_max_lane_count(uint32_t count);
+
 #endif // UNIGRAF_H

-- 
2.54.0

