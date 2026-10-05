Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5439BCA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C0610E7A0;
	Mon,  5 Oct 2026 06:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYCDeL+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FFD10E7A0
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791182385; x=1822718385;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M5YBsBs2Iaq+51Qi+aFFuxFf5N5okaJA5L+NRkg/CRM=;
 b=QYCDeL+wGy6OykGZ7sD8mmPDWLGswpwFSaVCeS8M+EUYMpdm4cHFxxub
 BhNg94dXumg9Pg1oJn7/gghxsTgUF4kUNAMwYpwcFU6XUaGxU2itdIaQJ
 goJv4nVZJ8nvPQsuyQhrYW9XGx9oBlEiwq24RVhdLxFxdz0OrKtYu63e2
 M3JMK0Nr3leAXBtbJ3ta0ScYd6XSNJ3FaumQ3N0F+C/TFb4Ncm+Do6Y32
 2jOPcgU1Ajq6Jqw8QX7x2HU9BikDU1S4kS+pKrfhVFVU5SbPebmUSL4sp
 Jm8bOVSy2kAHQi2MI0vyeCC5/uZrbPVotf5jAi6L6dXyvxjhq23E40oxo A==;
X-CSE-ConnectionGUID: RFUJRHdHSTWzqNiyN8OXyg==
X-CSE-MsgGUID: 5O4BGIuPTe6YAKfuwS7TjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91869434"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91869434"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:39:45 -0700
X-CSE-ConnectionGUID: TbBt+14ORWC0OnLOIVb0uA==
X-CSE-MsgGUID: 6tCf9t0gTaK0OtK3N/nzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="302990019"
Received: from hgirotra-desk.iind.intel.com ([10.190.216.57])
 by fmviesa002.fm.intel.com with ESMTP; 04 Oct 2026 23:39:44 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/pciids: sync with kernel commit 682b943f1547
Date: Mon,  5 Oct 2026 12:09:43 +0530
Message-ID: <20261005063943.2638847-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Synchronize PCI IDs with drm-next kernel up to 682b943f1547,
which includes the following changes:

commit 682b943f1547 ("drm/xe/cri: Add new PCI ID")
commit aee2d33da882 ("drm/xe/ptl: Add a new PTL PCI ID")
commit ca24e8d9fa48 ("drm/xe/nvls: Update PCI IDs")

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/pciids.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index e32ef7634..a21609207 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -880,6 +880,7 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 /* WCL */
@@ -893,8 +894,9 @@
 	MACRO__(0xD741, ## __VA_ARGS__), \
 	MACRO__(0xD742, ## __VA_ARGS__), \
 	MACRO__(0xD743, ## __VA_ARGS__), \
-	MACRO__(0xD744, ## __VA_ARGS__), \
-	MACRO__(0xD745, ## __VA_ARGS__)
+	MACRO__(0xD745, ## __VA_ARGS__), \
+	MACRO__(0xD74A, ## __VA_ARGS__), \
+	MACRO__(0xD74B, ## __VA_ARGS__)
 
 /* CRI */
 #define INTEL_CRI_IDS(MACRO__, ...) \
@@ -902,7 +904,8 @@
 	MACRO__(0x674D, ## __VA_ARGS__), \
 	MACRO__(0x674E, ## __VA_ARGS__), \
 	MACRO__(0x674F, ## __VA_ARGS__), \
-	MACRO__(0x6750, ## __VA_ARGS__)
+	MACRO__(0x6750, ## __VA_ARGS__), \
+	MACRO__(0x6751, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.53.0

