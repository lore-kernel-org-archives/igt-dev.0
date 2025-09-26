Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F06CAC5B8
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1A210E9FA;
	Fri, 26 Sep 2025 07:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ju1AUvEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D763A10E9FA
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872911; x=1790408911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdzcPtNoeTgP5gHkgWT6Et/D/rpH5BnNZKPZscCo4jM=;
 b=Ju1AUvEvTs/n5wOLHLJX3AFo4RSSS0VUQps9UG0Qkfl1qwdiumBIWu/R
 45GJEyFSfKrEF8jQH/zVcbBVWJnTZdVANKdsBNrCgzc9X73PLR2r0qwl3
 bhbknf3ikyzHZSNG/205nI7aOOHM5boSkFD308MX7nJKbNfOoWAThogum
 LZvHklrhaVjF1HmyhAifo6zBAHQxvjkQXUw7RS1NPTT5dn2py9Qx9ezfC
 9qsU2mdMwJ6ZBPMLUK4JGAlPzr7bfUc4kypOgcjOjC0Bczm7MrW/jUao/
 o/sVYM72lpBdmi77KXsAWOGOlKgL+t7NDppiqQPKRmHT5h337/bvXK4JP Q==;
X-CSE-ConnectionGUID: PsLC86B7Sfm34U5DtgbbwA==
X-CSE-MsgGUID: V8C3uL3WRAWCMU4/8bJIUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372385"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:24 -0700
X-CSE-ConnectionGUID: kbKibEp0RZmH7/w4NkIXWQ==
X-CSE-MsgGUID: Bgm1CHpnSjmAxXGvTrKvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474225"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:23 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 5/9] tests/xe_eudebug_online: Improve issuing SIGINT
 in set-breakpoint-sigint-debugger
Date: Fri, 26 Sep 2025 09:47:57 +0200
Message-Id: <20250926074801.9031-6-dominik.karol.piatkowski@intel.com>
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

Use xe_eudebug_debugger_kill instead of pthread_kill to allow proper
handling of signals inside debugger thread.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index aa58e5f99..30e661b13 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1600,7 +1600,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
-		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		xe_eudebug_debugger_kill(s->debugger, SIGINT);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

