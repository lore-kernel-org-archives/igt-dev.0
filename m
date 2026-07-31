Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8716C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 12:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16210E1F0;
	Fri, 31 Jul 2026 12:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2RuilwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC910F241
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499970; x=1817035970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ga4y5O9gMfpw/NN2bqM179cCwk80sU7mdugo7PbFG4=;
 b=h2RuilwJu//I/MzVeQFlQdbg8V3GoMcwYkC+hog5Ed1U9ZD4GPJZnob/
 zfsEI2I7UbBhgByDE6xNRnDxNRlxLdO5g7/4vgx0HF0SKcyyspMPLUAqn
 9uAL/nA7yOXueZ7JH3Ub7neZXxeBvuBgms+R/VI3xb5P0el64PJOqKXJA
 JiIq6qU8hQh6lQVGB1+F9sNVfwRlYQyle7GnC+HGyWzG2KfE9feo6mjpy
 633uGBCNC9wdsCjgqckhbOJIp+HxDAayBwOqXsSqMzNTvXabJOU4i+Bl/
 no3yvJVPrdq7HHbUNETefW/CKoMWy4QEewdqBWt9oqhKLPxBdyRl/qjQh w==;
X-CSE-ConnectionGUID: yguUmlbIQmO/f2xNZzl12A==
X-CSE-MsgGUID: 0Hauha8TSzidnW/lnNY0Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85891506"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85891506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:12:50 -0700
X-CSE-ConnectionGUID: WGmphcE+QpWJoCWwgkrg/w==
X-CSE-MsgGUID: u1mAEbSwRmGlI/NvpPnrnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="265630658"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 05:12:49 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/4] lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
Date: Fri, 31 Jul 2026 17:51:44 +0530
Message-Id: <20260731122145.4099468-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260731122145.4099468-1-swati2.sharma@intel.com>
References: <20260731122145.4099468-1-swati2.sharma@intel.com>
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

v2: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 93b67655f..d30730f5c 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -375,3 +375,41 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
 
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
+float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe)
+{
+	char buf[8192];
+	char dest[20];
+	char *start_loc1, *start_loc2;
+	int dir, res;
+	float comp_bpp = 0;
+
+	snprintf(dest, sizeof(dest), ":pipe %s", kmstest_pipe_name(pipe));
+
+	igt_require_intel(drmfd);
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert_lte(0, dir);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	start_loc1 = strstr(buf, dest);
+	igt_require_f(start_loc1, "Pipe %s not found in i915_display_info\n",
+		      kmstest_pipe_name(pipe));
+
+	start_loc2 = strstr(start_loc1, "dsc-dss: compressed-bpp:");
+	igt_assert(start_loc2);
+	igt_assert_eq(sscanf(start_loc2, "dsc-dss: compressed-bpp:%f", &comp_bpp), 1);
+	igt_assert(comp_bpp > 0);
+
+	return comp_bpp;
+}
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index 0ba06d8c5..f895af7f3 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -31,5 +31,6 @@ bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
 int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
+float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe);
 
 #endif
-- 
2.25.1

