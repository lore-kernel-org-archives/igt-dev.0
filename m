Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857810F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82210EC4B;
	Tue, 31 Mar 2026 17:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p1sSU0cC";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB93310EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B57784E4288A
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CFCE6029D;
 Tue, 31 Mar 2026 17:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 523C0104505AD; 
 Tue, 31 Mar 2026 19:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5DSDuQf2FmnhrBi37MKfKCUTl1wqMkDnwBGH8JHkUYs=;
 b=p1sSU0cCOOZm37t229Uh6FbxoDAMppJ5Zw0+E7ZTMRlbEliz40eaj3HKElEu7rg7/uFJwC
 o45PsFE0bkHDcL4ZloxaSxHnifYcb2I7qeho7UzNze5Fx64YJvCZ6J5yPzTK7W0HrhnfkL
 5bA1E7k0sNMyUSvEI4RT42JcaWylBMQ5GjxPFoNQBFFSqUri3zAWUkcIgPUlFhbMHHm5f7
 oxOYU6qOXvd2xh55Qk+CT0N/Rh4LrD8c+GXvU19n1y74LWuI5Jn3BlC0TnVDi2pUYMJj1A
 ee3aOXI7dFBjJ7/9DsJJSX3GlXIS0TyAbXFtGGVLQuhkBh2Wow0Irw9MSNS1KA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:38 +0200
Subject: [PATCH i-g-t v10 21/49] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-21-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ulAIk8J5SrDM3N8d6pzksaTPWIzADAaKocDtWTY6bYw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+Q94CjRKBr7r1By7uG53T0sa/8NvAxJBfC
 c36VDibVQWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKD0A//QELq2qV0Fn7Ok4v7cc6lrARBvKIuSCl
 K0LUXnskwnX8gNWm8pqRgd2+IDcaM++6JFjBztZwkGx31Qo4dTP7tvY9+UE/hxY5s0AdTrSevlw
 AWC7HCZvqwqeQDt72nOe2Kz2R1zURCdIwCZY2PbsLMS4loMV3WOh3meIrzG+VWx7KXSfGSunh0d
 zEGQMeVQzWScuZXvzWMSJZPXzcNisB1nOSlGKzViTx5zdX1kozzEEca/uqUr6SanP87EzmWQqOd
 DbRN/lmVlB//EVAir+MLGjtOBglKRnzFfk03mNK3BscRe2sKQMq6VTplCH1ofAWLs9Bo8yB0D3y
 E2FsYYVDqfVtD+768YHseL+Ga3EV/Vsf9Bntt3P53uSKPRipUD0hboFiQbwJZICfDCJeQVMK39/
 nClVXYBoqMz1B0dN7L+mP6hAy+/VjLr4Bw8SjGRuq2BF76E46kDrAHfpozRZvqHX6JeFyillrmL
 gjVbxvxfIqLpggIfmENRVUqaK+gW1yrRv0k2L0EVHSV14IwfihASfnCi5l1wA9Svj4CrDfKH8Ha
 MelAaIbIJ+SR0xomDpNhCJP4oKdugTKrjw2J1Vn3fUrSx4iUUwYRlTQkYkaMn+5GC4dheLMPDoO
 UFHWXyi4yizpdVC12BQhB38rmrqTN+ZLRIkTgGp4PQeL5SVEy3sk=
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

As Unigraf can emulate a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f340548bc3d8..10b0b4650086 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -66,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3126,6 +3129,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i, crtc_index;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

