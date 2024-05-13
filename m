Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC838C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AF110E3D2;
	Mon, 13 May 2024 16:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOWBOsDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E4310E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715617434; x=1747153434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OC82hO9fVfGkOiTOIDcA+VFOW5vdZStFLKiA3hYSTyQ=;
 b=AOWBOsDvkmIejHK7r0YMIPetGJsGsq9eGwBPjY0hUTWdsW7nhUXLg7T3
 a8mMTH8SSLyQ/qESccBMYhYKrxE/nPL5PCJqX0rZAKnHY0zkJk/NVpGBk
 xXHPLdcfqGT3TbFrpV4Y59Zz5DMtlt912V8XHtgbo2MXd7eTocCNF87Hj
 Fx6ffcY9zNuNvUL/IVHO9MKVx0zAJBuVvsfywvbFHcC/acarXs/kVGe96
 9kaydlce/aFzYNxcbB/DTCYwD8K9k5rqRgQRSlbMVwJ7CUBud4oU9YHc7
 n6j5nA0VdYDVd8cEJY9F/XqvEVpxQyUHc+JeEzaXyC+JQpSsfeTJnjF3S Q==;
X-CSE-ConnectionGUID: 7ETvLJx+SZ6n5Sxr1v2kiA==
X-CSE-MsgGUID: w6Pq/yIDQxms2f54ZGO7Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11500845"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11500845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:53 -0700
X-CSE-ConnectionGUID: M+k7v5kBQAOtw7YeczcV1g==
X-CSE-MsgGUID: eZQQ47rcTKWlBlqvMZHTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30424790"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Rename and clarify
 mocs_suspend_resume
Date: Mon, 13 May 2024 09:24:32 -0700
Message-ID: <20240513162435.952578-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

mocs_suspend_resume is not really suspending/resuming the CPU. It's just
checking rpm (GPU) goes back to suspended status after dropping the
forcewake.

Also drop the additional argument and just use the same "s_state",
passing NO_SUSPEND in this case, like it's done in other tests in xe_pm.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_pm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e81a75d88..1215b5c2a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -617,14 +617,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 }
 
 /**
- * SUBTEST: mocs_suspend_resume
+ * SUBTEST: mocs-rpm
  * Description:
  *     Validate mocs register contents over suspend resume
  *
  * Functionality: mocs
  * Run type: FULL
  */
-static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
+static void test_mocs_suspend_resume(device_t device, int s_state)
 {
 	int gt;
 
@@ -639,16 +639,16 @@ static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
 
-		if (runtime_sr) {
+		if (s_state == NO_SUSPEND) {
 			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 			igt_assert(fw_handle >= 0);
 			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
 
-			/* Runtime suspend  */
+			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
 			close(fw_handle);
 			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 		} else {
-			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
 		}
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
 		igt_debugfs_dump(device.fd_xe, path);
@@ -758,7 +758,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-mocs", s->name)
-			test_mocs_suspend_resume(device, 0, s->state);
+			test_mocs_suspend_resume(device, s->state);
 	}
 
 	for (const struct d_state *d = d_states; d->name; d++) {
@@ -824,8 +824,8 @@ igt_main
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
 
-		igt_subtest("mocs_suspend_resume")
-			test_mocs_suspend_resume(device, 1, 0);
+		igt_subtest("mocs-rpm")
+			test_mocs_suspend_resume(device, NO_SUSPEND);
 	}
 
 	igt_fixture {
-- 
2.43.0

