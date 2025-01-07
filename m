Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A153E77199
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 18:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E931B10E1B6;
	Tue,  7 Jan 2025 18:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apA3ftTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57E110E1B6
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 18:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736275922; x=1767811922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r4fKlpEYRPEUVMlSKJdKbBFgHGwn0hxbrZLx4VvAAMo=;
 b=apA3ftTCj9m6shFQy6/EL2lxGcrq3HFgP82nLhON4iRNNJsDNlNlqYq3
 X5WknU2Lm2M9VmePg6t4toPeHv0hTfHBR66a2eXoKi6x5abqdiGpDchUf
 jfkOvY3vLXRej/WxeKN0k0TTQx168gJftYPj3E2zh16f/u5wStpjb6+fj
 3FO8xwYzIzR6KZ7RYrR6R/ysZfhoxspuwdVvwS9fEidujzEC5sqWx3Z3c
 salY1XWfODzLrFEA9nP9o2E7Ihqrmnc6dgwMM3uE50yk3QKt+lgqTb1vB
 l8sgwaqrKVMS++wUy23yrFEWdCjGGTVQ2nYkpcmOVsxfaBHnhk3XVv0f+ g==;
X-CSE-ConnectionGUID: uMdmXq4XTACZOH5MJRm+WA==
X-CSE-MsgGUID: Nnp6ktTvT7ObBNMSCAl+5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="58942022"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="58942022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:02 -0800
X-CSE-ConnectionGUID: ET/OIdDLTQi51VS6ot5JFA==
X-CSE-MsgGUID: 5WN79EURQK6LvwN94D81cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103706855"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:52:00 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
Date: Wed,  8 Jan 2025 00:27:06 +0530
Message-Id: <20250107185709.116756-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107185709.116756-1-swati2.sharma@intel.com>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
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

Add function to transform the enum into a string.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a67d17c4f..8ee8741d9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -61,6 +61,7 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
+#include "xe/xe_query.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
@@ -1803,6 +1804,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
 	return true;
 }
 
+/**
+ * igt_get_joined_pipes_name:
+ * @val: forced value
+ *
+ * Simple function to transform the enum into a string.
+ */
+const char *igt_get_joined_pipes_name(enum joined_pipes val)
+{
+	switch (val) {
+	case JOINED_PIPES_DEFAULT:
+		return "";
+	case JOINED_PIPES_NONE:
+		return "-none";
+	case JOINED_PIPES_BIG_JOINER:
+		return "-big-joiner";
+	case JOINED_PIPES_ULTRA_JOINER:
+		return "-ultra-joiner";
+	default:
+		igt_assert(false);
+	}
+}
+
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e2a927ab..c4d76bdcb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1275,5 +1275,6 @@ int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.25.1

