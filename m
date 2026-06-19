Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9067CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 08:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7E10F4B3;
	Fri, 19 Jun 2026 08:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ti+Z2+zM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223F10F4B3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781858386; x=1813394386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SeIGP9ttVP5en8CmmQbIkzmIF3QVfNyCbkfoaWM42oQ=;
 b=Ti+Z2+zMrFEykXGyTTfRqEbeQQKu+gwPKS+napffQ+ACdYhcOta4mYOT
 bAHVyaE0EyJvP7CcnUc4gyXySfc+bxLWFknjHIBCtKqaaL59iysrehZAu
 vVJFPI8Qgp4hYbBgz+zXXCq5hI82s5MJA1d3GRRlB9aDy/msWPWieU2PX
 seBA+Eh1rR8LKIObegDLrb1mPM+IdrZMpQpzVT8c/2tS5fkCuAUtQW04R
 z7skYPXU3N8qSFlZO7GBYGmH1VNckD3QltCS9YLrf/kryFWmHX33IPjl+
 UvtweH1/f4KtMs2EQCAd1J5L93QbB7QXzXthxUOR8qk/WnKl1YO2LYrC8 g==;
X-CSE-ConnectionGUID: S2OwSzL9SpSwqAO0JKjpGA==
X-CSE-MsgGUID: b3CfH9DVQBC57tep2jcr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94204003"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="94204003"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:39:46 -0700
X-CSE-ConnectionGUID: ZlgfPTmATce9bYr/adFnuw==
X-CSE-MsgGUID: GmcMrueaThCKxQLecVhIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="278764480"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 01:39:45 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: piotr.piorkowski@intel.com, Sobin Thomas <sobin.thomas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/intel/xe_debugfs: Add checks for existing
 root dir entries
Date: Fri, 19 Jun 2026 08:39:21 +0000
Message-ID: <20260619083921.637427-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260619083921.637427-1-sobin.thomas@intel.com>
References: <20260619083921.637427-1-sobin.thomas@intel.com>
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
index 43c436a77..7245b462a 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -408,14 +408,14 @@ out:
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

