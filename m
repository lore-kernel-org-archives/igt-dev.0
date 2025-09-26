Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B2BCAC5BE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618910E9FF;
	Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqCf0tCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553110E9FA
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872911; x=1790408911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtMvnqpsc5/YydiRI1CIneI9n3vO14jMzaKuQfCPAMQ=;
 b=BqCf0tCWqE9JhdzomVPEhHymkooo3B0j0jxhoG3ZAQL86h5yI7KiwiD7
 VKad4V/jYSesbGEF6kxoDz6S9IoHrYc9uH93jeCapY+KMP2ZwBNgoRBd0
 /PIKV+wIts2uEVMtFx1HgzRn2BNOc+EuiIjQZVedmA/JdZrsaD8XS+MhQ
 EKu8TeTW/tWA85WbTzAWjl8Fi3K8rDGvlK7B5f+vGwz6JojDZy5dYXsBq
 becNrcaBX/bZtUDSS7040Jv1/1oozaqOuIiH1dJIElqDnb9NucH29M1io
 pUgw/TPmruqFwCSduEaMTtYWDXPU9iofCVKT74y+tLYlhNz2UeJrkKjBZ w==;
X-CSE-ConnectionGUID: bP+TK+h/RQukYyQoso5rNg==
X-CSE-MsgGUID: GDD7Mv2bT3K3jth0EpoSdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372395"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:31 -0700
X-CSE-ConnectionGUID: XbqsYMzoShGuy/5/rcSuTA==
X-CSE-MsgGUID: ckI6beWuRaSu6lCfEhs8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474262"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:30 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 9/9] tests/xe_eudebug_online: Issue SIGTERM in
 set-breakpoint-sigint-debugger
Date: Fri, 26 Sep 2025 09:48:01 +0200
Message-Id: <20250926074801.9031-10-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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

