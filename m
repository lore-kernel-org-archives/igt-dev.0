Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848B3D18153
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 22:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B6310E4D8;
	Mon, 14 Oct 2024 22:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYc90cVT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3810E4DF
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728943212; x=1760479212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tn0o9aygaN9fWLm85wk2yg3+y/aX7kz8CGytROg5vvs=;
 b=HYc90cVTaO9cEEBA9IueMgSNuxHqYzJa2Zy9CWFFyh/yvsHYKvLzOKye
 OJmNLXhjZsBudmkwW9BdGU9znrOmGKCrPDlMFZg/NiZNqNRps6bzKQgxq
 WNKxcg8XGiLqu1ahND3VmAkF9kUjSNvk0ajv2VKpjXjbj0pZTZqkQgHRD
 PglcExWYVhIg6Y1P1Qp8c1VrpdmhsbsaYFr4oXtLra0tnfJXsMTynMASp
 ryDshosRJFzE6gYV9FxD0YvuEkt2JsFgycKnqYLpUJSbLGDPKViaxyEIQ
 bkMEN23aD0IjCdsOr6AP16Hd1ndgQTEStuMGiTSBhYkt6/kAPFVl32pbG Q==;
X-CSE-ConnectionGUID: A16kAxymTm+ZykcaOhCymg==
X-CSE-MsgGUID: 4zuC3QiZRbaOjAi+U+/MNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45822836"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="45822836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 15:00:12 -0700
X-CSE-ConnectionGUID: fuTTww3tRhiPkCsJs+Snsg==
X-CSE-MsgGUID: UBhOa9o6SB697Xw5owbSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77707611"
Received: from dut138lnl.fm.intel.com (HELO jcavitt-DESK.fm.intel.com)
 ([10.105.23.14])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 15:00:12 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 jani.saarinen@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2] tests/intel/xe_exec_reset: Explicitly declare exec
Date: Mon, 14 Oct 2024 22:00:11 +0000
Message-ID: <20241014220011.264642-1-jonathan.cavitt@intel.com>
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

In the gt-reset-stress subtest, we define a drm_xe_exec exec without
declaring any of its variable values.  We then define some of the struct
values separately later in execution.  Instead of doing this, we should
explicitly declare exec to equal a new struct with the assigned values
initialized during construction.  This prevents any values from being
assigned garbage data during execution.

v2: Define assigned variables as a part of declaration, rather than
separately later during exeuction. (Dixit)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_exec_reset.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index b5d5f43eab..43ef1e3345 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -628,7 +628,10 @@ static void submit_jobs(struct gt_thread_data *t)
 			.engine_instance = 0,
 			.gt_id = 0,
 		};
-		struct drm_xe_exec exec;
+		struct drm_xe_exec exec = {
+			.address = addr,
+			.num_batch_buffer = 1,
+		};
 		int ret;
 
 		/* GuC IDs can get exhausted */
@@ -636,8 +639,6 @@ static void submit_jobs(struct gt_thread_data *t)
 		if (ret)
 			continue;
 
-		exec.address = addr;
-		exec.num_batch_buffer = 1;
 		xe_exec(fd, &exec);
 		xe_exec_queue_destroy(fd, exec.exec_queue_id);
 	}
-- 
2.43.0

