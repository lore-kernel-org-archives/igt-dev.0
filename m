Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF5BCAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F55A10E9EA;
	Fri, 26 Sep 2025 07:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGBQbxAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA4810E9E5
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872898; x=1790408898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUh5vB6pkxdgD3ZxREvBZaY5buj1bZgCTXY+L1CcTXc=;
 b=XGBQbxAqdIO1naaJ1c9FRaCvHLjnXy7+XFB80Q6hKU2TkL9EitUovdXA
 30th6bk4bA181xw5452/tCgDLJs07l1blLCGGjkukLIeFZ9uH9JdFgYxP
 3DSUGYNHzIjE7xXL5SS3wkmzakolL6SFG8ZiKYMpY7b3O/k8veW8yPjo5
 hagI3qHaGHCLZ45rd57wVnof1HDtoSPWRwpVgH830MWHsc4zFoPmz9vcv
 z7zpjGNbDcLwnsqr0hexfGCGOFfFiTtI6fYMXUwjip2FeDWWgqzz8fIKo
 7TDVsAiRG3I/bnNy7qZxuPJeJ2aq3HNaAHjkPIYWcWjCThAXWtHodEUGu w==;
X-CSE-ConnectionGUID: lqhXfRb4THiO9c9cM0Of0w==
X-CSE-MsgGUID: XiI1Joc/Qd+NhH9mh+z7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372365"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372365"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:18 -0700
X-CSE-ConnectionGUID: gld7SM54ThWjGzFzIEXHrw==
X-CSE-MsgGUID: 70pe9U2hQ+aiLOt0dcTw4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474201"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 1/9] lib/xe_eudebug: Fix safe_pipe_read
Date: Fri, 26 Sep 2025 09:47:53 +0200
Message-Id: <20250926074801.9031-2-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the underlying error may be different. Do an early return
with -errno if the poll fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..d29c82857 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			return -errno;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

