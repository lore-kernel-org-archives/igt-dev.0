Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D141ECAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEB010E9E9;
	Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilp2CAAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A334F10E9E5
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872911; x=1790408911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uABZRU3U4CzZmc+zAhyBfQvljWfySRqlvHhG3JNIFB0=;
 b=Ilp2CAAReSZ8QkTeCdy47UUVKb4c/z+fMHwgW3b6vnzYMRqu7vz621KU
 yXCpAuMkuaSOFq/p+ro/l3e4y715A6kRKwddyjveoc/NSyJGEGSXl86Du
 NHJPiPaHt1jpzshiFlX+xYWoHnMwOFPS1cnSddnYUQTPKL1eWdcVoaWFf
 l4BhfquX9KUIP120fq8ZapGIKCtEbksbcCVWUa6l5luay6igdhCNeRMIQ
 L1daGHBdPlceYH87xme7suhwYpCvhHmP7BTGsrzKx6n3IMSEjiIiazELH
 AVB6mzCcM1winiW9E6sYHn+QGYEp1iEXISF54mv4ule6O0nkYW5vSNEFJ A==;
X-CSE-ConnectionGUID: yhDaMB/MRrW9Ss1Hbuockg==
X-CSE-MsgGUID: GQrXDnQKS4a8P9MoxktRbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372393"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:29 -0700
X-CSE-ConnectionGUID: ahuDTG3gSBi+WteoB45ECw==
X-CSE-MsgGUID: w8JHHA5JQ8+lbYdyvy+nsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474259"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:28 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 8/9] lib/xe_eudebug: Introduce SIGTERM handling
Date: Fri, 26 Sep 2025 09:48:00 +0200
Message-Id: <20250926074801.9031-9-dominik.karol.piatkowski@intel.com>
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

Add SIGTERM to signals that are handled by debugger_signal_handler.
Don't kill debugger thread on SIGTERM signal. Don't break on poll
failure if signal was received and errno is set to EINTR.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 15 +++++++++++++++
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8276a6dab..e8b046f48 100644
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
@@ -1112,6 +1119,13 @@ static void *debugger_worker_loop(void *data)
 		}
 
 		if (ret == -1) {
+			if (d->received_signal) {
+				d->received_signal = false;
+
+				if (errno == EINTR)
+					continue;
+			}
+
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
@@ -1182,6 +1196,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
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

