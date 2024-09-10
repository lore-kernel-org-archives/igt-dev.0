Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC63EDE98B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 01:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD0E10E5FF;
	Tue, 10 Sep 2024 01:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2SYbNON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D69410E5FF
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 01:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725930787; x=1757466787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XFS6avu1z8Q3wq8ATgbboC9yICQCXRI8vDaf3jW3qLg=;
 b=Q2SYbNONrmV1l98XBiiMxWuvVwv4Ba3+5z/aF8Buid3RcV0e29feoq7H
 mJ1T8+qv7pMqyYfHNffD8pt20C126pKax+I+U+YCNYBY7WZOGUS659Q81
 G2LDuHrQ0fxnPhjgkie+kMAjKCnn+9+/Ai+DRmKkPXmKM6T1hz/rMUGgP
 SRVIx3Vqn8q2iG3nhDaHhWwtmgBoCQp+bnwq1NxwVc9Ev4T2Ror1lfcPd
 4pDwASu5sywSARjDJmJ1O26l+vhvYJnzgIzJ1IL9XA9S8R3FOcWpOTDx1
 EyyBK06gqIjuzRWXfaYlNHyIet/d6hwHrqFjITMnI5SOT8ro7wxg8mxxl Q==;
X-CSE-ConnectionGUID: J3hLsyD4QpavL9KnQJEQzQ==
X-CSE-MsgGUID: 4kpsMcF4Qnu92LxNCFPa6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50067432"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="50067432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 18:13:06 -0700
X-CSE-ConnectionGUID: oCVEYYzKRjKL0kH285I52g==
X-CSE-MsgGUID: 6F0naJDQTd+uGG9bakSq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="71644604"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 18:13:06 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] tests/intel/*_query: Add new hwconfig table entry
Date: Mon,  9 Sep 2024 18:12:38 -0700
Message-ID: <20240910011238.254204-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

Two new entries added to the hardware config table. Updated enum and
tests accordingly.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 lib/intel_hwconfig_types.h | 2 ++
 tests/intel/i915_query.c   | 2 ++
 tests/intel/xe_query.c     | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/intel_hwconfig_types.h b/lib/intel_hwconfig_types.h
index 0e6ce5b17..b5d9f1c9e 100644
--- a/lib/intel_hwconfig_types.h
+++ b/lib/intel_hwconfig_types.h
@@ -97,6 +97,8 @@ enum intel_hwconfig {
 	INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES,			/* 79 */
 	INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES,			/* 80 */
 	INTEL_HWCONFIG_MAX_GSC,					/* 81 */
+	INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS,		/* 82 */
+	INTEL_HWCONFIG_NUM_XECU,				/* 83 */
 	__INTEL_HWCONFIG_KEY_LIMIT
 };
 
diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
index 54dbb193a..df7e46a63 100644
--- a/tests/intel/i915_query.c
+++ b/tests/intel/i915_query.c
@@ -1340,6 +1340,8 @@ static const char * const hwconfig_keys[] = {
 	[INTEL_HWCONFIG_MIN_MESH_URB_ENTRIES] = "Min Mesh URB Entries",
 	[INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES] = "Max Mesh URB Entries",
 	[INTEL_HWCONFIG_MAX_GSC] = "MaxGSC",
+	[INTEL_HWCONFIG_SYNC_NUM_RT_STACKS_PER_DSS] = "Sync Num RT Stacks Per DSS",
+	[INTEL_HWCONFIG_NUM_XECU] = "Num of XeCU",
 };
 
 static const char * const hwconfig_memtypes[] = {
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index ddb2e76e5..3a0a83135 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -50,7 +50,7 @@ void dump_hex_debug(void *buffer, int len)
 /* Please reflect intel_hwconfig_types.h changes below
  * static_asserti_value + get_hwconfig_name
  *   Thanks :-) */
-static_assert(INTEL_HWCONFIG_MAX_GSC + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
+static_assert(INTEL_HWCONFIG_NUM_XECU + 1 == __INTEL_HWCONFIG_KEY_LIMIT, "");
 
 #define CASE_STRINGIFY(A) case INTEL_HWCONFIG_##A: return #A;
 const char* get_hwconfig_name(int param)
@@ -137,6 +137,8 @@ const char* get_hwconfig_name(int param)
 	CASE_STRINGIFY(MIN_MESH_URB_ENTRIES);
 	CASE_STRINGIFY(MAX_MESH_URB_ENTRIES);
 	CASE_STRINGIFY(MAX_GSC);
+	CASE_STRINGIFY(SYNC_NUM_RT_STACKS_PER_DSS);
+	CASE_STRINGIFY(NUM_XECU);
 	}
 	igt_assert_lt(param, __INTEL_HWCONFIG_KEY_LIMIT);
 	igt_assert(!"Missing config table enum");
-- 
2.45.2

