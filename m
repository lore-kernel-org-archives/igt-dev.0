Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F11AC6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B169610FDCC;
	Wed, 20 Mar 2024 15:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiwrCwy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685B710FDB8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950229; x=1742486229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7tTrLwLj95zjOmYmiRX70Gc/SFmejC4iDkraYGr+tI=;
 b=KiwrCwy8Kq09NAaTTM5ziIzf1iKg0Fg919GvvruqPwrsBycXG/dUwa+f
 EpphBipJJAnuvGU1z8bpiqrYVfxw6SqDFFFyl34HkyeBhCO1k5MB1Vghr
 TG3QoIO4Ce2ZF0eB3PQ1N3WtWeyOwpihnPMc79rRTRhKciqkD7gN3x7d4
 tCoDcu2JU3cUjEH3ILPs+Sk7FfroyJA4PnhIv1Zv1A6JgZ5J+bMobo28O
 6a0D7cY8o8DnAkg0NVzLhFfRAGzdNBi18VLBPeyUl2wgtkVNHd943zHjQ
 vCRQyvgD+Z3jH2wxYAmDyzZol/VBv8Sg5bXI28OBRDVgFaPDQC9wKnltr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6007871"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6007871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18782991"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:06 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v14 1/5] lib/igt_device_scan: Introduce filtering out
 non-PCI devices
Date: Wed, 20 Mar 2024 16:56:55 +0100
Message-ID: <20240320155659.33518-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced igt_device_filter_pci function that filters out non-PCI
devices from IGT devices. This will help with checking multi-GPU
tests after they skip due to detected only one GPU, in that case
one can verify it after printing what GPUs are really on PCI bus.
Such errors can happen when using wrong env IGT_DEVICE filter.

v6: extending description
v9: fix memory leak in loop (Zbigniew)

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 23 +++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index fbf3fa482..9a2da3d62 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1908,6 +1908,29 @@ const char *igt_device_filter_get(int num)
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
+		if (strcmp(dev->subsystem, "pci") != 0) {
+			igt_list_del(&dev->link);
+			free(dev);
+		} else {
+			count++;
+		}
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

