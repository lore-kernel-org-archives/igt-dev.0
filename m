Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAF8E77182
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 13:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352B10E8E1;
	Tue, 10 Dec 2024 13:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBjnMh/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EB310E8E1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733838630; x=1765374630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+RjgjcqaIZKYre08WWpT50dDn2tznNtvp/Cwa6fmak=;
 b=DBjnMh/IH5RyK2WQvehbrwF9B79kxmRR2N/+4dZUDvC+Vle4g8lzEfth
 EZAOi4khYsWzsUNqF/YTtkMnMocn/2bc5DjcbGY3Oe8LyA7F/UefteHQa
 qCahWR/zpjqDmMFVAkJ1BN8WIr2S/hS9rClZwgy5V8rmx3kluwy/AdnC+
 fo9wu2kpVLVjyG48CK9PpGomloVu9Er/IJm0/SlhakeLRyFO7xUc/yROM
 +4ea1qtUbaAonRDDytkrnvnIsggbM7Mi/DO6ecdJOlJQCHvUXSj2e+V4w
 Seic5cr/t/+B4EgEjo3zUa+pvHSvSQdAIdmtg//70zkFFHC5GQ2cheACj Q==;
X-CSE-ConnectionGUID: aXd2yvMJSWqBLK62iQt7lQ==
X-CSE-MsgGUID: u6akIuDxSECSNtY0UgwPqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34316549"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34316549"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:30 -0800
X-CSE-ConnectionGUID: n+oF3DMySR2+Gj+CH2lcQw==
X-CSE-MsgGUID: bEythgqwQp+5ramDLviUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="132804980"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:50:29 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] lib/dsc: Add helper
 igt_get_dsc_sink_max_slice_count()
Date: Tue, 10 Dec 2024 19:23:21 +0530
Message-Id: <20241210135322.2117541-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210135322.2117541-1-swati2.sharma@intel.com>
References: <20241210135322.2117541-1-swati2.sharma@intel.com>
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

Helper is added to return maximum dsc sink slice count from the
connector debugfs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 24 ++++++++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 229cd3298..8d259b734 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -308,3 +308,27 @@ int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
 
 	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
 }
+
+/**
+ * igt_get_dsc_sink_max_slice_count:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Returns: The maximum dsc sink slice count from the connector debugfs.
+ */
+int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
+{
+	char file_name[128] = {0};
+	char buf[512];
+	char *start_loc;
+	int max_slice_count;
+
+	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
+	igt_debugfs_read(drmfd, file_name, buf);
+
+	igt_assert(start_loc = strstr(buf, "DSC_Sink_Max_Slice_Count: "));
+	igt_assert_eq(sscanf(start_loc, "DSC_Sink_Max_Slice_Count: %d", &max_slice_count), 1);
+	igt_assert(max_slice_count > 0);
+
+	return max_slice_count;
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 7ab0917ec..3cf2d4e76 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -27,5 +27,6 @@ int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
 bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
+int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
 
 #endif
-- 
2.25.1

