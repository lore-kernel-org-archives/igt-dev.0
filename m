Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F4AC55173
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4479B10E0F7;
	Fri, 31 Jul 2026 18:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j82TXN+p";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AB410F38E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C41264E4105B;
 Fri, 31 Jul 2026 18:22:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A9C56039A;
 Fri, 31 Jul 2026 18:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8244511C16C3D; 
 Fri, 31 Jul 2026 20:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yBnrWD2XOD+bSJ5rbcpSHde3g8dIe6hSrxBFQSFjyu0=;
 b=j82TXN+pGfwMVH/2gFuu6yjdS26/Q3T/Armxo85Q6ofk54/LbSqlijX/BLZnR7i6pjIXHR
 kkoF5Ie708yPs12oK5giKU4prW2veVUR7Ef7qWud+SzC6WVtX47p7IRfEbnVAXiqxfkhYd
 Wz23YDw9tSa3UxK/2VQu1tgNkL7IwwTCezbfaDyuK3qpFYvpOs6jQsu4CabOJrBnkHWFiZ
 vxdPeSjNuCH5VjeNXQX7xNBnCAWLViOX657EJ530eJn9oX78e6M6wW1PbrHzxWiC4q2+Wd
 f/jeABmMV8MB47Tj452LIt7KPS96DKptXvEkvZ1R8IQCOlCwoZOgnAxQuGfDJA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 31 Jul 2026 20:21:55 +0200
Subject: [PATCH i-g-t 2/4] lib/unigraf: Add HDCP management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-unigraf-hdcp-v1-2-495df88ebbbd@google.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, fomys <fomys@google.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810; i=fomys@google.com;
 h=from:subject:message-id; bh=vfwe431OCFeVL/nmKcpUFFfeF7Gzi43Ia5QwQzmrrSc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqbOfE0Mxx404Lk5Q9QkKNtU63BBFscLui+OcAZ
 LMiMkLPH+eJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCamznxBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLo2hAAwg1LB1g+CY4HQZCHP7YWQY6UqnfHq/i
 FvExEU5xYjc6n1xstn41lSJNJhUIaBBN5DiYyuvntrzuapXSJzSnz+R57nLho18aD3sBLVk/gI8
 UJCseSTjKXrqfHGD+GbBU76ufGGLPInOyKfImccknkVZMkn2Y2tvRkK6kXWUai8L1fbffPxlYHN
 JNf6lKkg8GoDE0RpDBSrKNAf4D6TKKXWpKS8NAIoRfoWO5iFfpxX284VAca90ABbWG1u1OcTnBP
 nruFzwQjmrQULt8+71ZKXdAzheDnwDQ3BkkOp9dXuYKMvYSNmLWOpg72coMmzv0lYlhykxfLmCD
 dIMPXNTxA3jlRJfD5Ll7QD+1jdW1USui4gqAmy0Nvudc3jLuX6GVI93nG9AP2IWZJaNrFi6O/UU
 awHSLpsstEqxNO3AQK5ADxgSIiPsd5u/ZcpTrP/FFVCZCjy3UfvydCKqrh7PK/snF8JkDLEivw9
 KzdlGnVu6AoGuv2qDPBLFCwNCwDJROiyqmjolOdzC1jL5V1iC3aJ4rabZGt4DeEr4JW4tqzH/Lj
 27zdFWHy+9eyXnNtKYGDMWH7v5i9lLmosOvh77GbiZAbUDiuy0BmGRhNvIeKLHknovclDmMio+P
 KTffzCaxInLJfH81QJFGR9OEACFPv08nMa+RkPd/I8xhM8tsNlKg=
X-Developer-Key: i=fomys@google.com; a=openpgp;
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

From: fomys <fomys@google.com>

Unigraf is able to emulate HDCP, so add few helpers to enable/disable
it.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 23 ++++++++++++++++++++++-
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 30ee3c72bc74..5b416f605428 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -549,9 +549,10 @@ void unigraf_reset(void)
 	unigraf_set_mst_stream_count(1);
 	unigraf_set_sst();
 	unigraf_load_default_edid();
-	unigraf_hpd_assert();
 	unigraf_set_max_lane_count(4);
 	unigraf_set_max_link_rate(UNIGRAF_RATE_8_10_GHZ);
+	unigraf_enable_hdcp();
+	unigraf_hpd_assert();
 }
 
 /**
@@ -911,3 +912,23 @@ int unigraf_rate_to_kbs(enum unigraf_rate rate)
 		return 0;
 	}
 }
+
+/**
+ * unigraf_enable_hdcp - Enable HDCP 2 support
+ *
+ * Unigraf is able to load production keys, but this will disable all recording
+ * features.
+ */
+void unigraf_enable_hdcp(void)
+{
+	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_LOAD_PROD_KEYS);
+	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_SET_CAPABLE);
+}
+
+/**
+ * unigraf_disable_hdcp - Disable HDCP support
+ */
+void unigraf_disable_hdcp(void)
+{
+	unigraf_write_u32(TSI_HDCP_2X_COMMAND_W, H2_SINK_CLEAR_CAPABLE);
+}
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 1570be3feb96..498a2d4daab3 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -103,4 +103,8 @@ uint32_t unigraf_get_lt_rate(void);
 
 uint32_t unigraf_get_lt_lane_count(void);
 
+void unigraf_enable_hdcp(void);
+
+void unigraf_disable_hdcp(void);
+
 #endif // UNIGRAF_H

-- 
2.54.0

