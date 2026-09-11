Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A7FC88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D110E1F5;
	Fri, 11 Sep 2026 21:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlTm1S11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4CE10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160292; x=1820696292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2r3JnzytZxHaxBKGl+4b+Q6jMZyQhiRshsAXUP18W6o=;
 b=FlTm1S11W2TnwreSGDWkRO/XgLNLlukitPOPnT11Bjm80DfCEiJ0cz+3
 lSsImbu8UIa2KqH3vrdXa+hbfMOya9Nd2an7KEB+PUS7GQNjdedYJHiWa
 ySbT8pNB/Ug6US2tcN2Ny+TVOqk0yTKC+3TjZXlD3Cu29uczVCYt2LvGZ
 NarYR6ARmJFN+tVw/nf4JDif1n1XJ4WDeWBvFajrp3AlvnNfCnk8FycD0
 n8F26vkkLmz3ufEzUo3eE1wsU9Pyj1i4x4uIjmUuY8d4jUvbQ7fkvAfrT
 FddtlAi3nO4HqkWq5VjMYRjkattjg1xgmqg4P0Nm/zI0P/+08056OiJqz g==;
X-CSE-ConnectionGUID: lLedKN2BQ16ueZ4FA3J4XA==
X-CSE-MsgGUID: W8ncgwPSQA6O0bVRiqesyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138961"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:12 -0700
X-CSE-ConnectionGUID: 00LV0lcBQ6qX9KB3q1Acpw==
X-CSE-MsgGUID: nnwUKI6CRqGRaF1oD4pFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293691"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:11 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v3 3/9] lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
Date: Sat, 12 Sep 2026 02:37:03 +0530
Message-Id: <20260911210709.943683-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Add a helper to read the active pipe's compressed BPP from
`i915_display_info` debugfs.

v2: Rebase

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index a1d98500a..0f938284e 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -378,3 +378,41 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
 
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

