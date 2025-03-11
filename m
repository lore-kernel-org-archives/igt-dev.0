Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1187C28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0910E200;
	Tue, 11 Mar 2025 13:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixJO5UOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FCA10E1FD
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701354; x=1773237354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EtvhxC9A5bvahg031pEthRaChf+nG2aik/d0JW0J1U8=;
 b=ixJO5UOw0DXRENCPzSmNupNDt8Q2CHktQfgpFlEmxQqdN3EKtu3btyoR
 BffzBc0J3GbPrWkuf/4uxEz0uSPlxZGW+1wXIRUb28MaTPBahH+lJRKbj
 G0bfj4iXi9CDreeyyA/1DZUSbz2iSzk4uxnyI7DwpGCof1uSQ1PAwFb4i
 Vbxb0vLCENfGxjM8K7P5ExlqeUY4+hOEiIkip+gz23apYjNGSqLUPfo68
 I/jVVOEiQirD10haUeRADYdgLvSD7daltXq4fiJDqrRSIxJgpU7/HaNoc
 +JESA4Nxb7HUxrAtwDP2Ly+7sm2Umy7iDvJX8heXM7746dlTM1USu51M3 A==;
X-CSE-ConnectionGUID: UsvXzB/BQLyJox2447dlsg==
X-CSE-MsgGUID: Vhm5SJXpSrKCyQt/Nr9bWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42616258"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42616258"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:54 -0700
X-CSE-ConnectionGUID: x09HLd3xTkWGEyKZP1FwoQ==
X-CSE-MsgGUID: EOTj8KTwRJiS/Lw1JaCYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151131523"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:53 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/3] lib/eudebug: Make debugger thread SIGINTable
Date: Tue, 11 Mar 2025 14:55:27 +0100
Message-Id: <20250311135529.5425-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
References: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
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

Due to the fact that `pthread_kill(thread, SIGINT)` results in SIGINTing
all of the threads - including main thread - by default, testcases that
send SIGINT to debugger thread are crashing.

Introduce SIGINT signal handler for debugger thread to fix this.

v2: Initialize sigaction (Mika)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1205d945b..558882914 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1050,6 +1050,11 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
 	return ret;
 }
 
+static void terminate_debugger(int sig)
+{
+	pthread_exit(NULL);
+}
+
 static void *debugger_worker_loop(void *data)
 {
 	uint8_t buf[MAX_EVENT_SIZE];
@@ -1060,9 +1065,14 @@ static void *debugger_worker_loop(void *data)
 		.revents = 0,
 	};
 	int timeout_ms = 100, ret;
+	struct sigaction sa = { 0 };
 
 	igt_assert(d->master_fd >= 0);
 
+	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
+	sa.sa_handler = terminate_debugger;
+	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
+
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
-- 
2.34.1

