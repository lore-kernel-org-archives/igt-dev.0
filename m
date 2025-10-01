Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7CCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD3310E6DE;
	Wed,  1 Oct 2025 11:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUK8ryYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034E10E6DE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319724; x=1790855724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XmFGqLozyjgIy+Ds2TUCJH3mEjXGu/bEsEIjzyRC3cA=;
 b=RUK8ryYjKeVYSsAm/rz5R+FHLa8YHB+qK0Kx429eTWbWBzcBjwGKd+NM
 mQgosVjM1mmqhd+ol4GnZzdzaunGpsOMpuzEhtfhwfxJsgPFR65jcCESf
 VfwUiNj6pXgt6JCjSwUDLUHUPe1ol7Kd8No9RGd7ibPd0rs+SNmv4U+hJ
 9qfuOb9jKq+funMi2bpS+c4IF/3SoLHA+4X2CBuFIZVsqpxb1S1Qj7nKb
 oJycbG2yjHEtsr3tiBVNB6QSEyh7pk4oe5hLjd3q0QISig4YdVVJ5e9DH
 fidd7ws+Mtbq1nAOTNvLmXXJZz67A1MBSlAyhQbGflukm/tjR7wSM/6jb g==;
X-CSE-ConnectionGUID: ZjbBspKdRnGwMQvl1wyLVQ==
X-CSE-MsgGUID: 7sAGye/jQMWoPAlFpo9RPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014994"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:24 -0700
X-CSE-ConnectionGUID: vVJ/IcD5RT6QlLYEM/Zgzw==
X-CSE-MsgGUID: Sld/v7QqRd+zqUpGhtNFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496260"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:22 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 09/10] lib/xe_eudebug: Introduce SIGTERM handling
Date: Wed,  1 Oct 2025 13:54:46 +0200
Message-Id: <20251001115447.11843-10-dominik.karol.piatkowski@intel.com>
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

Add SIGTERM to signals that are handled by debugger_signal_handler.
Don't kill debugger thread on SIGTERM signal.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 16 ++++++++++++++--
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index b40f0beb4..717b3c57f 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1082,6 +1082,8 @@ static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
 
 	igt_assert(d);
 
+	d->received_signal = true;
+
 	if (sig == SIGINT)
 		d->received_sigint = true;
 }
@@ -1105,6 +1107,11 @@ static void *debugger_worker_loop(void *data)
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
@@ -1114,8 +1121,12 @@ static void *debugger_worker_loop(void *data)
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
@@ -1187,6 +1198,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
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

