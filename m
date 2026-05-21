Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D04ACD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273A210E487;
	Thu, 21 May 2026 14:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK5wcL1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D679E10E487
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779373032; x=1810909032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IEudtseYifA2o9TJE9gIbBJcjK35rGkUrsk0ySfetJI=;
 b=kK5wcL1Fq++5Kz58e1xvQ5Uoflapx5nnmsKO5m8lkOjD6X3dNVwuOLsz
 oSp/nsCoUSaoeV83y2CdcqqaXtG67xsv2s+u+bFyqCbZHomvPnVuuORfk
 2nVyvduXGqjS6K47WsYRd6L6bqzb+KBBakPlDHHPXBMzLnsX3T3f25eIQ
 icGU3pSRqq+zGmcjylNSWstJSbzZlsN8+cSpJLMmGqlk8ryH7VAnvLeeM
 SHwrI8QpBK16kJwrXQlTKo1PZByMJM6XxukMYtc+JB+5Zuk8aue4p6XSb
 3rTDHK2aS9hnXvM4lCJXoXIxiLHu68gMBobRTl1ioFU4KXgM86hh8qKKi w==;
X-CSE-ConnectionGUID: jJNMQsYKT4G2w8/w4u8i3g==
X-CSE-MsgGUID: 6rPFIO8PQJu0oH59lkaVzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97863665"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="97863665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:12 -0700
X-CSE-ConnectionGUID: U8yQDwSWSW6qtyY45eqtyw==
X-CSE-MsgGUID: tfwdPUPiQDKrSe1URnYLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236121764"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:17:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "./cccmd"@freedesktop.org,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 1/3] tests/xe_exec_compute_mode: Make lr-mode-workload
 spinner preemptible
Date: Thu, 21 May 2026 16:16:42 +0200
Message-ID: <20260521141644.6502-2-thomas.hellstrom@linux.intel.com>
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

