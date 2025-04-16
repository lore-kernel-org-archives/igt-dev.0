Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E2BC369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 11:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF35510E8C9;
	Wed, 16 Apr 2025 11:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHMYVeng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5E10E8C9
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744801384; x=1776337384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOQC97PyP2kZ8BoEUE6P+bhFhl7AV7xPXHqUtKswJBY=;
 b=kHMYVeng5wwFvSaD/+eFq8ma0Ga9o5ZN2sf9OAn9RTIF4FRJ0zw0m5jp
 XfbV8LhBC0zCCRkUzBUb3+WO+Hl39JrXUcV3Men4N6WC72QVeZt0+7b7U
 GCQxYZAMtHR4vkoB+8PsvSQHzBRn0hoRnDKQrYDE+eZCTPXc5vwTHhlhb
 wIXJkePw5I6ht5hiKptrkZH4Z9e0w94Zqkf3yBhRjIN/Z9WXZGuqTHDbE
 QTYpoz5loMVNbxK93Y1kM41rifsMj5A1ANIkto4exiPR1ug6aAppBim8N
 sAIWDSHyOey6rguaHtNAt7+tqAsJ6+UA/f5FSgDylqAmjIeMdcaQBKhuF w==;
X-CSE-ConnectionGUID: zeF4cjK9Qfa6ekOVi9OGgQ==
X-CSE-MsgGUID: GzAmLHYNTzu7hNennvZnIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33958737"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="33958737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:03:04 -0700
X-CSE-ConnectionGUID: ok928xvCQPORQ8cfZ0uOFw==
X-CSE-MsgGUID: lySwFsF0Q/yOSWm5FqeztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135233857"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:03:00 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v7 1/5] lib/igt_device_scan: Add support for the device
 filter
Date: Wed, 16 Apr 2025 16:28:47 +0530
Message-Id: <20250416105851.2048787-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416105851.2048787-1-soham.purkait@intel.com>
References: <20250416105851.2048787-1-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 lib/igt_device_scan.c | 70 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..1613fc3ed 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1709,6 +1709,70 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
+
+	if (filter->data.card) {
+		char crdop[4] = {0};
+
+		if (sscanf(filter->data.card, "%d", &card) == 1) {
+			if (card < 0)
+				return &igt_devs.filtered;
+		} else {
+			card = 0;
+			if (sscanf(filter->data.card, "%3s", crdop) == 1) {
+				if (strcmp(crdop, "all"))
+					allcards = true;
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
@@ -1750,6 +1814,12 @@ static struct filter_class filter_definition_list[] = {
 		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
 		.detail = "find pf or vf\n",
 	},
+	{
+		.name = "device",
+		.filter_function = filter_device,
+		.help = "device:[driver=name][,device=type][,card=%d|all]",
+		.detail = "find device by driver name, device type and card number\n",
+	},
 	{
 		.name = NULL,
 	},
-- 
2.34.1

