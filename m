Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A4C7EE39
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 09:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7D10E862;
	Thu, 26 Jun 2025 09:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDH5JCzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7735310E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750929763; x=1782465763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ersdg667o3uqmO/jcB2zq9IOqLiED3ebfyx/Mw3b2wI=;
 b=jDH5JCzkWzH7xVeCd04glxRWa+IChHYW3R8j6YaLkpnPLBJzlLcCvdhF
 ycmsKCga8oECHlFX+Xkc43x+m1Dht8kFhWDb19R6/wt1ryyPWew+VApMy
 McyiA6DYcWLdO3Q2fm73Iyy6Xie9sNYCd++Xaa0qrhE3Z/dsnX1CO2GsP
 SxXtest7q/K8iaWYnHtX90zB25L7yXDqDkR/5JqbSpycjt/EJmI/Len7f
 OAifeBtiUSeyq2TVxh+Mp56oQ9sKZ7+V2G9/3QVeFZJGZxYZwcSJRNB+h
 a2uFco3589yOedqTYBfAqZEli65i5n6MeC0Spqyyuo7zCeAoD8EHScEG/ g==;
X-CSE-ConnectionGUID: zJXZ014jQQ6d/C+cb1lKkA==
X-CSE-MsgGUID: 7bH34eP+QNaD20WT26/mPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="57003029"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="57003029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:43 -0700
X-CSE-ConnectionGUID: 9rfORHadQYeXEn7mV5CPOw==
X-CSE-MsgGUID: flfQ57+iSMCth8Y8ubM4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="157960042"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:39 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 2/5] lib/igt_device_scan: Enable finding all matched IGT
 devices
Date: Thu, 26 Jun 2025 14:46:23 +0530
Message-Id: <20250626091626.3760324-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626091626.3760324-1-soham.purkait@intel.com>
References: <20250626091626.3760324-1-soham.purkait@intel.com>
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
index 346483c95..0ab7b7a0a 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2145,6 +2145,54 @@ bool igt_device_card_match_pci(const char *filter,
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

