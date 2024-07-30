Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D015C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C991210E517;
	Tue, 30 Jul 2024 11:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cV/5O44p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341810E516
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340044; x=1753876044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZdP6Hy08AxYbp/TJMT84yWyYm33RgErWQxZmjCRDvU=;
 b=cV/5O44pEMSYO0wnmWeT9PirhuLytvv5pqwoFQZvWBQx0XmSGmFPXkBQ
 QnGu0HUk1A4n386GM4fxCc08wLUp8fm9Ilbf69fATaKVYKBdd51SfsmqF
 JgGBOUAUdB9Vd0pMoYr0+dkyK8G4VD9SxAAhX12U9MChQW3cRkhayust7
 epR3CEMRt3XqN6g6C0ygeGsA4f3BRmWoH7QytJm7rzg5qrvWJY8KLWroT
 7RYiQ0wu3nI2WRBKMqAMaAGFRB7Nglokg5T4u/7H9PlZv8J4PHmrUbslH
 jkTkDACOsUb3ghZQILw91sFbHKTLxdHf2McCAvnVWgy5vf1J1kqvBqYIc g==;
X-CSE-ConnectionGUID: XLfkgFbjSau2VSQjzko2CQ==
X-CSE-MsgGUID: vCC/2O/aT2WrDSDuOY7NFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937226"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:24 -0700
X-CSE-ConnectionGUID: 0xk5UWc6SNycIlmWjcqWbA==
X-CSE-MsgGUID: Sp93UjWIQH+tnhfVHd8L6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216616"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:21 -0700
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
Subject: [PATCH i-g-t v2 14/66] tests/xe_eudebug: Add vm events sanity check
Date: Tue, 30 Jul 2024 13:44:31 +0200
Message-Id: <20240730114523.334156-15-christoph.manszewski@intel.com>
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

Add basic test validating eudebug vm events.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 0cef652e2..7c1c21a33 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -18,11 +18,27 @@
 #include "igt.h"
 #include "xe/xe_eudebug.h"
 
+#define CREATE_VMS	(1 << 0)
 static void run_basic_client(struct xe_eudebug_client *c)
 {
-	int fd;
+	int fd, i;
 
 	fd = xe_eudebug_client_open_driver(c);
+
+	if (c->flags & CREATE_VMS) {
+		const uint32_t flags[] = {
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
+			DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		};
+		uint32_t vms[ARRAY_SIZE(flags)];
+
+		for (i = 0; i < ARRAY_SIZE(flags); i++)
+			vms[i] = xe_eudebug_client_vm_create(c, fd, flags[i], 0);
+
+		for (i--; i >= 0; i--)
+			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+	}
+
 	xe_eudebug_client_close_driver(c, fd);
 }
 
@@ -238,7 +254,12 @@ static void test_read_event(int fd)
  * Description:
  *	Simultaneously attach many debuggers to many processes.
  *	Each process opens and closes xe drm client.
+ *
+ * SUBTEST: basic-vms
+ * Description:
+ *	Attach the debugger to process which creates and destroys a few vms.
  */
+
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct xe_eudebug_session **s;
@@ -282,7 +303,10 @@ igt_main
 		test_basic_sessions(fd, 0, 1);
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, 0, 4);
+		test_basic_sessions(fd, CREATE_VMS, 4);
+
+	igt_subtest("basic-vms")
+		test_basic_sessions(fd, CREATE_VMS, 1);
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1

