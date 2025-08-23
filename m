Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8F8CA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853F310E193;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0Yog7Hl4";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8FF10E189
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9A77B1A0D9C;
 Sat, 23 Aug 2025 02:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72681606A7;
 Sat, 23 Aug 2025 02:11:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CCD521C22DAF3; 
 Sat, 23 Aug 2025 04:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TyyaYI3As2jpUz6JZFF2Kl2t4CUhlWRfxOIkbEH9kwA=;
 b=0Yog7Hl4IcluOlTwMrN/Uz63i/Ca1aV+zdufG7btJcSkPnUNgo5shNyNGk8L0URqysfEyg
 eXbqkRlufJPkNMwLMe1dOLJkS+5VCy2oHKQE0rpawpSVNg1sAl36rqBulPNI9oVl+EICdE
 PWTP4eLxB7ny8oEHDFy/ObqIuYrzTgNoxR+ldOL8telxvIsp4yIsehMKRx1b7Dj5Q5TXgJ
 B3g93QRGTNQSOCIVyKWQ9KuL3Fc/rmot2oMAkCFWduv9RTMqHEAPdQEwJfVYT70H0P1het
 UxQR0srb/fE5PHlrMRViw3Xs2q3+3RAFhj3nqDGe0T/30EhqZbTx/mvoMbTQrw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:38 +0200
Subject: [PATCH i-g-t v3 18/29] lib/unigraf: Add plug/unplug helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-18-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+W48wXIhGdssfPc7FRiHRQpixzIQFWgjFty51/RT2ww=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNWFl+0LkHNAdDaz6d0+Adk5zFxVUz0ImbBI
 4VOZ9HufgmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVgAKCRAgrS7GWxAs
 4gwxD/0bZW2AZG8x//1RvBa29QPCmhfe3hQFosRVHDb9aUCJVI1XvtCra5BWI3cCD9Ox3l6ILDq
 DMm3kDgkx76AxN9ohH4xQaBFPzVgNKxqQsudKOrbRN2lfBB+hhFlak69CtoeiR89/hI3F+TI12x
 WFhxMOFCYvhd7IRGgQnqo2aRjhDbMvouyopYQVH/ZVmI7sPjbaxH0jp07XFmkWNu0iM2wgscvWq
 tjjf7JiAnGMYKnooCfd/T70HTUCIF2kL5rBwCey4KMNoKVbIMpjHivFO2d/xs5mZ/1X9c6+5Jjh
 sc4wY31/Pi9U1jQvdBgRPpzdYpkljhXzt9/uk4hmSVE34buU562Zfsrx37mgUHoxtxQgB91UPl6
 4Kx/R3MTfsmvNlqnRul1YRzswUBkOoKblc80QOHkCRHcadL4U1RYW43LVATJOlN5sZTw81xElsF
 sPqEaZOUaRym7LQrF8ScQECxy3ZSgr1Qc07sKfCPkmfJvkq2662gZ0h8xA4wwT4o4q6d09y+BMx
 Cp5PywqY8UymWD4GKb0jBTaq/Hi12HxLkTzSlNU7RQUKYVi0KgpNY/s/e6lQ7SLkoIZxUf1cm/w
 QoFLfbeY96aasDdaR2SCFWymrV03T9XtJNekpe+No6g8ZsNGcSZMVBMEdO06I5IvDTCxOY2tMaA
 nYxC8Q8mziS1m5w==
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
 lib/unigraf/unigraf.c | 16 ++++++++++++++++
 lib/unigraf/unigraf.h | 14 ++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 0682f383aaa0f5eb8d4b40bb88c2ea88975f311f..b0b6af97acc563d7af163c175bb4a73bd25abdb9 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -325,3 +325,19 @@ void unigraf_hpd_deassert(void)
 	igt_assert(unigraf_device);
 	unigraf_write(TSI_FORCE_HOT_PLUG_STATE_W, &d, sizeof(d));
 }
+
+void unigraf_unplug(void)
+{
+	int d = 2 << 2;
+
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
+}
+
+void unigraf_plug(void)
+{
+	int d = 3 << 2;
+
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index c5ae949c54729bf293a4629ec3bf5d995de9fb6b..4f32a3632c8dcd6bd9900d821a93dba3cb77d62a 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -69,4 +69,18 @@ void unigraf_hpd_pulse(int duration);
  */
 void unigraf_hpd_assert(void);
 
+/**
+ * unigraf_plug() - Emulate a cable plug
+ *
+ * This function will emulate a full cable plug (not a simple HPD line change)
+ */
+void unigraf_plug(void);
+
+/**
+ * unigraf_plug() - Emulate a cable unplug
+ *
+ * This function will emulate a full cable unplug (not a simple HPD line change)
+ */
+void unigraf_unplug(void);
+
 #endif // UNIGRAF_H

-- 
2.50.1

