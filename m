Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E10BF53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96C710E3B3;
	Mon, 16 Mar 2026 16:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KZwSbDLO";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846C10E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 730C9C55049
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE4125FC4A;
 Mon, 16 Mar 2026 16:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CA03F1037220D; Mon, 16 Mar 2026 17:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yK7Lovs+lPeGuOQEH0Noh3zVGH69K+koDlb0P9oEp9U=;
 b=KZwSbDLOwkceLn8fz93moQ/IrZ0V7hxOYZRqRrTXyxGRpwOj2VttyJqorO8Gyw3/q0ACXK
 JxY2m2cjsd/EPPfHKswdGDfnAW+hOFVvTn4bNriFou6yhSxADfZrCzrfa4RsPKdO/NwIy+
 gbSsCKX6Zgri6Nv5U8lt2qFp+7MjurfGbfbeKOuC1LeckoydHFDLyPQ9k+8L234PC5zwSW
 I3a7L8BQ/dwMR3uHSl2eoqf0BGuXFwYMdU87d51N4bauXiNm6byIgqk0TjdlkmfdmGuOqy
 HA8swItmHwuiV4o5+J6i9udTp00m9kUqcMXbPXy9/mwRc0Wdkd5LseQVmsKewg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:18:06 +0100
Subject: [PATCH i-g-t v9 45/49] lib/unigraf: Add lane count configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-45-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XAlAzu5mQq0zq7YHViRLHBZ5jJLRtKEv9vTyH2R1OTo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6P3jL3CNHl2KlD5ro8ZX/ezaUzZzzWbBhYx
 MyaV9Drm1aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIJxRAAwqaPRqKJD/DHzGhG6Tc6peqtrJGsoe7
 +AsNtWVpxnfy39qho2WrVMROhvWl2hXxYdJtV6hNrZ4MuMtq2TudZUtstYpxdT0FKIZjvsTrjBi
 mDSqfGfLnnbbr5/JtxdQ2yC6sUuVXkVNYcxWV+siogWBA726ZIEQZb/dspXNpzpDsGgD8YcWdRp
 r/hGtAniRrf/YSPlUiCKZxtDNsgwXEWFvHfkn0+h7tVEWTR28ZDlgRXwIjYfSVyNsjJe32NfTB9
 x99Zgw8vFZPhhPDmp10Fu8ExuFikda1ryR7lfZqir7xv62qtV5ZEAq3stqIH3+Ml/iPawJx2wyL
 HqPkt80qlOJEUSZvtk9jQzfmWsLUUC3WnYNwQF/gBN8OZb7Pk82d7Eb9QmdHU/LcwyAt+P1FqUa
 RSGdt/khg+3TXCr92WSHtdgAD1ks+PkjchubLXMEn7xj+P7VU/i+0A+flgVToUKYsSfN2RYrvtR
 v1HgztTe5eqZeHlyznu8iVD9hBKkvDvMLcDhy8NKsvXwDBR46v3K7lvz4wZnKJx++/1H5Lclvqm
 d2SUo9xAgVfu59a4K4ayMRtTK6W+Bu7Lhja3csB2ILzypJvdkk3vTFAhSyB/zoYiVvs94Ls2LAE
 iAFmCxmiMsyrsesV4LAMEQ8AJ9kncUPNP0o987Q5T0jTgP3le3ZU=
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

As unigraf can emulate 1, 2 or 4 lanes display port connections, add
helpers to configure the number of lanes.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 29 +++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 83ea1eb1f91c..e046fa5bc4fe 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -546,6 +546,7 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 	unigraf_load_default_edid();
 	unigraf_hpd_assert();
+	unigraf_set_max_lane_count(4);
 }
 
 /**
@@ -805,3 +806,31 @@ void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info)
 	igt_assert_eq(mode_info->vsync_start, unigraf_read_u32(TSI_DPRX_MSA_VSTART_R));
 	igt_assert_eq(mode_info->hsync_start, unigraf_read_u32(TSI_DPRX_MSA_HSTART_R));
 }
+
+/**
+ * unigraf_set_max_lane_count() - Set the maximum number of lanes advertised to the DUT
+ * @count: The maximum number of lanes to configure on the device
+ *
+ * This function sets the maximum number of lanes that the device will advertise on the DP link.
+ * The actual number of lanes used may be less than the requested count if the
+ * DUT does not support/use it.
+ */
+void unigraf_set_max_lane_count(uint32_t count)
+{
+	unigraf_write_u32(TSI_DPRX_MAX_LANES, count);
+}
+
+/**
+ * unigraf_get_max_lane_count() - Get the maximum number of lanes supported by the device
+ *
+ * Returns: The maximum number of lanes supported by the device.
+ */
+int unigraf_get_max_lane_count(void)
+{
+	int max_lanes;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_MAX_LANES,
+					     &max_lanes, sizeof(max_lanes)));
+	return max_lanes;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 65f00c8d4948..e926855dd059 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -80,4 +80,8 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
 
 void unigraf_assert_stream_timings(int stream, drmModeModeInfoPtr mode_info);
 
+int unigraf_get_max_lane_count(void);
+
+void unigraf_set_max_lane_count(uint32_t count);
+
 #endif // UNIGRAF_H

-- 
2.52.0

