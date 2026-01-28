Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30AFD25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EB810E6F0;
	Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PPORrjJv";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFD210E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 68BD3C211E5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2C506071F;
 Wed, 28 Jan 2026 13:14:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09C79119A881C; Wed, 28 Jan 2026 14:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606082; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r03pxxVkv4q3UwvCJtbYZfU2HWjVJxp7YPuwqSQoNYE=;
 b=PPORrjJvV6PWfGEr1B0mdmU3Kiuf82fkdwR1BEkiPPwFNX6iNZLmDFzPY6GpCA9Hfm15ZH
 I3l0JiuLORkmVqkPEDMNPyywKpQ4SHnwt6/H4A1fuyJYkHHWBKW0Tfw3k1UL4+t0ORWgDt
 lsNFLj/g9Q5QCo+d1th1D4W9h6+TUDjruGuel/hcRi7n0THVU0/QjMsSLE+dmXXJLGmbHu
 7bHg0bD9rNcdNjUwsHPjMBlznnp2jMeGIBKT9eg8H4n0kKmaFi4izO31okcVqvt4omfrAy
 tC9HFiLXdNm+ttVffkTNGF7IAowedDhexG3Ltad4LohwsscbqmbNKSl87d1Nmg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:47 +0100
Subject: [PATCH i-g-t v5 16/48] lib/monitor_edids: Add helper to print all
 available EDID names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-16-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kc92gVXm4y/Cn6N0PjbQz5EtFhWUxOL+PZXn3Q9Btew=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvJ6UI6VyIvE/xKUUos8R2r6kCNYT0aGhP8r
 W0ml979gBOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIyVhAAsPuVprHdG3UX8MuBK4qL0ix+kqSo7wO
 bDb9/iZ+XyRADn55lY7IjJe4Vqs2WnOMf/f0ZZPQ5d9HD9UDaBBnmgFY+PGtQBltvREvMWvGkZN
 Y/pCsPRkkzt9S1EZl8B9S1g8VQygT+4y5vGC6LAf8hRwD+52u1jP6euYhwKH0UqtJWSDO/vtMZG
 djwd0a1si2Vdkeih33O+N5lKjisIA3OyFA5Yx2Xc0B9GkfbgK1eRKvdohpY+gOkybc4KmY+hntY
 L2RWiiGPeMBrGM0hzpIv4sdYUemo6Uaa783j1zeN9FdXT85GOYazMCJ9GGDKExRn6PjAQ9O2Oq+
 e4Li+eIqQ6kM8p9m2JxTTKRH/Cij/o+mtRiXn/Oj4cLp8oGkmbE2IpDhD10E6TTSH+ph5XszwEP
 ZXc+XGaC86Xo4zO2An7CwkXPUzpR8FiyZPJuVil8k1R6eC2R3nFseesD+dvTFYZ57DgxDPFPlJT
 XQuOFllXqsOVdUvEs6kktQJ4Q/cQZHM0y5uaVDJ9uK24ILPtiTaKJJMYi8zoCpRNAPGsvSMApVn
 g/mIaumzAEmtRJEqZQPorXWiD/yP5RjSn71YoxMubWadX828/IHp2FKmtJhrm9IiuuEbS3CuClT
 Heimt92Tl/meIZZo+z6QclGhaqWv9aoNsXZ1cwiqe8atd3C6xEts=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
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

During the unigraf configuration, it may be required to know the list
of supported EDID names, so add an helper to print them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 16 ++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 01feb34a5516..0f9f5269471c 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -200,3 +200,19 @@ struct edid *get_edid_by_name(const char *name)
 
 	return NULL;
 }
+
+/*
+ * list_edid_names:
+ * @level: Log level to write the names on
+ *
+ * Print all the EDID available in igt.
+ */
+void list_edid_names(enum igt_log_level level)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			igt_log(IGT_LOG_DOMAIN, level, " - \"%s\"\n",
+				ALL_EDIDS[i].edid_list[j].name);
+		}
+	}
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 6d9e3fc89592..7ae0fd40c041 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -15,6 +15,7 @@
 #include <stddef.h>
 #include <stdbool.h>
 
+#include "igt_core.h"
 #include "igt_chamelium.h"
 
 /* Max Length can be increased as needed, when new EDIDs are added. */
@@ -35,5 +36,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
 struct edid *get_edid_by_name(const char *name);
+void list_edid_names(enum igt_log_level level);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

