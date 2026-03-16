Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD23F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DA310E29A;
	Mon, 16 Mar 2026 16:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ETxnoVaA";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D865310E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BF8984E4260B;
 Mon, 16 Mar 2026 16:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FE7E5FC9A;
 Mon, 16 Mar 2026 16:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B9B010372201; Mon, 16 Mar 2026 17:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sLKx7kL29gS3PevNbSGMLolfYFKHwGhccO3OGxrCJ00=;
 b=ETxnoVaABV4BTNUWuK/p9TeqnXpT7+FsWi8XE3e9KahSjYLEOGE6sgfu76mrOWtPwhnuPM
 1tWOjfbvGZHzSFsPzR22LyxCS3BjYbwBbxUP8E99IXvHDofStscY5/XqN2IL2GOIcfmspg
 VjTUerSm7nbqNpDNVpe5Qv5A7dOnyX/J31eqQ0B3WjojNW7nb4whWFNF8WC2y5VDWNL0wX
 /4E3IVWVOyfe2v2tfVBy8OiBp6nMR9RleIEJ1PSsxBM0ZZ9Puf6S0Fuz9H5qGM8Ge6Xxs0
 OhNrtvZ9lhcljVmFGnT2Q3ANlkYzz3suhVU5IDcAA0xTKyuEfT8Cl5e3Qed1KA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:09 +0100
Subject: [PATCH i-g-t v9 48/49] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-48-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zBoMxWSAP93gccKT8um84KhbAXMd1VMDY96LvQp68co=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6QTF/DtSodnf7itMS16TKXChkDAi9yjkSZQ
 5mSHcYZfiiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgukBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIFhRAAz0vK5QF2/3WFOLKajI2trg7+Fhdn6qW
 JGFa6skvN9DCvo8hqEkVzOhkYI8y8LlLl9jk+ygHRKreySwtq34pooa7TM62EK5eT8GcHO3fP/m
 X92j/n9IDWdjI9a3Ojcb/xorLdGIbZNH/oFsNnZsR/nSVftCpkPivuxoYXwM+78XQgM54kluS91
 j4b7f8izNszIdVbAGxjBIv652rLS0GLJ7483Y9MW2EV6FQH1u41OTH6sZb06P0j+MLxK1V3FswP
 okl+b0BpHJGwcnPuwMjcjJJ/lN1KzNYXXBewDfi9S2PhAfJvUuk8GVdABerfdWulfPaCX9fhkXJ
 kDUnFMYxBPopAhB7tWGLOrm7ci0ptd6SB1hp0jRnOHTxGlf1s+ry6PUXnm6rz+QFe4GoAZkOibR
 VPM0pv7EDMzCy7RG+8QILeC6XzkWiXmYdyWFRvOBwOx3VhNR4KvcdF6/bDAzCN7Yh+qz+3GhILZ
 qRUfbSm8VPgwLx0Nc7P3tltvuEb3m/rnblWZMDmQG4XTQafO6ta3HVlgE2XZ8FzIBslJx+TB2Ac
 9KlzELJ+Qr8YOt8chCMDnGW0VK66JSRzFONy3pX21NsDCqhuqKpTJAqB1LQuHSv0wbgLhT2AXli
 uEpWNZI7gz5MqgBSQymdPLwVPDAPj57gFdrk5klfFhOjrlitnS7k=
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

To ensure that the link training was correct, grab actual link
training status from unigraf.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 74957b6b3f5d..2e38dbfc9f1d 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -836,6 +836,26 @@ int unigraf_get_max_lane_count(void)
 	return max_lanes;
 }
 
+/**
+ * unigraf_get_lt_rate() - Get the current link training rate
+ *
+ * Returns: The current link training rate in units of 270 MHz.
+ */
+uint32_t unigraf_get_lt_rate(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_RATE_R);
+}
+
+/**
+ * unigraf_get_lt_lane_count() - Get the current link training lane count
+ *
+ * Returns: The current number of lanes being used in link training.
+ */
+uint32_t unigraf_get_lt_lane_count(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_LANE_COUNT_R);
+}
+
 /**
  * unigraf_set_max_link_rate() - Set the maximum link rate advertised to the DUT
  * @bandwidth: The maximum link rate to configure on the device. Actual value is
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 3cba15732daa..8032ef8e7fe6 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -98,4 +98,8 @@ int unigraf_get_max_link_rate(void);
 
 int unigraf_rate_to_kbs(enum unigraf_rate rate);
 
+uint32_t unigraf_get_lt_rate(void);
+
+uint32_t unigraf_get_lt_lane_count(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

