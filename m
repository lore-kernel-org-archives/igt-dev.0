Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1076AC021B5
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03CD10E057;
	Mon, 24 Feb 2025 13:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxiFDV1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A756310E057
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740402509; x=1771938509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a+fgq/WBgXthIV3lxPKRpf6MiEK+6hBU6uVPAO0tSrw=;
 b=OxiFDV1UkTBcGFkI8Rk9GUWDK2WwXEDkYurl2KLqzyLQDqNDv4toLumA
 ie9nkjD72FanSui1I6bkc4c67X+hBcnmNuU9lJnKXNhsx3Dr41Q57KAyE
 /tBNb8P/+LrnJlcfDczM+VB1lGXEaptzSueoGw2QlqznUhVKosaM8PPYi
 aj5vAyJ+sBncnJMHBigoiFuG/I0EO8ZMzTQjzP7J/AiavCnTBWCMu7Jg8
 ve319mY0KUoruAp6GciZhcJCi1TF2mcAzzFZcGEswyi4hFsLtg5FCvY0d
 TPHL+90rXZl/Sd3FRVoPkYMAgpvZ4j1fnGHuhTfZKMog5pBhc9tJfOaES A==;
X-CSE-ConnectionGUID: +IV794khRn6lXa3nxYbFAg==
X-CSE-MsgGUID: di7KNmGtS3m5j0lo8EZw1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51783821"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51783821"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:29 -0800
X-CSE-ConnectionGUID: mkGOSkf7SHGBX454FyxToA==
X-CSE-MsgGUID: 5XwQmQrPTAme2ki4Z3lo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153251845"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:28 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/3] lib/eudebug: Make debugger thread SIGINTable
Date: Mon, 24 Feb 2025 14:08:05 +0100
Message-Id: <20250224130807.9249-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
References: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1205d945b..ad8bdf68a 100644
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
+	struct sigaction sa;
 
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

