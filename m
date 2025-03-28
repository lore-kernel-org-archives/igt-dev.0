Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38845C36013
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 06:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800310E98D;
	Fri, 28 Mar 2025 06:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2+6ZJt2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762A10E98B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 06:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743145165; x=1774681165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0FM2LxheDkDDHqcquOQeb48VH0VOvOH48ttd8DJ6ig=;
 b=J2+6ZJt22HHAxsocQqHwx4v4xlEx6ANgOlgeQR978V5Tx/U1+1Ax4HSP
 UvRkGPcj66g3OUsoxJtqhnTRAPBp6S9WMVJWlIaffw2uyi5w0ci0hAYiX
 /+e8BFloQSez7FDqkR564y1zDWV0Hcnax11D7mYALvr5Y7ca5JUOsy6Cx
 3o31U3smMMJpvylm7AetLqex8q8g+2/dlBSv6tCHK0Me4ZnAY38OWyeqI
 RnCh17jIiwETSSIyId0js9LjopJweUMFab4md9rQuK0OjUy0WNxuovGkE
 2UzFdUYTPtZvEUVJsxQrf9WNnGEeUBP3jrrey0gkEwgZlT0f+ymb8OlN5 A==;
X-CSE-ConnectionGUID: xT3ao9CeSVG8VdNSilhW8Q==
X-CSE-MsgGUID: jKAMcDgwS8qOhra/z6wIjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="62033768"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="62033768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:59:25 -0700
X-CSE-ConnectionGUID: zihvnTJ5QnSsaHXT6yAVdg==
X-CSE-MsgGUID: /tWBUfxfQcehAcNTKKu7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125167235"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:59:22 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 1/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
Date: Fri, 28 Mar 2025 12:25:52 +0530
Message-Id: <20250328065553.1843028-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328065553.1843028-1-soham.purkait@intel.com>
References: <20250328065553.1843028-1-soham.purkait@intel.com>
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

Add driver field to igt_device_card structure
for storing driver names.

v1 : Add driver field to igt_device_card struct

v2 : Reorder commit sequence (Riana)
     Include sign-off

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c | 4 ++++
 lib/igt_device_scan.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 711bedc5c..3f26a1737 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
 		safe_strncpy(card->render, dev->drm_render,
 			     sizeof(card->render));
 
+	if (dev->driver != NULL)
+		safe_strncpy(card->driver, dev->driver,
+			     sizeof(card->driver));
+
 	if (dev->pci_slot_name != NULL)
 		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
 			     sizeof(card->pci_slot_name));
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 92741fe3c..f1cd3b1e9 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -59,6 +59,7 @@ struct igt_device_card {
 	char subsystem[NAME_MAX];
 	char card[NAME_MAX];
 	char render[NAME_MAX];
+	char driver[NAME_MAX];
 	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
 	uint16_t pci_vendor, pci_device;
 };
-- 
2.34.1

