Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C06AFA1FC7
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1426410E032;
	Wed, 22 Apr 2026 15:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlAutkP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4C710E032
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872681; x=1808408681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOuGEWmBh0EdYUqKiZU90l59KVAw7qlq1P56i6x1lxQ=;
 b=TlAutkP0SoSyyT0VNJenkV8NHzNF7cQ0hoEaa38CipeUPKtLQ4ksJReE
 gAiMA84zbtVvz3tr8a0d2NNOdlFqyFAXPqCeSzGVaVlYWGSRipYq1Oavx
 RWYmdb8fk7qc9esC2HMwrG6XlT2cqgmR7ebWvLwv3mnrIEd23wmS+7JEJ
 R6P9BRE9QgajUdxb+BCYV4GzSBzhD1/sJMxA1hf9J2yKScLzvelsCAtOh
 7j9Cfz2SAVSFPKXbPAMrKmWjxVVDpk3aNRCk/spjHTdJXTVIFOi2T7oIR
 046ekkGDvOXLf1o3LFpWXdhUP1+32x1KCyXuU6Y9UJ8JzABKVnQtdR2uf g==;
X-CSE-ConnectionGUID: 9PJHRjkERR6zIJcYaiMEQQ==
X-CSE-MsgGUID: u1hIKu1HSKq249qzGqp0kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81692680"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="81692680"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:41 -0700
X-CSE-ConnectionGUID: eFmymw7dSa+iCHoT5qf3Fg==
X-CSE-MsgGUID: W4zybkxrR0KPjHYMt7G+Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="236762671"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:40 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 3/5] tests/prime_udl: Fix error handling
Date: Wed, 22 Apr 2026 17:44:21 +0200
Message-ID: <20260422154423.141908-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
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

Open function returns -1 on error so error check was never hit.
Fix it and handle it properly.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/prime_udl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index b1524e6de..5d2c952d5 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -47,11 +47,11 @@ static int find_and_open_devices(void)
 		sprintf(path, "/dev/dri/card%d", i);
 		if (venid == 0x8086 && intel_fd == -1) {
 			intel_fd = open(path, O_RDWR);
-			if (!intel_fd)
+			if (intel_fd == -1)
 				return -1;
 		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
-			if (!udl_fd)
+			if (udl_fd == -1)
 				return -1;
 		}
 	}
-- 
2.54.0

