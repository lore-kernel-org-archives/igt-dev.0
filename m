Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAB6C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35710E7ED;
	Thu, 25 Jul 2024 12:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1P0YYrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A9810E7ED
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721911827; x=1753447827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGzCHFZBnjD9/MFCX8GGOTv4SPpP+hxAcZHVHDo/Vgk=;
 b=G1P0YYrsNYIc9lgfxp+WYLqkhZZyKwA1he7Eo014iazeqgo6N18xfHGy
 urVi8qjZp8ErjtBpgr2d1vwDP4BVylLjHCni+lYztJOttudso3UbW7sDO
 2idy7sht/gKTSV5xXLaPKCyYxrWwTse+HBLVMvIJC/zV4AAcH82VQ96Xm
 gw+R7dQ2UGfqEnb5S9ibqc8jD+T5MTCn1LYQqn9Vl+thXgoVZKssXc0LH
 UGSiQujRitocGSa3GFZ/N1xAyRNSsLyx+xePLLqN8p8oWf+fxv/J2xtxV
 3rW1LwGhL7cyo2dyv1/ics/Hpg0ofwoeJQv1aQKgVr6g4/x0AI2TTcv57 Q==;
X-CSE-ConnectionGUID: s5cBFwbORQCgXIISawaBLQ==
X-CSE-MsgGUID: k9upeUtpRluj4JBMABhqMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19522056"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19522056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:27 -0700
X-CSE-ConnectionGUID: tHjXEXe3TTqvn4E60eYxCg==
X-CSE-MsgGUID: gwxNkl9vTGaCV7dGMXQVEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="53686331"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v1 3/4] tests/intel/xe_wedged: Inform runner about
 expected error
Date: Thu, 25 Jul 2024 14:50:05 +0200
Message-ID: <20240725125006.30041-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
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

Tests runs force wedged state and then driver emits an error.
Standalone runs are succeeding but when run by igt runner it
catch such errors and reports them in results.

Inform runner to ignore such triggered failure.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1760
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1958
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_wedged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index a4fc53869..a3f7a697f 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -26,6 +26,12 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 
+static void ignore_wedged_in_dmesg(void)
+{
+	/* this is needed for igt_runner so it will ignore it */
+	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
+}
+
 static void force_wedged(int fd)
 {
 	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
@@ -235,6 +241,8 @@ igt_main
 					       O_RDWR));
 
 		igt_assert_eq(simple_ioctl(fd), 0);
+		ignore_wedged_in_dmesg();
+
 		force_wedged(fd);
 		igt_assert_neq(simple_ioctl(fd), 0);
 		fd = rebind_xe(fd);
@@ -245,6 +253,7 @@ igt_main
 
 	igt_subtest_f("wedged-at-any-timeout") {
 		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDWR));
+		ignore_wedged_in_dmesg();
 
 		igt_debugfs_write(fd, "wedged_mode", "2");
 		simple_hang(fd);
@@ -268,6 +277,7 @@ igt_main
 		igt_debugfs_write(fd, "wedged_mode", "2");
 		igt_assert_eq(simple_ioctl(fd), 0);
 		igt_debugfs_write(fd, "wedged_mode", "1");
+		ignore_wedged_in_dmesg();
 		simple_hang(fd);
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
-- 
2.43.0

