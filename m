Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B7CD37B7
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2110E461;
	Mon, 11 May 2026 03:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEOxcnYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5468710E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778471607; x=1810007607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1XmuCEBetzO1jJR6NsnzWYHSfLUnZOFsG2gtjAIdC8=;
 b=QEOxcnYBjB/c8ii/ytIP33ijhWMnW8RsBh4uROUXU1f6JfJ1G7ETsOMH
 lEnbyg5lbcXSqyvsW8RrTnuF9WIfPfecnJyDP2TnnlJy+SCYAUnbFks8q
 26WztKTBwSWjLB+z9GuWNKmAWtRxI5LlOmWtfwn00hQ1Id6GXnfDsecdJ
 W7VnqA8MQeI/AFZhGjWvHKH3vbsD2Av6RrGL7Zx46IA1MMnilhvoTgPfF
 CgYGb0A8W4ydQGS1FF+kqEF9JE+ukVB8jbjT4tgb7hlzWm8AsdEaWbQ+W
 wTIkJ51N4BY1+0R399jWSEklO+ApEZfjnScabaasT5AjyHIJCckjA5M2o w==;
X-CSE-ConnectionGUID: C246FLhmRmy3Fbtl3NTZMQ==
X-CSE-MsgGUID: ZvauV8h9QmCizBw3FQvebw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90052996"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90052996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:27 -0700
X-CSE-ConnectionGUID: EF545AJZTGWB0otIHCEOGw==
X-CSE-MsgGUID: 8D45pTbbQ3CWSnJVwVvwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="232857155"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:26 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 1/4] tests/intel/xe_madvise: Generalize metadata and
 group purgeable subtests
Date: Mon, 11 May 2026 09:22:56 +0530
Message-ID: <20260511035310.32323-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511035310.32323-1-varun.gupta@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
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

Generalize the test file description and functionality tags from
purgeable-only to cover upcoming atomic madvise subtests.

Wrap existing purgeable subtests in igt_subtest_group with a dedicated
fixture so the purgeable capability check does not gate future
non-purgeable subtests.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 94 +++++++++++++++++++++-------------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index e9bf55ff5..e79cafbff 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -4,11 +4,11 @@
  */
 
 /**
- * TEST: Validate purgeable BO madvise functionality
+ * TEST: Validate madvise functionality
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Memory management tests
- * Functionality: madvise, purgeable
+ * Functionality: madvise, purgeable, atomic
  */
 
 #include "igt.h"
@@ -776,51 +776,55 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
-		igt_require_f(xe_has_purgeable_support(fd),
-			      "Kernel does not support purgeable buffer objects\n");
 	}
 
-	igt_subtest("dontneed-before-mmap")
-		xe_for_each_engine(fd, hwe) {
-			test_dontneed_before_mmap(fd);
-			break;
-		}
-
-	igt_subtest("purged-mmap-blocked")
-		xe_for_each_engine(fd, hwe) {
-			test_purged_mmap_blocked(fd);
-			break;
-		}
-
-	igt_subtest("dontneed-after-mmap")
-		xe_for_each_engine(fd, hwe) {
-			test_dontneed_after_mmap(fd);
-			break;
-		}
-
-	igt_subtest("dontneed-before-exec")
-		xe_for_each_engine(fd, hwe) {
-			test_dontneed_before_exec(fd, hwe);
-			break;
-		}
-
-	igt_subtest("dontneed-after-exec")
-		xe_for_each_engine(fd, hwe) {
-			test_dontneed_after_exec(fd, hwe);
-			break;
-		}
-
-	igt_subtest("per-vma-tracking")
-		xe_for_each_engine(fd, hwe) {
-			test_per_vma_tracking(fd);
-			break;
-		}
-
-	igt_subtest("per-vma-protection")
-		xe_for_each_engine(fd, hwe) {
-			test_per_vma_protection(fd, hwe);
-			break;
-		}
+	igt_subtest_group() {
+		igt_fixture()
+			igt_require_f(xe_has_purgeable_support(fd),
+				      "Kernel does not support purgeable buffer objects\n");
+
+		igt_subtest("dontneed-before-mmap")
+			xe_for_each_engine(fd, hwe) {
+				test_dontneed_before_mmap(fd);
+				break;
+			}
+
+		igt_subtest("purged-mmap-blocked")
+			xe_for_each_engine(fd, hwe) {
+				test_purged_mmap_blocked(fd);
+				break;
+			}
+
+		igt_subtest("dontneed-after-mmap")
+			xe_for_each_engine(fd, hwe) {
+				test_dontneed_after_mmap(fd);
+				break;
+			}
+
+		igt_subtest("dontneed-before-exec")
+			xe_for_each_engine(fd, hwe) {
+				test_dontneed_before_exec(fd, hwe);
+				break;
+			}
+
+		igt_subtest("dontneed-after-exec")
+			xe_for_each_engine(fd, hwe) {
+				test_dontneed_after_exec(fd, hwe);
+				break;
+			}
+
+		igt_subtest("per-vma-tracking")
+			xe_for_each_engine(fd, hwe) {
+				test_per_vma_tracking(fd);
+				break;
+			}
+
+		igt_subtest("per-vma-protection")
+			xe_for_each_engine(fd, hwe) {
+				test_per_vma_protection(fd, hwe);
+				break;
+			}
+	}
 
 	igt_fixture() {
 		xe_device_put(fd);
-- 
2.43.0

