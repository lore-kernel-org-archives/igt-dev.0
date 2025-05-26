Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F3C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 07:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30A10E123;
	Mon, 26 May 2025 07:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgEgB50r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F7D10E123
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748244458; x=1779780458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OcF70n1asyaEybrp/WHKpTu9BHlQvu74nr1tulU5J3o=;
 b=MgEgB50rmRX/Pa+XHKLkPPehnLJ7biWBXXoI1+XEEQp8wSsMTbEr+R1j
 oQ0jk0I29zecBfrEBa00ulg83lzkN6jm+Xx0mXLcNXse/YXdP/7Fxt/yo
 8geKjpp+ak6Pwp5nRjdE1dvroDcMiejTyMFOQsKzPMOTraUi5766srfmk
 XckATN2nII73ZMvk+lxpWTKiGY9FE+PegRzO0RRmSuiG9w4rQQPHZN3V6
 W8AeipUho25xcaSPsHRvbln7nuDJGMxO58uMQrr/mBSPPXuHjGJZ4vB9K
 7GdPY3Z3psbQ6lXd9gjImraQ84RezuTgfVf+pyaewkb5JVzq/bN6GU2Zv g==;
X-CSE-ConnectionGUID: e1QkvCXCQkuOYfFRacVr8g==
X-CSE-MsgGUID: rO9MPV0zRvaXJ6/zwCS7cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61262003"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="61262003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 00:27:29 -0700
X-CSE-ConnectionGUID: QKw+VwdDSeiI9NJZ0av12Q==
X-CSE-MsgGUID: aCXciwVhRhiKdt537BiZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="173171481"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 00:27:28 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel: skip subtests using "mocs" debugfs if it's
 not present
Date: Mon, 26 May 2025 09:27:23 +0200
Message-Id: <20250526072723.7704-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

The "mocs" debugfs entry is expected to be missing on VFs, so instead of
asserting its presence, skip the subtests if it is not available.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_exec_reset.c | 11 +++++++----
 tests/intel/xe_pm.c         |  4 +++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 67b7bb826..e757141cb 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -597,19 +597,22 @@ static void
 gt_mocs_reset(int fd, int gt)
 {
 	char path[256];
+	char *mocs_content_pre, *mocs_contents_post;
+
+	sprintf(path, "gt%d/mocs", gt);
+	igt_require_f(igt_debugfs_exists(fd, path, O_RDONLY),
+		      "Failed to open required \"mocs\" debugfs entry\n");
 
 	/* Mocs debugfs contents before and after GT reset.
 	 * Allocate memory to store 10k characters sufficient enough
 	 * to store global mocs and lncf mocs data.
 	 */
-	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
-	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
+	mocs_content_pre = (char *)malloc(10000 * sizeof(char));
+	mocs_contents_post = (char *)malloc(10000 * sizeof(char));
 
 	igt_assert(mocs_content_pre);
 	igt_assert(mocs_contents_post);
 
-	sprintf(path, "gt%d/mocs", gt);
-	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
 	igt_debugfs_dump(fd, path);
 	igt_debugfs_read(fd, path, mocs_content_pre);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6eb21d5ec..6cf532a88 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -743,7 +743,9 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 		igt_debug("Running on GT%d\n", gt);
 
 		sprintf(path, "gt%d/mocs", gt);
-		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
+		igt_require_f(igt_debugfs_exists(device.fd_xe, path, O_RDONLY),
+			      "Failed to open required \"mocs\" debugfs entry\n");
+
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
 
-- 
2.40.0

