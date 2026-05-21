Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36DCD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8238610E20C;
	Thu, 21 May 2026 14:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k04qA0Iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD1F10E20C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374113; x=1810910113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IEudtseYifA2o9TJE9gIbBJcjK35rGkUrsk0ySfetJI=;
 b=k04qA0IucGgDF4s2w1MIcwMgAKag8bszvh+M7GxVLXHWaUgCjgqYmQD9
 amGmHqt1wAcVVljQgDS3nxJg+/BnOu1Os/dXWW0zlfQQDarj7Mn4iLcfT
 1VzHQVZ1w9NEd/kDB/O0FSvh/mNLrWWEzc/Nv4owyuupbqKzwrCTKUqDl
 CZTxLZXg/MeiKFt89SZ5Z90HHoJy07xNJbPa+NU6xnZYr7TiOLpPqQfDQ
 /tsmp3XRgyMdZ87TMHNUiS6+lAJtc5dACI0K2VE2q/JBG3RgGZa2UYLGx
 m6OSIhoY9Ep9jhgO1tV0Tzx38ReJhRPFN2J4t9RkdbvHTEbDfd5vc0VBP g==;
X-CSE-ConnectionGUID: Ozf9GWxYQcagwBDcJ2QS8g==
X-CSE-MsgGUID: ozPS7zn2QVu5f/jsgtX5og==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80147357"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80147357"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:13 -0700
X-CSE-ConnectionGUID: gQOldTbhTvyM8Wzp+vXKNg==
X-CSE-MsgGUID: zt74KBmOSjm8SyPynu7rng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="278650393"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t 1/3] tests/xe_exec_compute_mode: Make lr-mode-workload
 spinner preemptible
Date: Thu, 21 May 2026 16:34:37 +0200
Message-ID: <20260521143439.6927-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
References: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
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

Enable preemption in the xe_spin used by lr-mode-workload by passing
.preempt = true to xe_spin_init_opts(). This allows the workload to be
preempted during the 30s stress run, which is needed to test LR mode
behavior under preemption (e.g. during suspend/resume).

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 438ea163f..869f8fbe1 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -324,7 +324,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 #define LR_SPINNER_TIME 30
 /**
  * SUBTEST: lr-mode-workload
- * Description: Stress LR mode workload for 30s.
+ * Description: Stress preemptible LR mode workload for 30s.
  * Test category: functionality test
  */
 static void lr_mode_workload(int fd)
@@ -368,7 +368,8 @@ static void lr_mode_workload(int fd)
 	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
 	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
-	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
+	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true,
+			  .preempt = true);
 	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
 	exec.exec_queue_id = exec_queue;
 	exec.address = spin_addr;
-- 
2.54.0

