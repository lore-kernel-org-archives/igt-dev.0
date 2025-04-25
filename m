Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74754C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 19:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C8A10E140;
	Fri, 25 Apr 2025 19:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOvpTELT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402C910E140
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745608864; x=1777144864;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8BQo7vMiJXvySBtwHE0U3Q3yhIQvkq9sDkSZLFyi41w=;
 b=dOvpTELTN0109JTRwdNnupt3gOIhrlQZe/xrtFAgT0b/ovL9DKMSR0Y8
 3E562gpRKSkbzfNyeXbZHskxUjx+P57l0STVYwdc3LBB1XyHCsqSfMWbr
 6liUcJYeFLtObAXVzbhq1rJQUuzXo2g3MXw6WlMIZEZM4dmj3aykRZ128
 v7+C0o/sd3g3/0SKVMOFS/VqVD3uEgmf+0TBesljT2TZ9kCoIDX6d4b3F
 dvu2ZdlVYH5wTi8adokev3Bq8zxQEfKey56+UJemYUniNSx1kAT95i38e
 s2EJhk/IApiQBizfxmW72bdPsKI3SF7+Us0K+BTksZ4TyBlKIlNY2uuSk w==;
X-CSE-ConnectionGUID: yVrZ6vWUSP6VSH1TfeuhKg==
X-CSE-MsgGUID: OHbdtzTnS72BgoBFZDequg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47155508"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47155508"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:21:01 -0700
X-CSE-ConnectionGUID: rR1ETAgUTlCA0b0DOfhg7A==
X-CSE-MsgGUID: hdyrw3zVSwmZBxe8XLUAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137965489"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 12:21:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add test to check for active
 contexts
Date: Fri, 25 Apr 2025 12:21:02 -0700
Message-ID: <20250425192102.1551877-1-umesh.nerlige.ramappa@intel.com>
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

Add a test to check if fdinfo returns the correct ticks when querying
utilization for a context that is currently active on the engine.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9a8811b4cd2f..73346ee9b1da 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -48,6 +48,9 @@
  * SUBTEST: utilization-single-full-load
  * Description: Check that each engine shows full load
  *
+ * SUBTEST: utilization-single-active-full-load
+ * Description: Check that each engine shows full load when active
+ *
  * SUBTEST: utilization-single-full-load-isolation
  * Description: Check that each engine load does not spill over to other drm clients
  *
@@ -456,6 +459,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu2[1]);
 
+	if (cork && !cork->ended)
+		xe_cork_sync_end(fd, cork);
+
 	expected_load = flags & TEST_BUSY ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
 
@@ -769,6 +775,12 @@ igt_main
 			utilization_single(xe, hwe, 0);
 	}
 
+	igt_subtest("utilization-single-active-full-load") {
+		require_engine_utilization_data(xe);
+		xe_for_each_engine(xe, hwe)
+			utilization_single(xe, hwe, TEST_BUSY);
+	}
+
 	igt_subtest("utilization-single-full-load") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-- 
2.45.2

