Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA87C02181
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA30F10F151;
	Fri, 10 Jan 2025 17:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LP6A0RNq";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE37310F14F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 59C81C4D0C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B54CF4000F;
 Fri, 10 Jan 2025 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUuyfPE6UD7qaDnZXvlFSoJNazlbzUi8vuaHwSSXAkI=;
 b=LP6A0RNqOngJpa73SdJRpRcZPCftHPLLEEBXsq38tFqT3D57AtvaseNq2rtCvnk1EblT1G
 SbJuxyNKE8q2HDwvzR8wvNzrBpjBIWXU8QHTysGkA2jBZRiFOcYRlgFhrwL8HJa/ROHv97
 VEmPN2grbzVuqD0GbMvp8n4bHgGoQQd3N0WuhxVIHlQdNDxYsFWaDND7Jq1X4kVTwXjRVS
 sH7LY2gjgNVUeA2Qvd0wV2DD0dls5p04CrdY9OLehFBQXHW6QZM3Hz07hHnBMSAVnSkLKf
 UF446VHqhZ8LOKPs2w3TVg0qNXX+NEMQvfOfqi+5Mcpt0ITP6ot01dy27FTeJg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 18:42:54 +0100
Subject: [PATCH i-g-t v4 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-5-0b0474708f9f@bootlin.com>
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Q4j+o5HzcMTcawUZ/t3YcAhW3Gxu/RPNvEAWQlt5NNY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVwf4bKK9VbL0cVBtVxG1FdE+kUjG6CF2SCFS
 XLa4tKiaKiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHwAKCRAgrS7GWxAs
 4nFIEACHKpMUSDM7wRZhAIg8NVfG8BleFi3vprG8SbgYdKbuD2o8O+iv3jMekmnokFFpfbF5nTO
 EaC9HQ/vy6g7j6rOw6yH/RQuHBmLyYMl0fQbbcT4w2RuFWoWM6D6F/oGwk3GuaKLLv/s978dWMy
 rZke+DsLKZPwnRL4btBqaiqrihj3rHHKn2Z6X9rzkNbvAHlaAmbj9NhO7vrBPxICtH7Vu+00Di7
 tS210BUOg2r3zEnfZv5K0RCf8LidcB4OOWLan7qBlMNuoOAZAC5cGdppTYq3kPRW9Fcp9gFJCHi
 Q5PUQs2IMAtEQCCSCG7bdxSAFQzaR6Q9IqzZfvKPSrn7xnIVgcKEz2tozgonQh8WUvhw5O49MCG
 04Kw5SFZZoxK642Ad9HcAgOtdnAbTpi6ybvKGAG5dDfRZuY3SGYu8iGxww/8ieGkKSZDs+gNLDH
 Ggcppsje3HFCZbhyiGCOOsdQZPobo3138TKIvRQ+MV030HReXYbDido2OqBUrY8b1h1DjIxVNxR
 AGcm6NHJ81t+5h5WvCQICc5TWHadWpjks/seKI8PUpKi36D3rSPsf4knbVFnfLVv0iXpFYBNECr
 dGjx4M+8ruGMS5VKE3IuQig8g4gqGHrIkOKuk/QryqGATDK+qqif1XNTZJFNdYPOqn9GnoY/THl
 94M8WVm1S3Txo+Q==
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
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f6d9341b75b4fc8dfa614478cd3bf35510f9ecea..d6cd6833ef24a914da6e0234dd7eea40867df452 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7458,3 +7458,25 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
 	return 0;
 }
+
+/**
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
+		     (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+			return pipe;
+	}
+
+	return PIPE_NONE;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3be9068384aa118461dd090224d15aa5c979ac06..60a90500048dd83620c8a6ed08b70d5ddb020bbc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1285,5 +1285,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.47.1

