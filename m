Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681D1CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBE210E728;
	Wed, 24 Sep 2025 12:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCXbd7pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06FE10E728
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717712; x=1790253712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0TYEh4qWxxQYSGr2ZkzmX+cm6NK+RZhtQVOk2JdKTLo=;
 b=WCXbd7pCOhT8XNRiFitFUIWp9FgT9trBnmX+Up3vub54oOiS2S5n4yDx
 EcFt5vjQIs0cyrgdCfKw5o8v4C6Bf/O+4YJ4mUEyWZE0r1Vj6t7xVXewE
 dhup+KRHCcDAFJ4CQPS+VYsVuFBUY8UAFeFOY9HipZ7CXpQAzhZztE74i
 xbiugO8u0X3JrstH6DrK0A908LXyJzsatxwLZeZ5dusHDCMao4HXIh3Vg
 yrFfbbmXZnX/VLA5J8e7RjzOim2hnCebEcJIujdO+j5Vq3Qrn0Bd3w65c
 51+WBN5EdJMm6udyzEVj8o6pNvVlM6wZOjFtoILd3fOyRI3w1x7L0ak0v w==;
X-CSE-ConnectionGUID: gcazGQr6TiO+Q3UrDLWH+Q==
X-CSE-MsgGUID: nRobdm48QKOFMj1zdAG9Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182126"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:52 -0700
X-CSE-ConnectionGUID: A4OBL1mFQryHRDo3FMOuEg==
X-CSE-MsgGUID: nRNJHfgpQgqrzMbDCXjOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459909"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:50 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 6/6] tests/xe_eudebug_online: Improve issuing SIGINT
 in set-breakpoint-sigint-debugger
Date: Wed, 24 Sep 2025 14:41:23 +0200
Message-Id: <20250924124123.14792-7-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
References: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

Use xe_eudebug_debugger_kill instead of pthread_kill. Wait for the
SIGINT handling to complete before closing the debugger fd to avoid
tripping over asserts. Issue some SIGTERM signals in quick succession
before SIGINT to raise the odds of hitting the ioctl.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index aa58e5f99..4c6c31da3 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -65,6 +65,8 @@
 #define CACHING_POISON_VALUE	0xcafedead
 #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
 
+#define SIGTERM_COUNT		50
+
 #define SHADER_CANARY 0x01010101
 #define BAD_CANARY 0xf1f1f1f
 #define BAD_OFFSET (0x12345678ull << 12)
@@ -1600,7 +1602,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
-		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		/*
+		 * Issue some SIGTERM signals in quick succession before SIGINT
+		 * to raise the odds of hitting the ioctl
+		 */
+		for (int i = 0; i < SIGTERM_COUNT; i++) {
+			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
+			usleep(rand() % 1000);
+		}
+		xe_eudebug_debugger_kill(s->debugger, SIGINT);
+		/* Don't close debugger fd before it dies */
+		while (!s->debugger->handled_sigint)
+			usleep(1000);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

