Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD8CAC586
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C2C10E513;
	Mon,  8 Sep 2025 12:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JI5h7cE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9604710E513
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336107; x=1788872107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8YPkvTrgqyx/GrNV6huwrxxcCtslSBNHhKN6qb8kqE=;
 b=JI5h7cE8ow+0SURgFEMIyRpr08z4h1Xqghc0ZLCM7+ItOSDSr1ZZQwXC
 x5h2rlFS/3TpUG8jU5rXpzU3lcjro5KPmwccmhPF8BkknP9yDmWEvL2xD
 FLx9N4/A4+Fl95D+JUjIQ+CUu3Y6Ch+OXZyGZvEQskRTrIG1vExzU8nD+
 77iQ51Rh8ipGSP4tkJlDIlToHgcYV/20irITHg0SRrJa8G4J0TKVw98L5
 gnP3yp3WKjAcB37g/bc/YjuZCvbZwP1MivatcFEN8STvszHGDbFnaUYBw
 NtHahHQZhKg0j1Gd1HzslJbz18ShdVC5uXourrjMxy83qxkFOmGduoAqH Q==;
X-CSE-ConnectionGUID: bFQG6UGCTRm4m+KCWWldhQ==
X-CSE-MsgGUID: TMLzHDABRSi0BuULPVt8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70688727"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70688727"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:06 -0700
X-CSE-ConnectionGUID: XX0b1O1mRpeSWmook8BI7w==
X-CSE-MsgGUID: OFYbjctST6+5kzD5ijsotg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177101509"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:06 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 3/4] lib/xe_eudebug: Fix safe_pipe_read
Date: Mon,  8 Sep 2025 14:54:47 +0200
Message-Id: <20250908125448.13420-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
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
misleading, as the pipe could be already broken. Do an early return with
-EPIPE if the poll fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..8e5664496 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			return -EPIPE;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

