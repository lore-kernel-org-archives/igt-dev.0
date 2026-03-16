Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CCFF4644B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528CD10E262;
	Mon, 16 Mar 2026 10:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ujItHyUY";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F5D10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0C86EC40404;
 Mon, 16 Mar 2026 10:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 850815FC4A;
 Mon, 16 Mar 2026 10:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A8E510369F4A; Mon, 16 Mar 2026 11:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yK7Lovs+lPeGuOQEH0Noh3zVGH69K+koDlb0P9oEp9U=;
 b=ujItHyUYhoOyCOVyx3hCO9S7v+fKBFvcrcjQ/xYssnlcqubLO2aais09Song9ua4+6AV6Q
 jEG8w6R0Dn2xkWLrKjC+uVwN43q5FDDAp+8QSrHHgGdykRRN1eGoUNDn+j7uamrasIETjw
 EYFu0+FJsj64hNu0v8fWGU+gr7UDuPNab7v5pHcL+iqbZ+vP5TMpo9dSit1npwuWKOf61L
 Lk5jWvYsW8xW7x2CselHz2332qcvu3ULdUw4laRzFBM1rq7QmPQQUN6DEL1MEzHj3EpvQ9
 Xs0kPJGZtckUMmUuavFtzHhdenRB3WpgcdOFE3OMrAYGXvu9efY7oSpO584KFg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:53 +0100
Subject: [PATCH i-g-t v8 45/49] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-45-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XAlAzu5mQq0zq7YHViRLHBZ5jJLRtKEv9vTyH2R1OTo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pU4un1HoE1AVEjud2nwhWE4i52YgPTy8eyM
 oQYnZmKz3yJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIeHA//Wy1C7X2ZUJ2+CcQ0F6X9vI+iSrPcq0F
 u5n/DdDYBvBEUh6qwRu0SyHG0YDNHED1o5luJvNesRg32BBceYZliWzDhR+ylMHQtJkvbokrUjE
 xoCbF102cJbziCayufwDqhuy0yhzyDjeeaROEjcQK9XR/elzXcMQBdmJY2ISuBixYVgLk5jQFIY
 P/qY2+Ljbm4btiXs92Lckq5C82+4VZoloAc0C+uhTTV+EnDnymHS5UGW+iktfR1U1K4maYh7RAa
 tNdoCNAw1Zi7wrcE/lbKdX6vA0Y2UbEXi1yc+91TIjIjbtTTVivz6KKGGcI4wY6sDerGygF4ykr
 SI2aHPFNf3Oqs0scvQvgn6AeswDmtAFOV/hlWwb5U6zNlrUmrNf57hh5giXnkn3AClZnQbp0Okd
 qNS5sOcZxVnalkU4AGOPR/2T0g9EBcADtCfDg6vUdIFpq2V0fwCIkB7ntnn2eLSsfeHTXqtDA3S
 LtrvnD7b2DHULs6CQlLkkW7is6bpulBPV9mbWPI30uKNkjxImg1cvJdn2NUaJQpJaZiccSlId//
 51L9N+kcRau923GCqGGr2vVaWaTmCFpdMVGoD+yYaWNzoZFSnmF94hDwnV2zeT8XWVgUgY5Z9I3
 +nqBR4sVOpDDfaKIs9/i1XAOFp2P8qqMELaSqUMfDV6RqXetI71o=
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
index 83ea1eb1f91c..e046fa5bc4fe 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -546,6 +546,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 }
 
 /**
@@ -805,3 +806,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
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

