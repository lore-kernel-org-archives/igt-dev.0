Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4EED711D8
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 18:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7F210E18E;
	Wed, 20 Nov 2024 18:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqiwjOuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A4310E18E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732127539; x=1763663539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9glZGcIMk/z6UOgNm+6kqw+JCsGaWjlKE65oPfFICXc=;
 b=XqiwjOukW5X/EILlKkR3n4WxPaR1MDnmVP9hH6ggbjTv/W/lrhncqmaq
 eTMWEFegD96ZbGoNYeaA7bT5Ss9qtEjuOSFP+UiT8E2DP/sEXWeysWeZC
 yP2HU8IlAugbN3I9VzmF3QQ9ddiu+qO3OS7fdG7dablON5iGWfXYSw/Tm
 wdKtTP6wXeI1gPdpCc2xCMJWG1J1GAZNMVSUmaDVtXWR8gp7B62hHE9xJ
 omXJKbrf94sFdQDcw1tqXSLPY2MP2L9tlvNA2gRGZ2bH2rYjLpokNiSoA
 2RSmv7JEkN2PZnFIhN1g8xLngxmhFAUPlEHymCKp5exJw0Wqb0xt8jlXD w==;
X-CSE-ConnectionGUID: rQyJRa72RMaqScge7I/vTA==
X-CSE-MsgGUID: xnXNdAaRQ5GjvoG/QfUicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54705894"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54705894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:19 -0800
X-CSE-ConnectionGUID: rgkNqCS3R36c9ME91Dgg9Q==
X-CSE-MsgGUID: 5FtI6sXiRPC6tjU087AKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95067385"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 10:32:18 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 1/4] runner/executor: Check for error at writing
 dmesg dump
Date: Wed, 20 Nov 2024 19:32:05 +0100
Message-ID: <20241120183208.146299-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
References: <20241120183208.146299-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
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

In processing kernel dmesg there are checks for error at reading
so add also one for writing.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/executor.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..e4d1fc323 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -600,7 +600,7 @@ static long dump_dmesg(int kmsgfd, int outfd)
 	bool underflow_once = false;
 	char cont;
 	char buf[2048];
-	ssize_t r;
+	ssize_t r, w;
 	long written = 0;
 
 	if (kmsgfd < 0)
@@ -654,9 +654,32 @@ static long dump_dmesg(int kmsgfd, int outfd)
 			return written;
 		}
 
-		write(outfd, buf, r);
-		written += r;
+		w = write(outfd, buf, r);
+		if (w < r) {
+			if (w == -1 && errno == EINTR)
+				w = write(outfd, buf, r);
+
+			if (w < r && w >= 0)
+				w += write(outfd, buf + w, r - w);
+
+			if (w < r) {
+				long err = -errno;
+
+				if (err) {
+					errf("Write error while processing dmesg, errno=%d %ld < %ld\n", errno, w, r);
+				} else {
+					errf("Cannot write dmesg chunk: %ld < %ld\n", w, r);
+					err = -1;
+				}
 
+				if (comparefd >= 0)
+					close(comparefd);
+
+				return err;
+			}
+		}
+
+		written += r;
 		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
 					    &flags, &seq, &usec, &cont) == 4) {
 			/*
-- 
2.47.0

