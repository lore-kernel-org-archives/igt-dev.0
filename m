Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B338FCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6467610E8FF;
	Thu, 25 Sep 2025 12:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZnyqQi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186D10E2C7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758803899; x=1790339899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtMvnqpsc5/YydiRI1CIneI9n3vO14jMzaKuQfCPAMQ=;
 b=HZnyqQi0+sBWbChwNNk4JN+3hKenW9Agr0sZqsKUxeE10LsATJOKukJj
 b2xLNVnuZHgSFO0lQUU+XtOaey9IaR/hGPGMIh2rQE+QVyXELYASWOoZ8
 8Sv9yiv1AbFjRRFkBUYPpF4EJWZVlXdfTVNV6CuMduuIUgIM5c5880V7T
 KHSIursVoBo0WimuT8D4mzCmyJNeO5L7zripxKdZoJWC57a2mw8W1lL5x
 Q077gCm6RTr3Twc/18g2+Vid1tuuIVSNJXs8n1PkgZjMH36mmja1uE4XQ
 dxAm30e/mxBVpMQxlZwQy/WzZUKLCWby0XCVea5BWAEMGEjEZ97TQUNR+ A==;
X-CSE-ConnectionGUID: RkmQ7dU4Q6iRx7jfMAotXQ==
X-CSE-MsgGUID: MxPv9SVzS621hMy41Ke0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61226522"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61226522"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:19 -0700
X-CSE-ConnectionGUID: AL5dhfZgR0WU2Yfujan27Q==
X-CSE-MsgGUID: kDuxo66ITDG+05KMd3Ol2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176894502"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v6 i-g-t 9/9] tests/xe_eudebug_online: Issue SIGTERM in
 set-breakpoint-sigint-debugger
Date: Thu, 25 Sep 2025 14:37:45 +0200
Message-Id: <20250925123745.15721-10-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
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

Issue some SIGTERM signals in quick succession before SIGINT to raise
the odds of hitting the ioctl.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e388ea888..4c6c31da3 100644
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
@@ -1600,6 +1602,14 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
+		/*
+		 * Issue some SIGTERM signals in quick succession before SIGINT
+		 * to raise the odds of hitting the ioctl
+		 */
+		for (int i = 0; i < SIGTERM_COUNT; i++) {
+			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
+			usleep(rand() % 1000);
+		}
 		xe_eudebug_debugger_kill(s->debugger, SIGINT);
 		/* Don't close debugger fd before it dies */
 		while (!s->debugger->handled_sigint)
-- 
2.34.1

