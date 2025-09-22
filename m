Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ABCCA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3B110E4A1;
	Mon, 22 Sep 2025 16:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewDgEidh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352AB10E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758558257; x=1790094257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d3RE7P6W71PkOleTFqnMpkr9S7QP0k/ZpRx6xXwoN9g=;
 b=ewDgEidhODn4bIeFgu5AT2/mssK8i7hAuYoDZn06E2Jqg/9smcSdpxOH
 Rfwt5bXMHiNP9vFwIyoXfwY79iQqK9LP9iFVK83COr0pshsBXb4UsA1co
 ayaDdLVU9VxDoCP3Qd2LyRwKBxp7pS4AI9WSXOzkWVJ9MVDLwGwRCsBUB
 zbjRRCjm2oi02EMGs++nKZg7WLWDBfxQIvs2Q9sSmSOMjK/AYpfNJ2OfQ
 gAxw50qjdk6+3/ugYNiejtguda3hGONs4BXy7F7kTPHMti2oJgfZiuWuc
 Crm0ad7lSPqCtUp1rUFU/KfI8fvy1tm+E9LJSiEG2fY/7UZe1pIjcEKc6 Q==;
X-CSE-ConnectionGUID: sKVea6CLTgul+zU4XKJ5KA==
X-CSE-MsgGUID: UbpDr7hkQyWnQI9nmSdQOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63455190"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="63455190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:24:17 -0700
X-CSE-ConnectionGUID: Maf18/8NTR6BbHzJKTh3Bw==
X-CSE-MsgGUID: /wxUmmn2RL6jmotjwet3VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180528256"
Received: from hfritts-mobl2.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.246.0.18])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:24:15 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_list: igt_list_empty() Detect uninitialized list
Date: Mon, 22 Sep 2025 18:23:40 +0200
Message-ID: <20250922162340.20034-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a check to igt_list_empty() to return true if the list head pointer
or its next/prev pointers are NULL, preventing segfaults when operating
on uninitialized or potentially broken lists.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_list.c b/lib/igt_list.c
index 37ae139c4..f77aef7dd 100644
--- a/lib/igt_list.c
+++ b/lib/igt_list.c
@@ -79,5 +79,9 @@ int igt_list_length(const struct igt_list_head *head)
 
 bool igt_list_empty(const struct igt_list_head *head)
 {
+	/* Detect uninitialized / potentially broken list */
+	if (!head || !head->next || !head->prev)
+		return true;
+
 	return head->next == head;
 }
-- 
2.43.0

