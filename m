Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC63C83F34
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 10:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A455110E339;
	Wed, 23 Jul 2025 10:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jn52/aOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B450110E339
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753267465; x=1784803465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iG9l6og09OpDDY739u7Px6AVED3vqY6n+QWGR3vF/yk=;
 b=Jn52/aOxbt+8+dRjZSAdENmzgPvKdJMD9GEt6O0DRIbXpvXV+48DcpVX
 cMSCgqnF1uZ74SeMy6e5GNHqDbaR2MDGZvHUNyEL3lrRwr0602zwZb/JM
 QFRIM4zVSrjoL6NlRMSwyiGlDWwS65YGvXYofD+MOP90+4Bstzn3v3onr
 hGEEvRKGzPaWTeKasqzeR6wyRwU8p7ShWJ8v7OIWUIL9QQgKTu90WunaH
 +zp9u/aikf6vbjw0lVSz9Qk9FzOT7NJs5DrC2r/DP4q1teUOcGkR5I3Qo
 XMjeo9Gc57GDc/QwZChhoSDKfJWJf4Ee/JgjdmXNOU1SjcN7TUWixs0PJ Q==;
X-CSE-ConnectionGUID: EwY1kUisRJmDMab/zc/iwA==
X-CSE-MsgGUID: XDJDLmyeShOa2r+2adgmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55393789"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55393789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:25 -0700
X-CSE-ConnectionGUID: abWY1wHOR/2M1A96OUQtRA==
X-CSE-MsgGUID: 8IxLSt6lSRumlRiBjKT/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159984243"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:23 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4 i-g-t 3/3] lib/tests: Update hook unit testing
Date: Wed, 23 Jul 2025 12:44:06 +0200
Message-ID: <20250723104406.58784-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723104406.58784-1-peter.senna@linux.intel.com>
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
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

The unit testing for hooks checks env vars created by the hooks
infrastructure.  Update unit testing to account for the new
IGT_HOOK_KMOD_UNBIND_MODULE_NAME env var.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v4:
 - Introduced in v4

 lib/tests/igt_hook.c             | 1 +
 lib/tests/igt_hook_integration.c | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
index 676c6eb7a..420a19c72 100644
--- a/lib/tests/igt_hook.c
+++ b/lib/tests/igt_hook.c
@@ -16,6 +16,7 @@ static const char *env_var_names[] = {
 	"IGT_HOOK_TEST",
 	"IGT_HOOK_SUBTEST",
 	"IGT_HOOK_DYN_SUBTEST",
+	"IGT_HOOK_KMOD_UNBIND_MODULE_NAME",
 	"IGT_HOOK_RESULT",
 };
 
diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
index 8525c6a3f..3b35065ab 100644
--- a/lib/tests/igt_hook_integration.c
+++ b/lib/tests/igt_hook_integration.c
@@ -16,24 +16,25 @@ char fake_argv_buffer[1024];
 char *fake_argv[64];
 int fake_argc;
 
-#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
+#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, unbind_module_name, result) \
 { \
 	"IGT_HOOK_EVENT=" evt_name, \
 	"IGT_HOOK_TEST_FULLNAME=igt@igt_hook_integration" fullname_suffix, \
 	"IGT_HOOK_TEST=igt_hook_integration", \
 	"IGT_HOOK_SUBTEST=" subtest, \
 	"IGT_HOOK_DYN_SUBTEST=" dyn_subtest, \
+	"IGT_HOOK_KMOD_UNBIND_MODULE_NAME=" unbind_module_name, \
 	"IGT_HOOK_RESULT=" result, \
 }
 
 #define TEST_ENV(evt_name, result) \
-	ENV_ARRAY(evt_name, "", "", "", result)
+	ENV_ARRAY(evt_name, "", "", "", "", result)
 
 #define SUBTEST_ENV(evt_name, subtest, result) \
-	ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
+	ENV_ARRAY(evt_name, "@" subtest, subtest, "", "", result)
 
 #define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
-	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, result)
+	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, "", result)
 
 const char *pre_test_env[] = TEST_ENV("pre-test", "");
 const char *pre_subtest_a_env[] = SUBTEST_ENV("pre-subtest", "a", "");
-- 
2.43.0

