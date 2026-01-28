Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B0D25B61
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEBE10E6E2;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N208zys8";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145510E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9969CC211E5;
 Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16A9C6071F;
 Wed, 28 Jan 2026 13:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BBBB119A880E; Wed, 28 Jan 2026 14:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ULsefNOb2S33s3oidG5Mg+FLPkP45k56lH0Vby4faNQ=;
 b=N208zys8dR5v/cLq9DOFYzM8Gx4LjxPPeoln1NCicAI75nPAKm5JImIv9EJ6Ou8cmhd4Pd
 X69L/Yj/qG31qKBh9UzYM1SM3Oj3pnNBldpogYBjnUsW3HyStRkdjWWlsmltgG2Zo2a68v
 YNV8vNU8wWCW/0ruOpAXgDgKGuLp+ESN3Y/UvG0gVUlzaKysiwCu6mQtEYHLcB1INjY1CZ
 IS0sqYfj599DuI2/Zo20wSANpHrgXvBvOEDDvjxaqup32vLMNiGaQJz9jWhdQHhzuMprwb
 uNnPIfDeM7l8yWoa1LHb3Es5u2dPU09lDJX/odNhbt2Q580xZxXNcUpN0VcS0w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:14 +0100
Subject: [PATCH i-g-t v5 43/48] lib/igt_kms: Add helper to get a pipe from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-43-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rnq32GKGsO3h2r5a61IMC9pjMZW3hPDBqWXLcJ+M1Q4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvNd312C1tlwCpsudJo6hgd4hUByVuUQbRyP
 3x+OlZMTeOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLghg/8Dlg2d6guVGyhXIkeJ6QBiM2tDibwCgg
 jq+EX0efuW0i6fMiKMpBd8LorFY8fBuA8hRnjBS9uh8VW95J7QaYulWJeGWY5seRRWDf0AUlkTP
 DvX5DJ1BXEL5UTsdtZ5zTc+IvJ0FBWgJmMdrEOrdpBRP6VpaRO2OrBQY4Mf+UY7CaD2xDu816ld
 R/hcoiIz8DN04b8G9SjMnOy8A4Ji9ZxNofBjGqZCRzZJTdoegBEArfbr/h9UEBfRqpTEysuLeGW
 hn+eHOx2Ku+HnFmaIlrOqgJjm2ZIaqF+qSdBRxR7x6o0Z5hMnEUvTIoixe9NYrgT9ZX9HJvf8SA
 yoa69IiRLswnTyez44/yHUXHZupZF7vCg2Ua8hT3Cx5VtHSQ3iwg22Ro0S7IC29vGGPwMV2OfkU
 55s5EZoE5a5uhevdHeHhkekwpB5YXSj7FiwxTIOD2Dr0GJkPJz/iNF65UAK+hDIKYMf6Q+yHO+a
 hnp2mPdKmzb7unU3fKMuvcHwjoYfF6eCa6WlkAUI1u+WnTOtO1DrMuyMeCC4sEmgsU0JTlLMNVZ
 +c1e6yFPM4e4Gsmbfn0U7vpxIdaKMbwBWm9sEYkr4lqJVXWQutnEHAdjZXmu2we6owUSEiFsDCS
 lLC8wiXMrHfpkYT1lOyq0pw19D4p3N8Ogmw3FRR9ztwc+GRCIhIE=
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

Grabbing a valid pipe from a specific output is useful when testing
the output.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dfd83e295491..e1ee7430d62b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8005,3 +8005,25 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
 }
+
+/*
+ * igt_get_pipe_for_output:
+ * @display: display to fetch the pipes
+ * @output: output to use
+ *
+ * Get a valid pipe for a specific output. The return value is the pipe first valid pipe for a
+ * specific output.
+ */
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if (igt_output_is_connected(output) &&
+		    (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+			return pipe;
+	}
+
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b43aaf62ab52..7785c3b78bc1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1322,5 +1322,7 @@ get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, in
 	      uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

