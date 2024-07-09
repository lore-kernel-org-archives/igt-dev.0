Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4BFC3DA4B
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55C510E5BD;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Rii8nC7q";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A810E5B5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AFD92001F;
 Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yoZUrdaoWaNpPajHX2L4fjYYEH9ddkdLOsTfDyLvlHw=;
 b=Rii8nC7qtcdnU2aeR1PQrZS73IKBpaILj/oiuTpY+9onMd0z1ALy4Dh6k6J20CGLUW2fOP
 K2yhbDfBDTkQl11niMoF1TYvXbO7rClMZ3VhUzKSxKBKRAenJoEv235X7YIJkCi8PWvtUX
 cA7SJkoea/6uzxvm85YzucwSlHQvHFC4Ajl8+ClkR1LYAVD3vVAU9rST+kbeelcA1piJNq
 Za7BQbb9WjNPtbysL4sBWwo58eXPEUMJeN2wVxHL3hrpb0iBhc5H28FqoBaeRmIstwGy5G
 ZGYmge8yxK/c6OKHAdr4+zqCmBitZEmlTSLC2L2Ql3TkLqv7y71bHa64QkAMYA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:33 +0200
Subject: [PATCH i-g-t v2 17/39] lib/chamelium/v3: Implement method to
 retrieve Chamelium port names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-17-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=A9KDjRbn0p9A5hQRcodOHWLd0WtBsXdFqf88ptAj1Mk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYBid55BT4fKCprsKtXOGsxQq6uAMhrbyY8
 Q9CEVOj2gqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4s95D/9vmLlaYHf4EH3+0yphRKsL0W3fgXqXnEQ+WN+dU5cIXz0XVLSBV0hVlYDMIOnyWKeDiq+
 nMZDJhQ3yiQEyqaecltcXelgAnmJZ+wkKD0oF14DynjDOlXhhus2vcNtn0Ar9dw2PfLYyzkVZfe
 yz5hV8S/yf/Kje2rAF9oKrIbJvb0MvCihuusYrqX1FpwtcObmQOvs0ZSPLKHUv0dEcmEp31Kh5G
 duJxjcNW5Y3fVJyYL7gjayOs7xGJqgT1g9pyx/v0PWLupsFe+Hipluox7xSOGDTg/vEECyBioMP
 OmXQbhK6LvfhoDhzU9XzxfSdajeTefzLOZpV2Zr5da40JMWHb2UTzPWCty+H+penqZDHD6LOe1d
 x+XFQLidwvci8RnNpajdpqpZ36ID105ksiD9yxqNHqlhcJXyMbYFr+pmwAQ09Mtmc0ykbvwUug4
 22NwIx5tLvaCuuOoBRZjlxyzvMG4tMiPhMOVLLKRFfmMHaA1uoi7JvTnaTS2tMs5D2DOw4m9kpV
 7Fg4YhIhrzk8DOCUW+1+bWH3A7cvQFuk0zUBJYcMDfh9tttF8PcV5XTp9/eK1K8DFxWxfwAky1a
 GmVQ/cTlXD55hmfZ65SvTSTBDAAUH4enAeW/7qcsVw3O1a67/kp0rXdsRct4zYwdc5276kigkr2
 xOctxjJ9Vo5fp4A==
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

Chamelium ports have descriptive names associated with them. This commit
introduces an RPC call to fetch these names, facilitating easier debugging
and better understanding of the port configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 25 +++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index c4c75c57fa64..5a7e42334e81 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -282,3 +282,28 @@ bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_i
 
 	return is_mst;
 }
+
+/**
+ * chamelium_v3_get_port_name - Get the port name from its id
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Port to get the name
+ *
+ * Returns a string containing the port name for @port_id. The caller must free this pointer when
+ * not used anymore.
+ */
+char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium,
+				 chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	char *port_name;
+
+	igt_debug("RPC GetPortName(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetPortName", "(i)", port_id);
+
+	xmlrpc_read_string(&chamelium->env, res, (const char **)&port_name);
+
+	xmlrpc_DECREF(res);
+
+	return port_name;
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 763ab4bc0304..ae3225873bfb 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -47,5 +47,6 @@ int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
 int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
 			      chamelium_v3_port_id **port_ids);
 bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

