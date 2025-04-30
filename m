Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7BDC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AF210E6BC;
	Wed, 30 Apr 2025 07:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBMuuhqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F36810E6BC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745997174; x=1777533174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9JPTnamUR0MdanVFE0+NKicXiuNBZgA91BQYm53YykE=;
 b=CBMuuhqpyoV/cefXU5wG6Q1EW7mowbplclzqVyuUSq+wblp7nZJ0tzM6
 WA9Kn6jHzrYJFlg1xW7HAYQu8OYHblVJvRozDJ3OmysLoppQR1dLDjNpm
 cu7aoG6gH1KaH+4qPIVFynxVd1c707Kqv7y1JuQhMOKhTW8LTp/rOdFvC
 bGcHeNwkJslVsQ8V6uJYBuhTTrT7Ut7Wkitbkbto6iHUMpfHLzpc0K6rU
 gbeEmgWawNCytPZ/xlqlVQz8smdQfGhr6ixvX5zWbvlITk+kKX8KwNNZL
 wB8uHMW1UppgHsapU/LiCiIvp5P4kXk8Hdoi0NM3gLmpq1+4wyeh9GxAw A==;
X-CSE-ConnectionGUID: GRnYOYz3TpGxuL6sesfhmA==
X-CSE-MsgGUID: DR+2+JWYQuOe3T5sJjMW0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73030116"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73030116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:12:54 -0700
X-CSE-ConnectionGUID: kEKVYeALSh6Jn+HTIVUKEA==
X-CSE-MsgGUID: SX2M/jZnRTW6XqfK26HB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133965906"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:12:51 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v10 1/5] lib/igt_device_scan: Add support for the device
 filter
Date: Wed, 30 Apr 2025 12:38:20 +0530
Message-Id: <20250430070824.3012927-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430070824.3012927-1-soham.purkait@intel.com>
References: <20250430070824.3012927-1-soham.purkait@intel.com>
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
---
 lib/igt_device_scan.c | 79 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..3c36ca3f2 100644
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
@@ -1709,6 +1711,76 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
@@ -1750,6 +1822,13 @@ static struct filter_class filter_definition_list[] = {
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

