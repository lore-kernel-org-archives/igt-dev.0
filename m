Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91016CD6E79
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 22:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCBE10E0AE;
	Mon,  8 Jun 2026 22:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izBCn410";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB8A10E0AE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780957376; x=1812493376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dvKhOaYU8AWTFflff8irKcOZK/72Laja0iQPc6w7aKQ=;
 b=izBCn410WUXxe8ekvQK0mfiLDqYAo9JkKRTAtndhLiDcZdqrddzLmF8d
 LvCE4xPWsQq5CPQ4eU1ZeTQyPwOd+SUYdd7cugYT0HVWu5KD3T/Fc00H2
 FmeuLcqTSrcqxEzH99yaqDzn9dMvItP6dp/acOH2X0GkOiB8mu3uwqbrH
 RJBigt2h5skEWsOy/TUrPjTr+Jv1HbopfjFNYThgPR33RYkYJEOSY1oCe
 SIST5tkiDilkrGNYrv6Ul0Qz/LFS9aSXC5GWqqcaxC6BuJpIjspuNCyx/
 tLlv4fVoa5hZmsPIkzCHnZSPIh9diOVWLya+VeraF92nztl+nva5FdfRQ A==;
X-CSE-ConnectionGUID: f7wv+gy3QIiC5LbE1nSytQ==
X-CSE-MsgGUID: rL8dJwK+QimpDhB0rs5XuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85597730"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="85597730"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 15:22:54 -0700
X-CSE-ConnectionGUID: rbX/n6jVTWerJ/kvqkCdug==
X-CSE-MsgGUID: lDCtK5lOTieuOirwnYrDAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="243237296"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2026 15:22:54 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	jia.yao@intel.com,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH] tests/xe_exec_reset: Replace fixed usleep with dynamic GT
 idle wait
Date: Mon,  8 Jun 2026 15:22:52 -0700
Message-ID: <20260608222252.2060110-1-x.wang@intel.com>
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

The CLOSE_FD subtests simulate a user abruptly closing the DRM file
descriptor (e.g. via Ctrl+C) while GPU work is still in flight. After
closing the fd, the kernel begins tearing down the VM and releasing
resources including the ASID. If the next test starts before this
cleanup completes, ASID reuse can cause hardware-level collisions and
trigger a cascade of CAT errors, corrupting the subsequent test.

The previous workaround of a fixed 150ms sleep was fragile: on some
platforms or under varying system load, cleanup takes longer and the
sleep is insufficient. Replace it with a dynamic poll that waits until
the GT enters the C6 idle state, which is a reliable hardware signal
that all GPU activity has ceased and resources have been reclaimed.
The poll checks every 10ms with a 1 second timeout, adapting to actual
hardware completion time rather than guessing.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_exec_reset.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index dc1ae7e99c..12c2906800 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -157,6 +157,15 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
  * @parallel:	parallel
  */
 
+static void
+wait_gt_idle(int gt_id)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+
+	igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10);
+	drm_close_driver(fd);
+}
+
 static void
 test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	      unsigned int flags)
@@ -277,8 +286,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
 		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
+		wait_gt_idle(gt);
 		return;
 	}
 
@@ -542,8 +550,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
 		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
+		wait_gt_idle(eci->gt_id);
 		return;
 	}
 
-- 
2.43.0

