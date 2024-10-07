Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D1CCFB441
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 10:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E090E10E1EE;
	Mon,  7 Oct 2024 10:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa0GWks6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF95310E1EE
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728296872; x=1759832872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l1PeHYdxyF2qNLG8m4QlHo0QNjz8VV1aDng7Kxm+UNM=;
 b=Sa0GWks6Ygy86rSeCD0h7IcffRfy1TAkyEElteGUu2sNA1YmOQEe901m
 V/ybMtD1HePc1RBAYk3ZOz3QDakxoEBjo5JRmVQKwftTWR7Ptbb9MTkP2
 7XKRCs23DK+90nECYB+b4siHfKvmjlC8nLDGvFjVUpsZmMZJi2UXKWwfM
 qiIlaNJoPNDnqJozU67OX06BRzbnz4Uomb4Hg2tkyR1l/shwfoDy+VP5i
 pmrfstO2r92Ph3WS+H3dWcvRrHHuwQTqs0PHKPjf4VHVn9RQ9fXtho3O7
 3WmoGnsBXtq+LOu2t4sLrVDOjPRQvQoPlS34Eh4yjazBo8QuMGtJfeWRB Q==;
X-CSE-ConnectionGUID: /xsTTF4CQASwPB6QkASLqA==
X-CSE-MsgGUID: 8mmijiqTSNirvhUY/uTpew==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38565981"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38565981"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:27:52 -0700
X-CSE-ConnectionGUID: Wb5CBuYrRFCkdFq0Iw0ohQ==
X-CSE-MsgGUID: zyB2qh7KRHOpcUZDqvVQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80020317"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.244])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:27:49 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class property
 helpers
Date: Mon,  7 Oct 2024 12:27:33 +0200
Message-Id: <20241007102734.5452-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
References: <20241007102734.5452-1-dominik.karol.piatkowski@intel.com>
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

Introduce the following engine_class helpers:
 - xe_sysfs_engine_class_get_property
   Convenience wrapper to get value of given property for given engine
   class on given gt.
 - xe_sysfs_engine_class_set_property
   Convenience wrapper to set given property for given engine class on
   given gt to given value.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_sysfs.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  5 +++
 2 files changed, 90 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index b7746a1ec..26a3aa31f 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1414,3 +1414,88 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 
 	return xe_device;
 }
+
+/**
+ * xe_sysfs_engine_class_get_property
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ * @property: property of engine class to retrieve
+ * @value: pointer for storing read value
+ *
+ * Convenience wrapper to get value of given property for given engine class on given gt.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t *value)
+{
+	int engines_fd;
+
+	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_get_u32(engines_fd, property, value)) {
+		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+
+	return true;
+}
+
+/**
+ * xe_sysfs_engine_class_set_property
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ * @property: property of engine class to be modified
+ * @new_value: value to be set
+ * @old_value: pointer for storing old value, can be NULL
+ *
+ * Convenience wrapper to set given property for given engine class on given gt to given value.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t new_value, uint32_t *old_value)
+{
+	int engines_fd;
+
+	engines_fd = xe_sysfs_engine_open(xe_device, gt, class);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open %s on gt%d.\n", xe_engine_class_to_str(class), gt);
+
+		return false;
+	}
+
+	if (old_value && !__igt_sysfs_get_u32(engines_fd, property, old_value)) {
+		igt_debug("Failed to read %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_set_u32(engines_fd, property, new_value)) {
+		igt_debug("Failed to write %s property of %s on gt%d.\n", property,
+			  xe_engine_class_to_str(class), gt);
+		close(engines_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+
+	return true;
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 0ee253826..852b95053 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -184,4 +184,9 @@ enum xe_sysfs_driver_action {
 
 int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
 
+bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t *value);
+bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
+					uint32_t new_value, uint32_t *old_value);
+
 #endif /* __IGT_SYSFS_H__ */
-- 
2.34.1

