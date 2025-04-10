Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB0C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE65D10E1A1;
	Thu, 10 Apr 2025 22:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLDA5OM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBA110E1A1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325354; x=1775861354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dlvbm77bjXMUxqphhhuR3RkSt2fJd514wfKGLM18Dbw=;
 b=aLDA5OM0t8GyL7KF7BgLS69ZAnJpvJqCVn1E2jGsSVzMHJHN+JoscpPt
 kbRSj4pMA6zuxhlBEJTZrcyBfQYV9kURhQeI32Q36UdTqVHRZsjnAZ1B6
 h4JkpNsgVustC0jSVC6/Gj5B4GJJbMH9SQwHWU4DaJPv5vxT4huvdLTx9
 wSf4iRWxSQtsrCZ3lYHWkO4T0vFV21LMN2f+J8zKfrzMd2oVyYKGdKH9Y
 mxB+qz4qR4PUGhnMOi/UieEQtuGbVrwaVOi2uEhumCvxskBUTk0Lp3GJ5
 CYOAKw86f6AqWGXtF1W6qD8ZlipRud0p6Z8JmqK4DUCT195RtxDHs6i+R g==;
X-CSE-ConnectionGUID: NXLhy1A8RhSQKu8bSfw7kg==
X-CSE-MsgGUID: h6FrJ0OVRJCX0j7HfulfQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757029"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757029"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:49:11 -0700
X-CSE-ConnectionGUID: PD1bJM9XTPmt2ez0T7Oy0g==
X-CSE-MsgGUID: geBjQ/v4TLiri70GGhECCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998355"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:49:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 10/10] lib/igt_sysfs: Drop xe_sysfs_driver_do()
Date: Thu, 10 Apr 2025 15:49:00 -0700
Message-ID: <20250410-lib-kmod-v1-10-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

All users are converted to igt_kmod_{unbind,bind,rebind}, so drop this
implementation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 50 --------------------------------------------------
 lib/igt_sysfs.h |  8 --------
 2 files changed, 58 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index a76af54eb..bc68cf61b 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1479,56 +1479,6 @@ int xe_sysfs_get_num_tiles(int xe_device)
 	return num_tiles;
 }
 
-/**
- * xe_sysfs_driver_do:
- * @xe_device: fd of the device
- * @pci_slot: PCI slot of the device
- * @action: the action to perform through sysfs on the driver
- *
- * Use sysfs to perform an action on the driver.
- *
- * Returns: fd of the device, which renewed if needed
- */
-int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action)
-{
-	int sysfs;
-
-	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
-	igt_assert(sysfs);
-
-	switch(action) {
-	case XE_SYSFS_DRIVER_BIND:
-		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
-		close(sysfs);
-		break;
-	case XE_SYSFS_DRIVER_TRY_BIND:
-		igt_sysfs_set(sysfs, "bind", pci_slot);
-		close(sysfs);
-		break;
-	case XE_SYSFS_DRIVER_REBIND:
-		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
-
-		/*
-		 * We need to close the client for a proper release, before
-		 * binding back again.
-		 */
-		close(xe_device);
-
-		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
-		close(sysfs);
-
-		/* Renew the client connection */
-		xe_device = drm_open_driver(DRIVER_XE);
-		igt_assert(xe_device);
-
-		break;
-	default:
-		igt_assert(!"missing");
-	}
-
-	return xe_device;
-}
-
 /**
  * xe_sysfs_engine_class_get_property
  * @xe_device: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 5bc733168..265f77d4d 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -183,14 +183,6 @@ int xe_sysfs_get_num_tiles(int xe_device);
 char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
 int xe_sysfs_engine_open(int xe_device, int gt, int class);
 
-enum xe_sysfs_driver_action {
-	XE_SYSFS_DRIVER_BIND,
-	XE_SYSFS_DRIVER_TRY_BIND,
-	XE_SYSFS_DRIVER_REBIND,
-};
-
-int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
-
 bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
 					uint32_t *value);
 bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,

-- 
2.49.0

