Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9343EFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD110E2C4;
	Tue, 28 Apr 2026 04:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZqR0eDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB0110E2C4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351649; x=1808887649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cZahrtcVDAYdxF5uE/sAJ32E53uqJ8/IJypPLQ3SPs0=;
 b=XZqR0eDD8kKiFWLDtXWI9IB27N+x9EcZISQ3MZ7+TCxdH7/adL6lmSM1
 prz6qS6dOXn41pCv6ySFZjDseMmEN8mK2Pi/IRm56YQ+WQRljV2lejceQ
 90ArUj+yC4O9XEdcSOLHJjoSID3uNQCOLS7Hdgns/+Q+KxoD4XjHvwkWS
 bpxOoMwNy1DfJsYBaAA2cAEQXsdLjQvOFj4EIGyTzoif3N4Ym5JCME3qq
 k2EKA41jatqjKagowb9vxUnEP0yYi1E0FW9frMBhAxS9dpI9v4F4FmQ0V
 32KisPoFwmmv0NNZwdtr+qUpoYcZwLK8V8ABj+Du0y1JmdqIHvCOC8TDW Q==;
X-CSE-ConnectionGUID: e/mTnt0fQaSiwiSaRSBDUw==
X-CSE-MsgGUID: Y53joq6XT+6fQsF3PoBKug==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167846"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:29 -0700
X-CSE-ConnectionGUID: eOppvrQyT/S0ntjFctPBmA==
X-CSE-MsgGUID: qHsnqOaDTP2dwfm2caPMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706727"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:28 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 17/25] lib/chamelium/v3: Add method to discover
 Chamelium ports
Date: Tue, 28 Apr 2026 10:16:26 +0530
Message-ID: <20260428044644.257001-18-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Since Chamelium v3 ports can change (recently added MST ports, for
example), they need to be discovered to prevent using an incorrect port.

This commit introduces the RPC calls GetSupportedPorts, IsMst, and
GetChildren to list all ports, check if a port is MST-capable, and fetch
the child ports of MST ports, respectively.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 133 +++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |   6 ++
 2 files changed, 139 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 663f51aaa..1122ce102 100644
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
index 929d7d4b0..af5258068 100644
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
2.48.1

