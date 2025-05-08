Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FCFC3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 05:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB4810E329;
	Thu,  8 May 2025 05:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmDjtei1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D5710E324
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 05:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682014; x=1778218014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pdmP+qglJU9K6S1cC8Tb3J0ntV63WH4P4cGPPL8rqxY=;
 b=hmDjtei178fxP+fQOZYiuA13jmexY39qOEZMihT+VnlbIgfKxjSzOLVZ
 EwAuibxbCcEYm9lRCSwd1565Gv4MaaLikfYILwSv9nw0IuYSIgekzj6gB
 Yn3+Zl4gyVgVXclFCCkxDgPKwI7A7kO7YgEqMpVNlis9fp0RimZQUHe3L
 6LbvEmatirvNgwMHve0N+T8zjEtknhvbumaB2H3JC7heqLJmLMAdIeP6h
 rIsNaur/Au4NKVeSIstv/zhozjzfVLSBNcdvLf5UqJfomGKgcyxjwu5/O
 rNon3vC+58BFUqI/3T7u+WxlRJ1fe8vAqpuLA51JZ56fspvGXDvFLBNsf w==;
X-CSE-ConnectionGUID: S78x/3rTS7utiSLAoL+TrQ==
X-CSE-MsgGUID: CgFoTpCOSpSYdGxmW0ppXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59798129"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59798129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:53 -0700
X-CSE-ConnectionGUID: N3/XpNdJQTKnJpjsHqCTHQ==
X-CSE-MsgGUID: 0IQpjw+ASzWZs+XN6DqgqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="167124018"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 1/5] tests/intel/xe_pmu: Add a helper function to
 check and end cork
Date: Thu,  8 May 2025 11:20:02 +0530
Message-ID: <20250508055006.734259-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508055006.734259-1-riana.tauro@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
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

Add a helper function to check if cork is active and
end cork

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..03a966708 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int gt, int function,
 	return get_event_config(gt, eci, event) | add_format_config("function", function);
 }
 
+static void check_and_end_cork(int fd, struct xe_cork *cork)
+{
+	if (cork && !cork->ended)
+		xe_cork_sync_end(fd, cork);
+}
+
 /**
  * SUBTEST: engine-activity-idle
  * Description: Test to validate engine activity shows no load when idle
@@ -172,8 +178,8 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		xe_cork_sync_end(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	if ((flags & TEST_LOAD) && !cork->ended)
-		xe_cork_sync_end(fd, cork);
+	if (flags & TEST_LOAD)
+		check_and_end_cork(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
-- 
2.47.1

