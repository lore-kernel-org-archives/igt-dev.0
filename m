Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25A7C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D1D10E513;
	Tue, 30 Jul 2024 11:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlNipxho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293E710E515
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340068; x=1753876068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMKW3LpFFOjGYbmIe8ABbpKOa7Mah5WqZ4ijshlP4mk=;
 b=mlNipxhofXMzFMHOlzX6bIZLxK2BoLBvFk3lJUvYNP06cZWzBRiw5bh5
 YPYrRaIMFzkuGBBxsiEwke/PmBS1kGhbrcvm62HtnWNhi5GbLs7cW3EqM
 ZMCjz/H5klVWoBaqPn2nyl/yqX3vfgCyUQU8IKoCGJj3QBt0If/mgjS2k
 sgYw+Ww0AuCp0GHa15l1f0b0vjOOZBGVBJ7wg8Uu/lAVW1ZBQ2rwq8k4f
 7pnytG1sW/Msxn8p7AmEC+pepiGjZtG4HHBX7HDGFz7v50f8zh8/+j/lU
 ZeJSRxLQG58aaO+iGrUkFdT18AelYcea/6TkWbMw8yx4F/Hj+ncHUhPsy w==;
X-CSE-ConnectionGUID: siqPueTnShKNTnio3oVs1w==
X-CSE-MsgGUID: NsObjbTLSgW9WsI3f7gvJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937295"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937295"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:47 -0700
X-CSE-ConnectionGUID: 7aDjj2i/TG+FJunKEggh3g==
X-CSE-MsgGUID: 6CE7c2BhRcO7vBnAKY07yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216755"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:44 -0700
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
Subject: [PATCH i-g-t v2 22/66] tests/xe_eudebug: Add coverage for sysfs
 debugger toggle
Date: Tue, 30 Jul 2024 13:44:39 +0200
Message-Id: <20240730114523.334156-23-christoph.manszewski@intel.com>
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

Add subtest for checking sysfs debugger toggle logic and debugger state.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index de8edb485..b565785e3 100644
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
@@ -1146,6 +1170,9 @@ igt_main
 		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
+	igt_subtest("sysfs-toggle")
+		test_sysfs_toggle(fd);
+
 	igt_subtest("basic-connect")
 		test_connect(fd);
 
-- 
2.34.1

