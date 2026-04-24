Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C94FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59888961D;
	Fri, 24 Apr 2026 16:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Nj1WLdga";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27378961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8B470C5EF2E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8BBF604EB;
 Fri, 24 Apr 2026 16:55:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE1F810720A37; 
 Fri, 24 Apr 2026 18:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8jD7mDYsio1QyF/8b3iArLHG4MQPbvPG1yoHl84Kv1w=;
 b=Nj1WLdga8usxdqG3U1p2gsyGHmxtufSLWOFIZqPQEze4fYLcBhUVvwU+3zsDwx+AF43lH2
 53iS6QHmxyVaCekDB9I8sygOYXO3FJbUb+Q1TIHmUoN5PBHX5p5+mUhTvBYR2Qp704X6dF
 Abs6LO+sWWZbPwoiK+B2ESeRn4dOVQarHjk0/MJs/Ra54wf8mSZ7kVRMcZQ9fHQKK7YGoL
 m5SOpt4ZzpQqn59bbsBY06ZKB08NWAmCaVxw3Bny62Sn83idN3m/GV0h7+IhiEZe0JmYFt
 u9e1LT8oEo0xZOfbV8eqYE/AsFNtdwvXV/diQeqq40IiGaDWxPzpJAIj8FiFMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:15 +0200
Subject: [PATCH i-g-t v11 40/49] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-40-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
2.54.0

