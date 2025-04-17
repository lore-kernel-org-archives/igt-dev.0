Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AF2C369CF
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 14:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25B10EB27;
	Thu, 17 Apr 2025 14:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9S/7ms+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F3B10EB20
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744898683; x=1776434683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+QrLIKcnIggEn+DcfCwjVQymp4QqCBM30xaLTpKoILQ=;
 b=h9S/7ms+q1iGvK9K1RSifz3dRkA8QpwDA6yCuf/Fz1b1bAZmySeBaLZl
 n7IlB/ZVcPXERLDzn3OoNg3V5jTm2dLUVRsxHbOgwiNXHMGnNn8egGNfy
 CLn7PbSNFmwaSAj0Hworlwn+Q8qcp5mOcp4nxQL0kgaW34OnwbBX6UjRm
 g97ZXZHcs0FCPA4mPcRvNZs4L1u1zWpXsOMPc49mAZ6DOae7C0AMnGFCP
 xJnGpcRLF2D78UBd1pfOVanzdcoiKhkZzBK8IUz3yEnPh28cb2SCkfkzi
 PfdBTMINBbqNlGwkb4I61o7X8Ta8XRJ70xWHWixSO9Rgi0jxW1Os2VdkM Q==;
X-CSE-ConnectionGUID: uW2hFJ13Ti6CbXf+4nfF+w==
X-CSE-MsgGUID: 8OZlFmH1QdqlmF/WhpsrSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45723081"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="45723081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:03:52 -0700
X-CSE-ConnectionGUID: 1YseUExVSlanbm8DCH+FPA==
X-CSE-MsgGUID: x7a/b4wmTxWsO3rfau82qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="153996350"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 07:03:49 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v8 2/5] lib/igt_device_scan: Enable finding all matched
 IGT devices
Date: Thu, 17 Apr 2025 19:29:38 +0530
Message-Id: <20250417135941.2083761-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417135941.2083761-1-soham.purkait@intel.com>
References: <20250417135941.2083761-1-soham.purkait@intel.com>
MIME-Version: 1.0
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

Use filter to find all the available
GPUs or few among them by driver name
and card type or card number.

v2 : Fix for refactoring GPUTOP into a
     vendor-agnostic tool. (Lucas)

v3 : Separate commit for lib. (Kamil)

v4 : Refactor to use composition strategy
     for driver and device type filtering.
     Refactor code to improve memory
     allocation and error handling. (Lucas)

v5 : Introduce device card match function
     to return collection of matching
     devices using device filter.

v6 : Separate commit for device card match
     function.                     (Zbigniew)
     Function description modification for device
     card match function.          (Zbigniew)

v7 : Single return for card match function.
                                  (Krzysztof)

v8 : Removed 'drivers' array as card match
     function parameter.          (Zbigniew)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c | 56 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3dbe06812..fd299d6ab 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2134,6 +2134,62 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+/**
+ * igt_device_card_match_all
+ * @filter: filter string.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ * @request_pci_ss: a boolean parameter determines whether to
+ * consider PCI subsystem information during this process.
+ *
+ * Function applies filter to match device from device array.
+ *
+ * Returns: the number of cards found.
+ *
+ * Note: The caller is responsible for freeing the memory which is
+ * dynamically allocated for the array of igt_device_card structures
+ * upon successful return.
+ */
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss)
+{
+	struct igt_device *dev = NULL;
+	struct igt_device_card *crd = NULL;
+	struct igt_device_card *tmp;
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
+		tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
+		if (!tmp) {
+			if (crd)
+				free(crd);
+			return 0;
+		}
+
+		crd = tmp;
+
+		if (request_pci_ss && !is_pci_subsystem(dev) &&
+		    dev->parent && is_pci_subsystem(dev->parent))
+			__copy_dev_to_card(dev->parent, crd);
+		else
+			__copy_dev_to_card(dev, crd);
+		count++;
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
index f1cd3b1e9..7bee65881 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -89,6 +89,8 @@ int igt_device_filter_pci(void);
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
-- 
2.34.1

