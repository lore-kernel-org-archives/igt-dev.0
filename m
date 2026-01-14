Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F9D31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558ED10E362;
	Wed, 14 Jan 2026 06:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKxf9y77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3F110E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373827; x=1799909827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iUUF61/B+4SQWzCv4fMeSvhRjnocfvEFtY3HsO/Ikr8=;
 b=kKxf9y77GnZ0TGG5IIqMphPqDZVNLnTFAp+TrzIU+DiRTc1sw4NmyMJc
 daYHwDKGbQvXQSmOzjrqgb3hPV4hRsNJswYzaIwd0YyWMCHQsMbnncKKm
 0ZdxTjPD55A6hApzjyDzFTRTOhs3GBxm7Gca2Veg0QiyiqoBSvZRQ748O
 e8+quGUBCkdixSxLRCYtEj1gxVyvU21o5uY+H3V3+lNc35jjcCoJEU3ez
 6LJU6SS3wbiGYw7/NHqJvJT0yMLgzpk5AH8R3vPdFIgSPiV70RVvJDX3e
 5umszoXWEawhmnJbOsNQ3efQO2HXvrWWhVcmdkFiJtl3X1rH+SPr2ES2Z A==;
X-CSE-ConnectionGUID: OaqjqvBqQzePbfF5/pvBrw==
X-CSE-MsgGUID: 6GSUCw9cT16DmELtEPRBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81031966"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="81031966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:57:06 -0800
X-CSE-ConnectionGUID: qOvQxj+SSau7XVXZe93CWQ==
X-CSE-MsgGUID: ysBdBn54T9yD3w12qPq5VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204874098"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:57:02 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3] tests/intel/xe_exec_basic: Enable dynamic subtest
Date: Wed, 14 Jan 2026 12:27:33 +0530
Message-ID: <20260114065732.377106-2-balasubramani.vivekanandan@intel.com>
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

Sometimes during debugging it is required to execute tests only on
selected engines. Dynamic subtests allows us to filter engines for test
execution.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---

v2: prefix card index for multigpu tests. Otherwise runner complains
    duplicate test execution when a same dynamic test is executed
    parallely on multiple GPUs.

v3: Remove dynamic subtests for multigpu tests. Even with unique names
    for dynamic subtests, runner complains when starting multiple dynamic
    subtests in parallel.

---
 tests/intel/xe_exec_basic.c | 42 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index b105455f3..5335bffc4 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -349,38 +349,56 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("once-%s", s->name)
+		igt_subtest_with_dynamic_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 1, 1, s->flags);
 
-		igt_subtest_f("twice-%s", s->name)
+		igt_subtest_with_dynamic_f("twice-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 2, 1, s->flags);
 
-		igt_subtest_f("many-%s", s->name)
+		igt_subtest_with_dynamic_f("many-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
-		igt_subtest_f("many-execqueues-%s", s->name)
+		igt_subtest_with_dynamic_f("many-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
-		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
+		igt_subtest_with_dynamic_f("many-execqueues-many-vm-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
-		igt_subtest_f("no-exec-%s", s->name)
+		igt_subtest_with_dynamic_f("no-exec-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 0, 1, s->flags);
+				igt_dynamic_f("%s%d",
+					      xe_engine_class_short_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
 	igt_fixture()
-- 
2.43.0

