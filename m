Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B265CE7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F32110E4ED;
	Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ONny1FG2";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3510E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C568A1A2C19;
 Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9695360767;
 Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 868B8119A8909; Mon,  2 Feb 2026 15:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=l6vAhc94ARDCU/wgXmMPnvTjcgIUuTtcYHmpKqHqoKs=;
 b=ONny1FG23dLAys2B+Oc6TMswXWm9grdbj6/B5lz2vcrIwHrrQnhMibWWkX3UYRjSSEPd+8
 lZGLnJLofJMNQl/havSUYhlfZ/G0tJ5IdySu49uCD8Ln0FRGhLqHJuIhzM1uqGP3Y9Opuw
 KAlelLuR8s1CHlhPoHcKixDllxZ6VaXA4Gi8+NYk4oOPZsVrsV4oGC4Icm9YWtKac3ZO+Z
 xghPf1Nh4Y/DQcNTUQDGCgaJmjVrHJ8C4qBnYAGGX2GdDkDOlrjZT44Trfc3R+049IQtVz
 z2oCj9D79quP+w9QmFCSxiUiKhBrAoTFyn1Xjbi+nHiJpAiGQQvqiThR/vTRXQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:05 +0100
Subject: [PATCH i-g-t v6 26/48] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-26-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yendymglfi1ntYaZnxiGgIc5BrBNgX0YlgGxs0PBgeA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWSgiqV4pf02KeIyydjPpz+dMq+2dJblh08g
 LgPUdHDZKCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI4dw//aAbAi80KmAgCWaK7Re2z9S93/N1om9Z
 MpT54cXOg/kP0TgtZ2Bp6pseEGiYSJkvF/opkZudPxToha2Q300SSLh6y2oco7ln55B/2t6FqjA
 DRDf+mE+2jlWKs2IPfTI9K3JGAgUPsbgY4EU9RjYZbDog2Izcmxs/yTCI9Nf77klWlGkUbBpjHW
 /Jmewypqs0WuaYuTcsgTeGZK/U8EaeDzccNIfoAdoUrojH39ulCUXUzuieDQJ7AkysiaX6z5SyS
 exmSSe85xTT1TTdD2UehhDFDuQy6WqWqRPhehBfrdaw8hKI/y/NRv+NDiKCg4j1xQ2efWpZWOnl
 pJZu5Of3v/wKbZSmsZ0PM5KxM0xZGdTeC/prNXhjwWUJo2pOjXlaWNW++TtRFjGobRetHa6nPqt
 LfNLLtdDfW1svAZSOq4RQUEDhvcHJSggCSrSM4MmR0zGc/6cTlEnEBhIVGTDS7OH+Gjgi7UiUmp
 4dyJRl6RICPOPTlJNC8qwuD9JGxJBxLKHj207SZCN+HO4PSycyhBTWbudP1x3CPGTFkefRfrJ7F
 bho/QT8uFdHvkieIPbziI6NBsiqLut9q5pwUfUU6+65GH4qWdY21pa7WZJQZp/sG1XjdprPWyOm
 We+18wPwe+C7WGBOMLtuuKBKCqLNs3FwwzAkDwElnCy9L+UaRybA=
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

The unigraf can emulate a full cable plug/unplug, so add helper to emulate
this.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 28 +++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b7e31a887a88..966e7d2a5077 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -327,7 +327,9 @@ void unigraf_require_device(int drm_fd)
  * and link parameters to default values.
  */
 void unigraf_reset(void)
-{}
+{
+	unigraf_plug();
+}
 
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
@@ -364,3 +366,27 @@ void unigraf_hpd_deassert(void)
 {
 	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 0);
 }
+
+/**
+ * unigraf_plug() - Emulate a cable unplug
+ *
+ * This function will emulate a full cable unplug (not a simple HPD line change)
+ */
+void unigraf_unplug(void)
+{
+	int d = 2 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
+
+/**
+ * unigraf_plug() - Emulate a cable plug
+ *
+ * This function will emulate a full cable plug (not a simple HPD line change)
+ */
+void unigraf_plug(void)
+{
+	int d = 3 << 2;
+
+	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index f91b903cd80f..97b8c3661f1f 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -42,4 +42,8 @@ void unigraf_hpd_pulse(int duration);
 
 void unigraf_hpd_assert(void);
 
+void unigraf_plug(void);
+
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

