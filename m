Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664F8CAC588
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854A10E514;
	Mon,  8 Sep 2025 12:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKAI8ax/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230B810E515
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336108; x=1788872108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jqmmxgb/tGxq8BtIE3HBHmLZ64kBNyfhYkLV4lweRVk=;
 b=ZKAI8ax/CHkVYyu55CYHkqmK2QI7UymcyaTa9t/CqZ7dN0vRu639kIu7
 QW88po6Rby0nNzARJomzs7eADtZipQ0L5Sb1PKd2kQKqNwNwpOfzZpMpp
 PMoKahdW6+V5S12bsMpK3IgbNim2ErJYBKxVH0QM3V5EO3CKcuvXj0c6s
 eiTJWhVYwsfo5KWC/BCYhDRsbnPrubjBhzZa4/0qj/FwT8Qo8OHZKJ6wE
 Sj5CNPJCgtYSIA8rYs4mwakL0tdGRgo2+sj9Ps3IQh6zr90h2QwnUoZRK
 ZlS/gOLZ4j0an/TjbN29N+PcwhXOZdfs6DeHEJ8VaVDJ+mvdDHhxqeNq1 w==;
X-CSE-ConnectionGUID: wIBiX5IdSXmsk1TGAA5o1A==
X-CSE-MsgGUID: yw+krQrJS1iWSsokQMQ5dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70688729"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70688729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:08 -0700
X-CSE-ConnectionGUID: LwOPFzB6SHiKql8RQkPYaw==
X-CSE-MsgGUID: Q4DQDlU2RjyZdeVOuqitVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177101513"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:07 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 4/4] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Mon,  8 Sep 2025 14:54:48 +0200
Message-Id: <20250908125448.13420-5-dominik.karol.piatkowski@intel.com>
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

If safe_pipe_read returns -EPIPE, print it and carry on. This will allow
for debugging if something goes wrong, while reducing the false tripping
of xe_eudebug_online@set-breakpoint-sigint-debugger test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8e5664496..7a43bc902 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -302,6 +302,10 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 	int ret;
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	if (ret == -EPIPE) {
+		igt_info("safe_pipe_read returned -EPIPE!\n");
+		return 0x0000dead;
+	}
 	igt_assert_f(ret > 0,
 		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
@@ -309,6 +313,10 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 	igt_assert_eq(in, token);
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	if (ret == -EPIPE) {
+		igt_info("safe_pipe_read returned -EPIPE!\n");
+		return 0x0000dead;
+	}
 	igt_assert_f(ret > 0,
 		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
-- 
2.34.1

