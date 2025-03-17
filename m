Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61CEC35FF8
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 08:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57C10E3CE;
	Mon, 17 Mar 2025 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/sv1qmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E32F10E3CE
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742200304; x=1773736304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dJR+P3D6k1xmW3+Z026Oan59/03ASX3aRE4HTKgG/w=;
 b=Z/sv1qmtqRZ2pOijhT0YWCGjUYAdn3OYaw9O+SPaZxlIqpD58z9AX8aH
 zNuqNK7nr7Kk4Oa5gxltXkVneA58a0dTJpwabOWzexoN/vyVnC4kV+YBh
 q7LMw+xgeVtFe4nknI/YFOoqHE+KG++6VHdpk7FUk7LedF2DlWNyJ53f+
 o8trTzU5vlOoyR4CscQslwDNA0Yfzpj5MWyDENZ/p0s5xTaO8KirY4nKq
 J+ogqUpSnlJNRvByeutqharyOw8oqZWaTcpJ9ZePOrDRd1f9kT0xIFWUP
 0Rb4cbF9PuqcZ8AK+0IEVGyUs02eHdbk93l0Hh6qvwmB+VpG/AxCxoLiG A==;
X-CSE-ConnectionGUID: dZkYSjduTNKFf1ylp4948Q==
X-CSE-MsgGUID: 2cXCfS1+QCy8hhRxBwyWig==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43166101"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43166101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:44 -0700
X-CSE-ConnectionGUID: m8keFDzkQTu5BE2rSwPx+w==
X-CSE-MsgGUID: jTYPp2EmRm+IiKWH95rurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="127056575"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH <i-g-t> v1 2/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
Date: Mon, 17 Mar 2025 13:58:23 +0530
Message-Id: <20250317082823.1631744-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317082823.1631744-1-soham.purkait@intel.com>
References: <20250317082823.1631744-1-soham.purkait@intel.com>
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

