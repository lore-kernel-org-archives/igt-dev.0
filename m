Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B479DCCD1BC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E510E07B;
	Thu, 23 Oct 2025 06:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3NXYEaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698C10E07B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761201883; x=1792737883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7ka6z38e8GT7OP8ssq5pP1d6BjRC4onpTDM8nzdlko=;
 b=i3NXYEaUBhHdS9FyX7pw+jMQpBdn5JcCoQd0E3TAZAot6dW3v8gz6uk4
 bGEZvKWkpg6A++xjJkv0u78wDf3Tutr+7kLxXd1XKojYGM+vCArHlzeuX
 5xfYy3Z2erZd2Ao3eOuUceQ3mrKZytPleAhzawEhxlo2FrDbEUgItKQBU
 mdU9bl9zYv2pnrGQYO6p1ZuNSF4av4f62jGZa2qv86WvSc50qJnF9bbE4
 yVNwkIOkT4FFlDMf6xqG57+0tCPgYopgFORw0rB5rIEi4+a9ejzdkci43
 gzJ1rcPUbcOBKmgbRw75nDda2HZ6ymDahwrOk01hcVpttOB35PeMyMPC7 g==;
X-CSE-ConnectionGUID: kvNfY5d2TQOHvZR3o6AUiw==
X-CSE-MsgGUID: Ft5VbRauQBirFj/0nSj/pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74707725"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74707725"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:44:43 -0700
X-CSE-ConnectionGUID: Phng4FxGSNiEID9WZzSU5w==
X-CSE-MsgGUID: umLRMC/YTHex39SqoNxEXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207733029"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 23:44:41 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v7 2/3] tests/kms_concurrent: Fix for msg_queue failure
Date: Thu, 23 Oct 2025 12:01:12 +0530
Message-Id: <20251023063113.3485132-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023063113.3485132-1-s.sebinraj@intel.com>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
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

Adds supports to check if the system supports SYSVIPC
and if not found it skips the test. This removes test
failures with msg_queue creation for systems that
don't support SYSVIPC.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 4f16f8b89..1f2da3001 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		if (is_intel_device(data.drm_fd))
-			intel_allocator_multiprocess_start();
+			igt_require_f(intel_allocator_multiprocess_start(),
+				   "Allocator failure, no SYSV IPC\n");
 	}
 
 	run_tests_for_pipe(&data);
-- 
2.43.0

