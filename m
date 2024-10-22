Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70711D2CE01
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D65310E6CF;
	Tue, 22 Oct 2024 16:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oJc3wiJI";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651F10E6CC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41A65E000A;
 Tue, 22 Oct 2024 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAt/4t/+uzdb2DXxNeF9CBtPICkXcqXEJFFehUFWRP4=;
 b=oJc3wiJI3DIe0pc8BTaL1TAXJpZGMXgX6gRJDSoyZOdiBTXbkJjkhZDQzySY+OaY783TMN
 w+Nme4N7iVia57W+lL5k17HQus7ldANiUQA6np5f5mp5ZIgGEmGSC0DwB5jtOToX59I3O/
 mvRxC6yoE5RNtibid2qzW2ilFzViCxnqgeJO/C4gHrzqs+r9dBx+spFFux5c+04wMWmVxJ
 HYZllOI4TnkQ/pwLhv3P3ty0QEhmRLFkV7HzkEjwwH0KeLaZhagRjJffqRfDNLqAeiwQ2B
 pskkd/XF3enLMGOT6yePIUNtp1yCJNs8BF8g0qEUFMnntIYxaBvZctKZfyuThw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 18:31:53 +0200
Subject: [PATCH i-g-t v3 4/5] lib/chamelium/v3: Implement method to
 retrieve Chamelium port names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dev-remove-static-ports-v3-4-bfbc7b2a83b9@bootlin.com>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aR94Q2OtrLH/EW0Ll75xas2OB6xUZfPuzbLy3a/ekUk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N8fZHXkqrrJOnITH3R1oOROBTbjT6glIFRi
 yAKzM22YXOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTfAAKCRAgrS7GWxAs
 4vUKD/sFZKQ9ZsXBMokWUx6UO35yuo5uZ1XIv5iHgozSq110XGgWPhIS5HRu5UqT8iYCFgtj1vL
 NqcNtd+OVhj8j8xp46o2UVSsJAFVw0fa9PzqYxzhPsd5Q5Np7JNvQvQmd6rqZgIxQDYM0lk9v0v
 kmQtymwRAwyepAEZrp/VFmY3GOrMVmjEvHqtV09nQltavjRld+nVLE277Po5g2uTv1LSenYoQDT
 9mY2v16OtRH8G/CQ9lbiKUdq6Iymsng4f2DAXpcf8ZeM6kmcbuu/ru57hH+NUO+m6aRglLM6civ
 133oIFPwYw7rrG+WMPQjReAWhBDxd6es2RJryg99Vk5Ng804ChHQN0gHAElVeK+VeFGWOAFRbPA
 5Eo2FO3uATzc1X4OAqO0qWLSzenQylXFnSFwjx9d7s8xum8gnZ3v1w0gaVA0K9qKlt8mDHKcNis
 EfcfIIBOqvB/p7SvqNUeXIpEJn+HxkBQtxYIZxRpkI4YLUsMRIwYJRCU6kjXitZzTZP6dBm5efv
 C1k8cl7ClvNJg7NPGIzC9svfTL+VrlyEeCSeh7BBIFgGpVX9vk0CW8vpP4kSkS77kDYWAUckXjL
 TEz+0JfX5DFR+o6OcZbj5YY7i9TkbZ1XUlM/rOCMuv7sQcYfZ15gfCYRB1Q5oG7FhI82tHnAH7v
 T871BWBiIEvPEvw==
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
index 1122ce102cde..8fad88e74d66 100644
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
index af525806865e..71351e579001 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -47,5 +47,6 @@ int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
 int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
 			      chamelium_v3_port_id **port_ids);
 bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.46.2

