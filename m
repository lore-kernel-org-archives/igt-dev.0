Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55507C54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F348910E118;
	Wed, 21 May 2025 07:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1awsDgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120EC10E118
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812192; x=1779348192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aRvfy9qJtJnQs2TgtXiz/smE/YkM6pswQ9FAMWR86Ug=;
 b=H1awsDggbWa79vNNKbL6FQYzkycruCRwfMGz0yRchQFD3YbvzKe8bord
 rr9G9INF40u1yS6HGqVeSrCn+FHotwi121kaVV/N9AV7jU+BCE8RuMB8i
 X82srCNPHvOhE55dztYQkFsG0O2LIEYklRO5+49duEsc04filnP64sQc6
 hFWv0ktw9tFGrfdjEoB46/hQ3lsUZ/tDRS1QTES5jX+QydvIVJcqLOZ1n
 lIxa+lBu35G/HsJLVgVNn9HOWVn0meHo8SWS2rEmg45uj19tVv8fgckg3
 /TDqY1KEGzn/WnXPODtcZ2yMO6io7piOeDV5SDNYSx44RvtJE53xQT/M3 w==;
X-CSE-ConnectionGUID: ZyrM4j6CQDij+nDSBTV2dA==
X-CSE-MsgGUID: dVRNAtjYQeuRosDAXxlN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571296"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571296"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:11 -0700
X-CSE-ConnectionGUID: 1bxu2fTrQjSBPJHF9lqv8A==
X-CSE-MsgGUID: MoIeMHbRSQujEU9tYOeTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943788"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/5] lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
Date: Wed, 21 May 2025 12:58:33 +0530
Message-Id: <20250521072836.1400749-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521072836.1400749-1-swati2.sharma@intel.com>
References: <20250521072836.1400749-1-swati2.sharma@intel.com>
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

Function is added to force compressed bpp via debugfs
intel_force_link_bpp.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 18 ++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 4caad39db..21677b0e0 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <string.h>
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_dsc.h"
 #include "igt_sysfs.h"
@@ -141,6 +142,23 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
 }
 
+/**
+ * igt_force_dsc_enable_compressed_bpp:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @bpp: Compressed BPP
+ *
+ * Returns: 0 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_enable_compressed_bpp(int drmfd, char *connector_name, float bpp)
+{
+	char buf[20] = {0};
+
+	sprintf(buf, "%.2f", bpp);
+
+	return write_dsc_debugfs(drmfd, connector_name, "intel_force_link_bpp", buf);
+}
+
 /**
  * igt_get_dsc_debugfs_fd:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 3cf2d4e76..ab5d27b06 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -17,6 +17,7 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
+int igt_force_dsc_enable_compressed_bpp(int drmfd, char *connector_name, float bpp);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
 bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
 						enum dsc_output_format output_format);
-- 
2.25.1

