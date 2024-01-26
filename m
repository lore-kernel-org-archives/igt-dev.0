Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB760C47DDB
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 17:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846610EAB5;
	Fri, 26 Jan 2024 17:32:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E9910E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706290319; x=1737826319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGJZUn2hM7z1vbooyXzq5S8B5IKPW1JxiBYRSVjofo4=;
 b=T8dYHh4pI8STX59fa/nbIqD1QhwW+t7f6zN+21qkz8q4bJb5nHILw8XP
 tl1kn1jQiCqTCtMqVoNq7Zjjk6XakN9VLXwIEQFqLmkqQl29FrZ8QAcT3
 O/wqgUBJtXGVpnX/iqD2rrtpambJeQg2gg0Sm7oThBcbAxcuBNVb1Fcgc
 Qs5ay/h/BuFVw6Kue4uCy8WHM0S15TuoTCuc42/6LCW3/9cMPp8eL/su5
 ryMttpkBEvkln1nBlQRhsTCl/LGHa6/pQSpZjkR8saGJ28DSSMbrZzuel
 L84vUG7E2s75pBxeZUTMsmBxtgC8bf85rEuH3PD4qcZk7dLOu7knS19E4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401386276"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401386276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:31:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="906371889"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="906371889"
Received: from unknown (HELO localhost) ([10.246.28.205])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:31:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 1/8] lib/igt_device_scan: Introduce filtering out
 non-PCI devices
Date: Fri, 26 Jan 2024 18:31:41 +0100
Message-ID: <20240126173148.63246-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240126173148.63246-1-kamil.konieczny@linux.intel.com>
References: <20240126173148.63246-1-kamil.konieczny@linux.intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Introduced igt_device_filter_pci function that filters out non-PCI
devices from IGT devices.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 21 +++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index fbf3fa482..37ebe1964 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1908,6 +1908,27 @@ const char *igt_device_filter_get(int num)
 	return NULL;
 }
 
+/**
+ * igt_device_filter_pci
+ *
+ * Filter devices to PCI only.
+ *
+ * Returns PCI devices count.
+ */
+int igt_device_filter_pci(void)
+{
+	int count = 0;
+	struct igt_device *dev, *tmp;
+
+	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
+		if (strcmp(dev->subsystem, "pci") != 0)
+			igt_list_del(&dev->link);
+		else
+			count++;
+
+	return count;
+}
+
 static bool igt_device_filter_apply(const char *fstr)
 {
 	struct igt_device *dev, *tmp;
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 48690e236..908733745 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -81,6 +81,8 @@ int igt_device_filter_add(const char *filter);
 void igt_device_filter_free_all(void);
 const char *igt_device_filter_get(int num);
 
+int igt_device_filter_pci(void);
+
 /* Use filter to match the device and fill card structure */
 bool igt_device_card_match(const char *filter, struct igt_device_card *card);
 bool igt_device_card_match_pci(const char *filter,
-- 
2.42.0

