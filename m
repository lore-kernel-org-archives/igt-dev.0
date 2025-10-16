Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8210CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7DE10E9C4;
	Thu, 16 Oct 2025 11:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYhZ6kYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F1410E9C4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760615449; x=1792151449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xJsrbIJzQitmbc5C2CnOfnBi7u3CuQpTkH8IicPBD7w=;
 b=OYhZ6kYcndbZUWL9LUoDorAXeozlZkp1+dqgmPwl+hK92mv12p3axW5i
 htmQ8QsWaSF1m4CqvaIodgABF72ZnvDdZMWCgwX10V2VK5m7XBA8O4Dia
 P6mhEthQmVuhQLuM2F7FtYdCyG2l+U246XXtn6Rwh0DWRgNgTap3yZZdS
 fzvqM2ltMF2qbpZwSD59Fuv/YdAacX0hck/m+CHrssZBqNuhOsHfIcZuV
 tt3JS+XjQ4cwdS9h2hxg4L4lixRG7mH+16sNTX7xCq+tGY9wTTYCpxQKm
 VVoOUa9EyG0wdRA68obBhIMtXbhp2DYaZUrONlIDaZM5htVYzBudt5QBF A==;
X-CSE-ConnectionGUID: gCvdc3mERLe07hK8N/u2Bw==
X-CSE-MsgGUID: yXMubKJUQG+0mRCjOMVPSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66635792"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66635792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:50:49 -0700
X-CSE-ConnectionGUID: Mc1CwiSuSlughtRPVDyZaw==
X-CSE-MsgGUID: RDbZIFgMSg+xT6b5Qr+HkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181565980"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 04:50:47 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v6 1/2] lib/intel_allocator: Add SYSVIPC support check
Date: Thu, 16 Oct 2025 17:08:15 +0530
Message-Id: <20251016113816.3343875-2-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016113816.3343875-1-s.sebinraj@intel.com>
References: <20251016113816.3343875-1-s.sebinraj@intel.com>
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

