Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00400C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 07:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDEC10E49A;
	Tue, 27 May 2025 07:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrvPIw95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FF610E47A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748332689; x=1779868689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HUzTXqZXWQsmcGz2/t82x4PYS2r5HByGz/WM0SPvq7A=;
 b=QrvPIw95XfgBpPBcX3UsX7dqrZI4dew5+hHvDkZdIYA35icDE63yZrBt
 vyNUGOas5jxycho5qBShuDUbFbysj9yBNt/pue3f5vEH6/7hnEZW06smR
 B9H9B/qhry8/jLhW4zHASGgeB7WLn61YXfXKrq6aAI3gHuyI8XKaoh1bc
 emJm/853ZrN0TlOmA5mk+lqMIG1EO0LMSZTD4EsSUmLAvrx+c8bL7PWCd
 jCRzXs1qSQKm/eFyosmlhc0xygJIu+Goo3dQjr9RxYmUv/3xUFxlW2+Ys
 jFAJoeE1jmCgi0v+6zpe+1hvO8mgQht3m7trkT/nLsr11Pds7VcnqsPow Q==;
X-CSE-ConnectionGUID: 2TvJ2iMESwePCgK6qUmqYQ==
X-CSE-MsgGUID: WbbDUiEVSFSLXSeS8BZtjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50365849"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="50365849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 00:58:06 -0700
X-CSE-ConnectionGUID: xHM9VH/sTJSeTCeUbs/aAw==
X-CSE-MsgGUID: /lorU3MBTMSksxX8tTwPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="147469844"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 00:58:04 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2] tests/intel: skip subtests using "mocs" debugfs if
 it's not present
Date: Tue, 27 May 2025 09:58:00 +0200
Message-Id: <20250527075800.5507-1-lukasz.laguna@intel.com>
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
v2:
- use %s to print required debugfs entry (Kamil)
---
 tests/intel/xe_exec_reset.c | 11 +++++++----
 tests/intel/xe_pm.c         |  4 +++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 67b7bb826..7ae53c679 100644
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
+		      "Failed to open required debugfs entry: %s\n", path);
 
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
index 6eb21d5ec..7e9324eec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -743,7 +743,9 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
 		igt_debug("Running on GT%d\n", gt);
 
 		sprintf(path, "gt%d/mocs", gt);
-		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
+		igt_require_f(igt_debugfs_exists(device.fd_xe, path, O_RDONLY),
+			      "Failed to open required debugfs entry: %s\n", path);
+
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
 
-- 
2.40.0

