Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D38D2F339
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 16:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A931510E510;
	Tue, 13 Jan 2026 16:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIAsg6ok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022BF10E510
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768320921; x=1799856921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6S1SJY4AEk5c0W6X/iKYXIELSTc1mGg4GFRLs34TZE=;
 b=hIAsg6okuoBzrIerIOjXazKwd5RXsnzYOwF+ifV5xOU7sCAjybXUOZVt
 B2SPBYa8U/2ADhjIFEmO6/R00aCkaWxB+/dcysKQIUE7+sTF46CcwbBAw
 c9o7PWRVaYi7oTIeaojpIDPnU8VCn3UR01GQFQd49FSXJ9oF2PLvbqsFk
 FkHHdnrr+jcTZYh1r5wrcmvPFHzjTxXNUPK98vfC8Cc2RKYf0zZRich7J
 rp5wZ2YD79Lz+ErYo7EqgcBNDoVhViSaJQ72tIePdobtoVmsqoBdVv5xY
 0dbsRJLw6DlUR0fu4jTZC6BKduH9TL/5g6D6BtSodjRQ1hLBK/b3nJcBG Q==;
X-CSE-ConnectionGUID: 5mZgQAQjRRWpM53CtZNtHQ==
X-CSE-MsgGUID: DrIgJirSR7Ob+pNmr+34KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95085558"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="95085558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:15:21 -0800
X-CSE-ConnectionGUID: sfy0CoJ6Q/KeLUjjApWfFg==
X-CSE-MsgGUID: vWnCp1QSREiOeqpq77TsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235141332"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 08:15:21 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add igt_debug
 instead of igt_warn
Date: Tue, 13 Jan 2026 16:15:20 +0000
Message-ID: <20260113161520.675912-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

Replaced igt_warn with igt_debug in test output to prevent non-critical
warnings from being flagged as errors in CI runs. This change helps avoid
cluttering CI logs with benign messages, ensuring that only relevant
issues are highlighted during automated testing.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 8af66d76e..945c56535 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1924,9 +1924,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		 * 100% reliable, rather than fail the test, just print a
 		 * warning message.
 		 */
-		if (pf_count != pf_count_after)
-			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
+		if (pf_count != pf_count_after) {
+			igt_debug("Pagefault count %s\n",
+				  pf_count != pf_count_after
+				  ? "pf count changed"
+				  : "pf count not changed");
+			igt_info("pf_count(%d) != pf_count_after(%d)\n",
 				 pf_count, pf_count_after);
+		}
 	}
 
 cleanup:
-- 
2.48.1

