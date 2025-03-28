Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606F1C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 14:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BFE10E1CC;
	Fri, 28 Mar 2025 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kct8Nsva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214FA10E1CC
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743171215; x=1774707215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7GdqE5jXTvDTK3a0k0zxTkLaR2wFmnIUxa7smR5dlk=;
 b=kct8Nsva9b6f8M5pS8vC3JdRs/snHWOcxVff3G5LXkfh8Oqm805TZQ7x
 KbmtmM3MVtwxcGlUO1GhFHvNxA2K2UxqsvLymuGIck3s6Qkd8ZZlukp0G
 5rSdt4pMFIdE/biNS2DTU2Gk9bV3srWiyNAkKop8Coe3nmWe66emVE5N5
 tHh6WC72Hdb9yh5MALRQhSJ2u+SQ/FH4ew9KIHge72fg/cv/2MO+xCgzD
 lsJrJtiYrUHFjXs/9/wXfgNChxst7vY+e9dKkXbf1RUs+ME3uBCyva8tO
 74xe0N0t73hjo4nVfn5tj9YVrhIa2cn7XJpw859cqM9zRqIRW8y2xfroG w==;
X-CSE-ConnectionGUID: u87u3OKXRquGvjnh/ImF1Q==
X-CSE-MsgGUID: AArz0YGgRbCMqX3dqtOiXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67005059"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="67005059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 07:13:34 -0700
X-CSE-ConnectionGUID: xgfgWVmGSDCfSW0qOVAIBQ==
X-CSE-MsgGUID: 94xjTm/6T4m2X4voAmQtKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156388549"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 07:13:31 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v4 1/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
Date: Fri, 28 Mar 2025 19:39:59 +0530
Message-Id: <20250328141000.1847594-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328141000.1847594-1-soham.purkait@intel.com>
References: <20250328141000.1847594-1-soham.purkait@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
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

