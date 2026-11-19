Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B9606A33F
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n7Wrff+1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ED2112232;
	Thu, 19 Nov 2026 09:55:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E111D112232
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795082017; x=1826618017;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3nghHIfA5Q/I/MoZI7W47yAoKR+vsXWGbHJ3QZdxM7k=;
 b=n7Wrff+1jKT6SEFChs6k/XU0F9EupernQ45OnOseW+XkRdaThGZ4ZlNo
 NGmZCsSiB5tDzGVKrOSvCb+2MMYgkh83uaS8BcGxFrR5XhY3MomJptEIc
 VcktT45Q88mK6q7H/+2G0u00O6V1ZSgMOXCErmCkMLkIOMimg1fCsNlCI
 JgJTK+Vkhjo7B/UQAf3nOFS+Z6x/e6xG+/OCSztbozr+cdRuZ4j1kJFVH
 wDR76nP9JQ1DQNtZnnhsV+5wGaCiVcq60x62jOxa4+U0MSP3Ce8bsr0VW
 O5SuILzmBwyzjgqNz9+RYbXii8gb8KdRYGn01TzHB65b54XitMA8DAIgG Q==;
X-CSE-ConnectionGUID: +ldaazpSTquJXWN2mrMYNA==
X-CSE-MsgGUID: 3sX0phjiTbq57TqG0QTzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3929151"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3929151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:53:37 -0800
X-CSE-ConnectionGUID: 5SvpYjNUSr2pAyd+Z1M6nw==
X-CSE-MsgGUID: +cEjl7kbSW2iU0c9o3s1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10478297"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa001.jf.intel.com with ESMTP; 19 Nov 2026 01:53:36 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH v1 1/2] lib/xe: Add helper to limit driver debug logs in CI
Date: Thu, 19 Nov 2026 09:53:32 +0000
Message-ID: <20261119095333.182110-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119095333.182110-1-nishit.sharma@intel.com>
References: <20261119095333.182110-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

Tests that migrate a lot of memory can generate a DRM_UT_DRIVER debug
message for each migrated 8 MiB or bigger chunk, exceeding the CI
runner's log-size limit on large-VRAM devices.

Add xe_drop_driver_debug_if_ci() so tests can, with a single call, clear
DRM_UT_DRIVER from the DRM debug mask while running under CI. The other
debug categories are preserved and the original mask is restored on exit.
The same function can be called from any test facing the migration debug
log issue.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_util.c | 28 ++++++++++++++++++++++++++++
 lib/xe/xe_util.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 6246841e6..5a3d2c1b3 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -360,3 +360,31 @@ void xe_fast_copy(int fd,
 	put_ahnd(ahnd);
 	intel_ctx_destroy(fd, ctx);
 }
+
+/**
+ * xe_drop_driver_debug_if_ci:
+ *
+ * The KMD emits a DRM_UT_DRIVER debug line for every chunk it migrates, so
+ * tests that migrate a lot of memory can flood the log on big-VRAM devices
+ * and exceed the CI runner's disk usage limit. When running under CI, clear
+ * only DRM_UT_DRIVER from the DRM debug mask, keeping the other categories,
+ * and restore the original mask on exit. Does nothing outside CI or when
+ * DRM_UT_DRIVER is not set.
+ */
+void xe_drop_driver_debug_if_ci(void)
+{
+	int debug_mask, dir;
+
+	dir = igt_sysfs_drm_module_params_open();
+	if (dir < 0)
+		return;
+
+	debug_mask = igt_drm_debug_mask_get(dir);
+	close(dir);
+
+	if (debug_mask <= 0 || !(debug_mask & DRM_UT_DRIVER))
+		return;
+
+	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+	update_debug_mask_if_ci(debug_mask & ~DRM_UT_DRIVER);
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 8dcfd2fb7..83d84fb50 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -55,6 +55,8 @@ void xe_fast_copy(int fd,
 		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
 		  uint64_t size);
 
+void xe_drop_driver_debug_if_ci(void);
+
 static inline uint64_t xe_canonical_va(int fd, uint64_t offset) {
 	return sign_extend64(offset, xe_va_bits(fd) - 1);
 }
-- 
2.43.0

