Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF5C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 10:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71310E820;
	Fri, 24 Jan 2025 10:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF9QZ8w8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0FA10E820
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737715279; x=1769251279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehu5E/umXeWAm68BrUTl8pUlGBYXP36nrvHWHbdtA5A=;
 b=BF9QZ8w8lKGjqhAJIZ/FTNRHJJNwFErkyQFyDHCbaSG97gw+CgEyKw6/
 Dc77iRT2FxZ/BC91ZomVKDvR4LHO5YYO6JM9SJGmbh+fijVQQ34A9pEoD
 oWH09jgVNPve6DM2b2C5USg8PrKj83s8+P//iSb5/zf+SekodmrHai663
 MigPdk7VdUt/x/IphhDlKic9clX7PQe+k9WdX8cI3B1tIpJJNxjhlLFII
 DYBoR3ojRLyB+JC1h5GfOu9MJnSHXna8kDyz4SGVezEnlVO7w/2YNkRt6
 nZWxtdA6yemYATMfGVst1jbe4vGvFkEeETy/7usCg2gVuhIBuBNe9pqfA A==;
X-CSE-ConnectionGUID: aXl46/92Te2CyOr1GlRRMw==
X-CSE-MsgGUID: ODwKQcCTT/af0zwEbAD1MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25850471"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="25850471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:41:19 -0800
X-CSE-ConnectionGUID: oUZd1pUzSOymK16Kpx9sTg==
X-CSE-MsgGUID: lDFFvjhYS8Skhh/P/oUiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108332418"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.245.168])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 02:41:18 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug_online: breakpoint-many-sessions-* add
 delay before resume
Date: Fri, 24 Jan 2025 11:41:07 +0100
Message-ID: <20250124104107.3626601-1-maciej.patelczyk@intel.com>
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

For single tile workloads under debug are executed sequentially.
The test quickly resumes workload that hit the breakpoint without any
delay. That is then catched by the expectation that there shall be a
break between workloads.

Add sleep before resuming workload so that there is a forced gap
between workloads. If they were properly executed sequentially
then the diff between workloads shall be longer than sleep.

Additionally fix the 'ms' to 'us' typo report in case of assert.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index f532387af..d58f7d65f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2305,6 +2305,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 				attempt_mask |= BIT(i);
 				should_break = 1;
 
+				usleep(WORKLOAD_DELAY_US);
 				eus = (struct drm_xe_eudebug_event_eu_attention *)data[i]->exception_event;
 				eu_ctl_resume(s[i]->debugger->master_fd, s[i]->debugger->fd,
 					      eus->client_handle, eus->exec_queue_handle,
@@ -2328,11 +2329,11 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 
 		if (multi_tile)
 			igt_assert_f(diff < WORKLOAD_DELAY_US,
-				     "Expected to execute workloads concurrently. Actual delay: %lu ms\n",
+				     "Expected to execute workloads concurrently. Actual delay: %lu us\n",
 				     diff);
 		else
 			igt_assert_f(diff >= WORKLOAD_DELAY_US,
-				     "Expected a serialization of workloads. Actual delay: %lu ms\n",
+				     "Expected a serialization of workloads. Actual delay: %lu us\n",
 				     diff);
 	}
 
-- 
2.43.0

