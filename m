Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CC9CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE81910E568;
	Tue, 30 Sep 2025 10:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhugRf2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171910E567
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228955; x=1790764955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUxoYnfEAJHuPWcgb79cwuAKZc+Dw8rFJIg4KKpzKiI=;
 b=DhugRf2KhBFRRMIMxVeRt0YFf4o+0cVYvSUwO9/VwV7VI5FLeWyjv0PP
 OrqudPADrA28zRjAqLJXfg71nQTQdCnooix8xjyLFShnq7f5wxQ2Fku6d
 v0Ubg0hlIqifOPcDogB1syxP2LayHR06rTbXJv8giKjhIUlb0g455LTgN
 w4TAsYizZUsQlcHy2qA8nUsEyi5Flri1Kl31cRmf7ArB48n9dHAanFtWt
 8MkFRcY2ek71Yw6Z8I1lQu2LQWTWiwSu+mK6ENpM8p4UbjZTZKq/Vo9PJ
 eDinV/l8L3IbJyqILzQsBQGENUPfv3MpK1m/C9Eb4XNYIgvnPrL0fsErw Q==;
X-CSE-ConnectionGUID: 9m7TcmtwTnS76OwhWF+oIA==
X-CSE-MsgGUID: uQ9thdbcREGKiFwzeHsJIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371504"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:35 -0700
X-CSE-ConnectionGUID: EdsqocvATwyIvO3r6vUT1w==
X-CSE-MsgGUID: 8je2BNq/TWeOi/+NCjDK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446609"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:34 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 8/9] lib/xe_eudebug: Introduce SIGTERM handling
Date: Tue, 30 Sep 2025 12:42:08 +0200
Message-Id: <20250930104209.22462-9-dominik.karol.piatkowski@intel.com>
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

Add SIGTERM to signals that are handled by debugger_signal_handler.
Don't kill debugger thread on SIGTERM signal.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 16 ++++++++++++++--
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1282e2918..811a0e14a 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1080,6 +1080,8 @@ static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
 
 	igt_assert(d);
 
+	d->received_signal = true;
+
 	if (sig == SIGINT)
 		d->received_sigint = true;
 }
@@ -1103,6 +1105,11 @@ static void *debugger_worker_loop(void *data)
 	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
 
+	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
+	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
+
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
@@ -1112,8 +1119,12 @@ static void *debugger_worker_loop(void *data)
 		}
 
 		if (ret == -1) {
-			if (errno == EINTR)
-				continue;
+			if (d->received_signal) {
+				d->received_signal = false;
+
+				if (errno == EINTR)
+					continue;
+			}
 
 			igt_info("poll failed with errno %d\n", errno);
 			break;
@@ -1185,6 +1196,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->ptr = data;
 	d->received_sigint = false;
 	d->handled_sigint = false;
+	d->received_signal = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 7c7a01471..d2f64fe4c 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -46,6 +46,7 @@ struct xe_eudebug_debugger {
 
 	bool received_sigint;
 	bool handled_sigint;
+	bool received_signal;
 
 	int p_client[2];
 };
-- 
2.34.1

