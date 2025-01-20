Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86087C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 12:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA410E3ED;
	Mon, 20 Jan 2025 12:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2mwt67i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782EF10E3ED
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737377986; x=1768913986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jUWs48DC1ayH6fBOheqC2R1GxDmOnekFhm/7s1N12No=;
 b=e2mwt67iCOKUHto8nyzu44KTsS+IhHEZnl04qRCUjaQj2yIaUdBgR21y
 7Rr8NM9oY8MCvmnHHFL9ZaTCrnqMuF8mPbuTnCfi3RnsXcI9bFnBFfMgL
 ZWVJj8XoUucjuVIoAyCYQJd8JCa08yHEYQ+Tedm1ezr9Hpi2fRHztuHFq
 Ex9Q/3uwUlz7K62zSllzjAi4/OOXv7sdUdQn7z2P1eS1zJ3ntv/wOWZUJ
 ABv42TpzJWFPRlgkcjfWDvPSe/fKFxnFS3rqA6zDC+P4QinwWs0tpJ7Cr
 xbusbp+DckkW+52LP/AASDSWefTGW9TSFfcczsZTHqDxCxlWqFN4vNbFW Q==;
X-CSE-ConnectionGUID: oOJbZporTceMs/1YFXyuqw==
X-CSE-MsgGUID: 1OHqJe1FSEO63sWDy++2AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49183980"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49183980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:59:43 -0800
X-CSE-ConnectionGUID: zOzKXo16SOWaG0w31anmmg==
X-CSE-MsgGUID: mogxUmVsTUKlrKqu88V8Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="137356395"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa002.jf.intel.com with ESMTP; 20 Jan 2025 04:59:41 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3] tests/intel/xe_wedged: Read wedged_mode debugfs
Date: Mon, 20 Jan 2025 18:39:27 +0530
Message-Id: <20250120130927.65919-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Added support to read the wedged_mode debugfs

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_wedged.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 613d571b4..22ff75367 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -203,6 +203,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: wedged-mode-toggle
  * Description: Test wedged.mode=1 after testing wedged.mode=2
  */
+/**
+ * SUBTEST: basic-wedged-read
+ * Description: Read wedged_mode debugfs
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -279,6 +283,15 @@ igt_main
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
 
+	igt_subtest_f("basic-wedged-read") {
+		char str[150] = {0};
+
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDONLY));
+
+		igt_debugfs_read(fd, "wedged_mode", str);
+		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.34.1

