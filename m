Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D410CE7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 15:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8743010F108;
	Fri, 10 Jan 2025 15:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAduL0V8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECCF10F108
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736523318; x=1768059318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NVDHlvWuGYV33dw92bCFuo1uP+JzWgtKbfnL/2mWlos=;
 b=DAduL0V8dU2GazwM6P1L16nFp2NRL86rasND8AaLW7HGu+cOicNJcnle
 3WnZl6nGveFtrQnYurnH0tQef0UGr8/4wc3ryRnP5iRPC6HWfcORSmTro
 hErvb8t2kmj3wxfgtjMu1VH0Tfn1iA75VFH5h7UoC7YCD6GZGaQDS6LrG
 APoxV5Ra7RofCJ9zI0xNlFIw88xw58S//2MBDj6cbsg+Ub7U6KxBgdm9C
 PZRuzRUECymnMuBvomcd1bd4TsKy2Mi99J+qsLOhypEQUJITj0QrdcYXf
 iq3pmJhoR3NleMu+iiHb0M7lppnyiZPSS+tju2PRgBFCEhNVWPhhPdsAs A==;
X-CSE-ConnectionGUID: szNd4p0mQBaYNdI+WlEFQw==
X-CSE-MsgGUID: hYKw5QNYQNuUnIi9EZYF3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36929054"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36929054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:35:13 -0800
X-CSE-ConnectionGUID: vcCTEJykTDSgNMopHlcXsA==
X-CSE-MsgGUID: nO/zJYQIT3a9ea3xM9odOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103700236"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.124])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 07:35:09 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug_online: correct calculate the time diff
Date: Fri, 10 Jan 2025 16:34:55 +0100
Message-ID: <20250110153455.2791158-1-maciej.patelczyk@intel.com>
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

When calculating time difference between two timespec values use
library function which does it right.

Previous way wasn't working well on slower machines. It was only
taking the tv_nsec field from struct timespec.

Fixes: bbf1730baf ("tests/xe_eudebug_online: Debug client which
                    runs workloads on EU")
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 052774a3b..f532387af 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2235,6 +2235,11 @@ static int find_suitable_engines(struct drm_xe_engine_class_instance **hwes,
 	return engine_count;
 }
 
+static uint64_t timespecs_diff_us(struct timespec *ts1, struct timespec *ts2)
+{
+	return (uint64_t)(fabs(igt_time_elapsed(ts1, ts2)) * USEC_PER_SEC);
+}
+
 /**
  * SUBTEST: breakpoint-many-sessions-single-tile
  * Description:
@@ -2255,7 +2260,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 	struct online_debug_data **data;
 	struct drm_xe_engine_class_instance **hwe;
 	struct drm_xe_eudebug_event_eu_attention *eus;
-	uint64_t current_t, next_t, diff;
+	uint64_t diff;
 	int attempt_mask = 0, final_mask, should_break;
 	int i;
 
@@ -2318,10 +2323,8 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 	igt_assert_eq(attempt_mask, final_mask);
 
 	for (i = 0; i < n - 1; i++) {
-		/* Convert timestamps to microseconds */
-		current_t = data[i]->exception_arrived.tv_nsec * 1000;
-		next_t = data[i + 1]->exception_arrived.tv_nsec * 1000;
-		diff = current_t < next_t ? next_t - current_t : current_t - next_t;
+		diff = timespecs_diff_us(&data[i]->exception_arrived,
+					 &data[i + 1]->exception_arrived);
 
 		if (multi_tile)
 			igt_assert_f(diff < WORKLOAD_DELAY_US,
-- 
2.43.0

