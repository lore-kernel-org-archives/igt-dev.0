Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C18C369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0410E93D;
	Wed, 16 Apr 2025 16:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC0oS12u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304C510E93D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744821097; x=1776357097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GcH+IBlQKjB8ZgieFJCAJmxxj60MOKcMB8blv2F6ji0=;
 b=IC0oS12uZo4t9YfTz2WbYNdK9aiFtCjeahlUej5YtuNnyaA2gBmDcxz7
 LuEshWChVMxQlA5SstP0JT9gMuA7dmjcP00ecyJ2E41vt7PDybWXoHbuc
 lIkTTrsW1vXMf5hJQDvm8A6g1dnRjSUhtlrYfq/vfiOTbI1K2s88MVJGd
 4Gtre1iz8xJmxIGVGXY2XF3oVYnNyNdc4trjSfyR2HBqaYk6cMltSJyD5
 Ir7eY/k9oE6n+5PS81O+PsplJjuJvbYA9bRwic3fAcJ32tzcsnHmDg4g3
 YcHi38GaE4c4T2Ap0h7sBMapTfxxwJRMHvYODxlbGzzhcLwI0rqYULqjL A==;
X-CSE-ConnectionGUID: XcGfXnwPRo6Mh1Zh9VGPvw==
X-CSE-MsgGUID: icTXhtdNRbutrqgI1eARKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45515100"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45515100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:31:37 -0700
X-CSE-ConnectionGUID: gcUFFgCQQuCJMnpcxaKSSw==
X-CSE-MsgGUID: 4npKT5xqSa2m2pCBRpp3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130380176"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 09:31:35 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel: replace div64_u64_round_up() with
 DIV_ROUND_UP
Date: Wed, 16 Apr 2025 16:30:51 +0000
Message-Id: <20250416163053.117425-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416163053.117425-1-shuicheng.lin@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
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

DIV_ROUND_UP is defined in igt_aux.h with the same function as
div64_u64_round_up().

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/gem_exec_balancer.c |  9 ++-------
 tests/intel/gem_exec_fair.c     | 11 +++--------
 tests/intel/gem_exec_schedule.c |  9 ++-------
 tests/intel/gem_watchdog.c      |  9 ++-------
 4 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 46ea19a2a..1ad87036b 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -2636,15 +2636,10 @@ static int read_ctx_timestamp_frequency(int i915)
 	return value;
 }
 
-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
-{
-	return (x + y - 1) / y;
-}
-
 static uint64_t ticks_to_ns(int i915, uint64_t ticks)
 {
-	return div64_u64_round_up(ticks * NSEC_PER_SEC,
-				  read_ctx_timestamp_frequency(i915));
+	int f = read_ctx_timestamp_frequency(i915);
+	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
 }
 
 static void __fairslice(int i915,
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 19df66921..cdceb8927 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -187,23 +187,18 @@ static int read_timestamp_frequency(int i915)
 	return value;
 }
 
-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
-{
-	return (x + y - 1) / y;
-}
-
 static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
 {
 	int f = read_timestamp_frequency(i915);
 	if (intel_gen(intel_get_drm_devid(i915)) == 11)
 		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
-	return div64_u64_round_up(ns * f, NSEC64);
+	return DIV_ROUND_UP(ns * f, NSEC64);
 }
 
 static uint64_t ticks_to_ns(int i915, uint64_t ticks)
 {
-	return div64_u64_round_up(ticks * NSEC64,
-				  read_timestamp_frequency(i915));
+	int f = read_timestamp_frequency(i915);
+	return DIV_ROUND_UP(ticks * NSEC64, f);
 }
 
 static void delay(int i915,
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 84219b4cf..1055e8501 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -3031,15 +3031,10 @@ static int read_timestamp_frequency(int i915)
 	return value;
 }
 
-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
-{
-	return (x + y - 1) / y;
-}
-
 static uint64_t ticks_to_ns(int i915, uint64_t ticks)
 {
-	return div64_u64_round_up(ticks * NSEC_PER_SEC,
-				  read_timestamp_frequency(i915));
+	int f = read_timestamp_frequency(i915);
+	return DIV_ROUND_UP(ticks * NSEC_PER_SEC, f);
 }
 
 static int cmp_u32(const void *A, const void *B)
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 1edde8b3c..4cb92c68e 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -289,11 +289,6 @@ static unsigned int offset_in_page(void *addr)
 	return (uintptr_t)addr & 4095;
 }
 
-static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
-{
-	return (x + y - 1) / y;
-}
-
 static int read_timestamp_frequency(int i915)
 {
 	int value = 0;
@@ -307,8 +302,8 @@ static int read_timestamp_frequency(int i915)
 
 static uint64_t ns_to_ticks(int i915, uint64_t ns)
 {
-	return div64_u64_round_up(ns * read_timestamp_frequency(i915),
-				  NSEC_PER_SEC);
+	int f = read_timestamp_frequency(i915);
+	return DIV_ROUND_UP(ns * f, NSEC_PER_SEC);
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
-- 
2.25.1

