Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A99C3DA49
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE6610E5C8;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ixizde2C";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD410E5B5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B6C820013;
 Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ElgABbOthdhMiW3al955H1XzM9cOw2onwYIOqrb4ns=;
 b=Ixizde2Cq+1kOfByqEJM6awfFjsMwk3eVcoWMCHVFEQSNXkcPBSv8yto4qLEUOq0rlMS9p
 SiCJfIZj1t+I+9OXMAQ89EYA+VLP/zu+JeMcKfWeSeeMBlucUdRjLDClbK9YtKLjOyaUi4
 EqdER5W1RC21mJGK9iQtMMpag5FXy8FX/McU6a3UhAppHeTWXgsaAz8S6BG6rwMx+iBSCM
 v7vGZtP//zYBRtrlDzsvfjgswbu8+v8xFFayN4XTE/YqZvnISHfSrOtROoMuG8KtFhG7GD
 Oh85Qcijho/ZNPvSpXjMUP9nsENvST6/hvvrf91sjt+yGJcmJawuKssgTc1pfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:35 +0200
Subject: [PATCH i-g-t v2 19/39] lib/chamelium/v3: Implement Chamelium
 reinitialization via Reset RPC call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-19-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CX55wilyYm0xnzuhwUaK0ZJG4X5Q7y0HDB6Y9C4mCvM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYazoHMR29MHqzUAakXESfFeY4hg4iLJQBD
 Rfs3igEt7iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4sfJEACHghCS7iDIbcSLyhLYfsXGVrfIWeVQWnhbBX4BU2nWUOou3irRSiAjPMDBn44mZqjITZ3
 4IxXab4bJ4ykyIt08TsjyzEGNiUAyTLSlpTdhcYx4BE44itaunzOlr3Bs/LmkUOY8g2s7OGWJtn
 jFtrCQ6WIwMrOGdvqCYYETczKrrrAj92f3Y7yNEuVl0QU/lw8jZZ8Kl79UfWcx4mRFTZgxaIKDC
 7yF4urgIaywxakVqDiXKmfgdZeOGTPy5AZSUOqfgZN0bI9bGAVoZszx905dElbeeDsAAJun3ZSE
 vVwAse8CX/4nIQcTrmLof3VjPgKLc6J2oIaZtAxsXUEmccs1vXhuouUjfK6rcF+CGiJ/qFUzDIs
 E6M/pkmkQvyzEqq+FhsjT5VsOamH17AevikXidsPYk0cT8isIjKND8YYiXLVq0uieWobXtlTw8B
 ND0A/RdtqxhfVDSoQmIz2g81W3RZfLtrdwpig3uvZr0kvhY1kFs8EqvcDep+k2T27gooxrDL0bC
 d++WEmbSj9l3EXJl8SR5X1ezYwSoYQmGF131ZkeF68qY42anJoITjbP4nqzRZkdkFq8ZPzsFUF+
 5L+9CWKnmM6HCnKiunxy26bstT7+kKD1+8SmDCzt8NSrTZDPkwIHiGcodLKvvRqSrZ2KPTm81Ts
 7tt1GDCUnKD+cPQ==
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

Introduce the Reset RPC function to reinitialize the Chamelium, ensuring
it returns to a known state. This feature is particularly useful for
testing and debugging purposes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 16 ++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 5a7e42334e81..af6ab5c6c9b7 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -188,6 +188,22 @@ static xmlrpc_value *__chamelium_rpc(struct igt_chamelium_v3 *chamelium,
  * [1]: https://chromium.googlesource.com/chromiumos/platform/chameleon/+/refs/heads/main/v3/chameleond/v3.py
  */
 
+/**
+ * chamelium_v3_reset - Reset the chamelium
+ *
+ * @chamelium: Chamelium to reset
+ *
+ * Reset the chamelium to a know state (no plugged ports, no EDID applied...).
+ *
+ * Note: The current chamelium firmware does not reset scheduled hot plug, this may cause issue in
+ * some situations.
+ */
+void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium)
+{
+	igt_debug("RPC Reset()\n");
+	xmlrpc_DECREF(__chamelium_rpc(chamelium, "Reset", "()"));
+}
+
 /**
  * chamelium_v3_get_supported_ports - Get the list of ports on the chamelium
  *
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index ae3225873bfb..88b407dfd1ae 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -42,6 +42,7 @@ struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
+void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium);
 int chamelium_v3_get_supported_ports(struct igt_chamelium_v3 *chamelium,
 				     chamelium_v3_port_id **port_ids);
 int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,

-- 
2.44.2

