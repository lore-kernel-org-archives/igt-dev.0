Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A75CCD1BF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 15:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833C710EABC;
	Fri, 24 Oct 2025 15:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leo1ox4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C74010EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 15:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761318471; x=1792854471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1KYD9Yf3WQUwFsxsAyabLt2/W1EyqWBVt4K0A5PlvT8=;
 b=leo1ox4EFlLYT8Lb5opofoQvDkY+QJOW9/iaN7lY7VIYC2cp59sECX9u
 xz+ObHiUxqJYQcaH6eGeH9BC4C37Y9G5DUn4TfOlOdA/Ri2DDTsLFn/bq
 175Dt7UMm0oXRlqM3YyeNnZnHJyQkjLdYF0ya2PRrIPL5sHKQ4V9AZ3oW
 YCjV8nD9o2lMuOSJSN+G8wBAGb/cqCoWF1d7XMvuTdhaRHd7Zf61zCsqT
 DRTqNvJwugFSCveDx+qF9EB3Vr6ji1IW3ZRhDKLTA51nTxEXbxdUcRuck
 ZDwnPmiRHMzksSHSRPXtgmVLcv+itF4UgMYzRp2nXgkfsDlbQ7bsCTDvN w==;
X-CSE-ConnectionGUID: gWxTs7lPROWtdLv3HZ2Iug==
X-CSE-MsgGUID: bYh0hREpTF2adKTrFFYMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88970169"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="88970169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:07:49 -0700
X-CSE-ConnectionGUID: rlVkcypLQKa4x5kR/3aW0w==
X-CSE-MsgGUID: X5S4MVPjQOqt9cE1htmv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="183674332"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 08:07:47 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v8 1/3] lib/intel_allocator: Add SYSVIPC support check
Date: Fri, 24 Oct 2025 20:24:09 +0530
Message-Id: <20251024145411.3500452-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024145411.3500452-1-s.sebinraj@intel.com>
References: <20251024145411.3500452-1-s.sebinraj@intel.com>
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

Check for System V IPC support in kms_concurrent test to handle
targets that don't have SYSVIPC enabled in their kernel. Without this
check, the test would fail with assertion errors when trying to use
message queues.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c | 37 ++++++++++++++++++++++++++++++++++---
 lib/intel_allocator.h |  4 ++--
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index d22c70f1f..fddd0f3b3 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -250,6 +250,20 @@ static struct allocator *__allocator_find(int fd, uint32_t ctx, uint32_t vm)
 	return igt_map_search(map, &al);
 }
 
+/**
+ * Checks if the current system supports SYSVIPC by verifying the existence and accessibility
+ * of the /proc/sysvipc directory.
+ * Returns: true if accessible for read and write, false otherwise.
+ */
+static bool system_supports_sysvipc(void)
+{
+	if (access("/proc/sysvipc", R_OK | W_OK) == 0)
+		return true;
+
+	alloc_debug("SYSVIPC not supported, cannot access /proc/sysvipc\n");
+	return false;
+}
+
 static struct allocator *__allocator_find_by_handle(uint64_t handle)
 {
 	struct handle_entry *h, he = { .handle = handle };
@@ -803,12 +817,16 @@ static void *allocator_thread_loop(void *data)
  * How to separate initialization steps take a look into api_intel_allocator.c
  * fork_simple_stress() function.
  */
-void __intel_allocator_multiprocess_prepare(void)
+bool __intel_allocator_multiprocess_prepare(void)
 {
 	intel_allocator_init();
 
+	if (!channel)
+		return false;
+
 	multiprocess = true;
 	channel->init(channel);
+	return true;
 }
 
 #define START_TIMEOUT_MS 100
@@ -839,14 +857,21 @@ void __intel_allocator_multiprocess_start(void)
  *
  * Note. This destroys all previously created allocators and theirs content.
  */
-void intel_allocator_multiprocess_start(void)
+bool intel_allocator_multiprocess_start(void)
 {
 	alloc_info("allocator multiprocess start\n");
 
 	igt_assert_f(child_pid == -1,
 		     "Allocator thread can be spawned only in main IGT process\n");
-	__intel_allocator_multiprocess_prepare();
+
+	if (!__intel_allocator_multiprocess_prepare()) {
+		igt_warn("System does not support multiprocess mode\n");
+		return false;
+	}
+
 	__intel_allocator_multiprocess_start();
+
+	return true;
 }
 
 /**
@@ -1678,6 +1703,12 @@ void intel_allocator_init(void)
 	__free_maps(vm_map, false);
 	__free_ahnd_map();
 
+	if (!system_supports_sysvipc()) {
+		alloc_debug("System doesn't support SysV IPC\n");
+		channel = NULL;
+		return;
+	}
+
 	atomic_init(&next_handle, 1);
 	handles = igt_map_create(hash_handles, equal_handles);
 	ctx_map = igt_map_create(hash_instance, equal_ctx);
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index 4b6292f06..9cd83ea27 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -164,9 +164,9 @@ struct intel_allocator {
 };
 
 void intel_allocator_init(void);
-void __intel_allocator_multiprocess_prepare(void);
+bool __intel_allocator_multiprocess_prepare(void);
 void __intel_allocator_multiprocess_start(void);
-void intel_allocator_multiprocess_start(void);
+bool intel_allocator_multiprocess_start(void);
 void intel_allocator_multiprocess_stop(void);
 
 uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
-- 
2.43.0

