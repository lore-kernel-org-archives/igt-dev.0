Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E2CCA0EF8
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 09:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C610E908;
	Thu, 21 Aug 2025 09:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeYjFxnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8010E908
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755769968; x=1787305968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ySbjo+NWP9blUDzdHwMrxtFaXu9bunCpR6P7kesF0qE=;
 b=LeYjFxnv3u0RlErsVBP8ocsiFhJLsQowk2ca3eXlOWdUqBx5KkCxcx+U
 vy2Hbf7ZpuIJW6nwKiukBYMH99mT8sMJEZ3iun/55aA1i2sVM46xVHMCx
 TOcY4/mb16NPvV9+jw0NtO1GCxbPm/i12cJKWCErDMZblRdAwsMeb4oz5
 IgzXnGUICHoL0Aa+pan9haLtkV6+2Ia1M75XLxXP+bo02D7NvP0MZwoqi
 p6zytGrG7ggHhOujXl5FDRg8z1kxD85FwdVLHkJlGk79VujxG5uhUPJa0
 cOZzGX0uzrMq23gViOuxBvFiqiC/5V9HLISY/hFo67zVEH9949SjunM3+ w==;
X-CSE-ConnectionGUID: NHaD1R0nQpKesbLnNpcF2A==
X-CSE-MsgGUID: xQphRg2GSCSCVt+f9UO+zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69155411"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69155411"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:52:47 -0700
X-CSE-ConnectionGUID: 9dKddGkMTkSWyd9Wzbfw9w==
X-CSE-MsgGUID: 3ErJDaGMQ5GE8rK1rgpQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168733007"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2025 02:52:46 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH v2 i-g-t 1/3] lib/dsc: Add helpers to disable force dsc
Date: Thu, 21 Aug 2025 15:05:09 +0530
Message-Id: <20250821093511.937552-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add helpers to disable "force dsc" and verify that it is disabled

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 25 +++++++++++++++++++++++++
 lib/igt_dsc.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 4caad39db..3754eef07 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -124,6 +124,31 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "1");
 }
 
+/**
+ * igt_is_force_dsc_disabled:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: True if DSC is force enable is disabled (via debugfs) for the given connector,
+ * false otherwise.
+ */
+bool igt_is_force_dsc_disabled(int drmfd, char *connector_name)
+{
+	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: no");
+}
+
+/**
+ * igt_force_dsc_disable:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: 0 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_disable(int drmfd, char *connector_name)
+{
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fec_support", "0");
+}
+
 /**
  * igt_force_dsc_enable_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 3cf2d4e76..f63345848 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -17,6 +17,8 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
+int igt_force_dsc_disable(int drmfd, char *connector_name);
+bool igt_is_force_dsc_disabled(int drmfd, char *connector_name);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
 bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
 						enum dsc_output_format output_format);
-- 
2.25.1

