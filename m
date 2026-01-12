Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9CC9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B7310E3C5;
	Mon, 12 Jan 2026 13:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSqoJCAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53F710E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222843; x=1799758843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=id/1ek7H0QK2A1xurn5UP8iE0H6wKXzYk0SWBq/pXJE=;
 b=FSqoJCAuM0hf+G462bbub+M5K2+lyiZQPA55l/LYqkUUJwqrQ4ngWAsS
 HnmrytANEiVTQUgNyH9AsD+gIj7OBS+WsbxgEc3W5CB9Fniui0nA968Z7
 B85fQc/WECYDD5jph64Sy61rOddYzLleJtgpJn2wliNPcRLDHoVC3+oTO
 zGdyIeKnVt/nPtkAb2wCHBi8Gbm8uMoIJxERy/vPUQfcK2q1HnHtUgDME
 hcLwXSNUoKUCHjvXAWhSPek07Y/4Pm4WmtG1MQVbblMs32CgxrjZKMacc
 YC9FNn+ftiBKd3foCOr8mrrUjebHsQDaqXAKj9pI8DMIhh6KU/qdBh+kj Q==;
X-CSE-ConnectionGUID: 9szXZB2bQgmME1srf2wHNQ==
X-CSE-MsgGUID: 0s1KSg/bRE6hHiGckMVjKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545535"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:43 -0800
X-CSE-ConnectionGUID: d4I/TLC2QSG4ULfBNjhIuA==
X-CSE-MsgGUID: GBlpShtxQoG1MRDJ0ckPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094966"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:40 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 08/21] tests/intel/xe_eudebug: Fix connect-user test
Date: Mon, 12 Jan 2026 14:59:54 +0200
Message-ID: <20260112130008.1649357-9-mika.kuoppala@linux.intel.com>
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

We changed from connecting to pid into connecting into
a filedescriptor of a drm client. As the access checks
are now in a filedescriptor level we get EBADFD
instead of EACCESS. Adjust to new error returns.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 3c7a13f6fe..1bb30a1cad 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -637,7 +637,7 @@ static void test_connect_user(int fd)
 	test[0].skip = !pwd;
 	test[0].u[P_GDB] = u1;
 	test[0].g[P_GDB] = g1;
-	test[0].ret = -EACCES;
+	test[0].ret = -EBADFD;
 	test[0].desc = "User GDB to Root App";
 
 	test[1].skip = !pwd;
@@ -659,7 +659,7 @@ static void test_connect_user(int fd)
 	test[3].g[P_APP] = g1;
 	test[3].u[P_GDB] = u2;
 	test[3].g[P_GDB] = g2;
-	test[3].ret = -EACCES;
+	test[3].ret = -EBADFD;
 	test[3].desc = "User GDB to Other User App";
 
 	if (!pwd2)
-- 
2.43.0

