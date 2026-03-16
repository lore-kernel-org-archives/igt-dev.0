Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ECDF46446
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3589A10E286;
	Mon, 16 Mar 2026 10:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IK3Gf+3I";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827910E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7F68C4E42627
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 571895FC4A;
 Mon, 16 Mar 2026 10:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7351D10369F31; Mon, 16 Mar 2026 11:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ut7zgJE/QeWFD4jXuLHpR/EX9K/taIAI/b+81poMTsw=;
 b=IK3Gf+3IhV/sQqrLd4spZvJu+qaSEwU9cmVU6FmJd22JeP7kEC6+DkjPfCJNBEIwLMZ8oi
 UEGjThXP6sPhScUJ4/xdyUYzwWKZKcSCBefRmedA+LqMQc9Bbc0tvQi+uz6DfGpPzUfoFP
 1UNQMqmEV7yrPjCDerfeg2GaVoqq9kK1LFzO9BaE5/rjVlwRQLvUdwjDoPlB1Lcvs0TXBF
 W9cjOGd0Tta1/JNlI+4GzcoOKuCPWp52Oll9YjR7KLGa1WPWlx60Io2N7ka+GJCz7Ugfqa
 Cvra/w7FRyDelDPdOLHkrmiPahwL4qV4V/8GIqU5BVzLBHPTx4CX+LNL7RGiiQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:48 +0100
Subject: [PATCH i-g-t v8 40/49] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-40-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mlKgRgQnpCjaAe1Ok2WZixIqI7lbdNRvI4o8c9Q8MH4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pU8SyPvUz0ost92ZX119kKbjBT8hITTwBpg
 5Q9KgfxJ1yJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLv/hAAnhyuxxDnW+JdDWy+y/mtLl4Uvc1yUOr
 luYWPJTE/exltUTxmKvn6pxTe/NKuhyrblji9G8NpWjH8tXGYU74IeRGrPfMT0x2E+ZUHb0VH6q
 25pFcK3DP5QkYNaIIiEa+MRWinblHW06G4ppAzHBTO6khONe3jMbArQx1QbbZTzgnHHLCI/J1tt
 VusZ2aadgP0gUcNgVVe2oJWcuHf2WlZXFiuoTAhp8xeMvnJFJFwTlnO6TdJmZxqMCDJXFk+lw2T
 +XhISpGfz9JFjq8TeblEzyzxDV7xfnfSQerNhbUJOmPyoyP3TXVacLDU3DgB1JaZfnGDnCU1UXg
 RwQyxwnmMZSc+fVrw7arrDzqpljZ5rLE/7MR7cgJ67P9t7sD5XuBXTfmotNto04cVJ84wuRwjtr
 LyHFQ5sYBWtKoC6NUy0h9Pnyr1tQtNCZucLRtwiNRBxe/P4vf+bFkNvKDxr2HqO0ai251D//8Pg
 kFCU+IgmEt3NFhI4g0oKZcCmYfYoo2EDH62KJf+oLIOV1VfVNd4WddqrLhzB9pxG90/0bFr8Adq
 KLCr/oJ1FhjCb+QSRe9tgp+nrl/7T2p8NKWR8wNc5h+hJBNqF5GbgGkHE0EtBYEt3TyOPkS3FcK
 vUCg1w/pUg067NwCzJQb9ACzcJ9TX6PxMar6mZy2dlz3w4lsyzsw=
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

Current sscanf usage can fail silently, add assert to ensure that the
returned value is correct.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index da3dd05c3293..c2cddb955d75 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -128,7 +128,9 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max link rate from %s\n", buf);
+
 	return ret;
 }
 
@@ -150,7 +152,9 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max lane count from %s\n", buf);
+
 	return ret;
 }
 
@@ -257,7 +261,10 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link training failures from %s\n", buf);
+
 	return ret;
 }
 
@@ -278,7 +285,10 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link retrains from %s\n", buf);
+
 	return ret;
 }
 

-- 
2.52.0

