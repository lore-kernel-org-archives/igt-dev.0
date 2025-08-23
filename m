Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAFACA0FEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855AE10E197;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bRj/NHzz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369510E197
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 59DCE1A0D97
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32D9A606A7;
 Sat, 23 Aug 2025 02:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 605281C22DAFB; 
 Sat, 23 Aug 2025 04:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5x7gP0+WdTwv9CMnlTmn/r3XZhgNA4/DrbidIoi75g4=;
 b=bRj/NHzzp3n00mhbaum203m9HOQJGtv1Oyz+R3u+K3TRz9QYLmDnv3BJQpb8tUH0pBNfzF
 YpP0guX9P96jTrIP0lQxD7AqKaimReKwY6W9U5P31vxW0njqt2ZAYfxbCZC5UR7wp5/mN7
 TqqQBvpqnkDlrgPRiW96ESRPV3zn+hMp1wLC0KW/2rxy8e+n1L3Zvs/lBxIo7fSDHxlx77
 YrPy0/jBkWRV5uvIx0oSwhcaskYtdlLxXh5us8Kb+A5IHbVWWk666Xv/9NYfXWqXcqQuhA
 q7/TcALo3l3D75eHjzbqKsKDLiXRlb/CkxxCCZfDETnBEwfs7I3hVIeusLT5ZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:39 +0200
Subject: [PATCH i-g-t v3 19/29] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-19-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4632;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MflgKO0d4ZNvtemKwMoCsbdqDbKzhf+owpu0L1OeHGQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNW73B92AUQsOPPQCymIrKWiSryIOXspiY1Q
 6viLagaWd2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVgAKCRAgrS7GWxAs
 4t09EADTuyRqa99n7qaGmyrjQ3JDyx9PlKJJsm5udGZp985mD7/RcXJfAM0CknJh7sJtLKpmMF0
 ctCtK9q5IHMCRYRxI8j3tNcUE3hgRAmNqfPMpmgupIta/5VLk8WeS/e8zxISyIMrnsptX78ZdgL
 iLvqYGnybOYvPMO7DgrxiqBmcqlfOpxwZfbJgRPWEK1Lh+JFRDN+3Q4tcoGYiUU8/JgnXIl1q8l
 A8YsVBAcr7MjQobQhzZgxYE26IMs2NHzbP3dznjFtc9AAX5RWgixMZUW9h1Z3C8Xrfn8eP2APcK
 unUbBKj4D3hINEuVfMd9ZRxDOuTjaekiALIc0OftXlRv8Mcc5xNA8jItTKAUnUeCmzhxY05JrGh
 i7KCYcYspt5F0iOcuzGbV6XW56X2et23PqeDm/XxoN1YHBfc11P+tSm5W9Dd6tZEQhsV2Y68GQV
 gSwIhoDaDBx0ezjvrD22R+crdT3ryTOyB3daVhHqFgwNu62f5SwZCQafQgYW/FzsT7tSoVk3k1Q
 tMeECicUaD0F6Da3adg8szJsJGQByL4HuGzHEN9VUd+DV8rLhj1jTyxgosxojsMF9Xe5xQMFRBS
 7uCrgj2W6z1P3ny84oGIG779yg31LWvc5Y6CEQbOBe2Li31iDCAKCO2QYIgystzpmdqeHUVJzcQ
 g3jhaDscRIQqxEQ==
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

Unigraf devices can emulate both SST and MST display port. In order to
write tests using both, add fews helper to manipulate them.

The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
python SDK, as it was not defined by the C sdk nor documented.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 38 +++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b0b6af97acc563d7af163c175bb4a73bd25abdb9..6166a6d7e9bb8e348c8f6e6f42ad30b6487bbdd6 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -341,3 +341,75 @@ void unigraf_plug(void)
 	igt_assert(unigraf_device);
 	unigraf_write(TSI_DPRX_HPD_FORCE, &d, sizeof(d));
 }
+
+void unigraf_set_sst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	igt_assert(unigraf_device);
+	unigraf_unplug();
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags &= ~(TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT);
+	unigraf_write(TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags));
+	unigraf_plug();
+	unigraf_hpd_pulse(500000);
+}
+
+void unigraf_set_mst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags |= TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT;
+	unigraf_write(TSI_DPRX_LINK_FLAGS, &link_flags, sizeof(link_flags));
+}
+
+int unigraf_get_mst_stream_max_count(void)
+{
+	int previous_count;
+	int max_count = -1;
+
+	// You can write any value to the register, but the actual
+	// value will not be more than the supported sink count.
+	previous_count = unigraf_get_mst_stream_count();
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &max_count, sizeof(max_count));
+	max_count = unigraf_get_mst_stream_count();
+
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &previous_count, sizeof(previous_count));
+	return max_count;
+}
+
+int unigraf_get_mst_stream_count(void)
+{
+	int count;
+
+	igt_assert(unigraf_device);
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_MST_SINK_COUNT,
+					     &count, sizeof(count)));
+
+	return count;
+}
+
+bool unigraf_set_mst_stream_count(int count)
+{
+	int new_count;
+
+	unigraf_write(TSI_DPRX_MST_SINK_COUNT, &count, sizeof(count));
+	new_count = unigraf_get_mst_stream_count();
+
+	igt_warn_on_f(count != new_count,
+		      "IGT:%p: Requested MST stream count (%d) differ from what was applied by the device (%d)\n",
+		      unigraf_device, count, new_count);
+
+	return count == new_count;
+}
+
+void unigraf_select_stream(int stream)
+{
+	igt_assert(unigraf_device);
+	unigraf_write(TSI_DPRX_STREAM_SELECT, &stream, sizeof(stream));
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 4f32a3632c8dcd6bd9900d821a93dba3cb77d62a..4d9eb1b926dfe9ad531e58243f4edf1623a24473 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -83,4 +83,42 @@ void unigraf_plug(void);
  */
 void unigraf_unplug(void);
 
+/**
+ * unigraf_set_sst() - Configure the device for Single Stream Transport mode
+ *
+ * This function sets the device to operate in Single Stream Transport (SST) mode.
+ */
+void unigraf_set_sst(void);
+
+/**
+ * unigraf_set_mst() - Configure the device for Multi Stream Transport mode
+ *
+ * This function sets the device to operate in Multi Stream Transport (MST) mode.
+ */
+void unigraf_set_mst(void);
+
+/**
+ * unigraf_get_mst_stream_count() - Get the current number of MST streams
+ *
+ * Returns: The current number of MST streams configured on the device.
+ */
+int unigraf_get_mst_stream_count(void);
+
+/**
+ * unigraf_set_mst_stream_count() - Set the number of accepted stream count
+ *
+ * Returns true when the stream count was properly applied, false if the final stream count
+ * is not the one requested
+ */
+bool unigraf_set_mst_stream_count(int count);
+
+/**
+ * unigraf_get_mst_stream_max_count() - Get the maximum number of stream count accepted by the
+ * device
+ * Caution: This function can be destructive to some configuration: the only way to get the
+ * information is to try and read the new value.
+ */
+int unigraf_get_mst_stream_max_count(void);
+void unigraf_select_stream(int stream);
+
 #endif // UNIGRAF_H

-- 
2.50.1

