Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F65CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCE410E894;
	Thu, 18 Sep 2025 12:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YluobPiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892E10E894
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198860; x=1789734860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zwg8XMJ2As5EyGTBbm+A1vZt5VXoThMppv11JQAN4Ws=;
 b=YluobPiwqrCgqG/xeAu9Lhb808+AdtvK6axBG2PCP6R47Nj498ose2Od
 86HNvLSjA+EcgwXa6nkMpsDWq/aUYvtrJ9CA+z491z4H7sQQr9H89LJsw
 78Jz7iHFNY9QSARa/2QKwqwqXcXDDOKT3bFPxHEaPOMfRqYdsSN0xudKZ
 +2BHZI5vmvz7pfwOkc/WIxryVYhfkiUpCOXzn7p1Nkup7V3u5bDiMeY0+
 uwdxUKYkOJqHwmEQ21dOb3Ori0E0caAyBwPrLiK/EcoRCqRhssdva2V1M
 Jv7C9dwIi0oqySJ62YO2fZ3O+titT2VAxadPaH24iZSA40QbJEwCa3+Fh Q==;
X-CSE-ConnectionGUID: nNz/a0mlQACivSfyhanIdQ==
X-CSE-MsgGUID: QLIj20PZSqaNZBifSgOT5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966204"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966204"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:20 -0700
X-CSE-ConnectionGUID: s6cdJ1oCScmi7RVh8Gfoog==
X-CSE-MsgGUID: Ax+BlgJJQ0+vbwlLkHaUzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328181"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:19 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 5/5] tests/xe_eudebug_online: Improve issuing SIGINT
 in set-breakpoint-sigint-debugger
Date: Thu, 18 Sep 2025 14:34:01 +0200
Message-Id: <20250918123401.5433-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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

Use pthread_sigqueue instead of pthread_kill in order to be able to pass
debugger to signal handler. Wait for the SIGINT handling to complete
before closing the debugger fd to avoid tripping over asserts.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index aa58e5f99..2576477eb 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1600,7 +1600,11 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
-		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		pthread_sigqueue(s->debugger->worker_thread, SIGINT,
+				 (union sigval){ .sival_ptr = (void*)s->debugger });
+		/* XXX: Don't close debugger fd before it dies */
+		while (!s->debugger->handled_sigint)
+			usleep(1000);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

