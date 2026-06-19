Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC51CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 16:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1934B10E0BA;
	Fri, 19 Jun 2026 16:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqidLaUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8366B10E0BA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781887384; x=1813423384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CU+eTWYEunKDiErN24+4Fcg0RSdNaMToA9/sMJsIlMs=;
 b=XqidLaUryjwqdsxWY01NoEJAvW8vypCZRc2c2cFeRDrsvosKPCvs2tAs
 JFKTBoJ/GotIQp+8F9mT+TbsOB6UcbHuiWoHQEKd5vObRooDENLISfC5W
 wXciSeoZZWskm0LywKikulvNaJzyrEj2cURaoJad0UOlDOvECSFjcSSxQ
 Qmi9Vd9MNF5hOlaIpN+lmXMKHeM48FETeSQCCcRRIaVb/t4wGa5w04qFz
 Ynr/9E5sHljx804vDndFbtBHqeyJgVc7sWA1QX+ZEmUjUIwiI/+8fGrSb
 Uanv4PjaBPIxME+zGa5f8xuVEd2z+xW7OSrMMASl9qV+w5Q8SwQBcTcAe A==;
X-CSE-ConnectionGUID: Zk2KSeRbSS6RtQC2olenlQ==
X-CSE-MsgGUID: v6f611S+T8y5/i9Xdsvc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="94127871"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="94127871"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 09:43:03 -0700
X-CSE-ConnectionGUID: YKgF2NSFSZilWay/5YHJIg==
X-CSE-MsgGUID: ja2HgBkORVK8vByK99iHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248728022"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 09:43:03 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: piotr.piorkowski@intel.com, Sobin Thomas <sobin.thomas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/intel/xe_debugfs: Add checks for existing
 root dir entries
Date: Fri, 19 Jun 2026 16:42:29 +0000
Message-ID: <20260619164229.639186-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260619164229.639186-1-sobin.thomas@intel.com>
References: <20260619164229.639186-1-sobin.thomas@intel.com>
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

Add non-empty validation for existing root-dir debugfs entries

Validate:
- clients: entry is non empty
- gtt_mm: entry is non empty
- info: entry is non empty
- name: entry is non empty

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 0fe92f9fb..f9d1fbf70 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -416,14 +416,14 @@ out:
 static void test_root_dir(struct xe_device *xe_dev)
 {
 	const struct check_entry expected_files[] = {
-		{ "clients", O_RDONLY },
+		{ "clients", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
 		{ "disable_late_binding", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "forcewake_all", O_WRONLY },
 		{ "gem_names", O_RDONLY },
 		{ "gt%u", O_RDONLY, NULL, gt_iter_mask }, /* gt0, gt1, ... */
-		{ "gtt_mm", O_RDONLY },
-		{ "info", O_RDONLY },
-		{ "name", O_RDONLY },
+		{ "gtt_mm", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "info", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
+		{ "name", O_RDONLY, .validate = VALIDATE_NON_EMPTY },
 		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
 		{ "poor_man_system_atomic_support", O_RDWR, .optional = true, .validate = VALIDATE_BOOL },
 		{ "dgfx_pkg_residencies", O_RDONLY, .optional = true, .validate = VALIDATE_NON_EMPTY },
-- 
2.52.0

