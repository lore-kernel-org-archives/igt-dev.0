Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D3EA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E3F10E38A;
	Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RrgA0/wK";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ACA10E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BF7C64E41031;
 Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 959E55FD43;
 Mon, 23 Feb 2026 12:09:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A7CA10368FDC; Mon, 23 Feb 2026 13:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848570; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gm4GoCDdr1wPdl4fEBAG7XD5bffwgYprLaAzmYO95wM=;
 b=RrgA0/wKINCvocnNdHQPu76NaMPV2v63Ht54Wg+Wp3l3mO3xZ6YjGbYx3C1jScTutbxzyn
 y4RsHsgDmDfVNrPEdMUAc+muFwJJt4DUnX4N2wdmFcz8oJ6CekuJXHT89elLPH1RO1RjXv
 Dcf6rgLRqP+ueeLQ5lHJCXOejKzJ9qCB2LZUk0GLPMJc1g4UW7RstQbBHlwu49Wn3VYjtx
 P0cA2V3OzQr+UMCL/GqnzSUSjGD+KwKjad+XCYarbsqBFpFsAGdzWfjwoH9mxEhEJ4jFFt
 WYCD7Q6cjIKLZ51F74z0nAyD0u84j1kg9fupah3syKgbTQS1VCM3tOCbkoYJDA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:51 +0100
Subject: [PATCH i-g-t v7 44/48] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-44-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gqOLDo4TA3s8VURyASU+nSZMjxwd708dZ6Uzr4NB6+k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENsMvRLU1VMOlisfWX7QEzkxpdwuH2YT60nP
 Qbh8b5m4yaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKY2w/+Ldlb/gcPcBtO3EyGJJRDS2lobDI1c7x
 WEKbAWk3hHgJdi159s/dpKv+WoueiSz7UK4GKyZJhJ277s/dRFfEvYwMOJE+jRmOA2a29MW7hU7
 FbhjcxbV8NQe05vpAP4hutFMLFG+L5atcOUNWsCzcs+1LYPMK+wu8yO715oeUrMyHIjYxVn2htE
 o80h4fVLKQ7gaXQyPXa0aeKmgwvxk5He/maF4eBjD3xsFjN0EXlkJEWMb8PSOBQ46FL+He3T/Jh
 wFRj6v4z8o2IymZ0TmS8CsE1Cs7+dpiB4+G4VBYsLBY8SUMLmhd6NnSXMtaZDUWwwQj1w0cGDgc
 zHHASOl1yyjU6IAHLeEPcFsirxBdawZDWxjN2gC4XTKY2DBNc1WAfCFkZgn/bMLRxUxgZlAEk8k
 610Sw8McVvvKpsIaweLziq66v9gpnsgacRyHeHt1XQNHexl8KOaggmadyBcsf3s3zG0ibzTv2Ew
 nVoJiX772Ki5+v1np4yG7gRXpuMmfGIEjralTGECsuPPwzaSdRBZIOCqann7YWpoD94aR/C6UYn
 FWJAQ+OdHf77i91M3wENdSOPatVtMEj9CCEdyRfTKMZA6J3R9TeZceooOwKSv9rsRWQu9iRMVu0
 O6e234d3+c0ji/P/0YLD0+9pOH/6Cbems6457akIUxMBIROe2H/g=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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
 lib/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 17b96aa3ac89..038188182bc5 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -543,6 +543,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 }
 
 /**
@@ -803,3 +804,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
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
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 65f00c8d4948..e926855dd059 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -80,4 +80,8 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
 void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
 
+int unigraf_get_max_lane_count(void);
+
+void unigraf_set_max_lane_count(uint32_t count);
+
 #endif // UNIGRAF_H

-- 
2.52.0

