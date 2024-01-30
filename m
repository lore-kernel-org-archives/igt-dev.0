Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70955C47DA9
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 17:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EBF11327B;
	Tue, 30 Jan 2024 17:07:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B931132D9
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706634453; x=1738170453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/IrtrZCUlCOmNv8b93k00CT5zuLEKXg+xP8AX2J70UM=;
 b=g90OFzxPaQXetKDhOQIBWrb7I5c/XuYnUojicabcb+XZznX13988lpwe
 WNvgyIuektNrF8IpUU8H4v4YyYuuwzq61dt5Vs6fOEQiyjpjek0u/G/4b
 2QK1Hq2mGiBO+c7/CbrMH5Isi3+h411R32I/xhTuvEIGZd6hAKRKXxz3Q
 8uauVLL+p7x5sRKXuJ021BLaXW2lLLG1w0+iyDW8AToR5qhDEStiBY3cl
 VNaT4Y0mFnyxSo/5ZQEPAH0tWVRDw3uQGRGhhpDDIrUitSAQZn0dQjolm
 RKntZ5dEddNEMu8tAzyPheF5DJe0/v9MS35KHq2K7ZBeJ+fI2PNDebqAQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3186599"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3186599"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3820931"
Received: from unknown (HELO localhost) ([10.246.4.20])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:07:31 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 1/8] lib/igt_device_scan: Introduce filtering out
 non-PCI devices
Date: Tue, 30 Jan 2024 18:07:15 +0100
Message-ID: <20240130170722.44828-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced igt_device_filter_pci function that filters out non-PCI
devices from IGT devices.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 21 +++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index fbf3fa482..37ebe1964 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1908,6 +1908,27 @@ const char *igt_device_filter_get(int num)
 	return NULL;
 }
 
+/**
+ * igt_device_filter_pci
+ *
+ * Filter devices to PCI only.
+ *
+ * Returns PCI devices count.
+ */
+int igt_device_filter_pci(void)
+{
+	int count = 0;
+	struct igt_device *dev, *tmp;
+
+	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
+		if (strcmp(dev->subsystem, "pci") != 0)
+			igt_list_del(&dev->link);
+		else
+			count++;
+
+	return count;
+}
+
 static bool igt_device_filter_apply(const char *fstr)
 {
 	struct igt_device *dev, *tmp;
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 48690e236..908733745 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -81,6 +81,8 @@ int igt_device_filter_add(const char *filter);
 void igt_device_filter_free_all(void);
 const char *igt_device_filter_get(int num);
 
+int igt_device_filter_pci(void);
+
 /* Use filter to match the device and fill card structure */
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
-- 
2.42.0

