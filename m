Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2164EC54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 15:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C746510E18A;
	Thu, 22 May 2025 15:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNuThFcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586410E18A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747928994; x=1779464994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lhsbaJUsSDtnePtY32ggXtHngBrIBhyaA4pwH9q0Ozs=;
 b=CNuThFcU02EqTQjO0ZlY1JLRZza6Mv5cZ3UoJVHF9+mwEsVz1aCO31x/
 OHJv8VuLmFxVC3AwCe8NznoVxeecvOqio1ufiN/HW26GgzEYr2nmJTnva
 U+39AjS89LzJqFZICnLLCU8iOe5eiqw1LvaDxPjcW18Qt1EBe2cYogHG8
 MSaXgLMaTyy6pHrtLZX2hmreDdUHpqmRt2Qgc1qOnMMr541bRC1pnB40V
 tgik1tWjhK+t4icyTVJSqL1+ZWRsBJ6izazZQHSY8nfdBBZ6Hbnx5CvcN
 ZhI4KzgRzCUIS57/NRgt7U1EF4ELdo1Vzg+RyOxQ+/TWFYY9wPa0hM7jk g==;
X-CSE-ConnectionGUID: rZ2l40zkR4+X6ITO1zszQg==
X-CSE-MsgGUID: IU+k5UKIRuWz2JVrLojAMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49862138"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49862138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:49:54 -0700
X-CSE-ConnectionGUID: gv4x6joOQAS25SBoXPcurg==
X-CSE-MsgGUID: IjU2EWygSxurxmj2MPJwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141594088"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:49:50 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v11 1/5] lib/igt_device_scan: Add support for the device
 filter
Date: Thu, 22 May 2025 21:14:43 +0530
Message-Id: <20250522154447.496407-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522154447.496407-1-soham.purkait@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
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

Add support for the device filter based on
driver string, device type (integrated or discrete)
and card number.

v5 : Add device filter to filter out
     matching devices.           (Zbigniew)

v6 : Move device filter with Separate
     commit.                     (Zbigniew)

v7 : Fix interpretation of card numbering
     and add 'all' option for all the cards.
                                 (Zbigniew)

v8 : Fix for card filter output. (Zbigniew)

v10 : Fix render node issue with 'subsystem' filter
      option.                    (Zbigniew)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 80 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..a250e7ee9 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1434,6 +1434,7 @@ struct filter {
 		char *driver;
 		char *pf;
 		char *vf;
+		char *subsystem;
 	} data;
 };
 
@@ -1453,6 +1454,7 @@ static void fill_filter_data(struct filter *filter, const char *key, const char
 	__fill_key(driver);
 	__fill_key(pf);
 	__fill_key(vf);
+	__fill_key(subsystem);
 #undef __fill_key
 
 }
@@ -1709,6 +1711,77 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
 	return &igt_devs.filtered;
 }
 
+/*
+ * Find appropriate gpu device through matching driver, device type and
+ * card filter arguments.
+ */
+static struct igt_list_head *filter_device(const struct filter_class *fcls,
+					   const struct filter *filter)
+{
+	struct igt_device *dev;
+	bool allcards = false;
+	int card = 0;
+	(void)fcls;
+
+	DBG("filter device\n");
+	if (filter->data.card) {
+		char crdop[5] = {0};
+
+		if (sscanf(filter->data.card, "%d", &card) == 1) {
+			if (card < 0)
+				return &igt_devs.filtered;
+		} else {
+			card = 0;
+			if (sscanf(filter->data.card, "%4s", crdop) == 1) {
+				if (!strcmp(crdop, "all"))
+					allcards = true;
+				else
+					return &igt_devs.filtered;
+			} else {
+				return &igt_devs.filtered;
+			}
+		}
+	} else {
+		card = 0;
+	}
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		/* Skip if 'driver' doesn't match */
+		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
+			continue;
+
+		/* Skip if 'device' doesn't match */
+		if (filter->data.device && !is_device_matched(dev, filter->data.device))
+			continue;
+
+		/* Skip if 'subsystem' doesn't match */
+		if (filter->data.subsystem && strcmp(filter->data.subsystem, "all")) {
+			if (strcmp(filter->data.subsystem, get_prop_subsystem(dev)))
+				continue;
+		}
+
+		/* We get n-th card */
+		if (!allcards && !card) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&dup->link, &igt_devs.filtered);
+			break;
+		} else if (!allcards) {
+			card--;
+		}
+		/* Include all the cards */
+		else if (allcards) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add(&dup->link, &igt_devs.filtered);
+		}
+	}
+
+	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
+
+	return &igt_devs.filtered;
+}
+
 static bool sys_path_valid(const struct filter_class *fcls,
 			   const struct filter *filter)
 {
@@ -1750,6 +1823,13 @@ static struct filter_class filter_definition_list[] = {
 		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
 		.detail = "find pf or vf\n",
 	},
+	{
+		.name = "device",
+		.filter_function = filter_device,
+		.help =
+		"device:[driver=name][,subsystem=all|<subsystem>][,device=type][,card=%d|all]",
+		.detail = "find device by driver name, subsystem, device type and card number\n",
+	},
 	{
 		.name = NULL,
 	},
-- 
2.34.1

