Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA951C83F3B
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176B10E89D;
	Thu, 17 Jul 2025 18:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QP/tBYti";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD3D10E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0DA0442AB;
 Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCMRHvdvzC6ERZ/DI5lNF71YUJ22Ja7Tc0p4nP6kK2g=;
 b=QP/tBYti34GeMAwPt6pVx2L1pXbY1AwCHzlKtLt9z2ERlSso9PIthKuUOeYl1UuJxzR+vW
 PeUnwqbf8hOnkn2iCXiNZbEinhgLyxV07mRUNRr2AxJy+aXdixdc2/qwNQu00CMhv6Vj/8
 mLpOApxMnFK5vYHPIiRWNHYuhDodT+U5u4eIAZne1NDoRrXvUH/rjC/xTRoEgs1ZAJIwQG
 Wxnh6iZJwkAGfx7wIITEirBl36kSWLNVCr80K6Xq+xs8O8otQSwhq/JD1nM3VG5JSuv8lH
 hQ7gm4h+77zKcjmhsQl6NDuGnIP/yjQlpvRAxkV9BLlhAIgkloaUGe4BppZ2mg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:38 +0200
Subject: [PATCH i-g-t v2 18/26] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-18-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4448;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C90Pqc2w056CAXdgfb2YQdsAXK/iO2xdU96cna3cTPA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUMhpEjvfEYdaA0rfQmKJCagr1FtrXj+94d9
 9TIDraloEiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDAAKCRAgrS7GWxAs
 4gi2EACQfGGhx7n23iZTsnkv5PSckubjq9RrzaJlfuIEjprHv7Ow/Kui0VP9XvD/QHOB6qcDrP4
 CE+zgxeRiIGyd+ciptH29lBH0RWHGDuzGTvLl8Y2294IB7IZWyk6sH1JFlTa+hfDzhUwP24xYPw
 BzGCrX/eJfNwco8nQmO+xguT3AkvTNmDvND44+uvi0/Gx/X1InttN4nySvNAHcicQNxUkvno33y
 Scq3oqhDZqwUZXGWem/jPvtgGWsF8qsL+byXqsKSc2aA8sfu1pwrW7+jQBZa//S1e/B4K0xXncK
 3WlzDMicq3U1/MNt0zJrD4bNJN0wJHsIyQZjojKdXfPlt8G2btxnjdpDe8qJAPVbFcI1/NzOBE8
 tR9mDoabn0hU+fuTYvapzin28B+x0fXnTydtj+3mqaGfDwgK1bm0bX0Ix8+MKvJ7IC+sJowIpf4
 9UauTZub77rvcAbFyH3is8sPZNXCmIzO/6vEz932J3MjAKFOMA//jqf0XCIKjBygzGn9dfTFQAB
 XKpVCK/HC/hQIDHJnvX5eFSBw5m/WWWZOzeAICFPaO5u2NVgymLne+kW8MmKAxvhPsX5J2qLWqq
 GjvBIJVHKDb5RJsMP1ecTZxDJmxpmS/9YQ/JGfumcPcxM3ppmMUYpwvJZrtL1JY5vFp5M6PW0Ow
 u2mcdUvyr0ikD6w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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
---
 lib/unigraf/unigraf.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 34 +++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 565d63d985b1ea99e839c377d7b87876ba2a12c4..15ded642c2fc6900a6722bdeb62c7126b23e9cee 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -313,3 +313,62 @@ void unigraf_plug(void)
        igt_assert(unigraf_device);
        unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
 }
+
+void unigraf_set_sst(void) {
+	int link_flags = 0xFFFFFFFF;
+	igt_assert(unigraf_device);
+	unigraf_unplug();
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags)));
+	link_flags &= ~(TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT);
+	unigraf_write(TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags));
+	unigraf_plug();
+	unigraf_hpd_pulse(500000);
+}
+
+void unigraf_set_mst(void) {
+	int link_flags = 0xFFFFFFFF;
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags)));
+	link_flags |= TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT;
+	unigraf_write(TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags));
+}
+
+int unigraf_get_mst_stream_max_count(void)
+{
+	int previous_count;
+	int max_count = -1;
+
+	// You can write any value to the register, but the actual value will not be more than the supported sink count.
+	previous_count = unigraf_get_mst_stream_count();
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &max_count, sizeof(max_count));
+	max_count = unigraf_get_mst_stream_count();
+
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &previous_count, sizeof(previous_count));
+	return max_count;
+}
+
+int unigraf_get_mst_stream_count(void)
+{
+	int count;
+	igt_assert(unigraf_device);
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_MST_SINK_COUNT, &count, sizeof(count)));
+
+	return count;
+}
+
+bool unigraf_set_mst_stream_count(int count) {
+	int new_count;
+
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &count, sizeof(count));
+	new_count = unigraf_get_mst_stream_count();
+
+	igt_warn_on_f(count != new_count, "IGT:%p: Requested MST stream count (%d) differ from what was applied by the device (%d)\n", unigraf_device, count, new_count);
+
+	return count == new_count;
+}
+void unigraf_select_stream(int stream)
+{
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_DPRX_STREAM_SELECT, &stream, sizeof(stream));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 7f6438da66b688b4b7d8aaa6f124474bd2c1d042..6ecd1248cdd70a2af99ae09ae19f9fc8c061ff56 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -81,4 +81,38 @@ void unigraf_plug(void);
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
+ * Returns true when the stream count was properly applied, false if the final stream count is not the one requested
+ */
+bool unigraf_set_mst_stream_count(int count);
+
+/**
+ * unigraf_get_mst_stream_max_count() - Get the maximum number of stream count accepted by the device
+ * Caution: This function can be destructive to some configuration: the only way to get the information is to try and read the new value.
+ */
+int unigraf_get_mst_stream_max_count(void);
+
 #endif // UNIGRAF_H

-- 
2.50.0

