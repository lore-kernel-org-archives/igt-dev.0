Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD03C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4010E54A;
	Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="baVqF8d/";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208BC10E547
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:32:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DE559C8263
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C4E4C000A;
 Wed, 28 Aug 2024 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKS7cP2oNg4pxOluomDhPn6jsm7xMxknRLaLD+iDXy8=;
 b=baVqF8d/4WyBbUBuhEtn7ASHgmKrzV7K34v0a9sfLmJG+gV5aCzepns94/9x+g4LZH/ES9
 K/QlbPAmDgYQFjUtsHzM4TW+1wwDvH1Ww5vdnZ7WA2LuHT5Wl5Xu1nyTNVKlujjsTqYQSe
 qnqzRlaCxF4dH8jP0kANnbTrv0Wp+ck8FTyeX57A3plpUtpmMovFhUQJGnmjELC82sOT+A
 buDuU6kuG/E5/QzbFCSfBGhEWnPqVIudDNt7cCmzhxacNwfSZjF6Yjpeqs6Nf7eWv1j/vP
 blbVAi89JTjp+Bky673Pwz826uqoXz4sKgFRI8f++0+k4O52To28VRk+/oNaSQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 16:31:54 +0200
Subject: [PATCH i-g-t 5/5] lib/igt_kms: Add function to get valid pipe for
 specific output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-5-d6e21b1e5d04@bootlin.com>
References: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
In-Reply-To: <20240828-b4-cv3-01-igt-kms-v1-0-d6e21b1e5d04@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uZC/RQzMD15EYb7JWS2zBZW8SkWReBT5cmFsBRRYo8g=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZ56H1eKMvCt1Yn23f4Fy97Xx2MM/BbfPN3
 tOa6DIzEP6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4uH/EADOpVMEU8hrSytkoVdSVJ97wNe/dwVWyu+YmQK60CD55n6r0sjVflRkFrn8w2JerkcIQ1w
 zEw1n2Wce+ICCdiIVEFHB11HnUcadoTtpkYwQWtivxQfg633n7ZGDGrYu6NaxjgCcAIv2JWOIxG
 Gp0ISZE1SyKNNE0qUGhrA6XNUyTx804Y1gQIPDW01efhvS5wMeQhqS1Epb+v/jAnZTPYRVQTjp9
 hByWL/mwGPTqL8QzZTgxb2KmOrhufL0/ThNwHHLZgj9J+WT9n6BnAJu5OoDJK0vcXXtz2wgrIDH
 lQnr5jxADXWzGbS92ktxHp1LMBAQG/fmADSlkrplR0Kim7GbyW3+1TEwjGCVj08vJvuHZqX7Ckv
 Q1FN6PwCyNuUZtcE+RjJjOA0oIemWksRFqdvRrQufu2s3l9aMP+4Dm5nXfcIB0yf4QrCFlx5AMm
 S6Pkw/MJnDozTJfxHGNub36DpjvikIO0O/CUKh4asIMyb0hlqpWVqLeMmhws80nQXsnIRLffXNp
 ZFn6u+InsV6/6HRmazNw+gI2YzNRj0lR+JSQ5ZvGA+8apQExX4h+wvY5jK8V9y7j3pbEVrBbUOc
 P2K7v22f6snqeQljBpF95NKuEWyDrqX2dshxPyAQdCJemXrYjGzRQ2/jQ/VTUXUggnmXtQ+jJEy
 0PzIC0b9OwXsC5Q==
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
index 45587a4bb9e6..d9dafe7ef24c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6918,3 +6918,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
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
index 0b7dc7e9a3ed..e2ad4af8439a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1240,5 +1240,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

