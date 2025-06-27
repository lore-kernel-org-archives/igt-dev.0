Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36BFC7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 18:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E710E062;
	Fri, 27 Jun 2025 18:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg7ZA6dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AC110E062
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751048395; x=1782584395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ersdg667o3uqmO/jcB2zq9IOqLiED3ebfyx/Mw3b2wI=;
 b=Vg7ZA6dnhvSAYFlGC340ihHlXc16qo5eeuhYeMQh3r/Z2BryfYcCTO8g
 bwxdwZP7ZujfD6eoBbSoGR/WGFlfCWSFswRzdIk4lfZT1yPen5yDDpWC1
 gKLdQvSEtp3cneMUh1y2FeEYLwkoScZzaAUf45J7eNVJej0SYoJqj/CvA
 zY2AJQjGJvpWO6ckBHUxNnb3duYIB+GIoW/w/680A3Z5puy7V7rKgJYTM
 w5s1oqy55wjU/I38Rd9nHHuvzVcn8lKIxHqIcGHpkJiMzv0LrNDNjlqFd
 N6wTwplkqe3S9ouzUahlMq4pktxHu0lZ4mKA7yC5G6CLOpEx7VdHO9gZG Q==;
X-CSE-ConnectionGUID: Dhve9xi5THKFKjLW9kclTw==
X-CSE-MsgGUID: 6SeLolaWR56NkgUYSLEdqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53465688"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53465688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:18:38 -0700
X-CSE-ConnectionGUID: juHmNOHgQvek6umbAqH0JA==
X-CSE-MsgGUID: tLJTEOgqRUShxSeOi87/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152604336"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:18:34 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v16 2/5] lib/igt_device_scan: Enable finding all matched IGT
 devices
Date: Fri, 27 Jun 2025 23:42:19 +0530
Message-Id: <20250627181222.227803-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627181222.227803-1-soham.purkait@intel.com>
References: <20250627181222.227803-1-soham.purkait@intel.com>
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

