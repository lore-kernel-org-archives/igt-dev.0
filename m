Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D892FC3DA4B
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2D10E5B2;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Bou0feu5";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAD410E5A6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FAA420012;
 Tue,  9 Jul 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhNHJ9J4xx7gXKTDgECd1PVaiUqutfIKNzAYByyRWTo=;
 b=Bou0feu5CECpn9wIIa7y6q3hPlUXZn3eFkb1psYQSBRvanyUvKzxaQ4eqngmKvywlfWuSF
 a/1OmnCldrEqeQBlV/HgFdle3Pv5IqGGT2QkF6cH8AqqAKvjwRNy/oMGmI3vWPUIDvjF2f
 9c1E5COv/yagbEv8wWn27SHC4QE2smPMRboPPi3ujUEQCaarOfX6A9yLkYnKgGPVLSRTBE
 xYhw7iosdxGGIju1bHnuSwtYiJkfeLJESmGIBxbxcv3Aadu4xflcZQNMhlvekrwe1rjKwt
 JRD3XNiRAg8YNrO+hyQu8K7CpOvSoPBy7SgL5ITLwegVo4e9WdL8R/+P1OtXXg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:21 +0200
Subject: [PATCH i-g-t v2 05/39] lib/igt_kms: Add function to get valid pipe
 for specific output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-5-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VI2y28qRl3Tw7s/vAvA8kxHqymWNiHTmXdkrqVqYIlU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViWckFLEpu2J+h55shqR9SigF3CNRv7MyMkx
 Ux/A49YekKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4juvD/4o/5qe+kgqoxUy5ueUTEJZ3KloeQhyv1Kragw4VM9jeieC/Q9KYmcua6RZesZAIdYm8+N
 UJ1ExBkhztf46/JVaz+MP8Lx1dxXUPZSyi56n8IM6Sbapyd7FSvy9PJNiOuFDsigVvtwkZiDgJl
 amejZVxWUZHmck1VLWcj+bVQ3brS1Mc5+epCgSUUOY5GEF2Xz4dYpl+47whnJQA7DFOm1gQBs7J
 bPlieNJZDEAXJ5mtwPsFit0Nq/spkI4MwZU5Xvz+jgnSphgP/P8nHS3dSFEgNSP65D4IL3tF4bU
 8gQiEaqdka/hHwLVyXvhXwFx+dDWHlGinRn17Ni/nw2WcxZ9I9N3vDRGB87d+Xc0OviQO7x+sLa
 7Vzrs7f2aw4dR64kiwi+qf9/qqQp+ocgWyRkIK5mmMDIyUr87zwhOiz4ukp/VS5JYDOkun/t9Cy
 svuYsSEK/ezaHJWO/1BZ6iTHLrwRAVy4Y36Gaf6SSonNGxZF3WWfECGvgQO0tFAAn8tCBZSFQs8
 zGN+N3ek1smT264yaz7QZmXaza7aJ8PL1SzbVAnBBzzBUxJnZEdeI6A56rDnqoQ1M75m4GXsHQN
 MeiP5OHSWDwlS2OirlaUoHtFqKta9xNBI+/PExO9Fa0ubs4h6Ct2I4u80kKxDqS1ToqWShCZUIU
 /ytW1AxHxTEg6iQ==
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

Introduces a new function igt_get_pipe_for_output in igt_kms. The function
is designed to retrieve a valid pipe for a specific output in a display.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9669b5004e39..45e0eec72d12 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6875,3 +6875,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 	drmModeFreeResources(res);
 	return 0;
 }
+
+/**
+ * igt_get_pipe_for_output - Get a valid pipe for a specific output
+ * @display: display to fetch the pipes
+ * @output: output to use
+ */
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if ((igt_output_is_connected((output)) &&
+		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))
+			return pipe;
+	}
+
+	igt_assert_f(false, "No pipe found for output %s\n", igt_output_name(output));
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a7c80372ec6b..bfa1ca41e5a4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1239,5 +1239,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

