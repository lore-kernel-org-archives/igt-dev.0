Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FD7CA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 05:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ECB10E86E;
	Wed,  3 Sep 2025 05:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXkckCES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8710E86E
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 05:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756877088; x=1788413088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ySbjo+NWP9blUDzdHwMrxtFaXu9bunCpR6P7kesF0qE=;
 b=UXkckCEShrCVxvDWtEIexa6WCeTk36Fd/kn7fPcXGnT94NP/4xr9jbtw
 q4vswDZu/NGRoRGALdfedD3GUWlBXdNZxC9I/yk8ieS2LWc9M5mgMtNgP
 uckPRoAzmbs/xzvYicHtMBBAL4yfCzQWyKHfggLzNZG1w/bA4Ao9Y4R+i
 6m2NtI6bGe63S+d5N+ON9SFXTRotG7VNsxOiqO8l4syjNFJpJIqF/jPbx
 xJPTQvc7c7uzHzNpSIL2rBBDJ7df1BJRMoEU+4bF2Ry+pqI9TqD6apZ5+
 67YZiV2c+hAcPRw1vhIcZdpneo6/GTIm5jXwfQycnnc4OSLcsx2ReRjRh w==;
X-CSE-ConnectionGUID: q7vgkvbVRsm3qb+d9ogAFw==
X-CSE-MsgGUID: /3KkMi3JQfKeWrbyNXERiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69881338"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69881338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:24:48 -0700
X-CSE-ConnectionGUID: Kd+Jpho8RpqHTgp16GiihA==
X-CSE-MsgGUID: WJJefpImRgqcpeOquVtTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="176743681"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 22:24:46 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH v4 i-g-t 1/4] lib/dsc: Add helpers to disable force dsc
Date: Wed,  3 Sep 2025 10:37:15 +0530
Message-Id: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
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

