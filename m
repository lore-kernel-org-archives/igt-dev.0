Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D9C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 06:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5610E2E5;
	Mon, 12 May 2025 06:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QoAeHiLa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0C10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032153; x=1778568153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lvsa0gJcq/FJ+kMU19AkW51xK11JJt1xVn3iRfO+r/o=;
 b=QoAeHiLalcUf8ueM4A4HF3iOZPC1sLwPF5tG7biN12Z5ZLS5aMIPOFml
 Y3Bq1mo5vY99kCxZkkPdjmgoMoqj/eaUB7xiJs+Mhi0bNYEJaLTFajhFA
 KS+pl8C9DsC7aJRwn3wwl4Ho7akgb1UAKa1UvkmTgNnEe8D7px3Y0vRVS
 PsI+sy7Rs3t7+80VdwAO/3Vv6dW00lohFEdOIczgFJ2qzWOsSk3bMmEcZ
 T2xvsLiXJkDBaCFQF44poYz42s4pM/yRoSOm6GRrsDBGE1iJjFOlitfWC
 MwXognX4SdIc43cT8adyiiJCxGacJAHTK8rXaHE1wFQv+gISXTH25pINH Q==;
X-CSE-ConnectionGUID: Dh4KJMQLTVed3Sih9Om7zA==
X-CSE-MsgGUID: 7MTBhbbiQcmz0ncA1mpeng==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48888453"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="48888453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:33 -0700
X-CSE-ConnectionGUID: 0SjT9eq7RniVYGvSb08xcg==
X-CSE-MsgGUID: VxNIqukURdKh6RzIp3EMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137292686"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:42:31 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v3 1/5] tests/intel/xe_pmu: Add a helper function to
 check and end cork
Date: Mon, 12 May 2025 12:35:47 +0530
Message-ID: <20250512070551.774270-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250512070551.774270-1-riana.tauro@intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 2e29a4056..9b57b5bfc 100644
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
@@ -169,11 +175,11 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	pmu_read_multi(pmu_fd[0], 2, before);
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, cork);
+		end_cork(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	if ((flags & TEST_LOAD) && !cork->ended)
-		xe_cork_sync_end(fd, cork);
+	if (flags & TEST_LOAD)
+		end_cork(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -244,7 +250,7 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 		int idx = i * 2;
 
 		f = &fn[i];
-		xe_cork_sync_end(f->fd, f->cork);
+		end_cork(f->fd, f->cork);
 		engine_active_ticks = after[idx] - before[idx];
 		engine_total_ticks = after[idx + 1] - before[idx + 1];
 
@@ -305,7 +311,7 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	xe_cork_sync_end(fn_fd, cork);
+	end_cork(fn_fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -433,7 +439,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	max[0] = (end[0] - start[0]);
 	max[1] = (end[1] - start[1]);
 
-	xe_cork_sync_end(fd, cork);
+	end_cork(fd, cork);
 
 	/*
 	 * Restore min/max.
-- 
2.47.1

