Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670ACC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94B10E69A;
	Wed, 21 May 2025 07:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJTYN4RU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6026510E69A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812195; x=1779348195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1hOrkzkSmCkEicKR3diyrJqhTYus9RqaUM0faIwUo+A=;
 b=gJTYN4RUn1BC8uDoUbib/KgkkBG2eTQAVk1n9loVbW5D7AoZCEwJHubM
 aAZiiVAqcRQw0oFifyO16GgDha9l4179DKlQNEgsEtSoUx43aiqpToPru
 7ffSEv38KjA7uK1f5qir08EhTYzU2cZp6GLvTCGzWUNrpmxS+fhoHvlc6
 sMHTH0RrYF9K9KNbRX+A9J0JNOJJWzAmIhrmxdoLS0AgrtLZt2aoAhMgA
 4w5ULAAP9HngKhVx+2ahGqkFXWxlaCzZ7VTsxKhuNIJXJ2wk67HgES20H
 jPT1KsV4WEeoXSEj8SFvXKXns+gxrIORfklH+YuNqHWLgXmHofD2vu7KM Q==;
X-CSE-ConnectionGUID: z/fMvxngQiKbJQaEt7qmxQ==
X-CSE-MsgGUID: HjvrG2EvRyC+rpMwKdblKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571298"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:15 -0700
X-CSE-ConnectionGUID: OjdDW+MdQ8mdDjLZHXtPcg==
X-CSE-MsgGUID: pVPaaMmCRIeMTaYlLbU8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943824"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:13 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/5] lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
Date: Wed, 21 May 2025 12:58:35 +0530
Message-Id: <20250521072836.1400749-5-swati2.sharma@intel.com>
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

Function is added to return compressed bpp after
parsing i915_display_info debugfs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 21677b0e0..db7af3c7c 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -350,3 +350,40 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
 
 	return max_slice_count;
 }
+
+/**
+ * igt_get_dsc_sink_compressed_bpp:
+ * @drmfd: A drm file descriptor
+ * @pipe: display pipe
+ *
+ * Returns: The dsc sink compressed bpp.
+ */
+int igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe)
+{
+	char buf[8120];
+	char dest[20] = ":pipe ";
+	char *start_loc1, *start_loc2;
+	int dir, res;
+	float comp_bpp = 0;
+
+	strcat(dest, kmstest_pipe_name(pipe));
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert_lte(0, dir);
+
+	igt_require_intel(drmfd);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
+	igt_require(res > 0);
+	close(dir);
+
+	start_loc1 = strstr(buf, dest);
+
+	if ((start_loc1 = strstr(buf, dest))) {
+		igt_assert(start_loc2 = strstr(buf, "dsc-dss: compressed-bpp:"));
+		igt_assert_eq(sscanf(start_loc2, "dsc-dss: compressed-bpp:%f", &comp_bpp), 1);
+		igt_assert(comp_bpp > 0);
+	}
+
+	return comp_bpp;
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index ab5d27b06..f7d13c99c 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -29,5 +29,6 @@ bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
 int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
+int igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe);
 
 #endif
-- 
2.25.1

