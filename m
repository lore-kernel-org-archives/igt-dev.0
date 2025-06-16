Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD44C71159
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 23:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E81E10E470;
	Mon, 16 Jun 2025 23:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKYUx0Kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174310E465
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 23:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750118235; x=1781654235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c02Ni6PP/sNaqyAymV9CdC9UmIlz4evnrF4oQLgBQK8=;
 b=gKYUx0KnEeb07EY5/W+nUwsoIlecHTUDf53Fgjt25gTOp9ymV2yarBxl
 uwRkf9ywGhrCxax0g40QXgLv0tiRkQK7f5vAOQfCJiiGy+m8h/HNcKhbt
 8c8BfpBi3vcpwSxDuitkzhcrA+J8U8zYt5LMjks58FFwBkW8GL0Kv/0ww
 tBhV81qg+2Tr1vVrQq/hc731aqYI+RS1Cemh3bib7ZTm8EqX0F8DGqWOT
 X+mAf2PlOGLXJCQauy2a8ZN1n+38NC2ZA1GKnqp5R3UU03guRmV9RF8/W
 mIxaujA6fAkaeIs/CWoEZxY7G1688eiggvyCIuns6i40jvevhism1LOg+ g==;
X-CSE-ConnectionGUID: CfiHQ4Q2SJCwWSTGFDItPA==
X-CSE-MsgGUID: sUAoL4B8RCux8Q7X1Ju3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69719232"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69719232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:14 -0700
X-CSE-ConnectionGUID: nc6MlH81Qt2XOyrF7ZRB4w==
X-CSE-MsgGUID: 2uh22gQaTsKzYX4+u9nWUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148502631"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:13 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/xe_eu_stall: Close any open EU stall
 fd before opening a new one
Date: Mon, 16 Jun 2025 16:57:07 -0700
Message-ID: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

asserts in a sub-test can prevent closing an EU stall fd and the next
subtest may fail with EBUSY if it tries to open another EU stall fd
as there can only be one EU stall stream open at a time. Any open fds
are automatically closed at the end of a test (last sub-test).

v2: 1. Use igt_assert_fd() instead of igt_require_fd() as skips are
       not allowed from a child process
    2. Close any open stream fd before fork()
    3. Rebase

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index b27f5685e..16428af9b 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -69,6 +69,7 @@ static uint8_t p_gt_id;
 static uint32_t p_rate;
 static uint32_t p_user = DEFAULT_USER_BUF_SIZE;
 static uint32_t p_num_reports = DEFAULT_NUM_REPORTS;
+static int stream_fd = -1;
 
 static volatile bool child_is_running = true;
 
@@ -302,6 +303,25 @@ static void set_fd_flags(int fd, int flags)
 	igt_assert_eq(0, fcntl(fd, F_SETFL, old | flags));
 }
 
+static void eu_stall_close(int fd)
+{
+	close(fd);
+	stream_fd = -1;
+}
+
+static int eu_stall_open(int drm_fd, struct xe_eu_stall_open_prop *props)
+{
+	int ret;
+
+	if (stream_fd >= 0)
+		eu_stall_close(stream_fd);
+
+	ret = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, props);
+	igt_assert_fd(ret);
+
+	return ret;
+}
+
 /*
  * Verify that tests with invalid arguments fail.
  */
@@ -353,7 +373,11 @@ static inline void disable_paranoid(void)
  */
 static void test_non_privileged_access(int drm_fd)
 {
-	int paranoid, stream_fd;
+	int paranoid;
+
+	/* Close any open stream fd before fork() */
+	if (stream_fd >= 0)
+		eu_stall_close(stream_fd);
 
 	paranoid = read_u64_file(OBSERVATION_PARANOID);
 
@@ -395,9 +419,8 @@ static void test_non_privileged_access(int drm_fd)
 
 		igt_drop_root();
 
-		stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
-		igt_require_fd(stream_fd);
-		close(stream_fd);
+		stream_fd = eu_stall_open(drm_fd, &props);
+		eu_stall_close(stream_fd);
 	}
 
 	igt_waitchildren();
@@ -472,7 +495,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	uint32_t num_samples, num_drops;
 	struct igt_helper_process work_load = {};
 	struct sigaction sa = { 0 };
-	int ret, flags, stream_fd;
+	int ret, flags;
 	uint64_t total_size;
 	uint8_t *buf;
 
@@ -518,8 +541,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 		properties[3] = query_eu_stall_data->sampling_rates[0];
 	igt_info("Sampling Rate: %" PRIu64 "\n", properties[3]);
 
-	stream_fd = xe_eu_stall_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &props);
-	igt_require_fd(stream_fd);
+	stream_fd = eu_stall_open(drm_fd, &props);
 
 	if (!blocking_read)
 		flags = O_CLOEXEC | O_NONBLOCK;
@@ -592,7 +614,7 @@ enable:
 	if (--iter)
 		goto enable;
 
-	close(stream_fd);
+	eu_stall_close(stream_fd);
 	free(buf);
 }
 
-- 
2.48.1

