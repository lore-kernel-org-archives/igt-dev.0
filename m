Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC4FC10F1A
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36B112C0B;
	Sat,  4 May 2024 13:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N37RvtOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBBF112C0B
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714827857; x=1746363857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54LkhYuNAzSLSqh/KPeaLyM7GmUQDd7VKzNO/O2WBuY=;
 b=N37RvtOSwDenWsF8oIYJY2ZudA93Da6JlodQbucnumE9WmuBDImeZEB3
 uYC+RVosJh8A8+mXRhT9Gqw1olY6WVCoKJseM98lJErDEUonzs//EG59p
 CmvfOeJBhO8g1m7VqXVI6YYidy2fDVMNjCthGq2RpN1F0cwQUGTCRou97
 bukiXA+egaqOHLStNqjuuC/yv/+Qqxe0PjZrhwJnZjwqjJQ5xIjkciPAN
 ynIWkMtakvAYmnhGey10mdSfYP8dowmKwV0tsR+S5jkBphS+OzRcShPsg
 FLCAkJMLDeaxFApUFoW6DH6W59+/r/pkDhzGRL9ziLjYnzrO+TefBR8CF w==;
X-CSE-ConnectionGUID: SO/AKlV2TUOYBGeMLz6J1w==
X-CSE-MsgGUID: CpK3Nw9NS7mbw6vOVRtv9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10506815"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10506815"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 06:04:16 -0700
X-CSE-ConnectionGUID: CzwFhI3mRHq5FpSfB6ckng==
X-CSE-MsgGUID: 6wJMNYEjSH2omHHFJBIMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="27769792"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa009.jf.intel.com with ESMTP; 04 May 2024 06:04:14 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend
 resume test
Date: Sat,  4 May 2024 18:34:58 +0530
Message-Id: <20240504130458.2102132-4-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test to check mocs values are retained over S2-idle/S3/S4
suspend resume states.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_pm.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 73fd57636..fe77512fb 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -251,6 +251,10 @@ static void close_fw_handle(int sig)
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
  * Functionality: pm - %arg[1]
  *
+ * SUBTEST: %s-mocs
+ * Description: test checks for mocs state before and after %arg[1] state
+ * Functionality: pm - %arg[1]
+ *
  * arg[1]:
  *
  * @s2idle:	s2idle
@@ -617,7 +621,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
  * Functionality: mocs
  * Run type: FULL
  */
-static void test_mocs_suspend_resume(device_t device)
+static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
 {
 	int gt;
 
@@ -632,14 +636,17 @@ static void test_mocs_suspend_resume(device_t device)
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
 
-		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
-		igt_assert(fw_handle >= 0);
-		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
-
-		/* Runtime suspend  */
-		close(fw_handle);
-		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		if (runtime_sr) {
+			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+			igt_assert(fw_handle >= 0);
+			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
 
+			/* Runtime suspend  */
+			close(fw_handle);
+			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		} else {
+			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+		}
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
@@ -742,6 +749,9 @@ igt_main
 				cleanup_d3(device);
 			}
 		}
+
+		igt_subtest_f("%s-mocs", s->name)
+			test_mocs_suspend_resume(device, 0, s->state);
 	}
 
 	for (const struct d_state *d = d_states; d->name; d++) {
@@ -808,8 +818,7 @@ igt_main
 		}
 
 		igt_subtest("mocs_suspend_resume")
-			test_mocs_suspend_resume(device);
-
+			test_mocs_suspend_resume(device, 1, 0);
 	}
 
 	igt_fixture {
-- 
2.25.1

