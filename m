Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF101C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A541D10E42E;
	Mon, 29 Jul 2024 16:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAfLZjs3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64E610E431
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269034; x=1753805034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U3XMsbKcpf4ixSsx3Y/ttkZcWGxS5KIvbDWKlF7wuA0=;
 b=OAfLZjs31crem0P/xToy5VBC3YHpENsWG49B2lR2SkjETRZXkyzAg4DC
 MmnsLL0W+4l8KbRsIhKu7LsBB83vOiY5rp+8qHOiDjI+irEOjzkMrO/CF
 jjssHXn4XWzDLxrR+Cr3m2GhkvLpfFnLyTuBCQb0clcEuPXzePcW32VEJ
 mxfaImQcLC4ddzJDCKmHccB3ms+jFjamEctdysmMoE+yi4xjnTwnGuF4K
 4tno+mcTSlNCpZdCUhpQ8L5q1L+nf29g7+3FPq4v4tJXwXe52laPGxIWy
 +WIw5Ru8XuFJkEPrE/Txjxzptod3tRk1Kfz0i/DKK639f1WsbPE2oH6WU g==;
X-CSE-ConnectionGUID: ITeBYbAYQqWEJwcd/8p/3g==
X-CSE-MsgGUID: 0d1LltD1RbK8wZeTnvoTSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427155"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:54 -0700
X-CSE-ConnectionGUID: 8iXUbZbzSCevP+i5FkO+zQ==
X-CSE-MsgGUID: iMMoUQKkRleU+cNHXK/F3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738171"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:50 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH 29/66] tests/xe_eudebug: Added connect-user test
Date: Mon, 29 Jul 2024 18:01:22 +0200
Message-Id: <20240729160159.37036-30-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Verify the connection:
 * user to user
 * user to root
 * root to user
 * user to other user

The test uses two known non-privileged users lp and mail to verify
the scenarios. Test drops root privileges to one of users if necessary.

ptrace cannot access process which is not dumpable.  The default value
of this property is stored in '/proc/sys/fs/suid_dumpable'. If process
drops privileges then it gets the value from mentioned suid_dumpable.

In our case the value after switching userm, to non privileged one,
is 2 (SUID_DUMP_ROOT). Enforce it to be 1 (SUID_DUMP_USER).

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 164 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 022b39f1f..8c21cffc7 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -12,9 +12,12 @@
  * Test category: functionality test
  */
 
+#include <grp.h>
 #include <poll.h>
 #include <pthread.h>
+#include <pwd.h>
 #include <sys/ioctl.h>
+#include <sys/prctl.h>
 
 #include "igt.h"
 #include "intel_pat.h"
@@ -545,6 +548,164 @@ static void test_connect(int fd)
 	close(debugfd);
 }
 
+static void switch_user(__uid_t uid, __gid_t gid)
+{
+	struct group *gr;
+	__gid_t gr_v;
+
+	/* Users other then root need to belong to video group */
+	gr = getgrnam("video");
+	igt_assert(gr);
+
+	/* Drop all */
+	igt_assert_eq(setgroups(1, &gr->gr_gid), 0);
+	igt_assert_eq(setgid(gid), 0);
+	igt_assert_eq(setuid(uid), 0);
+
+	igt_assert_eq(getgroups(1, &gr_v), 1);
+	igt_assert_eq(gr_v, gr->gr_gid);
+	igt_assert_eq(getgid(), gid);
+	igt_assert_eq(getuid(), uid);
+
+	igt_assert_eq(prctl(PR_SET_DUMPABLE, 1L), 0);
+}
+
+/**
+ * SUBTEST: connect-user
+ * Description:
+ *	Verify unprivileged XE_EUDEBG_CONNECT ioctl.
+ *	Check:
+ *	 - user debugger to user workload connection
+ *	 - user debugger to other user workload connection
+ *	 - user debugger to privileged workload connection
+ */
+static void test_connect_user(int fd)
+{
+	struct drm_xe_eudebug_connect param = {};
+	struct passwd *pwd, *pwd2;
+	const char *user1 = "lp";
+	const char *user2 = "mail";
+	int debugfd, ret, i;
+	int p1[2], p2[2];
+	__uid_t u1, u2;
+	__gid_t g1, g2;
+	int newfd;
+	pid_t pid;
+
+#define NUM_USER_TESTS 4
+#define P_APP 0
+#define P_GDB 1
+	struct conn_user {
+		/* u[0] - process uid, u[1] - gdb uid */
+		__uid_t u[P_GDB + 1];
+		/* g[0] - process gid, g[1] - gdb gid */
+		__gid_t g[P_GDB + 1];
+		/* Expected fd from open */
+		int ret;
+		/* Skip this test case */
+		int skip;
+		const char *desc;
+	} test[NUM_USER_TESTS] = {};
+
+	igt_assert(!pipe(p1));
+	igt_assert(!pipe(p2));
+
+	pwd = getpwnam(user1);
+	igt_require(pwd);
+	u1 = pwd->pw_uid;
+	g1 = pwd->pw_gid;
+
+	/*
+	 * Keep a copy of needed contents as it is a static
+	 * memory area and subsequent calls will overwrite
+	 * what's in.
+	 * However getpwnam() returns NULL if cannot find
+	 * user in passwd.
+	 */
+	setpwent();
+	pwd2 = getpwnam(user2);
+	if (pwd2) {
+		u2 = pwd2->pw_uid;
+		g2 = pwd2->pw_gid;
+	}
+
+	test[0].skip = !pwd;
+	test[0].u[P_GDB] = u1;
+	test[0].g[P_GDB] = g1;
+	test[0].ret = -EACCES;
+	test[0].desc = "User GDB to Root App";
+
+	test[1].skip = !pwd;
+	test[1].u[P_APP] = u1;
+	test[1].g[P_APP] = g1;
+	test[1].u[P_GDB] = u1;
+	test[1].g[P_GDB] = g1;
+	test[1].ret = 0;
+	test[1].desc = "User GDB to User App";
+
+	test[2].skip = !pwd;
+	test[2].u[P_APP] = u1;
+	test[2].g[P_APP] = g1;
+	test[2].ret = 0;
+	test[2].desc = "Root GDB to User App";
+
+	test[3].skip = !pwd2;
+	test[3].u[P_APP] = u1;
+	test[3].g[P_APP] = g1;
+	test[3].u[P_GDB] = u2;
+	test[3].g[P_GDB] = g2;
+	test[3].ret = -EACCES;
+	test[3].desc = "User GDB to Other User App";
+
+	if (!pwd2)
+		igt_warn("User %s not available in the system. Skipping subtests: %s.\n",
+			 user2, test[3].desc);
+
+	for (i = 0; i < NUM_USER_TESTS; i++) {
+		if (test[i].skip) {
+			igt_debug("Subtest %s skipped\n", test[i].desc);
+			continue;
+		}
+		igt_debug("Executing connection: %s\n", test[i].desc);
+		igt_fork(child, 2) {
+			if (!child) {
+				if (test[i].u[P_APP])
+					switch_user(test[i].u[P_APP], test[i].g[P_APP]);
+
+				pid = getpid();
+				/* Signal the PID */
+				igt_assert(write(p1[1], &pid, sizeof(pid)) == sizeof(pid));
+				/* wait with exit */
+				igt_assert(read(p2[0], &pid, sizeof(pid)) == sizeof(pid));
+			} else {
+				if (test[i].u[P_GDB])
+					switch_user(test[i].u[P_GDB], test[i].g[P_GDB]);
+
+				igt_assert(read(p1[0], &pid, sizeof(pid)) == sizeof(pid));
+				param.pid = pid;
+
+				newfd = drm_open_driver(DRIVER_XE);
+				ret = __debug_connect(newfd, &debugfd, &param);
+
+				/* Release the app first */
+				igt_assert(write(p2[1], &pid, sizeof(pid)) == sizeof(pid));
+
+				igt_assert_eq(ret, test[i].ret);
+				if (!ret)
+					close(debugfd);
+			}
+		}
+		igt_waitchildren();
+	}
+	close(p1[0]);
+	close(p1[1]);
+	close(p2[0]);
+	close(p2[1]);
+#undef NUM_USER_TESTS
+#undef P_APP
+#undef P_GDB
+}
+
 /**
  * SUBTEST: basic-close
  * Description:
@@ -1534,6 +1695,9 @@ igt_main
 	igt_subtest("basic-connect")
 		test_connect(fd);
 
+	igt_subtest("connect-user")
+		test_connect_user(fd);
+
 	igt_subtest("basic-close")
 		test_close(fd);
 
-- 
2.34.1

