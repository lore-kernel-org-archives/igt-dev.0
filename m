Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E716CCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779510E05D;
	Thu, 23 Oct 2025 06:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYgNqWQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B6410E05D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761201882; x=1792737882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIpMF6mwpod06991O0QfXuxxMLXQZuG3xqGs5ESMLwQ=;
 b=eYgNqWQHs79F7BiStNCfvlCccfCegJUPY8HFTvc0lip1AZV7ACaju4AA
 SAQZTAmkU4jcC9q6yGCiAQZ/rGyVxTqcK/Emf1nqF8YN7PfCUsalhiNIT
 MrhiV+viG4E7ATHPgf1hEMc12Tcrx46seB1wulABZi4AaxhoghQXkUP8X
 MDeMxE/HOhtYg8N0aZi2kn+uA2D7oJZ2o7Md03QRlFOsJA56qbdguOTdH
 bKnuUosnKGEJZeTbz+NyiUTdzga75O6FNV1njaTuPSnurhblFdUJ5QhuT
 KGqp6BWS2mMr6gJZmX0UMJwTK60tBUugzvgAV0esMwYqrUuo3caZRyUSF A==;
X-CSE-ConnectionGUID: yZ34Kp6mQ1OKZMEKK/ICcQ==
X-CSE-MsgGUID: rZrPRT+ETQym3d/Usmn2EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74707724"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74707724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:44:41 -0700
X-CSE-ConnectionGUID: bOEv2U3AR6Wuk7Od4G1lXQ==
X-CSE-MsgGUID: 1/hVd4VGT0GZ1Teef3XoCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207733023"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 23:44:39 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v7 1/3] lib/intel_allocator: Add SYSVIPC support check
Date: Thu, 23 Oct 2025 12:01:11 +0530
Message-Id: <20251023063113.3485132-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023063113.3485132-1-s.sebinraj@intel.com>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
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

Check for System V IPC support in kms_concurrent test to handle
targets that don't have SYSVIPC enabled in their kernel. Without this
check, the test would fail with assertion errors when trying to use
message queues.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 lib/intel_allocator.c | 39 ++++++++++++++++++++++++++++++++++++---
 lib/intel_allocator.h |  4 ++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index d22c70f1f..6664b004a 100644
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
@@ -803,12 +817,17 @@ static void *allocator_thread_loop(void *data)
  * How to separate initialization steps take a look into api_intel_allocator.c
  * fork_simple_stress() function.
  */
-void __intel_allocator_multiprocess_prepare(void)
+bool __intel_allocator_multiprocess_prepare(void)
 {
 	intel_allocator_init();
 
+	if (!channel) {
+		return false;
+	}
+
 	multiprocess = true;
 	channel->init(channel);
+	return true;
 }
 
 #define START_TIMEOUT_MS 100
@@ -839,14 +858,21 @@ void __intel_allocator_multiprocess_start(void)
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
+	if(!__intel_allocator_multiprocess_prepare()) {
+		igt_warn("System does not support multiprocess mode\n");
+		return false;
+	}
+
 	__intel_allocator_multiprocess_start();
+
+	return true;
 }
 
 /**
@@ -1678,6 +1704,13 @@ void intel_allocator_init(void)
 	__free_maps(vm_map, false);
 	__free_ahnd_map();
 
+	if (!system_supports_sysvipc()) {
+		alloc_debug("System doesn't support SysV IPC, "
+			   "multiprocess mode unsupported\n");
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

