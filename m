Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D7FC3DA51
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AC510E5B0;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P5r2kKvR";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD2B10E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D64192000D;
 Tue,  9 Jul 2024 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y0nPJS7o3V5eLRgrL2CChIEqjlcWIf0YYOjw63FhwU=;
 b=P5r2kKvRFc7+j0k+diIWBsWK++CiFcM7cqpT296JD5oedhugKVkSfqCjXnqvDo/aXafh8q
 MKObM0WNpYS27w7zQsyGGaPG9i2GSkxnjLj+7jYWEqE6xLHTxGHT1VkqI7MzIYWZG0pJpi
 luh/gvkEyjire+sWR1jsQREK1CVEzTTFvBREuTJQx3x9VrYMy+1qXuwnhHp8y2PtYTeloe
 HsJ3ovqXQ4iC6nvuFTtHQ27+on1YJGR/6ozb94eCGtt9sybD8UPKKMDZl9zi1+yVQ58LEU
 JydiGGF/4RyEsk/BKxWQZWXcWbe5wwwXimg4ICSwjWQRsv2HgKct+o64zqX5EA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:32 +0200
Subject: [PATCH i-g-t v2 16/39] lib/chamelium/v3: Add method to discover
 Chamelium ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-16-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5824;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pdIM6t5YzuV30k9iJ7x25C6cuOncdfZdfFtkHYukF+I=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYgiugq9D9rFpwWKINLnxkkblU406wekx1C
 ClG2kjs3heJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4jB5D/93GKI+BHHlJuNaVqhNFE11P4s99/TxfzWRSzLIycXL0RgtAWgp0r9X/3KtJizUrgZ2dbk
 yCkLOILVd4+6j+vxnQUk3vCX6E9iU8KLaUZ+7NHsfi9UypX2J9s4u84zKab9Vtn1p5FYJDqqMY4
 oJYfmy+Bb8ITeU6vx0BgCt5ZApirD7HteiW4r5jQnSAl0E1RidyFpuWm26NEBz9M6BMf4+BNFwP
 DHX312EV3204yQXcKuXVs0InfRMsVZdEGxJQt+sLB0ykKMA0dxeT3qDCVRvEAGwdntpOrkvLjtl
 PIQlWI/M4IYDOVGt44NntvDqLGFjnNijErazFSiKl3ttX0XboQWZpeuiLeepA7JGSX89rRhGmYj
 t+R0Na3A6JoT3+soVGpSUb0w192a8C2cGS/LggOXxFnFBkbOEc5vsHCdmo6E17iW5cN6GiV8ths
 /nQ9Y1uoU2fbhfpI8JmIyGysnOvceae/Uwx5mCu++NqbLwj6ZBa7wydcfP6OPO2uM6eMIbhH9ZZ
 J+hgAnCGhxCvFh8aQMNfQIMxF2nWLTnCiTWh0rL8K/No6mCuqw3ojSjuk+zNZ6VQ/QH3P25mwwW
 PssQwrY8O2crM+3DKqK8YdTa5BSHHzcMpwkfQV9d5f5KQHXc7+HQ0+iL1rV7Ea1rC+p0ma2HbfT
 7Re4xYVWF0KNC9g==
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

Since Chamelium v3 ports can change (recently added MST ports, for
example), they need to be discovered to prevent using an incorrect port.

This commit introduces the RPC calls GetSupportedPorts, IsMst, and
GetChildren to list all ports, check if a port is MST-capable, and fetch
the child ports of MST ports, respectively.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 133 +++++++++++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |   6 ++
 2 files changed, 139 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 7a5a1ff19e4b..c4c75c57fa64 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -149,3 +149,136 @@ void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium)
 	free(chamelium);
 }
 
+/**
+ * __chamelium_rpc - Call a remote function on the chamelium
+ *
+ * @chamelium: Chamelium to call the function on
+ * @method_name: RPC endpoint name
+ * @format_str: RPC parameters description
+ * @...: RPC parameters
+ *
+ * Returns a xmlrpc_value that contains the call result.
+ */
+static xmlrpc_value *__chamelium_rpc(struct igt_chamelium_v3 *chamelium,
+				     const char *method_name,
+				     const char *format_str,
+				     ...)
+{
+	xmlrpc_value *res;
+	va_list va_args;
+
+	if (chamelium->env.fault_occurred) {
+		xmlrpc_env_clean(&chamelium->env);
+		xmlrpc_env_init(&chamelium->env);
+	}
+	va_start(va_args, format_str);
+	xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
+				chamelium->url, method_name, format_str, &res,
+				va_args);
+	va_end(va_args);
+	igt_assert_f(!chamelium->env.fault_occurred,
+		     "Chamelium RPC call[%s] failed: %s\n", method_name,
+		     chamelium->env.fault_string);
+	return res;
+}
+
+/*
+ * For the RPC calls, please refer to the python code [1] for documentation.
+ *
+ * [1]: https://chromium.googlesource.com/chromiumos/platform/chameleon/+/refs/heads/main/v3/chameleond/v3.py
+ */
+
+/**
+ * chamelium_v3_get_supported_ports - Get the list of ports on the chamelium
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_ids: Out pointer for the list of port ids
+ *
+ * Returns the number of element stored in @port_ids. The caller must free this pointer when not
+ * used anymore.
+ */
+int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id **port_ids)
+{
+	xmlrpc_value *res, *res_port;
+	int port_count, i;
+
+	igt_assert(port_ids);
+
+	igt_debug("RPC GetSupportedPorts()\n");
+	res = __chamelium_rpc(chamelium, "GetSupportedPorts", "()");
+
+	port_count = xmlrpc_array_size(&chamelium->env, res);
+	*port_ids = calloc(port_count, sizeof(**port_ids));
+
+	for (i = 0; i < port_count; i++) {
+		xmlrpc_array_read_item(&chamelium->env, res, i, &res_port);
+		xmlrpc_read_int(&chamelium->env, res_port, (int *)&(*port_ids)[i]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_count;
+}
+
+/**
+ * chamelium_v3_get_supported_ports - Get the list of children port for a specific port on the
+ *	chamelium
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Parent port id to get the children port from
+ * @port_ids: Out pointer for the list of port ids
+ *
+ * MST ports on the chamelium have children ports that can be plugged independently, but are always
+ * connected with a parent connector.
+ *
+ * Returns the number of element stored in @port_ids. The caller must free this pointer when not
+ * used anymore.
+ */
+int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
+			      chamelium_v3_port_id **port_ids)
+{
+	xmlrpc_value *res, *res_port;
+	int port_count, i;
+
+	igt_debug("RPC GetChildren(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetChildren", "(i)", port_id);
+
+	port_count = xmlrpc_array_size(&chamelium->env, res);
+	*port_ids = calloc(port_count, sizeof(**port_ids));
+
+	for (i = 0; i < port_count; i++) {
+		xmlrpc_array_read_item(&chamelium->env, res, i, &res_port);
+		xmlrpc_read_int(&chamelium->env, res_port, (int *)&(*port_ids)[i]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_count;
+}
+
+/**
+ * chamelium_v3_is_mst - Get the MST support for a specific port
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Port to get the support from
+ *
+ * Not all ports on the chamelium support MST. This functions allows checking if a specific port
+ * supports MST.
+ *
+ * Returns true if the @port_id supports MST.
+ */
+bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool is_mst;
+
+	igt_debug("RPC IsMst(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "IsMst", "(i)", port_id);
+
+	xmlrpc_read_bool(&chamelium->env, res, &is_mst);
+
+	xmlrpc_DECREF(res);
+
+	return is_mst;
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 759a1f4d59e2..763ab4bc0304 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -42,4 +42,10 @@ struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
+int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id **port_ids);
+int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
+			      chamelium_v3_port_id **port_ids);
+bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

