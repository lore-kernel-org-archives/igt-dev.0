Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0FC77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 10:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7A510E352;
	Mon, 23 Jun 2025 10:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBJQQyKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2510E352
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750673567; x=1782209567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3a6CG6LlSQeoCGdaeE276Q+0hz/oXj04e80YRXIEVk=;
 b=lBJQQyKSRnck5MfZZnNofMIqU6jPaXI+icYR6ovKFUmPgfabuMsA9c6C
 +c6crKS9gdlVzqr8L5zOsOAnQILYS9hSC+/P0NU2Bs02rB76svJ3gWyK+
 qDFq8pWy+OXJNLac0eHrE7KgzOTDc4uApEAmPQLZaXVaTSuFHGf/PGTkY
 2DCa7Hn2oiTghFJEUzC0X+VbrQPkNxD3vUB3IA89TKrIfJAHWIzGGMr0a
 Q56Hw8amLlq8vtIEmygBhpquKN/FsVmnA1eRDpXbOH7SUfzxr2hmnOyAR
 zGhuEYNfqfvgFHt1pnX3JxJroiYYgydxL3u+5Ln2/qes1vcdOL/C49e64 A==;
X-CSE-ConnectionGUID: 8cgVPNgAQFKafZyQqitqzw==
X-CSE-MsgGUID: 1PKgAKYpRdegadgpEZdalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64229287"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="64229287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:12:46 -0700
X-CSE-ConnectionGUID: ZiKn/OLESGmp0ikhvSpXAA==
X-CSE-MsgGUID: c/rPrcz/SY+QQ1KRNju/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151844208"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:12:44 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v14 2/5] lib/igt_device_scan: Enable finding all matched IGT
 devices
Date: Mon, 23 Jun 2025 15:36:38 +0530
Message-Id: <20250623100641.3359635-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623100641.3359635-1-soham.purkait@intel.com>
References: <20250623100641.3359635-1-soham.purkait@intel.com>
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

v9 : Fixed allocation in card match instead of
     multiple realloc.            (Zbigniew)

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

