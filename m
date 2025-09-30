Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFB5CCA474
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4DF10E56B;
	Tue, 30 Sep 2025 10:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keS2mYXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BACE10E567
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228953; x=1790764953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QeoflwMe5erecvJn/KOXrJXyJAOX/gpXGaEfaUxWC7c=;
 b=keS2mYXmMTAGxNVfmi/ikVjB+67JVRpGFVBiOL7QuPgbyicbz7UPJs0d
 alu5G/43fx2gU3xynYDezYCKuonbfPRiYGdH8/vQ57IGoPnjsw2zaomZI
 UVjl5h07+PaSTyKQ3fkbyBC5tb+s3qMBDDKBMK6dfKHtx0N4c5iVeQiFx
 /K31RAcr5MjkRfIVXSvSCLdDbLSQEwYNp5Xms3usA5zBVP/LP8D70o+bP
 a19VQUnmxSs6XQCXtWrKcl+PUyPFVxK5hvDmGQklcPS9YAT+xOQ/khAN5
 Augh6VfosLkTA0gqlLmbAJ2oFf5YWw+oqBimsPyshBSsPtoONmwV/1tEB Q==;
X-CSE-ConnectionGUID: r8KJ+QSpRHuTSpWiXWF6ug==
X-CSE-MsgGUID: zllR7ymFSCO2d1WjEWg6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371499"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:33 -0700
X-CSE-ConnectionGUID: OrNwpCMKQj2CfaPAHXxr/A==
X-CSE-MsgGUID: Y1rcqhzsRk+6Xyt3IimLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:32 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 7/9] tests/xe_eudebug_online: Introduce proper sync
 for closing debugger fd in set-breakpoint-sigint-debugger
Date: Tue, 30 Sep 2025 12:42:07 +0200
Message-Id: <20250930104209.22462-8-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
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
---
 lib/xe/xe_eudebug.c             | 5 ++++-
 lib/xe/xe_eudebug.h             | 1 +
 tests/intel/xe_eudebug_online.c | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0db9eaaeb..1282e2918 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1106,8 +1106,10 @@ static void *debugger_worker_loop(void *data)
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
@@ -1182,6 +1184,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
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

