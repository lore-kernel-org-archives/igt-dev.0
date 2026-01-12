Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1B5C9EC89
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2A10E3CE;
	Mon, 12 Jan 2026 13:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwM5a3Ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A2610E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222873; x=1799758873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WOEqDnKTM8j8xTD+5VHtUk4M47NZgYmqT46Aku4TIEA=;
 b=AwM5a3AdwgiVmPBGoUD9CcnFqj5o2CfApgrCzeukb6StuA7WUf7zcIqN
 8Lcfuy1i/MTRXP7FOIXFfASBczoyLy1yDdWUUcE5XaVGAVNJ20ntS9cyc
 /IoGi8HTBSl7n7/pvpVRAHnnU1B+boWi1ND2qJMSjG0lAAYah8/tRkkKd
 rAAJYkl6ULdsAdEQLUHifSZhz7D4PVx5+Sp0pBqIzLKoSlhIr2r097Q8K
 7TkO8QrjmxRhlai8kq3L433G44jR/OahzMd6QhPPIUk44KX/ekAlpCHxo
 vsxWFPIMvluU63CzwsQJOL1A+B4oAIlaPnTTtxYq9/loUajofpV0Kz8t7 w==;
X-CSE-ConnectionGUID: F8dGkWQVRSGCU4af/Qyirw==
X-CSE-MsgGUID: ABI46V2XTyirdMa/ld0VGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545619"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:13 -0800
X-CSE-ConnectionGUID: l51x4bJFQeWNk12PnJHxMw==
X-CSE-MsgGUID: /wQpcMyYRzKHspTTFd8/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095109"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:10 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 20/21] tests/intel/xe_eudebug: Add render node testing
Date: Mon, 12 Jan 2026 15:00:06 +0200
Message-ID: <20260112130008.1649357-21-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

We need basic-connect to also check if render node is
available for connection.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 41 ++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 4e7ba0348d..01410f3197 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -460,6 +460,9 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *
 	return ret;
 }
 
+
+#define TEST_CONNECT_RENDER BIT(0)
+
 /**
  * SUBTEST: basic-connect
  * Functionality: attach
@@ -467,23 +470,34 @@ static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *
  *	Exercise XE_EUDEBUG_CONNECT ioctl with passing
  *	valid and invalid params.
  */
-static void test_connect(int fd)
+static void test_connect(int fd, unsigned int flags)
 {
 	struct drm_xe_eudebug_connect param = {};
-	int debugfd, ret;
+	int debugfd, ret, render_fd, target_fd;
 	pid_t *pid;
 
 	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
 		   MAP_SHARED | MAP_ANON, -1, 0);
 
+	if (flags & TEST_CONNECT_RENDER)
+		render_fd = drm_open_driver_render(DRIVER_XE);
+
 	/* get fresh unrelated pid */
-	igt_fork(child, 1)
+	igt_fork(child, 1) {
+		if (flags & TEST_CONNECT_RENDER)
+			close(fd);
 		*pid = getpid();
+		igt_info("client in pid %d\n", *pid);
+		sleep(5);
+	}
 
-	igt_waitchildren();
-	param.fd = xe_eudebug_fd_for_pid(*pid);
+	/* XXX build a sync mechanism */
+	sleep(1);
+	target_fd = xe_eudebug_fd_for_pid(*pid);
+	igt_assert(target_fd >= 0);
 	munmap(pid, sizeof(pid_t));
 
+	param.fd = target_fd + random() + 1;
 	ret = __debug_connect(fd, &debugfd, &param);
 	igt_assert(debugfd == -1);
 	igt_assert_eq(ret, -EBADFD);
@@ -493,7 +507,15 @@ static void test_connect(int fd)
 	igt_assert(debugfd == -1);
 	igt_assert_eq(ret, -EINVAL);
 
+	param.fd = target_fd;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert_neq(debugfd, -1);
+	igt_assert_eq(ret, 0);
+
+	close(debugfd);
+
 	param.fd = xe_eudebug_fd_for_pid(getpid());
+	igt_assert((int)param.fd >= 0);
 	param.version = -1;
 	ret = __debug_connect(fd, &debugfd, &param);
 	igt_assert(debugfd == -1);
@@ -517,6 +539,10 @@ static void test_connect(int fd)
 	igt_assert_eq(ret, 0);
 
 	close(debugfd);
+	if (flags & TEST_CONNECT_RENDER)
+		close(render_fd);
+
+	igt_waitchildren();
 }
 
 static void switch_user(__uid_t uid, __gid_t gid)
@@ -2789,7 +2815,10 @@ int igt_main()
 		test_sysfs_toggle(fd);
 
 	igt_subtest("basic-connect")
-		test_connect(fd);
+		test_connect(fd, 0);
+
+	igt_subtest("basic-connect-render")
+		test_connect(fd, TEST_CONNECT_RENDER);
 
 	igt_subtest("connect-user")
 		test_connect_user(fd);
-- 
2.43.0

