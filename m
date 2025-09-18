Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7E1CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C023C10E7CA;
	Thu, 18 Sep 2025 12:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CE0A2sYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B8D10E755
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198854; x=1789734854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zQEBCKQiUTR2TywriW7YlE76uqPZ3NcwSrNZ2OAF4NY=;
 b=CE0A2sYNwWeoDX3ohUsU5WkWeFmEV4KD5UFgNY3dh6xdEhz3lu1fA3uV
 ahTwwkuKwsKimEvwg2FuynuRVjtGRfHFFJfLIfQONEfqydQxrzOzylrH3
 3VcmVeuOpqHjqEs+vkamRLpzEFX1dJcNQUASbWVvkQLQ4s3CJ0uXk7aaY
 UK+rdkwkL/ahpPgd4t2z6MpNACsOAsEbKiUH6lIKBhaRXLJXscHZbxv5m
 qWmxzn5IaVBTevCEHnPLXTb0bbV4QfFQfohoO8dqQcvQPUYnQQf/Mx0c4
 OgA4QF0u8LSGVtz+u9NBwtgwoM2poIIoq04x6gfJeRCg16m2lBGM8j5O/ Q==;
X-CSE-ConnectionGUID: ZiOTnVP2QsmPMCul2RJLIw==
X-CSE-MsgGUID: hI+PupLSQY63hsSiv6bULw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966197"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:14 -0700
X-CSE-ConnectionGUID: se8hmUmkT5OLPlzS4uAERg==
X-CSE-MsgGUID: AvIQAWYsTyqRapkyrak1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328143"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:13 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 1/5] lib/xe_eudebug: Fix safe_pipe_read
Date: Thu, 18 Sep 2025 14:33:57 +0200
Message-Id: <20250918123401.5433-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
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

