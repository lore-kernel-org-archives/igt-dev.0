Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8DAC3DA49
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905AE10E5DA;
	Tue,  9 Jul 2024 15:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KnsE/CVQ";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615F10E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C79420005;
 Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dhMag2fL5YSTtdHPJk2zYSQvnQQ49utNcH/xI3xT1dI=;
 b=KnsE/CVQ2oIaT36klR4U5ACFbOdS7Hy/bHnsMGlZa8w6ml5TAnay+YSycnOc4tKj0JHcOM
 EBWzG/tNdYIj8/IQZChq1t4Wpjm8TBVt/SaCsksunVA8aBBoIFpIk0zvAcWz6gY34GQ8Xo
 r094ooDtvY3SffY+MOzUKhplULR94zUjopeKP4p2JwpXgy12l/NBSOeAyw+jMjlkV5My4N
 hAswuhW3oldphWJ3dec7zaKHKXfpvMlNUpiJzEgsnWrE6lmO9yrtUQNuvUU6Kra4YIofTb
 MEtd3a4miK4rhAHA/OU7Ix2Zl/hcvWaAvNyeRwVkWcSZt5cY4SogFd1IsyQ9Ew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:50 +0200
Subject: [PATCH i-g-t v2 34/39] lib/chamelium/v3: Implement method to
 discover video signal status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-34-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cfR+tJDK93bfeNeYIP58wF3+rSFlDjf7uAz2HTIHBf0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViafGHdXTsvl75KOwc10KwMeIbD2LCKANY24
 EGsWdk+ga6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4sMPD/96M4mCN2SPevZ4PKjdMN/OoYYST8kT3bxQZce22+HdgObfsSQFbQPNODZNRu8tMyo85d3
 lLu89Yt5PC+t0VGDMGfSE+vE+Xd8CAT+/O9/N59PzSiw6OeZfXWayXbdXsRGfILFj7KEIueJ/+J
 AhxXyDjFRdeV3Xuj7x6gJTUAcs12ma14G7SMd8VyQV/EsXND5eORpKuV7aAAA+PC9hZQ0/pAvw2
 h5RoakPaUNdsrHhRuyWrqvmrjZk00h4LzyaolqKDcG8T2Wb7cDVtGaMErl+23St2QcxPzAXw3kW
 lED0C6lXOD2BMB3o/t20NVh7SJ+Qdp4ba89sN+OZ+ebX4aLvhTpn8ifiwwD/V6zpnY4BleOTi/q
 trH+LkWGauBRkr3NghGO38yojg8oS4S+IMu1rvl6lM7ybh8gUt3agbu2IRGgmtkpg4HuGN0gh/x
 QYUFiRsdwDFrZsVSXr+R4qR/QMqDuWH54x5px+JmLRnN1VaWyl0G/BKg8ihcQmJ38esQv9ex+Za
 AAbVYjJ2QIh6KB/e00NQ7eKSVH2tG4eojvRZaxlOI0VfiShhKxCEUE8TqjwAD9UkOEXKVnuHCQS
 7c6Y4moiCetA6kVsd6ok+cbGRFXt1HsNIb1DUxepRPKE3ibFxBEWsvRI1URiXNBZ6GigYEVZpzS
 zhoj3ul5ScBq2Lw==
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

The Chamelium can record signals received on its ports. This commit
introduces DetectResolution and WaitVideoInputStable RPC calls to utilize
this functionality, allowing users to monitor and manage video signal
status.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 54 ++++++++++++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  5 +++-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index cf9eb330efe4..436a3cba139e 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1119,3 +1119,57 @@ void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium,
 	igt_debug("RPC ApplyEdid(%d, %d)\n", port_id, edid_id);
 	xmlrpc_DECREF(__chamelium_rpc(chamelium, "ApplyEdid", "(ii)", port_id, edid_id));
 }
+
+/**
+ * chamelium_v3_port_get_resolution - Get the resolution of a signal on a specific port
+ *
+ * @chamelium: Chamelium to use
+ * @port_id: Port to fetch the resolution
+ * @x: Out parameter for the width of the signal
+ * @y: Out parameter for the height of the signal
+ */
+void chamelium_v3_port_get_resolution(struct igt_chamelium_v3 *chamelium,
+				      chamelium_v3_port_id port_id,
+				      int *x, int *y)
+{
+	xmlrpc_value *res, *res_x, *res_y;
+
+	igt_debug("RPC DetectResolution(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "DetectResolution", "(i)",
+			      port_id);
+
+	xmlrpc_array_read_item(&chamelium->env, res, 0, &res_x);
+	xmlrpc_array_read_item(&chamelium->env, res, 1, &res_y);
+	xmlrpc_read_int(&chamelium->env, res_x, x);
+	xmlrpc_read_int(&chamelium->env, res_y, y);
+
+	xmlrpc_DECREF(res_x);
+	xmlrpc_DECREF(res_y);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_port_wait_video_input_stable - Get the resolution of a signal on a specific port
+ *
+ * @chamelium: Chamelium to use
+ * @port_id: Port to fetch the resolution
+ * @timeout_secs: Timeout to wait before returning
+ *
+ * Returns true if a signal is properly detected by the chamelium on the port @port_id
+ */
+bool chamelium_v3_port_wait_video_input_stable(struct igt_chamelium_v3 *chamelium,
+					       chamelium_v3_port_id port_id,
+					       int timeout_secs)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool is_on;
+
+	igt_debug("RPC WaitVideoInputStable(%d, %d)\n", port_id, timeout_secs);
+	res = __chamelium_rpc(chamelium, "WaitVideoInputStable", "(ii)",
+			      port_id, timeout_secs);
+
+	xmlrpc_read_bool(&chamelium->env, res, &is_on);
+	xmlrpc_DECREF(res);
+
+	return is_on;
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 0d2e481f6cca..bc0645f882c0 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -80,5 +80,8 @@ chamelium_edid_id chamelium_v3_create_edid(struct igt_chamelium_v3 *chamelium,
 					   const struct edid *edid);
 void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
 			     chamelium_edid_id edid_id);
-
+void chamelium_v3_port_get_resolution(struct igt_chamelium_v3 *chamelium,
+				      chamelium_v3_port_id port_id, int *x, int *y);
+bool chamelium_v3_port_wait_video_input_stable(struct igt_chamelium_v3 *chamelium,
+					       chamelium_v3_port_id port_id, int timeout_secs);
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

