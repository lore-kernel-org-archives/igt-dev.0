Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19ABC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50310E425;
	Mon, 29 Jul 2024 16:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3KpM/DH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046F510E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268942; x=1753804942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5KG4QjlCzC2+I8qLuLI83KTYzmQzoaPWQSFVCeLRzo=;
 b=a3KpM/DH12p60fItMQvIjr79d0DgIF3gbCvSs5Q0X9aRbePermjFRPwe
 eg8hW3LGvqL1E/O0ah5d+xPmohK2cN9QLaiROkwtllkYlicOWC+vKghWC
 kOp6M4yyc4267jViMugutYeTvcO4Svxlm49c/dakNUuPdlZIasMvWbp12
 4dH/MXkzhtocetWWRyOLhcgP3jG/slNHQbbX8TIElLAj5e1LEZHUJANm4
 byJ7XqI4DDeEuaeblgYTr5FpZpuGWof8ZjUFcyv5pRUkyUxahwH7SbpDa
 WpkXDVlnphqJd5dlz1d/N6qbwkv8dRiI+v+camft0eUqGFVDuRQyIDEoa A==;
X-CSE-ConnectionGUID: PhAFM1GIRDyfWBZQ3W97fA==
X-CSE-MsgGUID: lo/rJPzGRVC3I/mCBQn5AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426743"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426743"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:22 -0700
X-CSE-ConnectionGUID: ZZEpaSknS3agHjCPXoU4lQ==
X-CSE-MsgGUID: 1splfFBnTOaYuFN+kixSuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737067"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:18 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 01/66] tests/xe_eudebug: Test eudebug connection
Date: Mon, 29 Jul 2024 18:00:54 +0200
Message-Id: <20240729160159.37036-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Add basic tests checking xe eudebug connection capability.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 115 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 tests/intel/xe_eudebug.c

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
new file mode 100644
index 000000000..2bd5a44f9
--- /dev/null
+++ b/tests/intel/xe_eudebug.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <xe_drm.h>
+#include "igt.h"
+
+static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect *param)
+{
+	int ret = 0;
+
+	*debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, param);
+
+	if (*debugfd < 0) {
+		ret = -errno;
+		igt_assume(ret != 0);
+	}
+
+	errno = 0;
+	return ret;
+}
+
+static void test_connect(int fd)
+{
+	struct drm_xe_eudebug_connect param = {};
+	int debugfd, ret;
+	pid_t *pid;
+
+	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
+		   MAP_SHARED | MAP_ANON, -1, 0);
+
+	/* get fresh unrelated pid */
+	igt_fork(child, 1)
+		*pid = getpid();
+
+	igt_waitchildren();
+	param.pid = *pid;
+	munmap(pid, sizeof(pid_t));
+
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, param.pid ? -ENOENT : -EINVAL);
+
+	param.pid = 0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.pid = getpid();
+	param.version = -1;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.version = 0;
+	param.flags = ~0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.flags = 0;
+	param.extensions = ~0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.extensions = 0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert_neq(debugfd, -1);
+	igt_assert_eq(ret, 0);
+
+	close(debugfd);
+}
+
+static void test_close(int fd)
+{
+	struct drm_xe_eudebug_connect param = { 0,  };
+	int debug_fd1, debug_fd2;
+	int fd2;
+
+	param.pid = getpid();
+
+	igt_assert_eq(__debug_connect(fd, &debug_fd1, &param), 0);
+	igt_assert(debug_fd1 >= 0);
+	igt_assert_eq(__debug_connect(fd, &debug_fd2, &param), -EBUSY);
+	igt_assert_eq(debug_fd2, -1);
+
+	close(debug_fd1);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	igt_assert_eq(__debug_connect(fd2, &debug_fd2, &param), 0);
+	igt_assert(debug_fd2 >= 0);
+	close(fd2);
+	close(debug_fd2);
+	close(debug_fd1);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("basic-connect")
+		test_connect(fd);
+
+	igt_subtest("basic-close")
+		test_close(fd);
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index e649466be..35bf8ed35 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,7 @@ intel_xe_progs = [
 	'xe_dma_buf_sync',
 	'xe_debugfs',
 	'xe_drm_fdinfo',
+	'xe_eudebug',
 	'xe_evict',
 	'xe_evict_ccs',
 	'xe_exec_atomic',
-- 
2.34.1

