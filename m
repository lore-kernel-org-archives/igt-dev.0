Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920FAD2CDFD
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93710E6D3;
	Tue, 22 Oct 2024 16:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Yn21LYb4";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EAB10E6C6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C09E000C;
 Tue, 22 Oct 2024 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkzGLXK3DpzDvMeioQiyOIZ4kb1bO/o4wd5rt6sCfjo=;
 b=Yn21LYb4PkONDSkseXWzQqVTTLgH4DQn528NzDfCszWpTDI0UAH8LGiOB/e7ZgOuZ6HnLr
 HX6JL4JHZ/geIZzSrdAPH+MD+K3fJuX0vxnAQwMyw3WZ5hv5NDBrsJybArUfR1y1y+57to
 5sMuRBTNcTHsIV8R/zgovIKLZSwnjJwzQvfxZ1+wakZ1Jw6BNl7p4ZBVYEjgeziutQIQiW
 NNb9k/m6+fUfKNIC2FZXfcC6SAUrwPwC7Wc2Npx/oBo5M3VBfIJeN33wxLoGV+cRsmvX8K
 JSH32iI7R7JxTS8uj1/SmvIX8GbvdGg0XhqfweNwpUSxJqIVUwbMg+1QBK92lA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 18:31:52 +0200
Subject: [PATCH i-g-t v3 3/5] lib/chamelium/v3: Add method to discover
 Chamelium ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dev-remove-static-ports-v3-3-bfbc7b2a83b9@bootlin.com>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5824;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vzbuuOpNITrA/raX0EHxukrjlLlqKyuB5owr41mIiRo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N7X57Ouoyuv0aQndC3W7cnGYQHsy+Xjv2z7
 0N1APdgKryJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTewAKCRAgrS7GWxAs
 4vwiD/9Zs6iXNEEzXaOfLkqtLmE553ic5GHKTBZCoxe4Q/mEhTk5L/uAExrg78MkFsV5MtDyZUK
 cVnSz8YAuwl+cLdvNU4ZkVlxRQLW1vNO5j7zFe0Td4uclHTxR0dOvK5f0T+kNmkwzWJoHHK3mt+
 m2SHX1zEh/2RUSzVlkH+vPe/CfjnRd/jaKJaZHZybdsN03fdtrRw3FmPr8Ft6kVqaBtTJ/z5vsF
 0B+yvrCkqLxUi0Tm8IdM1vCXc0sHWXGvGNtN79iIjJwPePU942YziqtCw9kUxDMbN76n+1TmChr
 vcwcMe9yA6pl2MWe6RevRlxN5NeduDeYtxZZyoZzwRhDZM2SG5YqgUGru9/AGsOn7XLIetN9lZs
 sTLeefRh+v2ypI/WEVtcaw6lP1GzgSqgDRSWcbEpkSSggIZdFaEhgS10H6YGOwH6ggmu5jm08LI
 QP+5bmxc8odFvCX/DazgRI543O1rIfCRhZJwxp0uuVq7Kjrz5ZTpmxf+Gx3AlXzw9zChSQfPmMR
 2ih3Bk2z7h4tTF2kRmS2zzVSpg3xwPgH7UwqfaftEyeeAwXV+42a/mvZrjDqhX8WQ4gUmNW0NJE
 CLayJCv0tURM+jp+/bX76Gn6sC0AIi9JBAN6rxg4VOVYkeS2JYp/x1MZC4/33IvSs+9cn+cgnn1
 qvEMt551JjQ+nvg==
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
index 663f51aaa7b0..1122ce102cde 100644
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
index 929d7d4b07b1..af525806865e 100644
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
2.46.2

