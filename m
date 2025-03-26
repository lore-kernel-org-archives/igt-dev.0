Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEA9C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 18:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AD210E1AA;
	Wed, 26 Mar 2025 18:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMVPGW1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DECF10E186
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013009; x=1774549009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3YAqs19T4cp1xz5BTz52WA8Vp7zPSpMcL0SNYgih+Xw=;
 b=DMVPGW1/I8mpnxJkuHJYq+jX9bKXCmvbbfKbk2fTsXyYvjUYVRHUk3EZ
 L+ss8tzi2apy7xH5e1EUPFXZc28Whh4pg5XMvbAOz0ZBKw/RB1TT1dIk2
 CkzqYFqUhv3npbDxTmChF6XbApmeGSPfF70+p0tNeXoxH04KDG2SUtysK
 JQuNby2ygyxBMWGi+QcM//IF32y9uO5M5Qub0u/yyb9RTYXYc6ijt5M+z
 JXH7c2gMxsV6PB/6uncnSc97Fmk06sR77R5/+GEqurB+Hiiik8nwt5Zct
 +X2XD6+zPc7kJDijKr5Iw+YRvKuPhCH8SYl7ay9VrkjjvfQWdIlkARxc9 g==;
X-CSE-ConnectionGUID: vIDF3rAwRuKgxVxvc7d8tQ==
X-CSE-MsgGUID: TA2lTXcHTueU/JitBYCctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31924962"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="31924962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:16:48 -0700
X-CSE-ConnectionGUID: +4LcHyU1SSORdvjDUB6rlw==
X-CSE-MsgGUID: smsolNfQQsqUvf8mdVd0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="124797013"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa010.jf.intel.com with ESMTP; 26 Mar 2025 11:16:46 -0700
From: replace_with Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	dominik.karol.piatkowski@intel.com
Subject: [PATCH 1/1] Added tests to handle error string conditions in
 xe_sysfs_scheduler.c
Date: Wed, 26 Mar 2025 18:03:12 +0000
Message-Id: <20250326180312.1808192-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326180312.1808192-1-sobin.thomas@intel.com>
References: <20250326180312.1808192-1-sobin.thomas@intel.com>
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

From: "Thomas, Sobin" <sobin.thomas@intel.com>

Signed-off-by: Thomas, Sobin <sobin.thomas@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 4fc764f82..a0eaad5ab 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -10,6 +10,11 @@
  * Sub-category: SysMan tests
  * Functionality: scheduler control interface
  *
+ * SUBTEST: %s-invalid-string
+ * Description: Test to check if %s arg[1] schedule parameter checks for
+ * min max values.
+ * Test category: Negative string test
+ *
  * SUBTEST: %s-invalid
  * Description: Test to check if %s arg[1] schedule parameter rejects any
  *		unrepresentable intervals.
@@ -121,6 +126,23 @@ static void test_min_max(int xe, int engine, const char **property,
 	igt_assert_eq(set, default_max);
 }
 
+static void test_invalid_string(int xe, int engine, const char **property,
+                         uint16_t class, int gt)
+{
+	unsigned int saved, set;
+	char invalid_input[] = "999abc"; //Intentionally passing wrong string
+
+	for(int i=0;i<3;i++) {
+		igt_assert(igt_sysfs_scanf(engine,property[i],"%u",&saved) == 1);
+		igt_info("Initial %s:%u\n",property[i],saved);
+		igt_sysfs_printf(engine, property[i], "%s", invalid_input);
+		igt_sysfs_scanf(engine,property[i],"%u",&set);
+		igt_assert_eq(set,saved);
+		igt_info("Property %s correctly rejected input %s\n",property[i],invalid_input);
+	}
+}
+
+
 #define MAX_GTS 8
 igt_main
 {
@@ -130,6 +152,7 @@ igt_main
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
+		{ "invalid-string", test_invalid_string },
 		{ }
 	};
 
-- 
2.34.1

