Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550DD31A25
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 08:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300810E393;
	Wed, 14 Jan 2026 08:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrPHNQP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A477D10E393
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768380362; x=1799916362;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Jnh9zWuTeKI6pbkLk0E9UCPEBz9E6bjJ/4pO5IGVYg=;
 b=CrPHNQP2EWq4fF1mluuOAgZOkwNpgmziFxAaIJ/WlRXfhaZKG8mbcB9b
 cM4xUJDqqMDvfdiGcT2LIoqTde6TXYSqp6F/oFDsufJ1uw54gAkXyzmEY
 mYpMtD1TSR5mJPCNbDMF1VJs6AF+7XBpqW18VkeFDCf5IS9LlOTcbAOSx
 0R+TMCkoKk+OQasceFmcbtLrfNTIX1CG0gia2VeLOCQOZMDUBaVMyE2Cq
 AAhQGKxwLuYTEeqGonEqJOMB98Xi4CgVj8Kv0gzkNfOYx68IggqulwJLB
 M6yf8dxeKuEeUGUUxP18SeQ5XN5tdnV1sXxeX8J1rEAYXqN+CMr3zo9x3 A==;
X-CSE-ConnectionGUID: MdQJr0/DQamxYjsxrj9Www==
X-CSE-MsgGUID: 6/rur+FJQROKYE4P0G18AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80784809"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="80784809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:46:02 -0800
X-CSE-ConnectionGUID: plpYYmk2TmGW4AU8k2YdsQ==
X-CSE-MsgGUID: M4gXdbPgTkSWvk1BQgrI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="242161557"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa001.jf.intel.com with ESMTP; 14 Jan 2026 00:46:02 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add igt_info
 instead of igt_warn
Date: Wed, 14 Jan 2026 08:46:00 +0000
Message-ID: <20260114084600.829484-1-nishit.sharma@intel.com>
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

Replaced igt_warn with igt_info in test output to prevent non-critical
warnings from being flagged as errors in CI runs. This change helps avoid
cluttering CI logs with benign messages, ensuring that only relevant
issues are highlighted during automated testing.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 8af66d76e..112d1af8d 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1922,11 +1922,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		/*
 		 * Due how system allocations work, we can't make this check
 		 * 100% reliable, rather than fail the test, just print a
-		 * warning message.
+		 * message.
 		 */
-		if (pf_count != pf_count_after)
-			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
-				 pf_count, pf_count_after);
+		if (pf_count != pf_count_after) {
+			igt_info("Pagefault count: before=%d, after=%d (%s)\n",
+				 pf_count, pf_count_after,
+				 pf_count != pf_count_after
+				 ? "pf count changed"
+				 : "pf count not changed");
+		}
 	}
 
 cleanup:
-- 
2.48.1

