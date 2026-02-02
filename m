Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59477E7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E751510E4F4;
	Mon,  2 Feb 2026 14:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QEWQ9dZF";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1F910E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 703571A2C16
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4662560767;
 Mon,  2 Feb 2026 14:33:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45468119A890D; Mon,  2 Feb 2026 15:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=N38KY791UR7qWlaTcUDrSaCnSXQ+CwlaMaJ0V5+a1Q0=;
 b=QEWQ9dZFXOm6uiwdSxqtstsjAqhulYyCbhYh5f+9I+Dk2/p0UfIpiMROhA4wh+77M55ine
 YW4vLbshQeQ11GpMV9FN2ZsU9RPHg0bdCio/MAw/zDn6IGNfYwOQIcX+3JP085WZYKSexn
 HsI5nDaOJAx0Es/UFmQz9n86/wSeZuyyNpwp/g1r/MpVwgOs0rTmBtbJGZPrwTwAa34MCn
 ZWzrmt0UhfrcFprwhfmc8GSLnD+3KTRYHNF7hdzdGtxV9k4g2MSDEHyNd2/luvzV37gts7
 QufKU7nFAmzaoIAb6Z3BiGN9CORH5nPqCnn1d2d6dv0OSA6OseKmlkAoa8om/w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:18 +0100
Subject: [PATCH i-g-t v6 39/48] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-39-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=T2p2V7hYzh2KMea4q9Yc0/EkYmrXLKFL8wt/5FNTZRM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWTD+HGRaqrkhVujexNOlas1zPTo+TauZUmr
 XLVLjb6nwCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI4Wg//QflHiCBHe2j15jLNPn0RQq2xJeI5LfQ
 upQBsyqN3xod5BG8ZoIWYvII+Np+FM73F/15xosme0SkZy9SLgHczPKtHvvnXVyX8sd0Nxb4/cy
 xWaAXMfcKeEkSWSzdyl7P7iNgKR4pgXYvPNv3RZxsBuV99gz0z/iizJ875qLj7PvEmaIeEOhMJP
 auIwHYm7ANqCG7gqiJmswKmLiAEu9Zxdve68NUKa0pryRATgIqjkyfRxvRaUXcdPLHKHhpaIQ54
 uvkxCTab4m7sHXccAwBGB747wXtorKvZc9SP1If6a/D/TrhshoKs3cFrguMjghGQwSYrdPnCCu0
 SonLDADeEwp7DyAW3+1om5ptvyxux+/NxBVDh9kDH9oSX0q5TRYkzu123R3xX8YZIFO0AJG66/t
 XqfBzOmtArCNBjFBhTDOkfl3n6GhkTdzwOKKNBLPOZemX6ZpZEgpNENDZFGEodVZDkkBXT6cRic
 iIDBzET6aepDVC2HgBwgDwQM5yIWV600i6Lzj3nzZ02e9ASgyhC3gMZ12WM9xHr+qRTRP8raIkU
 8YG1ad32Eu8snyQZYZfZb4NBMwL65j0ho3RENByvNfxKop60lQNzgccL91GzrJDYjdjJojggLyb
 +QE7UhiGgQpy83aIgVu6HOxFR58f5qMvTNRIyZnsf+JT81OKeSvc=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 219f3d29e362..53caf3fa7716 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -101,7 +101,9 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max link rate from %s\n", buf);
+
 	return ret;
 }
 
@@ -123,7 +125,9 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max lane count from %s\n", buf);
+
 	return ret;
 }
 
@@ -230,7 +234,10 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
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
 
@@ -251,7 +258,10 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
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

