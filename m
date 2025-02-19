Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63638C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 11:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFCB10E7B7;
	Wed, 19 Feb 2025 11:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp7BbL3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2DB10E299
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739966016; x=1771502016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9GfklVzbgpN+ZVp0fVeTADLSBI4hXvG3aP12ctP81Y=;
 b=bp7BbL3sIcXMqPK1IrbT3UIGT9Ai2noqpciC1P0paevQK2krReR0CHOv
 UV74OmqpvpTmmzsX7EF8IUSFHVwBfQnxT1pHdbMaRG1Ngn/aDLI4iK9RZ
 x/lnBr293SHTqrD8TkyjfvCxmK+wMuPJsnWFTXUDkNEBykIkw8LnU3hVB
 9GCoal/yhSuugC0ewHIO8fWBVGVL3JYroR3+AQlgu/u2qNwSDyEs0KUzy
 RxrYaJyUkoe7PJ5WuHGKQpQOj+8huvrKQNlYDb6oifIuvRVpyBX+9t71Q
 R/LrUSit6I7JUUlIFR23c1+ZWIxcpy8Il90G4+4ljIdUoycBYXPMymvnW Q==;
X-CSE-ConnectionGUID: CrXZA7+SR2OUoWRpEBOiqw==
X-CSE-MsgGUID: TYtJFtd9QumIrjZkaoc+fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40556116"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40556116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:36 -0800
X-CSE-ConnectionGUID: ETZLOo76SQiFIqRTzdXCfA==
X-CSE-MsgGUID: oxBAjV+dT7+n7Wjzv3mgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137938434"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.136])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 03:53:33 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_sriov_device: Add intel_is_vf_device helper
Date: Wed, 19 Feb 2025 12:53:13 +0100
Message-Id: <20250219115314.180382-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
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

Introduce intel_is_vf_device helper to determine whether a given device
is a Virtual Function (VF). The function reads the VF_CAPABILITY_REGISTER
and checks if the least significant bit is set to identify VF device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/igt_sriov_device.c | 26 ++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 2b83cd43c..ffa996d6b 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -14,6 +14,7 @@
 #include "igt_device.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
+#include "intel_io.h"
 #include "xe/xe_query.h"
 
 /**
@@ -464,3 +465,28 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num)
 
 	return ret;
 }
+
+/**
+ * intel_is_vf_device - Check if device is VF
+ * @device: device file descriptor
+ *
+ * Determines if a device is a Virtual Function (VF)
+ * by reading VF_CAPABILITY_REGISTER. If the least
+ * significant bit is set the device is VF.
+ *
+ * Return:
+ * True if device is VF, false otherwise.
+ */
+bool intel_is_vf_device(int fd)
+{
+#define VF_CAP_REG		0x1901f8
+	struct intel_mmio_data mmio_data;
+	uint32_t value;
+
+	intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), false);
+	value = intel_register_read(&mmio_data, VF_CAP_REG);
+	intel_register_access_fini(&mmio_data);
+	igt_require((value & ~1) == 0);
+
+	return (value & 1) != 0;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 2b6acb6d7..912449086 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -33,6 +33,7 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
 int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
+bool intel_is_vf_device(int device);
 
 /**
  * __is_valid_range - Helper to check VF range is valid
-- 
2.31.1

