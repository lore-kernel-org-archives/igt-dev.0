Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBF6CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDF010E6B7;
	Wed,  1 Oct 2025 11:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g21+OAFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A964410E6DE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319722; x=1790855722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plBxQNSd3chcGfaPO/nRV5LpjUryiCESWsrLv4R+Skg=;
 b=g21+OAFrKeEzhjFsbVnjWQ7cOkX7GWw7hyxzm4g3N93MP4iORJy6xVXT
 nGTBgyVU8qhnrsJcUn8/5Hr7D+mvxPgFX/EYWRggR75hgysgseJOTnrBP
 E+6iIIK5CjKjY2GDgdZmzbN3sj2CQXNoics4D5cfZu/QiaWpo/HlwbXcy
 6fKInnRs/5R+kbMtJtu4dF2wsEEzjt65v1C+GRp6AFgl6sFf2YsT07lWd
 pbCMxAuE6luHzPoba4pZbMQ/SHTDyqvS2yi79HHPZPc6CaoKwkRK3u+zv
 kwr0/MtK40TjKuv16vaZI9JpHbg8LVJTc0JRBxAtbs0s5fQTHgrDQP2LE w==;
X-CSE-ConnectionGUID: Kge+B1QmTnqSWBGpf8C9xg==
X-CSE-MsgGUID: BG291q0xT4i+Ljx0Orsn2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014992"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:22 -0700
X-CSE-ConnectionGUID: nmqHaYuxQAKP7UoHPu/zew==
X-CSE-MsgGUID: Cy61zRbDR+CO4ADY5m9/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496255"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:21 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 08/10] tests/xe_eudebug_online: Introduce proper sync
 for closing debugger fd in set-breakpoint-sigint-debugger
Date: Wed,  1 Oct 2025 13:54:45 +0200
Message-Id: <20251001115447.11843-9-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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

Wait for the SIGINT handling to complete before closing the debugger fd
to avoid tripping over asserts.

Introduce handled_sigint to help with coordination outside the debugger
loop.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c             | 5 ++++-
 lib/xe/xe_eudebug.h             | 1 +
 tests/intel/xe_eudebug_online.c | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8ab0e5f6a..b40f0beb4 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1108,8 +1108,10 @@ static void *debugger_worker_loop(void *data)
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
-		if (d->received_sigint)
+		if (d->received_sigint) {
+			d->handled_sigint = true;
 			pthread_exit(NULL);
+		}
 
 		if (ret == -1) {
 			if (errno == EINTR)
@@ -1184,6 +1186,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->master_fd = master_fd;
 	d->ptr = data;
 	d->received_sigint = false;
+	d->handled_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index dd5c5e20a..7c7a01471 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -45,6 +45,7 @@ struct xe_eudebug_debugger {
 	enum xe_eudebug_debugger_worker_state worker_state;
 
 	bool received_sigint;
+	bool handled_sigint;
 
 	int p_client[2];
 };
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 30e661b13..e388ea888 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1601,6 +1601,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 			sigints_during_test++;
 
 		xe_eudebug_debugger_kill(s->debugger, SIGINT);
+		/* Don't close debugger fd before it dies */
+		while (!s->debugger->handled_sigint)
+			usleep(1000);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

