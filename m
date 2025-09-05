Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8486CAC580
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 21:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5E510EC4A;
	Fri,  5 Sep 2025 21:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8qivhPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17310EC48
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 21:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106089; x=1788642089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RM6ZtH64PPCCyK1XsgHBBAY6IOAqEGUbQfA2Dib6LuI=;
 b=n8qivhPR0padUQaktETk1IfoDvsfePZARyZTGyT+kNPySbKzXE2Z/qD6
 gOivnTCb0f3C9Pa4/vp5T2Ot+SFaq5kQh0e1ppnuPTwjpwi/Ri8l6vw4S
 +pK0awO3Dps7h2ZTCZQIMMgrrANwh0bzHpdXB3iUo3uujG5Y9yK/n5tp1
 KwqGh02RHrkCjdfEM8Ln3ywt42bXWLWkBGmVl6YQDSwNYZSahQot/q30I
 cljFT1vAp0lJIG9yAv8S+gCDLwKEviUzmikbnWdQ9V6j6zfMYXYWAbQAA
 FfoCwNQkal5dZn7N1HQxjGabuZk79QszL10I10Hkc9g6d+BQ+0fIlTbaw g==;
X-CSE-ConnectionGUID: hUNdJP9YTYukKHqO3gVJJg==
X-CSE-MsgGUID: z54ZdjK7QxKM4jipItNuqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59530906"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59530906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:01:29 -0700
X-CSE-ConnectionGUID: Re2B2kKxRYujiseZunmpyQ==
X-CSE-MsgGUID: IJqiQqnOSlGPtpIVdsz8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="177459203"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:01:28 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v4 2/4] tests/kms_joiner_helper: Add
 igt_is_joiner_supported_by_source()
Date: Sat,  6 Sep 2025 02:38:14 +0530
Message-Id: <20250905210816.319104-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905210816.319104-1-swati2.sharma@intel.com>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_joiner.c        |  9 +++------
 tests/intel/kms_joiner_helper.c | 33 +++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  2 ++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index d1ddbeb60..e5cd33ef3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -33,7 +33,6 @@
  */
 
 #include "igt.h"
-#include "xe/xe_query.h"
 #include "kms_dsc_helper.c"
 #include "kms_joiner_helper.h"
 
@@ -546,8 +545,8 @@ static void test_basic_max_non_joiner(data_t *data)
 
 igt_main
 {
-	bool ultra_joiner_supported, is_dgfx;
-	int i, j, display_ver;
+	bool ultra_joiner_supported;
+	int i, j;
 	igt_output_t *output;
 	drmModeModeInfo mode;
 	data_t data;
@@ -570,9 +569,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
-		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
-		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
-		if (is_dgfx && display_ver == 14)
+		if (igt_is_joiner_supported_by_source(data.drm_fd, JOINED_PIPES_ULTRA_JOINER))
 			ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index 17a22d34a..8f77ccde4 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -179,3 +179,36 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	}
 	return true;
 }
+
+/**
+ * igt_is_joiner_supported_by_source:
+ * @drm_fd: drm file descriptor
+ * @type: joiner type
+ *
+ * Returns: True if (ultra|big)joiner is supported by platform, false otherwise
+ */
+bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type)
+{
+	int disp_ver;
+	bool is_dgfx;
+
+	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
+	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	switch (type) {
+	case JOINED_PIPES_BIG_JOINER:
+		if (disp_ver < 12) {
+			igt_info("Bigjoiner is not supported on D11 and older platforms.\n");
+			return false;
+		}
+		return true;
+	case JOINED_PIPES_ULTRA_JOINER:
+		if (is_dgfx && disp_ver == 14) {
+			igt_info("Ultrajoiner is supported on dgfx with D14 only.\n");
+			return false;
+		}
+		return true;
+	default:
+		return false;
+	}
+}
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 8a6f8e5ad..5f55fe4be 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -7,6 +7,7 @@
 #define KMS_JOINER_HELPER_H
 
 #include "igt_kms.h"
+#include "xe/xe_query.h"
 
 void igt_set_all_master_pipes_for_platform(igt_display_t *display,
 					   uint32_t *master_pipes);
@@ -17,4 +18,5 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t *used_pipes_mask,
 				  uint32_t master_pipes_mask,
 				  uint32_t valid_pipes_mask);
+bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type);
 #endif
-- 
2.25.1

