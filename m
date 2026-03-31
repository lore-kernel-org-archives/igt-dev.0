Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E91FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53E10EC54;
	Tue, 31 Mar 2026 17:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hgl47wpV";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C7910EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2ACE61A30B3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EE6676029D;
 Tue, 31 Mar 2026 17:11:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F2F6E1045051E; 
 Tue, 31 Mar 2026 19:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977088; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+uUmNzB+h+4nBGKe8o6/h1BPXVDIr7y5s8U1Mljb0u8=;
 b=hgl47wpVEJMbo9x8RfeJ+EawKL5qWcAqH3YuTTLxx55JIWiB01VspcqUyxzQfMqqWXSR1A
 J7jGeNTRJ2v98yxJLIUWw1GxfbY19urlX1bX+dXVYW9mhTVtBw0lI0hfj0Zr2O+Ha/zKwE
 q9DiQGUW3VMom98ad5QHDzNp3TAgq8eDYf6s9o8TuYjkfFbUulPE7q7M3saXb8C2D4jB11
 ruWBdsUYtrvnIbBnb6qjSPDnonQXTFHmGAwBQbwMhOVu5n0wzHGG+g0gOfa/EGbgcV6eMu
 URyeCM+AgjplMI2wNiZ2WOAOl1jyQVWKxJhCW4y7phMzLF8LzdfsHpIqIuhivQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:02 +0200
Subject: [PATCH i-g-t v10 45/49] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-45-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rpl6rk6x1kD1gJiyw2d+bFlfIZu9buY6tBXqwfZsKBk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABBbVCB69R/Re4tM4xxymZNEcPpCS6UjXi+V
 Ob20N391iOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJgFQ//fUJZRII7VeoN0VG4rt4fthJ3JV6VNEH
 gsxL7c1IX6ODzDWV9ya0z4gYNA+Ao4ilfgcBujfzhZ9J/Mv0GQmhU01pgj1kIOlJNlhcOWMDaQy
 wFjdzM9ahEM/l/5Mwwl/cZt8aIGxvN0Kw0xEp1zMzdHU/T1a7YdxLbvUPChgnbpEBwXJ0jSnKUd
 g2YI4Mkxo64T0cbMwQYS7nDH+AN00ngDK9GuNVMqQBfhbxkiZZUxBjhTSxkn07y3vrQBa/qWru2
 x8HuzmDLlgq9uqJ9I4rCw/53t3LM3zyi17BxuGBPlRPry7bnu3yrQlfIRaDE1fAps0LfB6y/eN4
 hmXrVU0Z8UWrCYpD5B1qv3cXL6bIOvDrFaDypLi/dGJA651hgIEZBazBIeqw0sdlUSFmzuos48m
 7HztaHe5vyqAM3w8XSf4LVyOvZ0dvdysyzXumdsIbwlZPpv9laUEScXvbgZT+R1UHpIWg/mxMqy
 8SaIEosGmsSqx/86xBL10b4mM1DpGMNx0g5IREZm1UXeGpEPQoGNb8G118O53gpLpT0eV35bF0Q
 wVoX9JKsBv7fT0LZf+zTImd4tZypKDKw7LPdsioo+TOzrHPR7VSDQ6hppws0SmBOSFc5sM3PaeL
 iTfVVvGJl+93mCjZOebAncXkS2+/JlarYhSCp39EoUYi1K7bQzz0=
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
 lib/vendor/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index ae8036526156..7dbde1279d31 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -551,6 +551,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 }
 
 /**
@@ -810,3 +811,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
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
2.52.0

