Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0399C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD9810E5C3;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VWojlJ+a";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739AC10E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4DF52001A;
 Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDJC5YSqLE0IgaSgKQVyfRHqJ7aT3+42cfwRxqsBENY=;
 b=VWojlJ+aVbwmexu5OMTk/n5ZWTdHmrmjISaLu1tclWriGC/uuP/vCh5sie/PfFcmrJUur8
 9Y3aqc2dcMn4vn5HOvPo48wi7v67IMlAGbMqVQ6Bnvrvbh+Qk1BWEeqb/aGOg8gSZC9d/y
 gA2Xs0qLh1MFNvvShhAprzvXCyzhrZpwGA/eF9zpEg1RkaMcmUlZktYAYNmrfvXuNeuBkS
 6TUbjSyDBY6gN5d70FmyyWoWeekDpTiR2e7G/D1SWCqgZunKQ1qCkBVkCUyYlqu+E0fbxJ
 7H7w0NbHvYX3XkoyDerPpoonwBrnjLdpSP9p/embdISNAA18AL7AA9UGQqOtvQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:37 +0200
Subject: [PATCH i-g-t v2 21/39] lib/chamelium/v3: Implement methods for
 managing Chamelium EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-21-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4028;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qTSlp3sLuD6LneR5D71AS6CbJfW99GX8fWoFKi6ZKCU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYUAZ0IdfPv8w6AAPfXTkQnApP3ig6c8vfE
 /9nl17SntyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4uT8EADYZPEeI8xCN8XiX5ppUs9HtTGgE0DSQCQM9n2AW4sQoCN1jeaNKHzNXgXvAqE+3cBTev+
 kCcfth+HuL91zrbPjaUAUK+c2xQly82A/KOORQJk1SLeHx3rGDCYKBPQkXM4A4wL/LnT5SVm5i3
 kZ+AWVYAxayOldyliHPWJtryF8PEolGSBoh38B6095VZrjQMkgRwoesf/zKJ/SiY+nzhx9qqqW4
 OAzHiBEXwFaFfFpN8MfnZTDG6m3Ilml3DTaGPuWW/3wRv+SrsQf4FIKmH/cbPO6QyoV8hVR5/4j
 UizAROUDTBygahzcVvg0Do+lP5SuWOE/iLloQC2iwIVs39O0ZHDPck1tM0nFrlf7v7Q8e5pxZti
 GDkjvO56NqT2VGlPUw8AhfJR7FjfPfP9uWPiVlH1lofcs3+IWx9tW1Btr9ROFGiSb5bEMvQRdcT
 PHr2kOu9DpjleLr6gnKBqb+IfnM7C5jGVrYFsFtDxFdAP2CpqasqnIdVpTse6SE8Jv24nSxY9vm
 IRdun9S3iFk1ckqbyuDcfyBB7NIM33GSYYoWmMgBknPKhkNthXry9me5Y463DSy0Z0yWKIONXQu
 4HMK+KAxZ20KC1xe+GswFTIIWAIrnoaNTcdkXpXjOd5ykYjrc2ZOirgDMpomFFwbBb/nkJWiKKJ
 DBbUgCKTu+jMtiQ==
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

Introduce functionality to apply different EDIDs to each Chamelium port.
This includes uploading EDIDs and assigning identifiers for applying them
to specific connectors. This feature allows for greater flexibility in
configuring and testing display setups.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 47 +++++++++++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h |  8 +++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 334098d4dea6..767dfcfcb182 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -364,7 +364,7 @@ void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
 	xmlrpc_value *children_array = xmlrpc_array_new(&chamelium->env);
 
 	for (int i = 0; i < children_port_count; i++) {
-		tmp = xmlrpc_int_new(&chamelium->env, (int) children[i]);
+		tmp = xmlrpc_int_new(&chamelium->env, (int)children[i]);
 		xmlrpc_array_append_item(&chamelium->env, children_array, tmp);
 		xmlrpc_DECREF(tmp);
 	}
@@ -374,3 +374,48 @@ void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
 				      children_array));
 	xmlrpc_DECREF(children_array);
 }
+
+/**
+ * chamelium_v3_create_edid - Upload an EDID to the chamelium
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @edid: EDID to upload
+ *
+ * Upload an EDID to the chamelium. The returned value must then be used with
+ * chamelium_v3_apply_edid to associate this EDID with a port.
+ *
+ * If you prefer to not upload, the chamelium already has a default EDID that you can apply by using
+ * the value CHAMELIUM_V3_EDID_DEFAULT.
+ */
+chamelium_edid_id chamelium_v3_create_edid(struct igt_chamelium_v3 *chamelium,
+					   const struct edid *edid)
+{
+	xmlrpc_value *res;
+	chamelium_edid_id edid_id;
+
+	igt_debug("RPC CreateEdid(...)\n");
+	res = __chamelium_rpc(chamelium, "CreateEdid", "(6)",
+			      edid, edid_get_size(edid));
+	xmlrpc_read_int(&chamelium->env, res, &edid_id);
+	xmlrpc_DECREF(res);
+
+	return edid_id;
+}
+
+/**
+ * chamelium_v3_apply_edid - Set an EDID to a specific port
+ *
+ * @chamelium: Chamelium to get the ports from
+ * @port_id: Port to apply the EDID
+ * @edid_id: EDID to apply
+ *
+ * Apply a specific EDID to a port. The @edid_id is the value returned by a call to
+ * chamelium_v3_create_edid. For simplicity you can also use CHAMELIUM_V3_EDID_DEFAULT to use the
+ * default EDID.
+ */
+void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium,
+			     chamelium_v3_port_id port_id, chamelium_edid_id edid_id)
+{
+	igt_debug("RPC ApplyEdid(%d, %d)\n", port_id, edid_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium, "ApplyEdid", "(ii)", port_id, edid_id));
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 9bad733b717b..cab33e43aadd 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -5,10 +5,14 @@
 
 #include <stdint.h>
 
+#include "igt_edid.h"
 #include "igt_list.h"
 
 struct igt_chamelium_v3;
 typedef uint32_t chamelium_v3_port_id;
+typedef int chamelium_edid_id;
+
+#define CHAMELIUM_V3_EDID_DEFAULT 0
 
 /** struct chamelium_v3_port_mapping - Represent a mapping between a DRM connector and a port on
  * the chamelium
@@ -53,5 +57,9 @@ void chamelium_v3_plug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id
 void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
 				     chamelium_v3_port_id port_id, chamelium_v3_port_id *children,
 				     size_t children_port_count);
+chamelium_edid_id chamelium_v3_create_edid(struct igt_chamelium_v3 *chamelium,
+					   const struct edid *edid);
+void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
+			     chamelium_edid_id edid_id);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

