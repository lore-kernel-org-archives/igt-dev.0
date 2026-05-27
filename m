Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E82CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 04:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C03B10E243;
	Wed, 27 May 2026 04:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaA/21pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFDA10E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 04:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779857789; x=1811393789;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A86X1bJMB3F2tCazNjQzBvJtZBdZc7bSG8Xh0Bd8pGA=;
 b=WaA/21plReBPZMSqJdylWwQNAjVywdWWjPj1FKCJ+ajCxsbW3OAesMM7
 y/3bqTjXP4c6Gt+OD/S49VA68w0i47K+TC2J37wRc1KkgEQBMTtCjwVOQ
 2fHTg4IEvI1mC/n1CCj0wU41wHmDqGB5bZQUTu45DqKKkeN9Ni43skZAp
 CYCyeDo0O5XS/D+BR0ks25jekku2QAWTOk2RcUEjGyq1IUAhsH2aIkzph
 I+Lu4WONbMbdyjuUjGanpVPQ1JI7ONV97CV71x5fa86qrgsdufecQTIhN
 DBq+HSUyp6qKipYRe09FShoqKjxMWk6bfHdTZ1ScHg1OIiDLxXV0qquKD w==;
X-CSE-ConnectionGUID: NEruub5hSOCTL8JknrYIgA==
X-CSE-MsgGUID: 9L5GqdkhQ4m2H0QUA6wc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79715743"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79715743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:56:29 -0700
X-CSE-ConnectionGUID: IOay+MllQn2GloNhEWomOg==
X-CSE-MsgGUID: COQz44bmTQeh9ceuXa/+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265729256"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:56:27 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path for post and
 mid variants
Date: Wed, 27 May 2026 10:31:27 +0530
Message-ID: <20260527050129.2147335-3-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
 <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
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

Fixed the hardcoded "ctx_restore_post_bb" write with the computed
file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
invalid-case tests work for both "post" and "mid" variants.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index f024235f2..39762e030 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -234,7 +234,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
-- 
2.43.0

