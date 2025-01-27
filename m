Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C0DC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 12:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A5A10E228;
	Mon, 27 Jan 2025 12:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtpRrp7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28FD10E228
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 12:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737979814; x=1769515814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cwruz2JLRzZQlFsxQKs2CPS7dDvF8UrBYDSx7Qvz2QY=;
 b=AtpRrp7GwuZqs12+HE1mIPh8X++urEKbjYJJqq+8fU5m+DfCiyU/SFmY
 T5iETPK48vpSSQY6+6uFGyG7JLLHORPGbxYCY1RB9xbJrKEj1E3NiYPR8
 yE8gAGVJS0qx+MyEeszzoV1EyH0cSxDxkef04K2n2RF2bzRHVJCtCVXcB
 m+I8SYuRf/xr4WtGEeXg8bQRXQ45GWH4Dvv979CV5jIlAJvEQw2OblKbr
 mXyyPQHvTkcSaeY0JEXqMTkqcZwRYuB/JxD0hLWumv5f+ei4ps2bVKtdu
 68yzgVFGdSfhA58zMUR7aCqCEKSwBfneJMIcYtabnH9ZvJ9hZHTa8IX8x Q==;
X-CSE-ConnectionGUID: VQ89kidIQiCo943SBYOsIQ==
X-CSE-MsgGUID: OY1ZPXPhQkmR7kCSerAy0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38467471"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38467471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:10:13 -0800
X-CSE-ConnectionGUID: dve4UIPpQ16IRaqxtpBTiQ==
X-CSE-MsgGUID: Km/dy+HUQn2H3Cwd9UFaRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108950733"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.131])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:10:11 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug_online: breakpoint-many-sessions-* add
 delay before resume
Date: Mon, 27 Jan 2025 13:10:01 +0100
Message-ID: <20250127121001.58202-1-maciej.patelczyk@intel.com>
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

Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 726fc55b1..d3504b79f 100644
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
-				     "Expected to execute workloads concurrently. Actual delay: %" PRIu64 " ms\n",
+				     "Expected to execute workloads concurrently. Actual delay: %" PRIu64 " us\n",
 				     diff);
 		else
 			igt_assert_f(diff >= WORKLOAD_DELAY_US,
-				     "Expected a serialization of workloads. Actual delay: %" PRIu64 " ms\n",
+				     "Expected a serialization of workloads. Actual delay: %" PRIu64 " us\n",
 				     diff);
 	}
 
-- 
2.43.0

