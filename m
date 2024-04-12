Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8228C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 04:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5917A10E914;
	Fri, 12 Apr 2024 04:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jls5kRSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8778910E914
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 04:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712895499; x=1744431499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8AS8IDIgAWGQKXj3YiCm3NSnWuUT0a3lGHOrykUKZzw=;
 b=Jls5kRSlC1X4gT5mn01iUi36PElOAAAuVNTMZied4P8z6cZMzj4iZIu6
 ugVodhD2RXUde5Lrm+p0vKJgzxSPzhXPTBM1x8e4MWYemKcZYJWkO8eDN
 QXTNeA7Js+htX75R8lDucz2yVNI2mERlal6696lxIZ9hy1gxxAV01puXY
 zPImUvtx5CEpeyfeDC5eBxoYTtIKKt12X1i7CgGP6zsLkXddkNTf2JdPt
 wJu5qirRmneYmC7AxKzV32PYGA23URfCjFDYT5hat0IKCCDwwkzCxU4jq
 U0JYD562lfnYZYfMsunngD6GViYSaqn0sdwOh+Jmdp+nvxf5T0dXCns15 w==;
X-CSE-ConnectionGUID: dvV7aX1cQgmMW+H1x+8g7g==
X-CSE-MsgGUID: Eyj/bdmYQVuGqv54asWBDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19490164"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19490164"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 21:18:19 -0700
X-CSE-ConnectionGUID: UYfQZtl6RdOELHANNIwiYA==
X-CSE-MsgGUID: 7fljhH8VSdSr0WtTVqKGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="44396289"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 21:18:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/2] Revert "tests/intel/xe_vm: Do not error on -ECANCELED"
Date: Thu, 11 Apr 2024 21:18:40 -0700
Message-Id: <20240412041841.491326-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The test should never unbind an address used by hammer thread nor should
the exec queue in the hammer thread get banned.

This reverts commit 81462e71323ae6764d7f509f4a1bbd3e41aab13e.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ecb2a783c4..bd4973cc38 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1126,7 +1126,6 @@ static void *hammer_thread(void *tdata)
 	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
 	int b;
 	int i = 0;
-	int err = 0;
 
 	sync[0].handle = syncobj_create(t->fd, 0);
 	pthread_barrier_wait(t->barrier);
@@ -1149,15 +1148,14 @@ static void *hammer_thread(void *tdata)
 		exec.address = batch_addr;
 		if (i % 32) {
 			exec.num_syncs = 0;
-			err = __xe_exec(t->fd, &exec);
+			xe_exec(t->fd, &exec);
 		} else {
 			exec.num_syncs = 1;
-			err = __xe_exec(t->fd, &exec);
+			xe_exec(t->fd, &exec);
 			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
 						INT64_MAX, 0, NULL));
 			syncobj_reset(t->fd, &sync[0].handle, 1);
 		}
-		igt_assert(!err || err == -ECANCELED);
 		++i;
 	}
 
-- 
2.34.1

