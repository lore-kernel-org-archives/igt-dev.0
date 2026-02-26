Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CFFC591D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 09:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8CE10E8A6;
	Thu, 26 Feb 2026 09:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKZW6Bj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C2410E8A4
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772098924; x=1803634924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wBwRsY5nDdPll96SOgM5aN4giJPGSBikoq1P3VRXLg8=;
 b=IKZW6Bj0En9MSfHdfzHzuvZCGJbMwwQY4p7/MHxte+Vl+j1lehGk/gzR
 jV38MJ59+JMCL6C/KhTmYg0EZRHjT/AMStSdNmDeN/AcUk4eP2quqdnTO
 WmCOJPKd3PGepx3w8HibQ6oU4XRpTC1tL8A4/zsu+kODOnJ3ejAkloeFs
 1w2YDGBVaAJiyJ/pECaCk5lMQByeFerPIGLgAZddgWwVOyY8vfPlR77ni
 pDnfmm0sXaBJzTvBfeCZXz3h450rPyfq1YCiRT6n/Tr3Xr6VhsgZVPux4
 +VBDRmNAZ9s3euTJm+SuLX0c+bw1750BuAOPo37Hkxl3keE7JGe6YRu1D w==;
X-CSE-ConnectionGUID: MTHyG9mwQLGUQmSGepP09w==
X-CSE-MsgGUID: 49Of+1s8SYuBs1fdECz+BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90565311"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="90565311"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:42:04 -0800
X-CSE-ConnectionGUID: VxfG1nOgRFqDNVzCxHRIHw==
X-CSE-MsgGUID: yB6Q1WbPSKSowXpcBUK0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="220654627"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:42:02 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] lib/igt_psr: Fix Early Transport status handling
Date: Thu, 26 Feb 2026 15:12:51 +0530
Message-ID: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Make Early Transport check output‑aware and align with updated PSR
status text.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c             | 8 +++++---
 lib/igt_psr.h             | 2 +-
 tests/intel/kms_psr2_sf.c | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 7e50c3dc6..20f3d9b00 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -69,14 +69,16 @@ static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
 /*
  * Checks if Early Transport is enabled in PSR status by reading the debugfs.
  */
-bool early_transport_check(int debugfs_fd)
+bool early_transport_check(int debugfs_fd, igt_output_t *output)
 {
 	char buf[PSR_STATUS_MAX_LEN];
+	char debugfs_file[128] = {0};
 
-	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	SET_DEBUGFS_PATH(output, debugfs_file);
+	igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				sizeof(buf));
 
-	return strstr(buf, "enabled (Early Transport)");
+	return strstr(buf, "selective update (Early Transport)");
 }
 
 static bool sink_status_checks(void)
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 7639f8d46..53ab04483 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -49,7 +49,7 @@ enum fbc_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
-bool early_transport_check(int debugfs_fd);
+bool early_transport_check(int debugfs_fd, igt_output_t *output);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 5bcbc8df4..00283169b 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -962,7 +962,7 @@ static void run(data_t *data)
 							  "FBC still disabled\n");
 
 	if (is_et_check_needed(data))
-		igt_assert_f(early_transport_check(data->debugfs_fd),
+		igt_assert_f(early_transport_check(data->debugfs_fd, data->output),
 			     "Early Transport Disabled\n");
 
 	data->screen_changes = 0;
-- 
2.43.0

