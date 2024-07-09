Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39705C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49E110E5C4;
	Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nBAGItea";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C4110E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BADBD20010;
 Tue,  9 Jul 2024 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+4Otfj19FUDPV2YYXEAEEx/EuQseE/b0wUOo2GWGRQ=;
 b=nBAGIteajdnqul9voRLQUvx8ADy3zux/HmKDucO5K2ep9h7l8dWKpQqTSCb4Uwj9iPRUtT
 NLXoeEGGPnI7HSgjNYQlctGbjKseMuWtCMAODYR+Qd8CUyYK88VjYp7rLxu8hfA9dIPkli
 RFC29t7dH+JoryP5qvCcv9sOWbnYjDpTH4EpB1hcUsljvgeiT7MCywMEONdyQ+aaeKFYXA
 TeA5kz+Q5stGK0TBFP4vVNgF4VgqHX/yGow88jhl59ZypI1SxTBd8WpNbZjyDQBF2XpFeN
 S065VtXuvFbTq4X2zAfzeW06UDDmKcp0qmYYcFS+G2xobCeBbcNzbUE2mJeyyA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:39 +0200
Subject: [PATCH i-g-t v2 23/39] lib/chamelium/v3: Log port mapping for
 debugging purposes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-23-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jVh/oQuKqO0kU269SvV8okW+skfrvIb1P5vZEas1YT0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZlaMP8Cca8QrHRd55L+lQOEw9J3kDv7z/+
 pVNGI36YLeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4qbWD/0Wa5aGYzg0olgGMKYn7gNt7+3BVMUfyWJjeNQemkZzAFnqKdgeGFrb1XhzPexUbogS9QX
 T58FKncMFf2XMuHd9mAR/tQtI7p+vUnkqlmdlp7WQarFgPyfadR2lDDwWkY5BR8O5jWOE1DJATi
 gantPekc+UPoxxI2PslouzvykdPAkuBZjQzEy0U7OnzOOfu0+rlCc896El4M92vBNK1AtHZJe8z
 URHE7tK2UWq8KyxgZgGU7NiIm/q6HUAXL4oo4pPEeE+zA+t0uyiN6+n7WoqZYhKNKJl7Zf/6dr+
 Q/ZpcV4+B8F/+YrMe6CFoVl/cKP6SFWZcRCDg5qJyy501zY/xA6Saa5Mzvawa/0HGAKMZhyAaBb
 c6DbEvzHGbwLXYmcnpn9lDI9SYFHwM+K9f+0LdZBtcYnys6+SoJgCDPO87I9Tb9JgHzL9FlFr26
 wu2f6XxwVY32oo0px4j/4vH9Ab+eHzPJ2Op4bvxz0gdJ7qibRUzjddR1fXdhiGa3720xYBjcCma
 04u+04feEuSRw2yAgPPr1B7DW6hdss6Q8gpFUBAhTlDAD6CkChlsVFx9ebWYHkD+O3rJlTw/qQJ
 BFHEiDysdlc/NPWbSs0eFlG8z8vzBVPm1BWoTXmXHH9N9grNm26EtOrLTRAzTD91cKkdR1g4T7N
 4t+orDmNZk//GqQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

Port mapping is crucial information when attempting to understand why a
test is failing, as issues may arise from incorrect mapping. This commit
adds logging of the actual port mapping to aid in debugging and problem
resolution.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index e5a6a438924d..d528b40ca0c7 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -186,6 +186,27 @@ static void chamelium_v3_fill_port_mapping_from_config_v2(struct igt_chamelium_v
 	free(group_list);
 }
 
+/**
+ * chamelium_v3_port_mapping_info_list() - Display the current configured port mapping for the
+ *	chamelium
+ *
+ * @chamelium: chamelium to read the port mapping from
+ */
+static void chamelium_v3_port_mapping_info_list(struct igt_list_head *head)
+{
+	struct chamelium_v3_port_mapping *tmp, *pos;
+
+	igt_list_for_each_entry_safe(pos, tmp, head, link) {
+		if (pos->mst_path)
+			igt_info("\t%s: port_id=%d parent_id=%d is_children=%d\n",
+				 pos->mst_path, pos->port_id, pos->parent_id, pos->is_children);
+		else
+			igt_info("\t%s: port_id=%d parent_id=%d is_children=%d\n",
+				 pos->connector_name, pos->port_id, pos->parent_id,
+				 pos->is_children);
+	}
+}
+
 /**
  * chamelium_v3_fill_port_mapping() - Read the configuration file and fill the port_mapping
  *	structure.
@@ -196,6 +217,8 @@ void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
 {
 	if (igt_key_file)
 		chamelium_v3_fill_port_mapping_from_config_v2(chamelium);
+
+	chamelium_v3_port_mapping_info_list(&chamelium->port_mapping);
 }
 
 /**

-- 
2.44.2

