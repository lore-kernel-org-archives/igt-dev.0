Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18648C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:49:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64DB10E0B6;
	Tue, 20 May 2025 05:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDN3xVwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EB110E0B6
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747720196; x=1779256196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jgUSzoGHIfQjeqE9kOcdQts8MwMKbf1ChjF0Pch8piI=;
 b=LDN3xVwn2ZbgrRgCXF1qibAjdJg4Jp4Jk5c8c8HMlYNcjUwpbdajh49c
 35Ux469fTlHbyIu+9Too4nyjPUwaaSwbLyxpkv2lzNcxeQuTrj2q/sWdV
 mcxiQCVczcrwFY8g7wL5RIGL81QLjukzCBP/Z6VTRTYywX+i6d84VAWtY
 f3bBb0nIrBJx522ebyvzAf8tNIDQjYcqTSmA0Qb05fj5zdDOvRzE3JMyD
 GdisJNq9Q++P+zSu1df0AVFgNkpGSMElwNF11LyMDK9rL4gyKawt/B81R
 9NaM4FTjyrSrfhn1cjnQXQnG2KrCRdI5B445UnJaV4FLcUd7P/vp3DhN9 w==;
X-CSE-ConnectionGUID: uAy6eqoGRbm18ZymoJnHNg==
X-CSE-MsgGUID: jw3HNVR/TTK0jeDXdL093w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60293548"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60293548"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:55 -0700
X-CSE-ConnectionGUID: /p9idb2KTBqIKj3/oBqH5Q==
X-CSE-MsgGUID: y/Aed7mPTVqqQY47vdl9bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139621461"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 1/5] tests/intel/xe_pmu: Add a helper function to
 check and end cork
Date: Tue, 20 May 2025 11:43:32 +0530
Message-ID: <20250520061336.656057-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520061336.656057-1-riana.tauro@intel.com>
References: <20250520061336.656057-1-riana.tauro@intel.com>
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

v2: use single function (Umesh)
v3: do not use condition to end cork (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c49cceff5..abe8b38da 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int gt, int function,
 	return get_event_config(gt, eci, event) | add_format_config("function", function);
 }
 
+static void end_cork(int fd, struct xe_cork *cork)
+{
+	if (cork && !cork->ended)
+		xe_cork_sync_end(fd, cork);
+}
+
 /**
  * SUBTEST: engine-activity-idle
  * Description: Test to validate engine activity shows no load when idle
@@ -169,11 +175,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	pmu_read_multi(pmu_fd[0], 2, before);
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, cork);
+		end_cork(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	if ((flags & TEST_LOAD) && !cork->ended)
-		xe_cork_sync_end(fd, cork);
+	end_cork(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -244,7 +249,7 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 		int idx = i * 2;
 
 		f = &fn[i];
-		xe_cork_sync_end(f->fd, f->cork);
+		end_cork(f->fd, f->cork);
 		engine_active_ticks = after[idx] - before[idx];
 		engine_total_ticks = after[idx + 1] - before[idx + 1];
 
@@ -305,7 +310,7 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	xe_cork_sync_end(fn_fd, cork);
+	end_cork(fn_fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -433,7 +438,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	max[0] = (end[0] - start[0]);
 	max[1] = (end[1] - start[1]);
 
-	xe_cork_sync_end(fd, cork);
+	end_cork(fd, cork);
 
 	/*
 	 * Restore min/max.
-- 
2.47.1

