Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65555CCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 07:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1729F10EB42;
	Fri, 10 Oct 2025 07:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZiMGTte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12F10EB42
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760082112; x=1791618112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJsrbIJzQitmbc5C2CnOfnBi7u3CuQpTkH8IicPBD7w=;
 b=CZiMGTteqM1jRsWI6rNDMTYIrTJ5X1T2JNKu4o54fmiaGfo1WSqzv8DN
 B4ur6p2lLGAP5bHD8oaKIxbczRtJXetwa7fUYoOdz57hDug5kD6FO7G5T
 tyF8lm/JVQVE0DX0c8tLDjAhJy2earRRg0Ys4H17bGqZAq6eJVaaY2dGO
 Yf7qUfW9Ap0M5qj/+I/ieG9TL8+0OoDi/tTaiFzticB3k4hzgPMOuzcZ1
 DQbUGEPFoMGSjMMeN9AzHI/66oUnqKV90c8xZQNbVsOz2d3UPc5eYcwBY
 aMssCb849l8cz5NrNcx04NEZHIbQ5pSGPx9O+W2zOkwvY0X6vzU4A4Jp3 A==;
X-CSE-ConnectionGUID: cNJFUX5tQzauX8tGWYJUVA==
X-CSE-MsgGUID: vpxzPKHJTry35irDxna68w==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62327513"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62327513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 00:41:52 -0700
X-CSE-ConnectionGUID: CUrCbBVpTNiIDvAJ6m2S7Q==
X-CSE-MsgGUID: sUl78nKOS82Y7CwVjb77mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181687373"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 10 Oct 2025 00:41:50 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/intel_allocator: Add SYSVIPC support check
Date: Fri, 10 Oct 2025 13:00:08 +0530
Message-Id: <20251010073009.821335-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010073009.821335-1-s.sebinraj@intel.com>
References: <20251010073009.821335-1-s.sebinraj@intel.com>
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
 lib/intel_allocator.c | 23 ++++++++++++++++++++++-
 lib/intel_allocator.h |  2 +-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index d22c70f1f..7508d1788 100644
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
@@ -839,14 +853,21 @@ void __intel_allocator_multiprocess_start(void)
  *
  * Note. This destroys all previously created allocators and theirs content.
  */
-void intel_allocator_multiprocess_start(void)
+bool intel_allocator_multiprocess_start(void)
 {
 	alloc_info("allocator multiprocess start\n");
 
+	if (!system_supports_sysvipc()) {
+		igt_warn("System does not support SYSVIPC, multiprocess not supported\n");
+		return false;
+	}
+
 	igt_assert_f(child_pid == -1,
 		     "Allocator thread can be spawned only in main IGT process\n");
 	__intel_allocator_multiprocess_prepare();
 	__intel_allocator_multiprocess_start();
+
+	return true;
 }
 
 /**
diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index 4b6292f06..46e3429d9 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -166,7 +166,7 @@ struct intel_allocator {
 void intel_allocator_init(void);
 void __intel_allocator_multiprocess_prepare(void);
 void __intel_allocator_multiprocess_start(void);
-void intel_allocator_multiprocess_start(void);
+bool intel_allocator_multiprocess_start(void);
 void intel_allocator_multiprocess_stop(void);
 
 uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
-- 
2.43.0

