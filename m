Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7EC2A062
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 03:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812FB10E18A;
	Mon,  5 Jan 2026 03:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8CLDMCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDB910E18A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 03:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585210; x=1799121210;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aD/2EpeXnwcMiBobQlficcSsP/e1bsVO/5gHsdjnJ9A=;
 b=O8CLDMCAlm4YBIGiy1RSN//x7/8ssMijZtpasf9I0vgLdk24a416wz/d
 yEIdZjZSmHomK6rIdIYqxYtdbRCVbEM9E6Xc6fGgQF3BLm5wQI0+gJvjh
 3iMznGS56XbvaWyUp/czSl0NhTN5TwLd5JNiHqRdjOWkpQ2Gtgi2MTFXm
 j7bhvLFCE/hS2jd76PORrwdB4PeKlXndpldfKsBRr860aNS0urqnwPCnZ
 1gSm4Ky+kvC460vlyucevTNGwWcq1Ghgvmkg+waNjyEtvnwpvFKeldcla
 bEvPSYb20KcfxbBXJQO2xjXCw03c6l3ZYdwnIDHJuc0V8UAwE4lM79ZqK w==;
X-CSE-ConnectionGUID: 3Nbn+0IkS9CNUl9F4YdiZw==
X-CSE-MsgGUID: d6RQx1C2TOel9Jbtvs2T9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56512759"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="56512759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 19:53:29 -0800
X-CSE-ConnectionGUID: fr/vEbFPStaPLbLhdMwhhA==
X-CSE-MsgGUID: zlY7pUf+REGsBsxtZUbyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202187676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 19:53:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_exec_reset: Add spin-deadline section
Date: Sun,  4 Jan 2026 19:53:25 -0800
Message-Id: <20260105035325.1306847-1-matthew.brost@intel.com>
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

Add a spin-deadline test section that sets deadlines on fences, thereby
triggering the internal KMD deadline logic. The test does not assert
deadline behavior directly; instead, ftrace can be enabled to infer the
expected KMD behavior.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 44 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a3c4b2d7ba..0e07ff5ccf 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -27,14 +27,37 @@
 #include <string.h>
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
+#define DEADLINE		(0x1 << 1)
 #define LEGACY_MODE_ADDR	0x1a0000
 
+static uint64_t now_monotonic_nsec(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return (uint64_t)ts.tv_sec * 1000000000ull + ts.tv_nsec;
+}
+
+static uint64_t deadline_in_10ms(void)
+{
+	return now_monotonic_nsec() + 10ull * 1000 * 1000;
+}
+
+static uint64_t deadline_in_5ms(void)
+{
+	return now_monotonic_nsec() + 5ull * 1000 * 1000;
+}
+
 /**
  * SUBTEST: spin
  * Description: test spin
  *
  * SUBTEST: spin-signaled
  * Description: test spin with signaled sync obj
+ *
+ * SUBTEST: spin-deadline
+ * Description: test spin with a deadline
  */
 static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 		      unsigned int flags)
@@ -87,8 +110,23 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_exec(fd, &exec);
 
 		xe_spin_wait_started(spin);
-		usleep(50000);
 		igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+
+		if (flags & DEADLINE) {
+			struct drm_syncobj_wait args = {
+				.handles = to_user_pointer(&syncobj),
+				.count_handles = 1,
+				.deadline_nsec = deadline_in_10ms(),
+				.flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE,
+			};
+
+			__syncobj_wait(fd, &args);
+
+			args.deadline_nsec = deadline_in_5ms();
+			__syncobj_wait(fd, &args);
+		}
+
+		usleep(50000);
 		xe_spin_end(spin);
 
 		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
@@ -792,6 +830,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_spin(fd, hwe, 0);
 
+	igt_subtest("spin-deadline")
+		xe_for_each_engine(fd, hwe)
+			test_spin(fd, hwe, DEADLINE);
+
 	igt_subtest("spin-signaled")
 		xe_for_each_engine(fd, hwe)
 			test_spin(fd, hwe, SYNC_OBJ_SIGNALED);
-- 
2.34.1

