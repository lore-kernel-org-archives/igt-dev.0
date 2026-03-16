Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1107FF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAA010E25E;
	Mon, 16 Mar 2026 10:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hZDu8WSL";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998A010E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8B3521A2E28
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61C7A5FC4A;
 Mon, 16 Mar 2026 10:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AA0810369F2E; Mon, 16 Mar 2026 11:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E0jfLMRFfHQEWChydSeZRJsrsa0fo0QW+ATj3A2xYhQ=;
 b=hZDu8WSL9X1xKJwPwMO/37UAd3WfYFq+R+wYpdWHVs8+tll6lhO9z+rbARlVrpyF+rfkmQ
 iBVtHSQtEmgZ8GT5wUe6dOqf+KT7/5k00GLUTfzVJEG1BN81HG6lxZW5yKxYPMM5t3sEmP
 D4jdNXItT2LMt206kv2S6db3ifLyVJhN8IdAXTssoOFeT92T5DnCJymKTiyIBrC4TBtTCt
 kYUnJYYIIUV4nllwRIIffEpGK7InC1R6l9PBsfZI7M3wY/+ZJqLCacvtrANJZ4Okciolfu
 oT4HuXUT64V3qjRYi9h7ZZ3Nas2SegG6M4RMj/pTz70TDE4mSO8HgReVq8t6Vg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:21 +0100
Subject: [PATCH i-g-t v8 13/49] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-13-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Qs3TO86JT4LfvE+hJvoqDPdSs4D6kkSYfEFxNnJ2dGk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pQaIrvBC3ubqkAPIrgVt9VInGp9i/56Hi7K
 FwJO5NUN9uJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKJJA/+ONwkUrCsNRV/JkHpoF5cHfRN3hyI2kz
 bZv6fYMHrhLd3LbDc3WmKDA0AsoFlbfPSOkwxrVDEq05F5bMapMSN095y6cWeAkCyOfcqtCAkKq
 TFGvslbYJxR64VgL6egWhdID9GDkI5wxEYO4/5t45/ZC0sh6dYrCsSzpDfZg2WL+xZcs8yECS79
 SMAZwm6zKhIqKAnq/iMAsSq5y8iAZkB8kgkSIJn13iLOaHlHT6+0R/Gpj2Y3IQ0dJo8Z6k45jTv
 h3Sr95q+pVnzuPOOF35AIKmnfCATqMrQ5/TtICMBaFAdOfaBtQuIVbtXupuLmptkPuxX2IMkU9E
 Dl5jX9PPCWCCymI5U7Ld0PyyzE+QD2TRfanZtZobVNTIMUE1xOm6h5VObPNuPztnQzIOS96kKjq
 sLWGCwrkzoPDwvZKd4OexoED/Nm5/N9+qcjH/5VZO8zK/3BX7Cu/60zUrylH2rNplo7ukh8v4/Y
 xuh1nPgDP+X956beGxZI6MRtGocADG/fP64UFm9cMBNmcbxEacEIM6pgArvYAlqa49VZCAO6kMH
 czVdhocf5wLHtTk/NKAJ+AYXiBV5cM4dfTn9trzHkZBvXZy/sTiiXhFZb1fby1R9LEIC/WnkOTN
 lR42bSdtdKt7dGUkZeSrCNiqfywPlLMQBipmOHCyXTsyMKNuXgRQ=
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_amd.c | 2 +-
 lib/igt_amd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 3ddb5f40374e..081bad411355 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -831,7 +831,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
  * values of "Current", "Verified", "Reported", and "Preferred", respectively.
  */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread)
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
 	int fd, ret;
 	char buf[101];
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index bce4657cbcfd..217ee6dcbd02 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -210,7 +210,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
 
 /* IGT link helper functions */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread);
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread);
 void igt_amd_write_link_settings(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	enum dc_link_rate link_rate, enum dc_link_training_type training_type);

-- 
2.52.0

