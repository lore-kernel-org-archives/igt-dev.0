Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E1EC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 13:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AA410EBBD;
	Fri,  4 Apr 2025 13:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ace17DBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4867F10EBBC
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743773286; x=1775309286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yXOyk4QVZA8+Cve1NAUf3eP/savaLwSyystWgJVS/Ss=;
 b=ace17DBcCUwPwjzPZWU/umxD481c3SjUqNzI+K2FNMK2U90hDf3ne5Qr
 iTG/DHVSn7u8+TMiM3dfixNdgLveIv4x/23ZFIhoEzYk76gtdsZRXqoPI
 pbF+M91Pf7ilgizCMymcDMpM9nkc+TKkDBWd/ETALPsYzIsPtoQ1igSvu
 2g6zVoVQVO96DS6FpdJYadfsmY671g3X+bC2DvFuHCKVodI1rxTztPMx6
 SMaj8RdP0/oOFmqOVZ89jEwNgoPKpcmPwBnqynOCduK8XE3BNcQ76cTHc
 Vrktpoa7ITOGS9Es1f7QG91jgv1h+Ik4SaYM+cvbwzrQnUshrh2C090v+ A==;
X-CSE-ConnectionGUID: Kc0BjM6BRRqkXC1mVRyCKA==
X-CSE-MsgGUID: gd715ueKQmigoDRzm9dQcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44365654"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="44365654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 06:28:06 -0700
X-CSE-ConnectionGUID: iFYi9b6FRpiyfdXZkRjJ2Q==
X-CSE-MsgGUID: cCIk32evSuaPDDF97C+7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127252654"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 06:28:03 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v6 1/5] lib/igt_device_scan: Add support for the device
 filter
Date: Fri,  4 Apr 2025 18:54:17 +0530
Message-Id: <20250404132421.1920451-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404132421.1920451-1-soham.purkait@intel.com>
References: <20250404132421.1920451-1-soham.purkait@intel.com>
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

     Add support for the device filter based on
driver string, device type (integrated or discrete)
and card number.

v5 : Add device filter to filter out
     matching devices.           (Zbigniew)

v6 : Move device filter with Separate 
     commit.                     (Zbigniew)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..ea14d8e23 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1709,6 +1709,58 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
+	int card = -1;
+	(void)fcls;
+
+	DBG("filter device\n");
+
+	if (filter->data.card) {
+		sscanf(filter->data.card, "%d", &card);
+		if (card < 0)
+			return &igt_devs.filtered;
+	} else {
+		card = -1;
+	}
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+
+		/* Skip if 'driver' doesn't match */
+		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
+			continue;
+
+		/* Skip if 'device' doesn't match */
+		if (filter->data.device && !is_device_matched(dev, filter->data.device))
+			continue;
+
+		/* We get n-th card */
+		if (!card) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&dup->link, &igt_devs.filtered);
+			break;
+		}
+		/* Include all the card */
+		else if (card == -1) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add(&dup->link, &igt_devs.filtered);
+		} else
+			card--;
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
@@ -1750,6 +1802,12 @@ static struct filter_class filter_definition_list[] = {
 		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
 		.detail = "find pf or vf\n",
 	},
+	{
+		.name = "device",
+		.filter_function = filter_device,
+		.help = "device:[driver=name][,device=type][,card=%d]",
+		.detail = "find device by driver name, device type and card number\n",
+	},
 	{
 		.name = NULL,
 	},
-- 
2.34.1

