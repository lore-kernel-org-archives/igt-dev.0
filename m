Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C1DD3001D
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 16:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809410E377;
	Fri, 18 Oct 2024 16:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReMYorIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279410E377
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729268313; x=1760804313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sA3gyJX3GK5wssqf1KcWHi8RUJbP6DAxw+8kyIN4f6w=;
 b=ReMYorIClb+bL+JCiZaoXeI3Y3BqsqUksIYLIttU0j4fts/HrhF3wiQ+
 jo7MbwWWPcIzsIIP891relHwzeqVBv4ugGh0oqxtikum57GdlHBvI7zkJ
 joFz7hIAWT3OGOz4/lODN5PlUjJ6jxtg2B9AxycZJvwW6r55fVsyA1sQT
 SBIcSN3FWcu5Ll0XcFrWOMEQZ6n+mY6WhX1zj3rwgMKen9N3Mm2E0WSHP
 Q7aDWrmF2Z2tXLWDg4OL1YsqTXMnW+0XOX53ztHzezagD0Eq/JSmHCK3f
 C/eV8BV1EUZPTm/YMqPyX6GNSGAJ82ts0LIUCcnjWnnRmISA3wdtp0aat Q==;
X-CSE-ConnectionGUID: 6kS0qfTSR7aFxLvn6tvaIA==
X-CSE-MsgGUID: e1weMbqrQ+egdvVlDdfuzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28685245"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28685245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:33 -0700
X-CSE-ConnectionGUID: L0sjqs0PRQ2mgORKGtyXyA==
X-CSE-MsgGUID: PAgUIIXDQ4iJznnn/2h0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78571952"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 09:18:32 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] runner/executor: Check for error at writing dmesg
 dump
Date: Fri, 18 Oct 2024 18:18:19 +0200
Message-ID: <20241018161820.76014-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
References: <20241018161820.76014-1-kamil.konieczny@linux.intel.com>
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
---
 runner/executor.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..3939f92f1 100644
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
+					errf("Write error while processing dmesg, errno=%d\n", errno);
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

