Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB3F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552DD10E292;
	Mon, 16 Mar 2026 16:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TNlq9cZL";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04B10E3C2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AE7BAC5504A;
 Mon, 16 Mar 2026 16:24:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 06FBD60050;
 Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0427103721F9; Mon, 16 Mar 2026 17:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=W2vinQ7mYvSFHswawiIZENJEyGzN/Ka82YWGNy3XMMg=;
 b=TNlq9cZL24cmVpnTT6wBp2f1qTRRKzfMzwb3KGxklv3k8XFP54RUHRsXHbFaqolsBxwYYQ
 2hLM+Qq+KwUcpYIcUiHYBkX3BOUUas454elH5vRW7a6E/bdkdnip50cAD09MuTs8gV9W/i
 qhPMcqKhqvH1N7rz0Nbfffy/ialMqiRO6Nk8jYGMZHXKuaXvj9tL/qmmFu3EmVHXRAdHOO
 T3cuCqEv9ReWsmEb4iABTT/1FoZZk+pypcQ9nSuAWWhQFw1pTy+4TKbiQtZX4kSFqJPsBs
 gzrtd02iu9IK3ZlRL537u89KzoBX2Jih9Xhj0PSB9ovQATdnznt48BBYxsDHrQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:46 +0100
Subject: [PATCH i-g-t v9 25/49] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-25-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IQVeKgAKedViPewNWRa0NL9uC50OEs+o94h//QZVLGc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6MwKjZVnbYBCRhyLqMz+Bd/QI+85LpW2cuy
 4iojyYeItqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIaAhAAoCLiSHKEfC8oz/6//EpVJ+rnjKa0E3P
 xS1kP1oeX7TxNCcSLvYKmuYHB9YM7vwWiilwLAwRUJDETJTzt/NulRYCq6GFSzJ2u/eHu+YSiH+
 rSzOgV8lJj+Idt2QSTpjcuNKtQUMAdZY/Dyrp6WU0uLAK4ny1hYmtwZsErTBab9wjGDxPxv+v3Y
 P2b+W1nCqeSG7V0W9DqKqn45PV4Al1HxrsgfjPn/iUmqGwfv+EMEC5rUeukDhY4hQ/4bNGqD4m7
 GtCZP0Q1zWG7fNc1ww/U1KFIkdQKlAZyT27m+NWhFuCQEivRKd6n4mQsIYqogE4x6/lkurWx0X5
 yV896y0vkxjDlNrhTYo0maUK8j0n8z62QJNKY09rChOsX7h+dKpxKpHJoFZr0KvrgG7apG0qrTD
 S/HxUaZI/beFZaGqZ+uT1QHl0mnM39ALZ982KhGy4GCwEqiDGnNCYsc5uKLjF2Nn9dHCxUFZI1N
 EFVlCu1z8aFcgJV2XkpDR9m7fq7388mZ3fNmiFPYytMebqU+o/4CNH3Oh504BsGKj10iF0s+bf3
 +iHi8OzA2JAKq/wmcAIYyrqsKLVgxtTqV035Z1PV9gH3fOSocnNsMOu4plv14BNo+CMzSH9wC1p
 ev4LCFGuzXIYf2J8JGPw58BabCofqDTEog04jOaBWY5qslLXbrKk=
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 12 ++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 43179d5fb600..9cfff8254009 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -264,6 +264,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -277,3 +279,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index c08ce62894c5..4c2cbd6b1aa5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -40,4 +40,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

