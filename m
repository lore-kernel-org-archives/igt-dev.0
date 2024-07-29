Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C17FC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0310E431;
	Mon, 29 Jul 2024 16:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaCU2kq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EF210E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268979; x=1753804979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rP+nUBDocapT6s2ecK3gX0r9ggkhNwvzUIIZiT4f3jo=;
 b=XaCU2kq9goG6AIo92q/xvtZ4BDxE6NyL0ZBttqcnDzo3rbeLBhkSFQ9W
 6HNXglwG/RfbAzCL3gI70ewwLZPGfCHNPIxBttJ+z4QV7YDOfpeGSHTQi
 BbmQdpqFW2jt2PyCTLxgMjAV69ou1vkMLycnbzvKj6pA1vcComJ7vrRAF
 HqzlU/cLXxDdRStX7CzzvUmDrP5ih2FMH1q49MXlw1YYNb0jOGJtoiXqU
 NmqofHUVwWJ2sdhGZPvDSv7L1PwA+OpgffXGLcVoJdzR0bWkO2dpKAYt/
 fo8JxqZPUNPDTsdUxnitPbKtfzzZfG0rtm80Y9+qYrST4Qtnj7N+yDMaE w==;
X-CSE-ConnectionGUID: RbwVZoDLR860MVQOd/jTbw==
X-CSE-MsgGUID: kwkuCIUMRpuhdBdCs4KhIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426869"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:59 -0700
X-CSE-ConnectionGUID: QUqrqGUvTzqriq1A6Lwptg==
X-CSE-MsgGUID: RqPnrkdUS1CKqUpiauiIaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737455"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:54 -0700
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
Subject: [PATCH 11/66] tests/xe_eudebug: Test open close events
Date: Mon, 29 Jul 2024 18:01:04 +0200
Message-Id: <20240729160159.37036-12-christoph.manszewski@intel.com>
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

Introduce basic tests which validate client create/destroy events
sent on xe drm client open/close.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 2bd5a44f9..d0dc38436 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -3,8 +3,16 @@
  * Copyright © 2023 Intel Corporation
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
@@ -96,6 +104,28 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
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
@@ -110,6 +140,12 @@ igt_main
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

