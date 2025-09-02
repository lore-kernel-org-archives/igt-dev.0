Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABA9CA100C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA8710E6AA;
	Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUjbe0+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF1310E6AE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816357; x=1788352357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LNjWgGyODloEfoE7cQ9J8PIgwPlX1RamyDhPIRdrbME=;
 b=GUjbe0+UVAF3Ja+K+xTzVQQiiGoPTI5lcdBHeqk/NI41pdZ0Ff0MC9CJ
 xkhHocm7kVUQaRhNWcijkynKHOgX5GWfCIdT9o24xO0ae0pQbBm0TewdO
 MpzXsEo60cQJZkEzD7N07CgMgzWanGFmoRceMPJIWbpFvRm+yDyMvblUT
 Lz0keJliInQ1ipAGbMjSRGJ9XameWKiUOPvipdcLOFW5mdszmMn0GpW50
 8kuflj6PZPkREknKsjzCQN1EdLUaTt2mOpXxW38j5+jTbsX130DGo9s4V
 K2bS/a9VoxWlxF7tS7S1MIav5mv8eGV9JLbDvObND8JWUdM9yOXXEzcar g==;
X-CSE-ConnectionGUID: jJB+71aFRXKqcZje3KvZhA==
X-CSE-MsgGUID: bODoXYEWThuc50aXcq5PwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517416"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:37 -0700
X-CSE-ConnectionGUID: 9Cl3hHkpT+Ob3zi9Ob+hvg==
X-CSE-MsgGUID: l68fGwuvQL+I9wmCMeV8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153327"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:35 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 4/7] tests/xe_eudebug_online: Remove unneeded logs from
 set-breakpoint-sigint-debugger
Date: Tue,  2 Sep 2025 14:32:00 +0200
Message-Id: <20250902123203.4907-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove unnecessary event log prints from set-breakpoint-sigint-debugger.
This allows for deadlock avoidance caused by sporadic timing of SIGINT
during igt_vlog.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 6a7b8d8d7..c505b3082 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1608,9 +1608,6 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 
 		xe_eudebug_client_wait_done(s->client);
 
-		xe_eudebug_event_log_print(s->debugger->log, true);
-		xe_eudebug_event_log_print(s->client->log, true);
-
 		xe_eudebug_session_destroy(s);
 		online_debug_data_destroy(data);
 	}
-- 
2.34.1

