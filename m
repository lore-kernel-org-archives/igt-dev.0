Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D33FC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE32C10E428;
	Mon, 29 Jul 2024 16:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHBdKYKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFCE10E42E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269013; x=1753805013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JkxUUPMfru17/zcslXPf+6L+eynphutJqOnFz93Zmk=;
 b=VHBdKYKUnX/H6Vr4ulqZe4Ep0uTRLkil+FhlXFR1iVDruds+8+irSZ2M
 UPcaqggncTT+cKmoRy8n9Oq0UoV0kEQNAiZtMQrIv81RZ8kcjEmm3nAxh
 r3fkSzQDEnWIyjIykQZlgovpAta0ocO5Iz4nbNocyuA+4PpMlCnVGRC/6
 kvN25t0ekBfQtscHQef6K2/x6lKzL17UlmbbGrXBsQrZaBZf/C4btkKdg
 Lr/RkNKl9ED8IrJTlSKrzgPne7kzBJ9lxQj1jjTA0GuTI9gQ+XtrZgvuO
 wQdM1BY0Vl0xcHAu7pW5XFbVHgH4po9OB4/VyhQfJpHx8tR914exrVIIO A==;
X-CSE-ConnectionGUID: 4DKGb+C8TbSAXgFlYKB6NQ==
X-CSE-MsgGUID: synu1gYtQaGrFSpbuRn5gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427088"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427088"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:33 -0700
X-CSE-ConnectionGUID: 0IAOppMiTqiLxBcUSYAbtg==
X-CSE-MsgGUID: vByFM1boTcuIt/TaviNX3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737840"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:29 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 22/66] tests/xe_eudebug: Add coverage for sysfs debugger toggle
Date: Mon, 29 Jul 2024 18:01:15 +0200
Message-Id: <20240729160159.37036-23-christoph.manszewski@intel.com>
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

Add subtest for checking sysfs debugger toggle logic and debugger state.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index adf5e79ac..fa81cbfe6 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -22,6 +22,30 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+/**
+ * SUBTEST: sysfs-toggle
+ * Description:
+ *      Excercise the debugger enable/disable sysfs toggle logic
+ */
+static void test_sysfs_toggle(int fd)
+{
+	xe_eudebug_enable(fd, false);
+	igt_assert(!xe_eudebug_debugger_available(fd));
+
+	xe_eudebug_enable(fd, true);
+	igt_assert(xe_eudebug_debugger_available(fd));
+	xe_eudebug_enable(fd, true);
+	igt_assert(xe_eudebug_debugger_available(fd));
+
+	xe_eudebug_enable(fd, false);
+	igt_assert(!xe_eudebug_debugger_available(fd));
+	xe_eudebug_enable(fd, false);
+	igt_assert(!xe_eudebug_debugger_available(fd));
+
+	xe_eudebug_enable(fd, true);
+	igt_assert(xe_eudebug_debugger_available(fd));
+}
+
 #define CREATE_VMS (1 << 0)
 #define CREATE_EXEC_QUEUES (1 << 1)
 #define VM_BIND (1 << 2)
@@ -1145,6 +1169,9 @@ igt_main
 		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
+	igt_subtest("sysfs-toggle")
+		test_sysfs_toggle(fd);
+
 	igt_subtest("basic-connect")
 		test_connect(fd);
 
-- 
2.34.1

