Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5489AC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1454110E50E;
	Tue, 30 Jul 2024 11:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLyUsX5C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0788010E50E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340038; x=1753876038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tGbO4ju+rOZaCHCAdusV6JAQl7JSAUy71objCtO+qgM=;
 b=aLyUsX5CZAGdgFUOeQEKOSeF1WOep8CZOkPLtYhNIRPV7HUg+A9WOnom
 skpBZhOJgY2j6lEPCQpekz1+61/ZQ6xojZyBwuvQ8Pk+pHx2x0xv58Nw1
 A61OWpiPVWHnvbc08RH3AkbAvOdhkFKF3mwv5MKC3AyOsmiAtwBFVtAhl
 T+58m2dDJaLn4WAA4UmIqCtIvyuX0mTBbY0tqOM3IjAMYg9RGOAwGg99j
 NKuL+AkzjgjZ3rpIo9HBQD8JZqsVf8vMsJQzZ067WIf1T3MjvPwJaNKXz
 XF98cv0fuBO/7gWmS78fgEH4m2q4v8KDTA5HBuR50KR2FMo4r2fgnGMul Q==;
X-CSE-ConnectionGUID: xacOttmaTQKk0zfHF7G6TA==
X-CSE-MsgGUID: M5i68C5UQ/yQLAWc6EwolA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937207"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937207"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:18 -0700
X-CSE-ConnectionGUID: bmZWSXBNRW2SfcG4sCwP4Q==
X-CSE-MsgGUID: tqiaRewiTZGxbRGcE2smnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216582"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:15 -0700
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
Subject: [PATCH i-g-t v2 12/66] tests/xe_eudebug: Test open close events
Date: Tue, 30 Jul 2024 13:44:29 +0200
Message-Id: <20240730114523.334156-13-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Introduce basic tests which validate client create/destroy events
sent on xe drm client open/close.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 44a491319..7ca0138a2 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -12,8 +12,16 @@
  * Test category: functionality test
  */
 
-#include <xe_drm.h>
 #include "igt.h"
+#include "xe/xe_eudebug.h"
+
+static void run_basic_client(struct xe_eudebug_client *c)
+{
+	int fd;
+
+	fd = xe_eudebug_client_open_driver(c);
+	xe_eudebug_client_close_driver(c, fd);
+}
 
 static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *param)
 {
@@ -116,6 +124,39 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
+/**
+ * SUBTEST: basic-client
+ * Description:
+ *	Attach the debugger to process which opens and closes xe drm client.
+ *
+ * SUBTEST: multiple-sessions
+ * Description:
+ *	Simultaneously attach many debuggers to many processes.
+ *	Each process opens and closes xe drm client.
+ */
+
+static void test_basic_sessions(int fd, unsigned int flags, int count)
+{
+	struct xe_eudebug_session **s;
+	int i;
+
+	s = calloc(count, sizeof(*s));
+
+	igt_assert(s);
+
+	for (i = 0; i < count; i++)
+		s[i] = xe_eudebug_session_create(fd, run_basic_client, flags, NULL);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_run(s[i]);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_check(s[i], true, 0);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_destroy(s[i]);
+}
+
 igt_main
 {
 	int fd;
@@ -130,6 +171,12 @@ igt_main
 	igt_subtest("basic-close")
 		test_close(fd);
 
+	igt_subtest("basic-client")
+		test_basic_sessions(fd, 0, 1);
+
+	igt_subtest("multiple-sessions")
+		test_basic_sessions(fd, 0, 4);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

