Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E60C369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 11:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB7E10E8CA;
	Wed, 16 Apr 2025 11:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMHCbem1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C678A10E8CA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744801391; x=1776337391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HaSQaER3Aiji5CHUeT0SYyRmT/4hhtml6Qse/STxHhI=;
 b=ZMHCbem1BbBPJIFytTyyZ7sesEWrM3JDwu1w68pidDjUEmpO3zgaKO6b
 q9NurtEVIEkUkxppAbNqmgXb6j5l3/KuytpO06pYn+8+qCLckzi0mLCqY
 4Tyfa41agBf7+SvziRFpO926XFBQ47XccqfA7rGgpSlid3PPAMdP/abbK
 79uF0qeaEnMmD81DjYl5uZIqX7yubp3hpCyOybQpR1+pMeYSN1HIdOxqT
 wZI3K0w0oyZj0mw75CxVv4SKLDZWXTOX7qN9hFWbsB9/tPC3bjIWfOOdn
 9Cn17S1SVV/HIUpjKeakWBGrn4CvAf3sjdmhR2VTAFXQNH+ndf+XjD+BZ Q==;
X-CSE-ConnectionGUID: R/E1omQJRxiqjPdGbl7sNA==
X-CSE-MsgGUID: sQvvXtzpSKu9uyndgKuZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33958756"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="33958756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:03:10 -0700
X-CSE-ConnectionGUID: 67iDZ1YVSd2YFhYxJgpteg==
X-CSE-MsgGUID: mItkj/jaR7Coxc0N3wBGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135233893"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:03:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v7 2/5] lib/igt_device_scan: Enable finding all matched
 IGT devices
Date: Wed, 16 Apr 2025 16:28:48 +0530
Message-Id: <20250416105851.2048787-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416105851.2048787-1-soham.purkait@intel.com>
References: <20250416105851.2048787-1-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c | 61 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 63 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 1613fc3ed..67a00f0ed 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2133,6 +2133,67 @@ bool igt_device_card_match_pci(const char *filter,
        return __igt_device_card_match(filter, card, true);
 }
 
+/**
+ * igt_device_card_match_all
+ * @filter: filter string.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ * @request_pci_ss: a boolean parameter determines whether to
+ * consider PCI subsystem information during this process.
+ * @drivers: this holds the list of supported driver string by
+ * the caller.
+ * Function applies filter to match device from device array.
+ *
+ * Returns: the number of cards found.
+ *
+ * Note: The caller is responsible for freeing the memory which is
+ * dynamically allocated for the array of igt_device_card structures
+ * upon successful return.
+ */
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss, const char * const drivers[])
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
+		for (int i = 0;
+		     drivers && drivers[i] && !strcmp(drivers[i],
+		     dev->driver); i++) {
+			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
+			if (!tmp && crd) {
+				free(crd);
+				return 0;
+			}
+
+			crd = tmp;
+
+			if (request_pci_ss && !is_pci_subsystem(dev) &&
+			    dev->parent && is_pci_subsystem(dev->parent))
+				__copy_dev_to_card(dev->parent, crd);
+			else
+				__copy_dev_to_card(dev, crd);
+			count++;
+			break;
+		}
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
index f1cd3b1e9..c7ddccc57 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -89,6 +89,8 @@ int igt_device_filter_pci(void);
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
 	struct igt_device_card *card);
+int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
+			      bool request_pci_ss, const char * const drivers[]);
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
-- 
2.34.1

