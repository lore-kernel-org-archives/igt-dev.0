Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8162C5AE5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7616A10E547;
	Wed, 28 Aug 2024 14:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C5t/Qv9I";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA2A10E547
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:32:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4F373C821B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F01D4C000B;
 Wed, 28 Aug 2024 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0a84+1jH0MypGxyOyANVQNwR62ada2zVJNrb/QRf+M=;
 b=C5t/Qv9IRvT2LJEdjZVqNgc8fQ7yuem2yGco1M3pYQ0GhJ3yPf80gmxm6jeaFlKGXsfATx
 QazwM4QBsYtlyH5mL7Z3mgCG6AtbR/RTVxPuIJ3qlwfgohiSPXywBC1GkprPDlEAbPcYcu
 lrn4cRT7MzC5HWOWhtC/wa+6B5UclAcfRxNjZPYICnRrCsADEErE6rSIEh02SVauhmP8wX
 cQ0G1rrvI+EGT8WLrpiDIbH4RczJdr9utcjpMpisE99FdaG9qRnVqQBuv9LVIJn3wPF5t9
 DqmDlkuxs2ITnfI3a0rOlnC1aIepVlipJOIoZbtP7F7lCdnY8L/dizNVrF+zpg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 16:31:52 +0200
Subject: [PATCH i-g-t 3/5] lib/igt_kms: Add function to list connected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-01-igt-kms-v1-3-d6e21b1e5d04@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3Os+mDyEOYPyop2ySq+RqGFYCswLOQoHzNvM0gkB38M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzzTZaBKPf8/sx8DhsBsrVOhbY669NLX359C3p
 9MhtlNzPcKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs802QAKCRAgrS7GWxAs
 4sQWD/9627vUZMKhCVBXM83ZAQeGbhIwMKUyRp5cyeqbuzEpHlqZHWT1s/1maxrcyYx3W3TYT4a
 hZpkxyjtH7eTIcJyR5HSuGw1e4fr8B+E/ER29ErmWLDElkoZDqTOPV9d3yHcTt+72UBADpU4YTg
 NapUhbSQ27wy9JRTrxpo1CdGh23OeCDlJcmW4HgaTJyKK5EyNVxU/OKXzHR6xOZHxsE1C9m6s4m
 XfBJbkxtOzMp/zPNe8NjXhLcHLgfQ5ySSEVNdBkoWU43cgNn7tG6iLjkFJVcjkslPu+plY8JlMb
 6Wm2UVsaBqxHZCkwdIcfNvW723DggkA+G9opl6ywg0UV1ZkxX3WYc74YEvXx8Sum8jhl2fPtJ7k
 l4YziBvG9EL9GC3/BfQG9oYjWqycdhSdEiwxzG0ghFNWgQI55ZJcadcAi9XeXuzCw/S4FxoIlpN
 NMCsZicLIdWKmTcXZyhsAK7C/ckGR/6K4U+ZtpLFKqPG9rM81sACekeWPjCrOvdiKcnd40D3uMB
 1Q93qz2BltRjqZh4fUc/SAkCkhfP7hk08yk1QPhJW38TC9LDvvtTnAd2CoTMbPBbXGKTqEdnL6i
 lYKAGGjuZ/iX1z8scLgOCts5FyW1kN4GsxNuyRP6ix0m56bq+EJOoA1C+Ck6cm6jH8pKiwd1mVq
 Z9WFzsA89hRSeDQ==
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

Introduce the igt_get_connected_connectors() function, which returns a
list of connector IDs that are currently connected according to DRM.

This function includes a timeout mechanism because connectors can be
unplugged at any time. Also, especially with MST, the connector can be
listed by drmModeGetResources() but not yet accessible with
drmModeGetConnector().

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b1d937b4d91e..d4fe4ee7ae4a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6767,3 +6767,57 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
 		  connector_id);
 	return false;
 }
+
+/**
+ * igt_get_connected_connectors - List all connectors reported as CONNECTED by DRM.
+ *
+ * @drm_fd: DRM file description
+ * @connector_ids: out pointer for the list of connector ids connected. It must be freed by the
+ * caller.
+ *
+ * The returns value is the number of connectors
+ */
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
+{
+	int connected_count = 0;
+	drmModeResPtr resources;
+	struct timespec start, end;
+
+	*connector_ids = malloc(0);
+
+	resources = drmModeGetResources(drm_fd);
+	for (int j = 0; j < resources->count_connectors; j++) {
+		drmModeConnectorPtr connector = NULL;
+
+		connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
+		/*
+		 * This time is required as sometimes some id in the connector list are not totally
+		 * ready or can disappear
+		 */
+		clock_gettime(CLOCK_MONOTONIC, &start);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+		while (!connector &&
+		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
+			clock_gettime(CLOCK_MONOTONIC, &end);
+		}
+
+		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
+			igt_assert(connector);
+
+			if (connector->connection == DRM_MODE_CONNECTED) {
+				*connector_ids = reallocarray(*connector_ids,
+							      connected_count
+							      + 1, sizeof(**connector_ids));
+				igt_assert(*connector_ids);
+				(*connector_ids)[connected_count] = resources->connectors[j];
+				connected_count++;
+			}
+			drmModeFreeConnector(connector);
+		}
+	}
+	drmModeFreeResources(resources);
+
+	return
+	    connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 33f663d54463..b3ff0cdda36f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1236,5 +1236,6 @@ float igt_default_detect_timeout(void);
 
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
+int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

