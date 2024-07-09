Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00EEC3DA4D
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F6810E5CB;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hu6xJNE5";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A54510E5BD
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EDE220019;
 Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/pBupPCFtenT5t73BBUShNfDzVysN8qClFA6IK7kAk=;
 b=Hu6xJNE5tIoKQn947oRBeI9QH/Pz7qPuy8nXnduB65eFo1RLshMLk6K+wFi67KEkDypUlI
 UmsQ9E+mDRUjQ+xBIEZarvyswJ0if8VauGMNHlcFK7VEE6ZIl+yCgw5F0DwtKHdCJcpjmz
 Snshn7jztbrb/ZEjbLvAdaXrknwPTdCLmO7ZBiCC3d96AElo5yychnI9qZ+zRCKUG91Bsa
 wOAyptHWQk4em8I+BZgUBpEqVWOJU34yeHbWJ7crKZtsSOjlLr/C//JKBiEa6RIvXju1BK
 l5q0efkZtulZERYBkDg7CApsunEoyejxiWZN48EaY9ch+/3gt5KvLLQ1ouziog==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:36 +0200
Subject: [PATCH i-g-t v2 20/39] lib/chamelium/v3: Implement methods for
 plugging Chamelium ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-20-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3697;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Ed6b3uGbZcSB5AWAj/E++BOuVyVRJIYwa4ypkiOX+1A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYTvnumoOSqEhPOIUkIdDXpIpDVXb5/d9CK
 1R/cCdqS/mJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4n92D/9pOSd1lsvGLFm9yjSCvaz7ehX6GDC5wcv2pMSB6lCPhjAzoEEFoNCdv5B+obtgnoixi2m
 SDDNpFQLGIu1uk46UUzWTf2FZn9U1FEyoGcIzR4Txcb/jIZUQA80xkIFuG3DQWZEU9g64riD2XP
 BDJdcVQ9N+joR3ZSSLXDOrJ8ugXBKOJFCG9AiItFMY6vsVlYLujX+rTYWICid/vqoEPOlVB7fVG
 sRiTICbmdzd4jvNcjWb/hVUKEOx+s+1ZEm04n4UExTpXsAXR+wrfCv0UrRMRU2OKQj31msH+LfH
 i2EDnLNmRVoyxw+XAZGbbGpr+iCZPuLdmu6hNskj3p5b1xl9PItZOmJ1T2b00f/fZE6XjVvsnL+
 zc6nfNvZudDAjfXuuHvFeTBZ760+JdyYQLbDXoOnx9FTDLMR8WeT+W6OxddCpk8hggu/fn5EZFB
 7bP1a4raSchy7O2qOJhZIT9WJWFiVMtA/PVeP0Qpv5Dyj1KLGSzGpLp/uNFid0RJJ/EqahtN17N
 3P8HiilNgdSLArjMGee3eYQ9Cwl1WXGOZ3uC3Nh6mGVkl+cCniHZg+Fc3A/cAifcJW8sjMMIDUu
 p4hi/2AjWro1zq4ivFkpBvWBJboB2jMzwUJqujg9+TtcLAxUEYasLSFZOkZoH9lGI8xijCeKQRY
 RDTbxfoYwnIEuAQ==
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

Introduce two new RPC calls, Plug and PlugWithChildren, to manage
Chamelium port connections. The Plug method enables plugging physical
ports (HDMI1/2, DP1/2), while the PlugWithChildren method allows plugging
MST connectors (DP1 and its MST children).

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 51 ++++++++++++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  4 ++++
 2 files changed, 55 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index af6ab5c6c9b7..334098d4dea6 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -323,3 +323,54 @@ char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium,
 
 	return port_name;
 }
+
+/**
+ * chamelium_v3_plug - Emulate a plug action on a specific port id
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Port to plug
+ *
+ * Emulate a connection action on the chamelium. It should have the same effect as physically
+ * plugging a connector.
+ *
+ * Note: The current chamelium have some issue with port 1: the plug/unplug action does not seems to
+ * works reliably. However, it works fine with port 5 (same physical connector, but use a different
+ * component to emulate MST).
+ */
+void chamelium_v3_plug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	igt_debug("RPC Plug(%d)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium, "Plug", "(i)", port_id));
+}
+
+/**
+ * chamelium_v3_plug_with_children - Emulate a plug action on a specific port with MST children
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Parent port for MST
+ * @children: List of children port to plug. It must not include the parent port id.
+ * @children_port_count: Number of ports in @children
+ *
+ * Emulate a connection action on the chamelium using a MST device. The parent connector will always
+ * be plugged.
+ *
+ * The children pointer is not freed by this function and must be managed by the caller.
+ */
+void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id port_id, chamelium_v3_port_id *children,
+				     size_t children_port_count)
+{
+	xmlrpc_value *tmp;
+	xmlrpc_value *children_array = xmlrpc_array_new(&chamelium->env);
+
+	for (int i = 0; i < children_port_count; i++) {
+		tmp = xmlrpc_int_new(&chamelium->env, (int) children[i]);
+		xmlrpc_array_append_item(&chamelium->env, children_array, tmp);
+		xmlrpc_DECREF(tmp);
+	}
+
+	igt_debug("RPC PlugWithChildren(%d, ...)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium, "PlugWithChildren", "(iA)", port_id,
+				      children_array));
+	xmlrpc_DECREF(children_array);
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 88b407dfd1ae..9bad733b717b 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -49,5 +49,9 @@ int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_p
 			      chamelium_v3_port_id **port_ids);
 bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+void chamelium_v3_plug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id port_id, chamelium_v3_port_id *children,
+				     size_t children_port_count);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

