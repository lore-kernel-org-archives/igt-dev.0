Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F47F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BDB10E26A;
	Mon, 16 Mar 2026 10:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uyxdombv";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3CE10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1753EC415A5;
 Mon, 16 Mar 2026 10:24:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FBF75FC4A;
 Mon, 16 Mar 2026 10:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A624910369E83; Mon, 16 Mar 2026 11:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3EbGKJKrKUuurLVp+7tB8Q5lX6A0R90zcFIBJqRPfvI=;
 b=Uyxdombv1g8/zA0YNCs61U60Y3yT4ZhfumuIwktaHLXKD70oEiX2bPClyV16pvYzbng8LP
 +Qhuy0dr1gl4F01RJkgdJlhZy5gH5z4Pl6zxNkOy+HAxcknXG4jIrsTjQAQgHDhAUTd5eB
 umPVKtombbEOjHOxRSS/6KeLPiFSdyZpqAZSPRr6m5kfNXMwhP0dmf1wM9kSiTgHWQVG3m
 We4EkNkXI3OShoEWRSvPNddkhV7zkpBGHN/Ac8cO4FHfp270AAq5Gic/e4GKx4tmQRUChv
 mU4ko4yqsCeAfQgaWYANGae2i9iP7NvPVMzXZtTHqGCRyou5OdQ7805HEa7Mag==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:43 +0100
Subject: [PATCH i-g-t v8 35/49] lib/unigraf: Add helper to check timings
 received by unigraf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-35-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2cBzXqk90tyqprreOeCwZtAFKVdu1J+7vwkfQjKFSY4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pTVzcjEUHPzMUTOhXpb+N3QzpcZtHRMz1gK
 brqz3cTLEuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKgQQ//emy0BQJi5iE+cu+NtnVKIfHwru1T0Cw
 UP6DLCBm8BvjEYqsUYqIPzaYbWnr0PUW2LRSOPCe9xJEzGVOKeulNorW64xnKfNhQMb2h2yWuh9
 jcOmELIj/A0RxwZcJaUBbdC2r43te+3EDpW2GCLxZUaegxB12vnSTpilzS8zWKWsBnoW1Wb91Zg
 Iyiha4RuWbjgfCPFKQrc140LqKn2oe4eVqFHzISdW7+FZ9hqEYo3YJPdQDO6uIOe734MRaHMJa7
 rXmBFwPynqEz2OtZm4+L7HGkdfgiQMX0zoRjyn8lv8aA+Lk5KfLZMUNY/uoYgTpuugyKiIQoTs7
 VWLNh+ND7kSA0B5YyncS8t5AzRqQYbYsBOQ8oogAd3xLVgLmIZkES8tRs612Z1Ek1PXcR7WSxWN
 g3GuJEqm62HKwxvFX/V/iNp6JvS3jR6Npdfa+tJRcLN0uq8B5fkAhdtfnMR3j4QPSRkpvXKwE8j
 w1Khyc7vw616gebSA1MhR5DbhL5p+u1wUBTunHZm55OrB8FYefCUAM+5x4qm+fcrC7dBea8ZamL
 oHcYjb8Vl4VUIBX1qC6QcZXDYpUiLvtbpXAuMdrq3N8NEVyx21NWM97GWVv7tBrZh4jvkUDCHx7
 bKzo6XlofGb1BkIh9xefPgcmefCYLBtGB8s7SX7gYLRitHSrcsfk=
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

Unigraf device can check that some input video parameters.
Add a function to compare a mode with the actual signal
received by the unigraf.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 35 +++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6d192ffe36b5..3970c1071cc8 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -748,3 +748,38 @@ bool unigraf_use_crc(void)
 {
 	return unigraf_crc;
 }
+
+static void unigraf_read_msa(void)
+{
+	uint32_t data = 1;
+
+	unigraf_write_u32(TSI_DPRX_MSA_COMMAND_W, data);
+}
+
+/**
+ * unigraf_assert_stream_timings() - Assert that the received stream on unigraf
+ * matches the mode_info
+ * @stream: Stream id on the unigraf
+ * @mode_info: Mode to compare with
+ */
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
+{
+	uint32_t stream_count;
+
+	igt_assert(mode_info);
+
+	unigraf_read_msa();
+	stream_count = unigraf_read_u32(TSI_DPRX_MSA_STREAM_COUNT_R);
+	igt_assert_lt(stream, stream_count);
+	unigraf_write_u32(TSI_DPRX_MSA_STREAM_SELECT, stream);
+	igt_assert_eq(mode_info->htotal, unigraf_read_u32(TSI_DPRX_MSA_HTOTAL_R));
+	igt_assert_eq(mode_info->vtotal, unigraf_read_u32(TSI_DPRX_MSA_VTOTAL_R));
+	igt_assert_eq(mode_info->hdisplay, unigraf_read_u32(TSI_DPRX_MSA_HACTIVE_R));
+	igt_assert_eq(mode_info->vdisplay, unigraf_read_u32(TSI_DPRX_MSA_VACTIVE_R));
+	igt_assert_eq(mode_info->hsync_end - mode_info->hsync_start,
+		      unigraf_read_u32(TSI_DPRX_MSA_HSYNC_WIDTH_R));
+	igt_assert_eq(mode_info->vsync_end - mode_info->vsync_start,
+		      unigraf_read_u32(TSI_DPRX_MSA_VSYNC_WIDTH_R));
+	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
+	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 0ed6d1eb2713..65f00c8d4948 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -78,4 +78,6 @@ bool unigraf_use_crc(void);
 
 int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
+void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
+
 #endif // UNIGRAF_H

-- 
2.52.0

