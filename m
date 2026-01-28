Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED697D25B59
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9626210E6DA;
	Wed, 28 Jan 2026 13:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Q/2WDAYc";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E092710E6DA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C683A4E422FE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 977CB6071F;
 Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA7D9119A8813; Wed, 28 Jan 2026 14:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606076; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WM2Y2JAp3gGXxTtO7HZgJYHRRlt7SAuUxUKdNPvZTtc=;
 b=Q/2WDAYcyg7bBJd+ueoWVsKnfLx5HPjr+UuJfC8MIZ5xKggJV/4Y/xJlXCpU6XQ8/bildp
 Yr1DrO/Kfoi7/18kVv1jx4nbYjjXLN+Lf7pdEF/APkHzT34SKIFICJSRcg/dovKbA5k973
 hg6Z249j9SUQJ5H7OCEqI8ua5LuF9/OpqgWW8OPbATzZQ1FRrkD9qkk6uMxFnKfKtThW28
 ft15GG+Wgk3frsJFsCUE8ndxp6NT5YZdi9yB2eb3YbEQsaTcfejQkkVUkuLxgxtlZgFgwM
 MHXH3Qg5oMz+JDhQE5MO1l/x6rkuztq4W6VYqfHQJ8X30wbdKBjmlYV+0K/+WQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:39 +0100
Subject: [PATCH i-g-t v5 08/48] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-8-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RUGEW3S4U3Q8CW+tB4OYwxjqZE3AH0ttblIlA6sGpx0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvISnaPuB0gUsiI5QBukKFZ8oH+mDp2Pbgee
 Mjc/2GUIaeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIrHg/+JZx6fyJCi2TLhwTaXyyN+S50fltzwKF
 wMBXK+Xdmoy/G0+fyRlu131GdeVMawNSm6YHSzl75srrBYvFITj4PT4x1cqp24p9KGWgoiFBu6M
 n9R+Djlbq42XNcNqLfY4bLDl8lCGJTfD8SlveK0YL2e1EOHfdDETivufX2HHFE28KcO6eoOc5zj
 n0cHmkw2GeEv8TQz8HufiInrvgGTvRBCk5nFpo9+PjSRtHdpHFxxsnEP/Jn2p35AEx2Ad2txpco
 1v7kpZQurUwiu6Slkp51g9JaOwIUseCN1ezdT9CVob3cW3oD/dRSTcOp4deH/0PoiWB9QL8xRVb
 1VjloNtKjZ9PMr9EYg2X9ZH9KRCIdhpBetVBx6j/4+StW0r2c4FkMzvz0AF7Cthwv7iGIH+s8b6
 CfIx/XX4PHcytOX1mGp4i5kYtd5a0MAb7arnQxeWOc+6MpsKvjoxioqia//4qspnzbnF7Gcy+D+
 UL7QQxupio5FefXEwCgGFxRJeEBMKVkfjLF6xprOzFiSm9Wx4BcyPdeEYs1l7slZmF3Q7AJHLeg
 bEcwyBPEItp0tk3+HmNANcb17zODvF9O7tDsXsDwF9hVcSEU8qmXgcmXP41AsELMNrjIZv/8jAU
 scINSCuSJGF/tZpO0WeA3SaC1HXSURzCx2xZm79oozYJta8B+b/8=
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4d22ad71221c..2c02b7d1f4f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1614,7 +1614,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 584e05fd159d..869021559914 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -160,6 +160,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

