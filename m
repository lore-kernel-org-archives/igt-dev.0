Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6716F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66310E29A;
	Mon, 16 Mar 2026 16:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T+kxqKUX";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B7110E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EAB811A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5AB55FC4A;
 Mon, 16 Mar 2026 16:23:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A931910372214; Mon, 16 Mar 2026 17:23:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ut7zgJE/QeWFD4jXuLHpR/EX9K/taIAI/b+81poMTsw=;
 b=T+kxqKUXU2gWKk7oCBjsazQ1Rx++VbVd4/b90tb8L4ybQLdxyg4dhF5+YHczD7ec/n3CyV
 2uzzvXUKnmemvNzk61EsG9lRQoDhq2+bqnDexFnuAbLJnJiyvTScPc3vF1RIrI76izd6Zv
 kEQ0/K69P1SKOwyTl9/PigX70fhnFAsyjGeFpa/xM2vHHZ6MwXst13WikdXWp805FPydum
 jWGkQG39OB4p7XgMJsz6PvYUhyJCsXGASnXjkf2KFum2PlT2bdX66u896YmmDpWuhAtcYq
 eLtFRfnJeRYI948q9gb3SB+vRw4k9uRMBY4TwNihReATCM+Kg4cK+vgIUGs4aA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:01 +0100
Subject: [PATCH i-g-t v9 40/49] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-40-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mlKgRgQnpCjaAe1Ok2WZixIqI7lbdNRvI4o8c9Q8MH4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6OXDS2F1h17g7yQIdED0Lj+Vzc64+Jc2+ah
 E/PTQMDBz2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJYKRAArFWI/K5TiGPWpPeALBXDKqJMfJNJv+8
 eGnalg19o/ChhUCwCn2OBDx8uzLfo3Slo47LKWGCbkcrVNGu2tCvwatApoRtRlhSWpI7t02s7aZ
 2WZWPxb03vZiUo163odVuIG4IlM5WjOt3P7zGaM4WifmUjyFV/9vCBuFDNtne58T8BShMfyq3XK
 lHkIjMyGmVFgeq8G4grDtr6Xunnp+oHgmwJksQ0r6lKsUQZev/HRamojUEK1DvKWkXEPy8NSVQo
 5keYJSr0WL7OCt6ivDtIvd1+SrJhPZNYGx5uq/rCGSGfwaLa0fsXsMigvBiqk1ITfjL9aJC05Fk
 4rH+uDbxsG0W2vbLiyTN732rSyYda2/W1HguSLzFyVhFidPOa8aFjUdEP5jk46EC9iPoZB0c4n9
 1FcHResyanbq4KYiZsd8qi0XJKCwKVtDDrFmF0qWPFmcBYPIuSvZodxPZFcbtvymiCaR1ICLP/e
 /a68CuhjcCV+aUOu50MS+I+oQiQUJYdwODiUcUWt6QDQDU8qxKdsn8hoARlqZ37mQ6eNbM57esM
 jlJ8QSUjQuROQ551MNbOVGe9udNDYQXlG18sguEdc0Y1wZ9IQaUOYvriwL3Tu6/qt24bGe0E8Jc
 nQFE4rjWZfPy+AsK8ZNahBzOyKnA1I9el0XAHHXIt0j57OnQJkIY=
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

