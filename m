Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2CFC77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 07:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E4A10E67D;
	Wed, 25 Jun 2025 07:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRlG1anQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C2310E67D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750836897; x=1782372897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEDndX6vhIxxTpNrCkgLjjuSxTlAFXMwZfxeJefY0Cw=;
 b=aRlG1anQwbh4ZoS29Il2+65mKCret7GzHVDg4y4pMZBXkq/SvC9SmvtI
 pSN1yKXCOt+7hVVCd/RkI3edcM4mND5phqf9DtZ1r/mAEkvaBkstsXyIt
 XbVLs+RpH83fXZr/0gfT8DD2TSM3j3SqjDBfWfem7ZmqKj1GJ+PfutNyg
 JzmsUS7lMdhkpLa0DRMx8w+Pw1pj+TG8hZfNiiyIA1Kh6tjsyOMNJ3s0C
 TuO+P7yl4SvLuzv/Tcnp77fyi7JMhNnvfvx3ZjzeuKfgV4b+IKk+0CIqU
 sO/nV/m6eLNHcAiY7PwHbc01Xsi8WPsAkAroHGF8E6SC61heON2Bl3k7l w==;
X-CSE-ConnectionGUID: i3Y+WTZSTGWhDHafVYrHmw==
X-CSE-MsgGUID: zeHMB8N9SNyh168UsM97dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75633337"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="75633337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:34:56 -0700
X-CSE-ConnectionGUID: cdPUQcJiTLGiUkJP0R94Ig==
X-CSE-MsgGUID: QiFBCgWjR7aPlXSFlR8N7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151892247"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 00:34:52 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 1/5] lib/igt_device_scan: Add support for the device filter
Date: Wed, 25 Jun 2025 12:58:44 +0530
Message-Id: <20250625072848.3479396-2-soham.purkait@intel.com>
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

Add support for the device filter based on driver string, device type
(integrated or discrete) and card number.

v1: 
 - Add device filter to filter out matching devices.(Zbigniew)
v2:
 - Add 'all' option for all the cards and 'subsystem' filter
   option. (Zbigniew)

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

