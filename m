Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7147CD24463
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 03:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB4510EA1B;
	Fri, 11 Oct 2024 03:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jswziMJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CDE10EA1B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 03:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728615931; x=1760151931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BqIKcm1lKTdAtx97WR+3qDBZCAieebF1wh/YA865yfA=;
 b=jswziMJ6o81HG4J6smrONqLpZRhnMNq1ObWsb24MOH/xIIMeO+IaXXFO
 b8Pue3M6MIrDqwx29kuV26XOOEYACa0vTjy8oAAO17GyEeyShHCYb1yhf
 zxac8sCopBtcvnzEopMvI3+qK4V5C6L+9Sai1946qcf657Z0c/OCpP0Xe
 qUP9VpK0tf4tFTodxH2mydCclCKrWA0uGz+z3xOOOjXZhNDxsAhiC9Er+
 kZbyxt65DKZCtPgLLypeNbPy4j5pzzyeyIrPYVlvKYk/CU+i8qWFKmz1v
 AEohpUosDlckhI/tbAwr//TI9pvuCK0mSt2fJM29NhVRSzW6Fn3/09w0u g==;
X-CSE-ConnectionGUID: 2xrAAEjwQkqG6OCSzLTmHQ==
X-CSE-MsgGUID: OZWJ+XA3TM2md8LXEI41pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30880142"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="30880142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:30 -0700
X-CSE-ConnectionGUID: pPrpphvpQoyq3Oyh8xU6PA==
X-CSE-MsgGUID: J1egXFxARKyxQ41Q6avOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="107654641"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_query: Stop getting refclock
 multiple times
Date: Thu, 10 Oct 2024 22:05:05 -0500
Message-ID: <20241011030507.321961-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
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

In theory it could be different per hwe (but in practice isn't). In any
case, it shouldn't change on multiple invocations of the query. So stop
doing it twice per loop.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_query.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 4c79a02b0..9e0fa93dd 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -713,7 +713,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 	int i, usable = 0;
 	igt_spin_t *spin;
 	uint64_t ahnd;
-	uint32_t vm, eng_ref_clock1, eng_ref_clock2;
+	uint32_t vm, eng_ref_clock;
 	struct {
 		int32_t id;
 		const char *name;
@@ -746,31 +746,31 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 		ts2.clockid = clock[index].id;
 
 		query_engine_cycles(fd, &ts1);
-		eng_ref_clock1 = __engine_reference_clock(fd, hwe->gt_id);
 		query_engine_cycles(fd, &ts2);
-		eng_ref_clock2 = __engine_reference_clock(fd, hwe->gt_id);
+		eng_ref_clock = __engine_reference_clock(fd, hwe->gt_id);
 
 		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
 			  ts1.cpu_timestamp,
 			  ts1.cpu_delta);
-		igt_debug("[1] engine_ts %llu, freq %u Hz, width %u\n",
-			  ts1.engine_cycles, eng_ref_clock1, ts1.width);
+		igt_debug("[1] engine_ts %llu, width %u\n",
+			  ts1.engine_cycles, ts1.width);
 
 		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
 			  ts2.cpu_timestamp,
 			  ts2.cpu_delta);
-		igt_debug("[2] engine_ts %llu, freq %u Hz, width %u\n",
-			  ts2.engine_cycles, eng_ref_clock2, ts2.width);
+		igt_debug("[2] engine_ts %llu, width %u\n",
+			  ts2.engine_cycles, ts2.width);
 
 		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
 
 		if (ts2.engine_cycles >= ts1.engine_cycles)
 			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
-				   NSEC_PER_SEC / eng_ref_clock1;
+				   NSEC_PER_SEC / eng_ref_clock;
 		else
 			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
-				   NSEC_PER_SEC / eng_ref_clock1;
+				   NSEC_PER_SEC / eng_ref_clock;
 
+		igt_debug("freq %u Hz\n", eng_ref_clock);
 		igt_debug("delta_cpu[%"PRIu64"], delta_cs[%"PRIu64"]\n",
 			  delta_cpu, delta_cs);
 
-- 
2.46.2

