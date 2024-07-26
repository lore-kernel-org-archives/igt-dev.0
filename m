Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725D2C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 08:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217A010E2CF;
	Fri, 26 Jul 2024 08:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAIiMdpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B634D10E2C4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721982267; x=1753518267;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=CzHQ/8rXizcnvzn3uwv6eJ8eU0rJBULJ7ndfo8g2O80=;
 b=jAIiMdpU6FwUr1LMgMGshQBjrye1/U0wZYFvSTpzHg0MsXTxIqDl105I
 RfWYBMVHBpoak/NUt9MhElFErm/xWzKCtsH2TSdqqNKfYOxVQ6Bi2Vi8q
 YzRCwU3Y+455MR3JNuc8Bv9frpGV9dkApAEndzyvUdz8aFBMuFLeKKXvj
 jksX5TR/a03+gMsXIsP2u4CgHFEmfEZ5ObwbLPD3CDmxq38xT9UQnmqfL
 2rDdzw/JN88wdzm8sGtrAdH/WgqzkP82qbL1/GyNDeoK8mkeSVQx/oS/m
 CBDbncG5Rsm239IY1RNH34mTn/fTr+5kkIp2J3yuTfVq5tcn3DCa831yb A==;
X-CSE-ConnectionGUID: bYUG2/qHQpaMCLHaMWXHfg==
X-CSE-MsgGUID: qxgzEFF5SW+DoP42XVGlQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19725790"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19725790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:24:27 -0700
X-CSE-ConnectionGUID: C6tEUzMIShmaFsW0WOvVoQ==
X-CSE-MsgGUID: E9cXYsJ4RH+qMGHClni3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53138062"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:24:26 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 26 Jul 2024 10:24:19 +0200
Subject: [PATCH] tests/intel/xe_exec_threads: decrease number of batches
 for simulation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240726-xe_exec_threads_limit_simul-v1-1-4c3f6e8da448@intel.com>
X-B4-Tracking: v=1; b=H4sIADJdo2YC/x3MQQrCMBAF0KuUWRuIqSh4FZGQJl8z0MYy05ZA6
 d2NLt/m7aQQhtK920mwsfKnNJxPHcUcyhuGUzM56y725q6mwqMi+iULQlI/8sSLV57W0fQpOgu
 bEGJPbZgFL67//fFsHoLCDBJKzL9znZWO4wthdJw7gwAAAA==
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=CzHQ/8rXizcnvzn3uwv6eJ8eU0rJBULJ7ndfo8g2O80=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmo1058ui0il6CG/7Eff2nD4gblvbw+mQdE+80hkiH
 ZI6ePleJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZqNdOQAKCRAjYrKT3hD91zT1DA
 C3iFjugTTdnk1vf1ZGd7w9bRuu7Xswnw9HvL7303HJGynC3SaETSNQvwNqDFzBWY+/ZjkEv18vBCSw
 JTyoE1602IY/HkJMHwurVvPn90wBZX4eIJMxLNw0OaEhZwz4qu0J1wcc5ky5V8h76tn5hwaKuIgKlL
 F33T4DIm8VvWoyVtLII0lfL2Js2WPl9bFHj7ge0NWLppSwMe97ioh52ATlN7RK9mYHrBiz+kCyhM27
 JvJ8mSOmpqysS+yicXCZJG0XFiKoapw6ayImo55JaxLWTfTmeSLlhzVAUIgZ4SuH5EErPCXK57DFUQ
 PW3uyg6SPNqK0+R0S2y3v50hT3WkeXOjf/vnynVZytIx/XqW/inIHQgw1wQu6VITwhV9dEdELUj6JU
 fDI2elvkhEmEagsYmKQx7J6vx4otOVkBcbc3QUnJobT0mUHI2jYRidmBXe8LTgwxzeKDY7A/IBZ7Ss
 gZ4mnB9bvz8F879Lg79FWmvklIIREZ9BClUrs/GybWW/4=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Tests like threads-mixed-shared-vm-rebind takes significantly longer time
on simulation due to high number of batches - 6-8 minutes vs few seconds
on hw. As a result CI tests frequently fails due to timeout.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_threads.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e7a0a7cd0692..9a37730a9615 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -944,6 +944,7 @@ static void *thread(void *data)
 
 static void threads(int fd, int flags)
 {
+	int n_execs = igt_run_in_simulation() ? 256 : 1024;
 	struct thread_data *threads_data;
 	struct drm_xe_engine_class_instance *hwe;
 	uint64_t addr = 0x1a0000;
@@ -1002,8 +1003,7 @@ static void threads(int fd, int flags)
 		threads_data[i].eci = hwe;
 #define N_EXEC_QUEUE	16
 		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
-#define N_EXEC		1024
-		threads_data[i].n_exec = N_EXEC;
+		threads_data[i].n_exec = n_execs;
 		threads_data[i].flags = flags;
 		if (flags & MIXED_MODE) {
 			threads_data[i].flags &= ~MIXED_MODE;
@@ -1050,7 +1050,7 @@ static void threads(int fd, int flags)
 						vm_legacy_mode;
 					threads_data[i].class = class;
 					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
-					threads_data[i].n_exec = N_EXEC;
+					threads_data[i].n_exec = n_execs;
 					threads_data[i].flags = flags;
 					threads_data[i].flags &= ~BALANCER;
 					threads_data[i].flags |= *data_flags;

---
base-commit: 0471a1097444389a901d78b260c24eaf4fc2d7df
change-id: 20240726-xe_exec_threads_limit_simul-3dc20e0deac3

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

