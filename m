Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C55C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E671710E09C;
	Thu,  6 Mar 2025 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il17f7Yb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4978610E09C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741288559; x=1772824559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hURdx4nsT4yg5uBe4Pd0tTjv4/mC+n8b9Fixbko91kY=;
 b=Il17f7YbuVeH7G21k0kM6wiEf6jnk03GeFSCvkqj40C++T+sZBbiwE2w
 YZRt7KRoy9Yn166evgi+H9WSTAhTTOWwbOPZixIOsiN6rufJRgG5ukOJo
 WeLPq0MBb0AkBJv1yhDH5ZpnSWALZvs+FNVKaAhVui9kqTyLNoAXkqbYD
 CD5JzN68SbV1Pp6xCqD9K6SzkWRAn0sbnr/691TS3NV7VSZSKOjb88pnm
 KxjEPkOgR5IDTMRsSFkFfZ3UYDZDhORJgEq6mwKUaoneFdKs7FkC4/rEw
 VRCC5hsxghlX7+//RqwhY/JY/Yc0VsocrXTr+o6fOkBs/GaA+iHHTkKOH w==;
X-CSE-ConnectionGUID: pQkb3ue6Suy3oTTPcVVNlg==
X-CSE-MsgGUID: 0aLSxWWkQ6eiNMdw1cHHQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52961327"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="52961327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:15:59 -0800
X-CSE-ConnectionGUID: AqzRJ3lfT3iBKRExYSF1Sw==
X-CSE-MsgGUID: cASobuCwQBiVeCe2IJqK6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="124145819"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:15:58 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm: Add a check for power management
 capability
Date: Thu,  6 Mar 2025 19:06:21 +0000
Message-Id: <20250306190621.260153-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a check for power management capability of device tested. Currently
if test is started on configuration that does not support the PM
capability it doesn't skip, instead depending on test it may fail, abort
or timeout.
With this change test will skip with a clear message why it did.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_pm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..049596ebc 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -17,6 +17,7 @@
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_pci.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -38,6 +39,8 @@
 #define PREFETCH (0x1 << 1)
 #define UNBIND_ALL (0x1 << 2)
 
+#define PCI_PM_CAP_ID 0x01
+
 enum mem_op {
 	READ,
 	WRITE,
@@ -779,6 +782,7 @@ igt_main
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
+	int offset;
 
 	const struct s_state {
 		const char *name;
@@ -812,6 +816,11 @@ igt_main
 		device.fd_xe = drm_open_driver(DRIVER_XE);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
+
+		/* Make sure power management capability is present for device being tested */
+		offset = find_pci_cap_offset(device.pci_root, PCI_PM_CAP_ID);
+		igt_require_f(offset > 0, "PCI power management capability not found\n");
+
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-- 
2.34.1

