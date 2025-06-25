Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60868C7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 07:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC9510E67E;
	Wed, 25 Jun 2025 07:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4027NAO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0B510E67E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750836900; x=1782372900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gCLSLwbTGmqop/r0I/ffl/bbVHRDmhJZ2vyKH6khOYE=;
 b=K4027NAOmaudUJ50ZZ8oJ+3ap5XLBv3/lhUTSm5l9l0M2eWHwby8BHMn
 9BWq7pu9zHDOjzPGK3IoWs0YAZubnRiXGSfe0QuYE5yCvpuMBMTqWKMi3
 uorbrKBudUiRREPA7oPUUVFp9hvKCj0sxjs912b4OgaWHzlOxve0IbJ8R
 Cs7xJGbGABQgvBYaLAROjxnbJjB1RsczyNC6uBzxMZG3f6e7DXeevmz3w
 ZBvxLAcICsooJvxwDLyffZlV9ou9HA2Ofs7Jba331sAvUrw7IXpxKIHcQ
 nO3VT1N+abpTJuvtQHP8jLngQQdJNJk+2pFYsK8MkoQ+h3p9ertx32zUX g==;
X-CSE-ConnectionGUID: 1M4bUxErSo2QcrP+RF0B/w==
X-CSE-MsgGUID: bIFvztKrQJ+dYGjZUlQIpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75633354"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="75633354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:35:00 -0700
X-CSE-ConnectionGUID: VATHrCGVQ/SZsIPvJpcZZQ==
X-CSE-MsgGUID: PJCFCawSSaC3HfGzwHsBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151892266"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:34:56 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 2/5] lib/igt_device_scan: Enable finding all matched IGT
 devices
Date: Wed, 25 Jun 2025 12:58:45 +0530
Message-Id: <20250625072848.3479396-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625072848.3479396-1-soham.purkait@intel.com>
References: <20250625072848.3479396-1-soham.purkait@intel.com>
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

Use filter to find all the available GPUs or few among them by driver name
and card type or card number.

v1: 
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Introduce device card match function to return collection of matching
   devices using device filter. (Lucas) (Zbigniew)
v3:
 - Fix allocation in card match instead of multiple realloc.(Zbigniew)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index a250e7ee9..f11ebf02e 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2143,6 +2143,54 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+/**
+ * igt_device_card_match_all
+ * @filter: filter string.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ *
+ * Function applies filter to match device from device array.
+ *
+ * Returns: the number of cards found.
+ *
+ * Note: The caller is responsible for freeing the memory which is
+ * dynamically allocated for the array of igt_device_card structures
+ * upon successful return.
+ */
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card)
+{
+	struct igt_device *dev = NULL;
+	struct igt_device_card *crd = NULL;
+	int count = 0;
+
+	igt_devices_scan();
+
+	if (igt_device_filter_apply(filter) == false)
+		return 0;
+
+	if (igt_list_empty(&igt_devs.filtered))
+		return 0;
+
+	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
+		count++;
+	}
+
+	crd = calloc(count, sizeof(struct igt_device_card));
+	if (!crd)
+		return 0;
+
+	count = 0;
+
+	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
+		__copy_dev_to_card(dev, crd + count++);
+	}
+
+	if (count)
+		*card = crd;
+
+	return count;
+}
+
 /**
  * igt_device_get_pretty_name
  * @card: pointer to igt_device_card struct
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index f1cd3b1e9..e6e31e799 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -89,6 +89,7 @@ int igt_device_filter_pci(void);
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
-- 
2.34.1

