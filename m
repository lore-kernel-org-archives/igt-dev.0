Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B97F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD610E292;
	Mon, 16 Mar 2026 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e6yDdKxE";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F264F10E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7C57DC55045
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7FDC5FC4A;
 Mon, 16 Mar 2026 16:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86E62103721F9; Mon, 16 Mar 2026 17:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678235; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NxipDSJdLUtNQgCIvq18oms8AUvYxa/HjM6xPcdiHfs=;
 b=e6yDdKxEO2iMIPVf73oQGEhvndIgudRPLN7ixSmiA5mBT71c38a6S60z9POzgQDzIIHAlH
 9YipSr/KvuTWDOeUJohHrZFXvOAUPsKdnI9qNF+jY1d0DhcEv3nNbmPBT1OQ35iuiF1WHm
 T9C9kctw1Q40SPiXK7499XjgWAxhbsRjAPRBOh8MnNFgwJXnSRnUUEUejQdk0jyicvYPL3
 QiRoVh5A6cSwcgVnJuw88I6IHXC9tKNQ9oXynrhr1NMOiCJ0XW48UUOMtiSZjbu7eOgqvE
 ZCy9ncpbUHoBlzUUXkTf0t1b8nvTHL/Lh9+X4ocDJsx8IDYE/dwck6E9IyhgLA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:05 +0100
Subject: [PATCH i-g-t v9 44/49] lib/igt_kms: Add helper to get a CRTC from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-44-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EmtlCOcOLwxG3gn0a/PLOFtA2Duc2BodrtE1TOMMV0s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6PlSmPbypYaiK/Bft24oF+rS8V7JTswaVFp
 justIw4DeeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJHXxAAr5wVX2Sck/zq5C+aExs/RtO+8KZn8MM
 l7uP80Kxqd2AaoCndq2TZVYz0gO7vwujbLyeBVAjbuIwXNfF9Pipkd5p5BEd2q9Ik9UQTkDS7UC
 nSrT4Q0H1AY/BYnNkdVruxfv4VbsSKseAdPoYbu+KiBTla9pFw87SZYlvBh7AbZYFdJNFDrxYx/
 pRW1aWJG2nuObMqpzT2Eu+sir4aOICZVXvfEwAVUV66NaQld81rk2ILQuunol+YtWXrsly/BoQ8
 fb46gfwtkHFxCdXrQN93CmLX5UQfmQKYAkePqVE/LyI1xpZZr+Te5NxwUsZYvgCMxrduuLPmOoP
 gfmM3ZOGxrTzI1I3F5MPtHLG7rHcrA18fAjEGOUSQsDnLN/hdaBkAfkaZeCn9vB7HDDj9IKDfIO
 egw+7SB7zjQx4Qq3VVPsYFAdOeQ543XH/CeAIoe+HRp5QwSuUS55uk6fOGiq+/qf1Hqm9abYjEJ
 Z41FpU6bnY9ZBvAbbGov4jc2CsA4rycxn00GYhMe4TU/kt/MYpxdwRxOLTsQLqP9lHPXquIrayA
 5pw7LFrT6TT5JwijQ3VTx28YRyDftOXpp1qThTxN3EJfzQeDULUHu4P2x7VxBfq1wvKahmAAXPW
 nQzicuB1Qo0J47mZ0g2FRGoLC+zb8w9+TTY3nqw6q1bWIvW2RDIw=
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

Grabbing a valid CRTC from a specific output is useful when testing
the output.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 20 ++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 81d5077b3acc..d3ab26576313 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8090,3 +8090,23 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
 }
+
+/**
+ * igt_get_crtc_for_output:
+ * @display: display to fetch the CRTC
+ * @output: output to use
+ *
+ * Get a valid CRTC for a specific output. The return value is the first valid CRTC for a
+ * specific output.
+ */
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc)
+		if (igt_crtc_connector_valid(crtc, output))
+			return crtc;
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 042fac6b21b0..af27e8fcad4e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1311,5 +1311,7 @@ get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b
 	       uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

