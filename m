Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B0DCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ABD10E6B7;
	Wed,  1 Oct 2025 11:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKfKwjBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6251210E6B7
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319709; x=1790855709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fkBbiiHobfZ8fvmd1URSjW3B1p5p2vzCHg1TtRVp/H8=;
 b=AKfKwjBixb3HB373Nxq+MxqzEGqLi1os99FIGLCDa26qSQJe9PJNmaBU
 ashbu3jdIRXO6SXy4f3My1rEZI+Q/eep3HlhA67/Gel/8D0rw2Ti+P6/f
 kp8QBmsmK/bO3uvgqyjySP/AuQ66x99DetaMtMMG0Eq+kOrazGv/+biAe
 VOnCEyvvZ4FPU7HqyeoTxO/JC0HpkzoGHLJFMR6mDe1saWpz6zyzOvVIR
 F6Ou7qYnCg872Fu9VzyOh3VVZ5XTPsbNN33XzJHDjT4HOVPdngsGpkRYW
 ldNjTGgsS55pexAhrKbKLkXEPASAfUpKSxdYInGuItWb1Dzc1Kj4qIK7H A==;
X-CSE-ConnectionGUID: deyRQy9qSZWp6fYpOpE1Rg==
X-CSE-MsgGUID: AtPznufoQ16pgVuxNmIA7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014960"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014960"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:09 -0700
X-CSE-ConnectionGUID: vCi3F01xSsiJ85yEuRDcjw==
X-CSE-MsgGUID: Bcf/sLCZQB2mug5KjQttPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496200"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:07 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
Date: Wed,  1 Oct 2025 13:54:38 +0200
Message-Id: <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the underlying error may be different. Do an early return
with -errno if the poll fails, unless errno is set to EINTR - repeat the
poll in this case.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..840b501c5 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,10 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			if (errno == EINTR)
+				continue;
+			return -errno;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

