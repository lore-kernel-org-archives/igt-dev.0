Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD1CD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A67810E487;
	Thu, 21 May 2026 14:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQHM1s7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CE510E487
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779373032; x=1810909032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfQ1vXfLBSAL2+3wa/wlV+7Qhr6N+ZCGPE89FbnyHHo=;
 b=ZQHM1s7S1NJCPO1xE0zL0yCZqHWjKDrozY0jc5OmM4ULnxvH+iFI0KtT
 e2sboSzChSSqMGOhw9l71xeTIV2aqEFPeGYnEM5hWsPEsOt/kLJ5IqabT
 7YwSjM6P39CFBIatgg30OhiOUT0k0sxftDvwNRL0CurJhBr4D1Mi7HOM0
 PSxu6JF9WInb66a5RuniYT8QruE0hwl0ygsf7kIMo2luVZWPJ+BVPlz8F
 m+jAehugSpQnMlYgknoyvGrBDkHD220H43hQ7UF2av5W5kmtQG7zHSiEK
 lmmthYZ/Q9kKXfx1GdE0waJVsWBxmdtUq94k1Dhz9JHXJqDhRTsl75z0h w==;
X-CSE-ConnectionGUID: 8rMfmlk2TMekV9yCdTd3aw==
X-CSE-MsgGUID: eIUPwr13SHem1wqkDObeQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97863667"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="97863667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:12 -0700
X-CSE-ConnectionGUID: HFuTkE/4THWRufSnAhrECQ==
X-CSE-MsgGUID: TDcDzNKMSs+F609gFr9NUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236121793"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "./cccmd"@freedesktop.org,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 2/3] tests/xe_exec_compute_mode: Add workload subtests
 with suspend variants
Date: Thu, 21 May 2026 16:16:43 +0200
Message-ID: <20260521141644.6502-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521141644.6502-1-thomas.hellstrom@linux.intel.com>
References: <20260521141644.6502-1-thomas.hellstrom@linux.intel.com>
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

Refactor lr_mode_workload() into run_lr_workload() taking an
igt_suspend_state argument, using SUSPEND_STATE_NONE as a sentinel for
the no-suspend case.  Register all variants from a single table:

  lr-mode-workload         (no suspend, 30s stress)
  s2idle-lr-mode-workload  (SUSPEND_STATE_FREEZE)
  s3-lr-mode-workload      (SUSPEND_STATE_S3)
  s4-lr-mode-workload      (SUSPEND_STATE_DISK)

The suspend variants perform a full suspend/resume cycle while the
preemptible spinner is running, then assert the workload resumes and can
be cleanly stopped.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 46 ++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 869f8fbe1..8fc9bb912 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -322,12 +322,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 }
 
 #define LR_SPINNER_TIME 30
+#define SUSPEND_STATE_NONE ((enum igt_suspend_state)-1)
+
 /**
  * SUBTEST: lr-mode-workload
  * Description: Stress preemptible LR mode workload for 30s.
  * Test category: functionality test
+ *
+ * SUBTEST: s2idle-lr-mode-workload
+ * Description: Suspend to idle (s2idle) with a preemptible LR mode workload running.
+ * Test category: functionality test
+ *
+ * SUBTEST: s3-lr-mode-workload
+ * Description: Suspend to RAM (s3) with a preemptible LR mode workload running.
+ * Test category: functionality test
+ *
+ * SUBTEST: s4-lr-mode-workload
+ * Description: Suspend to disk (s4) with a preemptible LR mode workload running.
+ * Test category: functionality test
  */
-static void lr_mode_workload(int fd)
+static void run_lr_workload(int fd, enum igt_suspend_state s_state)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -376,8 +390,15 @@ static void lr_mode_workload(int fd)
 	xe_exec(fd, &exec);
 	xe_spin_wait_started(spin);
 
-	/* Collect and check timestamps before stopping the spinner */
-	sleep(LR_SPINNER_TIME);
+	if (s_state != SUSPEND_STATE_NONE) {
+		enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+					     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+		igt_system_suspend_autoresume(s_state, test);
+	} else {
+		sleep(LR_SPINNER_TIME);
+	}
+
+	/* Collect and check timestamps - workload should still be running */
 	ts_1 = spin->timestamp;
 	sleep(1);
 	ts_2 = spin->timestamp;
@@ -462,9 +483,22 @@ int igt_main()
 					  s->flags);
 	}
 
-	igt_subtest("lr-mode-workload")
-		lr_mode_workload(fd);
-
+	{
+		static const struct {
+			const char *name;
+			enum igt_suspend_state state;
+		} suspend_states[] = {
+			{ "",        SUSPEND_STATE_NONE },
+			{ "s2idle-", SUSPEND_STATE_FREEZE },
+			{ "s3-",     SUSPEND_STATE_S3 },
+			{ "s4-",     SUSPEND_STATE_DISK },
+			{ NULL },
+		};
+
+		for (const __typeof__(*suspend_states) *s = suspend_states; s->name; s++)
+			igt_subtest_f("%slr-mode-workload", s->name)
+				run_lr_workload(fd, s->state);
+	}
 
 	igt_fixture()
 		drm_close_driver(fd);
-- 
2.54.0

