Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40E3CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2BA10E3BB;
	Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="boIWtyu1";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0735510E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EDB8D1A19A7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BD8CF606F5;
 Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B75F410371917; Mon, 10 Nov 2025 14:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ynYpQTEzFJpSAFG/iWcmrZeSf+xD44NYN9cVMoKYgF8=;
 b=boIWtyu1RTYeLg+1ZsFiUa9spWEnZL0AXDKR2JQvkiNpnb5pXVjTGBfgJBvtSl+vaN2KPn
 jf/pvSGJnW1HxE1YF0llTeIU2lh52kXCPE49zoo4hGyEAIeGpR+jqKKPdYB1v+Q5y3dGKp
 2rjyfQ1be3x6QVjH9VMZgL3nYaF2sj5vglwmsMk/frUjchvffykgXcoAII9e7kA+ttsQTg
 p6n6vwYVnERyNS7l7Q7HB7psp0H6DnguRwP2xObXeJfMs1iTSrTig4TCBh8JyqwbfKr1Q2
 LYU4qw3iqPNYQr6pkE1pqc+ERPOKDQChDwOYR1aYMQXbs4/Z/L027AKLYtP01A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:29 +0000
Subject: [PATCH i-g-t v4 27/46] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-27-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4821;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=crs88obcYWE/C4vaNB22FVrhJ0bE2XCO68Gip2q3z0Y=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesQHxnk7PQTa6+cZLw5zlQVIHfMzqVnOllYp
 UDitCQU8v2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEAAKCRAgrS7GWxAs
 4t8LD/9usKQ7jeStsm1dL39hlest7vgyr7R3/Mvbhtb67mDoXSh60QC7jS200sQUiGO0kaICvAk
 M6hIBH7FtIeMkwYb2HCrC6Dd1gRna8OSOit9oGtQnCuStTA2pnwsvK+INuAJLsozZ8KKDQ1uylh
 m2qWQMJAd0+frXd1KfsAuKd1gAKd0SeDCTH96g7ZVDgc6grrDH3oul7HNEXLcX8UDWl3lQI0uKS
 Bk07/iMJfyKUKmqZ6FgXXM41pOd8/u3A4GdABFArlnXS4c+aT8CMUdZEivpF/6CoS/Hgo48PUm9
 1WdH2DR9OQj4Pt1B4kUzNjOMcq5x/LnM3IU0yabvtjg8ZNigUPXPX5D9Ph5wRkqcVUcMkoW9Q63
 HUnWnnQtm9FBnqsHzxCYIPR66ZpT8WF6z7BSu3A9f+AXbgKSkRASYub7t1M5ziq2GDtICVjS1Hw
 VYfwqMOeoLTGigqbKTOn8zj41+6u0qpIuRlHroElZqHKlcKK5kJEUvGQShdklsYK/+hVR5aJGBe
 sXz57PjjAXb2CHbtcBvXzOQPaXGahMOH6H6fopZmX6cbdexsDvMWuy7WQbhh78HI/1Hy7SHczqR
 H3LFU5I8hs5xm22NYsMHysDhNq5pJ2Yo0mHS3ajJezcSmUtoFv0mat3BNBDniUeE5hVrCNTteyc
 Gq1MNP2E1LCwXjg==
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

Unigraf devices can emulate both SST and MST display port. In order to
write tests using both, add fews helper to manipulate them.

The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
python SDK, as it was not defined by the C sdk nor documented.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 38 ++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 5ce1bd7d757b..9e77a052d755 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -108,6 +108,23 @@ static void _unigraf_write_u32(TSI_CONFIG_ID config_id, uint32_t value)
 		_unigraf_write_u32(config_id, v);				\
 	})
 
+static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
+{
+	uint32_t value;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, config_id, &value, sizeof(value)));
+	return value;
+}
+
+#define unigraf_read_u32(config_id)						\
+	({									\
+		uint32_t value;							\
+		value = _unigraf_read_u32((config_id));				\
+		unigraf_debug("Value read: " #config_id "=%d\n", value);	\
+		value;								\
+	})
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -311,6 +328,8 @@ void unigraf_require_device(int drm_fd)
 void unigraf_reset(void)
 {
 	unigraf_plug();
+	unigraf_set_mst_stream_count(1);
+	unigraf_set_sst();
 }
 
 void unigraf_hpd_assert(void)
@@ -346,3 +365,59 @@ void unigraf_plug(void)
 
 	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
 }
+
+void unigraf_set_sst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags &= ~(TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT);
+	unigraf_write_u32(TSI_DPRX_LINK_FLAGS, link_flags);
+}
+
+void unigraf_set_mst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags |= TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT;
+	unigraf_write_u32(TSI_DPRX_LINK_FLAGS, link_flags);
+}
+
+int unigraf_get_mst_stream_max_count(void)
+{
+	struct TSI_DPRX_HW_CAPS_R_s caps;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_HW_CAPS_R,
+					     &caps, sizeof(caps)));
+
+	return caps.mst_stream_count;
+}
+
+int unigraf_get_mst_stream_count(void)
+{
+	return unigraf_read_u32(TSI_DPRX_MST_SINK_COUNT);
+}
+
+bool unigraf_set_mst_stream_count(int count)
+{
+	int new_count;
+
+	igt_assert_lte(count, unigraf_get_mst_stream_max_count());
+
+	unigraf_write_u32(TSI_DPRX_MST_SINK_COUNT, count);
+	new_count = unigraf_get_mst_stream_count();
+
+	igt_warn_on_f(count != new_count,
+		      "IGT:%p: Requested MST stream count (%d) differ from what was applied by the device (%d)\n",
+		      unigraf_device, count, new_count);
+
+	return count == new_count;
+}
+
+void unigraf_select_stream(int stream)
+{
+	unigraf_write_u32(TSI_DPRX_STREAM_SELECT, stream);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 14e5fd984159..9fcae674b1d5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -93,4 +93,42 @@ void unigraf_plug(void);
  */
 void unigraf_unplug(void);
 
+/**
+ * unigraf_set_sst() - Configure the device for Single Stream Transport mode
+ *
+ * This function sets the device to operate in Single Stream Transport (SST) mode.
+ */
+void unigraf_set_sst(void);
+
+/**
+ * unigraf_set_mst() - Configure the device for Multi Stream Transport mode
+ *
+ * This function sets the device to operate in Multi Stream Transport (MST) mode.
+ */
+void unigraf_set_mst(void);
+
+/**
+ * unigraf_get_mst_stream_count() - Get the current number of MST streams
+ *
+ * Returns: The current number of MST streams configured on the device.
+ */
+int unigraf_get_mst_stream_count(void);
+
+/**
+ * unigraf_set_mst_stream_count() - Set the number of accepted stream count
+ *
+ * Returns true when the stream count was properly applied, false if the final stream count
+ * is not the one requested
+ */
+bool unigraf_set_mst_stream_count(int count);
+
+/**
+ * unigraf_get_mst_stream_max_count() - Get the maximum number of stream count accepted by the
+ * device
+ * Caution: This function can be destructive to some configuration: the only way to get the
+ * information is to try and read the new value.
+ */
+int unigraf_get_mst_stream_max_count(void);
+void unigraf_select_stream(int stream);
+
 #endif // UNIGRAF_H

-- 
2.51.0

