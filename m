Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B6C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B323710EC36;
	Fri, 14 Jun 2024 05:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+/gBT6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4BD10EC36
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343547; x=1749879547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VX7GcQkdYSqYt4lvckD/uMclyRcM4kb6k/tS5o9rj/E=;
 b=L+/gBT6FkdHXPSiZ+ts0UyHbp9iYf/IZjevyg2NX8GfkiMCOQd64IOWj
 rym43C2yy2E5vu5z3VsUAk2KXH96GX/GAKWE6JbzXT7EAYr9udZNU7m+6
 MpP9vWtIAuKqYmC5FMpZFI82J+aS9MAz/49fmeMKZywMNIiX1H+Drbpcr
 QucVer2kHg8PtsbJftcByu/tOx7pzOgFRESLiMGgIdjX+3ZdbbEOqT0g7
 R8rVW4dJVqvDskIHH285vISVYr3VWyNCLNQS2iXATQ7OJkqQ3D0d1u/AD
 u2jf0T77koE2zg2VGxPaFAuwL8QM96rThW2sC++HNwJAKIuS87McPdWAz Q==;
X-CSE-ConnectionGUID: hc9xG95GT/+QpD1XJ0hEPQ==
X-CSE-MsgGUID: OjCcEtLHSnatPuxhsQFAsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331593"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:07 -0700
X-CSE-ConnectionGUID: 1rUYXlAISQehgwqjX0STCg==
X-CSE-MsgGUID: KijnbuvTRHul82tG6R4qfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864072"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:05 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 7/7] lib/igt_psr: Adjust igt_wait intervals
Date: Fri, 14 Jun 2024 08:38:39 +0300
Message-Id: <20240614053839.1822879-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are observing problems with psr_wait_update. Poll interval is
10 ms. With eDP Panel Replay we are seeing scenario where on first poll PSR
status haven't yet changed to !SLEEP. Then we are waiting 10ms before next
check. During this 10ms sleep status changes to !SLEEP and back to SLEEP
and this is not noticed by psr_wait update and causing failure.

Fix this by adjusting poll intervals to 1ms.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 42012243d..bc8e0e830 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -100,12 +100,12 @@ bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 10);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
 }
 
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 10);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.34.1

