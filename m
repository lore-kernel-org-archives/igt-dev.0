Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8229AC5B54A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D3410E549;
	Wed, 28 Aug 2024 14:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gy9OrEZQ";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426D10E543
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8B6D6C8263
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 351F7C0007;
 Wed, 28 Aug 2024 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLTkOS42PKnnzhY7ARJuNo2lbyHXJcpAA2ZJ3v0Fym8=;
 b=gy9OrEZQh4IXOS/E+q7CwkeGvEyeZyzkF9Sqlqy08xLRdGaUoiC2q2sjf+6SfdRCYuuWTP
 QPC1QQPPsZNDtfpZNa2tpqbYMcsOaO8KxswHpetcgOAR6lquowTwhicqa9pYMFij1r6mks
 z4uI2LBO7QLauc/hIOS6CjPSJjYM96e8VibLMo1zuVzyQmqJYeanbqNaAmbYPk8yVs+dnM
 dnLSTtUQYbb3YGiVKgDZET1tIY6kUlntk/69pQNMQ3F8Qk5v1CoIsepR9BpHJOEY+jnQX6
 ddx/l2Ep45oG91/yx4/ZGXdUuBsmblnGmUhWmB2k4CelDYB/AtHrTyAgSkDyHA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 16:31:51 +0200
Subject: [PATCH i-g-t 2/5] lib/igt_kms: Add helper to wait for a specific
 status on a connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-2-d6e21b1e5d04@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=feB2V4b4tHFc8aYSfUVLZJTFu+Ld/Yry9SUhdLkASTk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZJPxu+QIadjFJwQ+xgTF5m6gUi6FSCySCo
 nzOmvqcTeyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4sBUEACI2udKeHsQLueDuJNpc6fqKJw2+ko6HvQHftOt1uvAuA4HdocKX3OBPw/MrBnuWIS1p/y
 hKh9Y80O5e9rqENp6zN5NWWjL36YqdInU+M3AGUAYRyfZMmwlztCvZ3S/8WYVIcRuodtlYd70tq
 Z9sERddjk/+aCcNxLwUagIf+Wian8x6lc9RpPyJnfdQAzJDCPMDjVpbQopZZ9WVP/P5Nsff247J
 8j6QH5dsgTt9MA+c7A+fvEM2RHY0byTX4a3yvjzj5Hjy3f+xpmN6IBIcpbaSqJ4DZ48Pqo+YIbM
 YAm0g0yK4f8xPMzwy9rGPL9G6p9+D652Z4dIWsgqA7CHx30y0HvnYCr50ywRC/3em5+AoVVbPf5
 5YrOXpyVwBdYe6u/U27B6yrh3lHtvwqaNlOuBW/mELD/1oriZ7wTEdVOeZYBliXM/FMrNAyX+ME
 U/sLUfPi+rbOCXWQ4BFuPwhL2plUtzXZlpSzY3GSuvIDinZ4Zx2LLxAZ5ZdSGbF//M8EgHDCC0d
 CAVW8kVKQz7wmKeT08PYZPi6ghwYY34IBhSk3VxHiI2rvkc4uJcrc1tbduBuE2WVsZEy4XjTroB
 g+fK/40aWD+tgP37KPrm2WJhAf7Kh3zYLrrdxDjmYihthxnVKqiHzqDuO3HdrNXT+P9KyWRLNeX
 3vIKzWvIW47uatA==
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

During testing with chamelium, it is frequent to wait for a specific
connector status. This new helper is polling the DRM API to wait for this
status. This allows detecting new status without notifier systems (which
can fail if hot plug detection is not working properly on the device under
test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d78b239c3bd7..b1d937b4d91e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6729,3 +6729,41 @@ float igt_default_detect_timeout(void)
 
 	return timeout;
 }
+
+/**
+ * igt_wait_for_connector_status - Wait for at most @timeout that the connector @connector_id
+ * status become @drm_mode
+ *
+ * @drm_fd: drm file descriptor
+ * @connector_id: connector to monitor
+ * @timeout: maximum duration to wait, in second
+ * @drm_mode: mode to wait for, see enum drmModeConnection
+ *
+ * Returns: true when the status is reached, false if there is a timeout
+ */
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	if (timeout == 0.0)
+		timeout = igt_default_detect_timeout();
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+
+	while (igt_time_elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector && connector->connection == drm_mode) {
+			free(connector);
+			return true;
+		}
+		free(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e4a64cb19322..33f663d54463 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1234,4 +1234,7 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe);
 
 float igt_default_detect_timeout(void);
 
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

