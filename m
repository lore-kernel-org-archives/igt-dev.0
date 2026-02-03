Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C9E87834
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 14:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C70610E6A0;
	Tue,  3 Feb 2026 14:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8FJS8+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006B310E68D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770129265; x=1801665265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kPT4Ok0bysIYfTEpm31FVFDfEL3Cu4Vw9EOxCiI3Frg=;
 b=Q8FJS8+j9WY9zHWW9nXy3ouMaJNKulLoD5B2QIt8lmuMyOaQgmLEnkvA
 Qo89+hsfvQwlEbpWk/+YAo2zykgZdhVgxIPfdXEihrrCEPJb+3bd+aVe5
 wDQvqj+sxamvCCw0NEDz1+ifqnmz0suvhqanUJ+TIQR+Ogf+UmkolIAMZ
 9admz/Kf5d2wFUCqmz4Wf/xSs7kIz6A8M5zVD3oiPhdT5zrCdi4Tw1Z8p
 kOfJYxQKCOLOcLduw3lW4y1cxQcexfeFa4irot9tOxgLDQ6O/lJsMuXpW
 A/yFLm2o35ZWVsuUXBBP+29eM2G4v1BSmlAipghypjH4AfdmHurOSwcjL A==;
X-CSE-ConnectionGUID: Sx2tUsGfQ4+kWokuFtFWug==
X-CSE-MsgGUID: 5etznGdNRmiqakKaK2Sj3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71380297"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71380297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:34:23 -0800
X-CSE-ConnectionGUID: L6rIv9ryQgWeS46VGm+2Qg==
X-CSE-MsgGUID: uUDfv7FdSm2OpQ9J2FDhpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240824877"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2026 06:34:23 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Reset configfs attributes after
 subtests
Date: Tue,  3 Feb 2026 20:36:45 +0530
Message-ID: <20260203150645.401837-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The xe_configfs test uses a shared configfs group across all subtests.
When subtests modify configfs attributes without resetting them, the
modified values persist and affect subsequent subtests. For example,
ctx-restore-mid-bb reports register value mismatches due to
stale batch buffer data from previous subtests.

Fix three isolation issues:
- survivability-mode: Disable survivability_mode at end to prevent driver
  from entering survivability mode for subsequent tests.
- engines-allowed: Reset engine mask to allow all engines after testing
  restrictive values.
- ctx-restore: Clear both batch buffers before each test since post_bb
  executes after mid_bb during context restore, and stale post_bb data
  overwrites mid_bb register values.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6204
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 tests/intel/xe_configfs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index d2dfd2e87..9a0e4aeb0 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -92,6 +92,9 @@ static void test_survivability_mode(int configfs_device_fd)
 	fd = open(path, O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
 	close(fd);
+
+	/* Disable survivability mode to not affect subsequent subtests */
+	set_survivability_mode(configfs_device_fd, false);
 }
 
 /**
@@ -147,6 +150,10 @@ static void test_engines_allowed(int configfs_device_fd)
 		igt_debug("Writing '%s' to engines_allowed\n", v);
 		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
 	}
+
+	/* Reset to enable all engines for subsequent subtests */
+	igt_assert(igt_sysfs_set(configfs_device_fd,
+				 "engines_allowed", "rcs*,bcs*,vcs*,vecs*,ccs*"));
 }
 
 /**
@@ -307,6 +314,14 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
 
+	/*
+	 * Clear both batch buffers to avoid interference from previous
+	 * subtests. Post bb executes after mid bb during context restore,
+	 * so stale post bb data would overwrite mid bb register values.
+	 */
+	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, "ctx_restore_mid_bb", "");
+
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const struct value *v = &values[i];
 
-- 
2.50.1

