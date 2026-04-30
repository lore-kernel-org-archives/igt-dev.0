Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57334CD13DA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 19:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0287710F41D;
	Thu, 30 Apr 2026 19:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4lx31aL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EB610F41D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 19:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777575701; x=1809111701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nqr6kCn0gG3qVw06WfM4gECw82T7nB/3RgIHcucwcWE=;
 b=X4lx31aLATBf1RzAh8O0+O0VvCRlTAaEY+4gm4dttC1D5D+Ys0lk8U29
 POizeId1wooMUJ7ESxzMgfVszRu4kFVPhoFZe9d2m86vpGEEi7YsuDbjD
 s/7r2FI3Dq5J33FILbHIf+p72Ppz8WpKjpQlkkpLZ9dppFGloMIWVU8Sn
 ybITU3PzA4k1OsVuFBqH5c6Tlo7P9hbAaG+NHCDTitfuokucgQIySp3aB
 v3pH8+/hYwZqmxzD4a0wXSnJbNPAj7yaEBHwqIA7ssO48xfTZ9dX3M1LY
 zT9UcmELx1IbLx1L9F2VLUG+1stAAkXX7vznxAmDQqH/kbWYbqrDiJg6+ g==;
X-CSE-ConnectionGUID: iI6kUm+HQhm736G7m3An3Q==
X-CSE-MsgGUID: QxfH/CniRlWCDun6/o3DkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90003572"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="90003572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:01:27 -0700
X-CSE-ConnectionGUID: KXJczIFuQiijukVdZwJlWw==
X-CSE-MsgGUID: wO3DLcweSXm3XO/ZpDcRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234559279"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:01:26 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v6 2/4] tests/kms_joiner_helper: Add
 igt_is_joiner_supported_by_source()
Date: Fri,  1 May 2026 00:39:45 +0530
Message-Id: <20260430190947.2347314-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260430190947.2347314-1-swati2.sharma@intel.com>
References: <20260430190947.2347314-1-swati2.sharma@intel.com>
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

Add func() returning true/false if platform supports big/ultra
joiner and use corresponding func() in related binaries.

v2: -Moved func() to joiner_helper (Jeevan)
    -Use common func for ultra|big joiner (Ankit)
v3: -Rename param type to joiner_type (Ankit)
    -Fix ultra joiner condition logic (Karthik, Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_joiner.c        |  8 ++------
 tests/intel/kms_joiner_helper.c | 33 +++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  2 ++
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba..2cd0d7276 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -33,7 +33,6 @@
  */
 
 #include "igt.h"
-#include "xe/xe_query.h"
 #include "kms_dsc_helper.c"
 #include "kms_joiner_helper.h"
 
@@ -619,9 +618,8 @@ static void test_basic_max_non_joiner(data_t *data)
 
 int igt_main()
 {
-	bool is_dgfx;
 	igt_crtc_t *crtc;
-	int j, display_ver;
+	int j;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
@@ -644,9 +642,7 @@ int igt_main()
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
-		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
-		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
-		if (is_dgfx && display_ver == 14)
+		if (igt_is_joiner_supported_by_source(data.drm_fd, JOINED_PIPES_ULTRA_JOINER))
 			data.ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index 0aa409ac2..d51aa77e5 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -184,6 +184,39 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	return true;
 }
 
+/**
+ * igt_is_joiner_supported_by_source:
+ * @drm_fd: drm file descriptor
+ * @joiner_type: joiner type
+ *
+ * Returns: True if (ultra|big)joiner is supported by platform, false otherwise
+ */
+bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type)
+{
+	int disp_ver;
+	bool is_dgfx;
+
+	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
+	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	switch (joiner_type) {
+	case JOINED_PIPES_BIG_JOINER:
+		if (disp_ver < 12) {
+			igt_info("Bigjoiner is not supported on D11 and older platforms.\n");
+			return false;
+		}
+		return true;
+	case JOINED_PIPES_ULTRA_JOINER:
+		if (!is_dgfx || disp_ver != 14) {
+			igt_info("Ultrajoiner is supported on dgfx with D14 only.\n");
+			return false;
+		}
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * igt_get_joined_pipes_name:
  * @val: joined_pipes enum value
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 1ea871a3b..7ede624c6 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -7,6 +7,7 @@
 #define KMS_JOINER_HELPER_H
 
 #include "igt_kms.h"
+#include "xe/xe_query.h"
 
 void igt_set_all_master_pipes_for_platform(igt_display_t *display,
 					   uint32_t *master_pipes);
@@ -17,6 +18,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t *used_pipes_mask,
 				  uint32_t master_pipes_mask,
 				  uint32_t valid_pipes_mask);
+bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes joiner_type);
 const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
 enum force_joiner_mode {
-- 
2.25.1

