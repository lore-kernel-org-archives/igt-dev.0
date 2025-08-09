Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC322C87FCF
	for <igt-dev@archiver.kernel.org>; Sat,  9 Aug 2025 13:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37D89F4F;
	Sat,  9 Aug 2025 13:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aY16VhfG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8D89F4F
 for <igt-dev@lists.freedesktop.org>; Sat,  9 Aug 2025 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754745562; x=1786281562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JQX5ckLVMXp0NvgRY+cFmW2wR6MvHpYYmpnMMZR9QgA=;
 b=aY16VhfGTeosEG1c60hSK4WwmD0uRUGFDbEQzuROrmDcmDq8iIp0XBpJ
 7iVr/MbArI77XKBln9wZ8z+tDgNe3ngcPo5PNq2nFepHlbAqU5AcWwOnk
 lgdnWoVPlPih+dPUbkk81/s4pb7u933Ajk96zo+UZlpSg68i82vYTgpTX
 MSYebB6xMX2Rt9KnNeAo3Fe3advK5z6xjtPTbJF0nAdcu8b6sufH7u0IT
 KanHKSKWPrI7F9uFierVqr8n+oSsbK0kfXNvdyE1L9k1Xb13G7aMGqLHx
 bc4nW8E2NpV0U4YB03CfgVKYsHV2tWexb71+/ILJkmx3Idr1Zamfd3JQV A==;
X-CSE-ConnectionGUID: MbErcckIRZuLv3NsW/izTQ==
X-CSE-MsgGUID: 5PTRx6YEQRKpZfRC21ZPbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57216630"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57216630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:19:21 -0700
X-CSE-ConnectionGUID: 3WkJXhtXTJiikKJkPrtn8w==
X-CSE-MsgGUID: odOcgeoYTImsLygYRVfyUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="164755884"
Received: from ayamohax-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.82.244])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 06:19:16 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, jan.sokolowski@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH i-g-t] lib/igt_dir: Use actual length for string termination
Date: Sat,  9 Aug 2025 15:18:58 +0200
Message-ID: <20250809131858.71685-1-peter.senna@linux.intel.com>
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

Commit 501da513dfb7 ("lib/igt_dir: utilities for directory traversal and
file handling") introduced a bug where strings were always
null-terminated at their maximum length rather than at their actual used
length. This could lead to strings with unintended trailing data or
improper termination.

This commit fixes the issue by ensuring strings are null-terminated at
the correct (used) length.

Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Cc: jan.sokolowski@intel.com
Cc: rodrigo.vivi@intel.com
Fixes: 501da513dfb7 ("lib/igt_dir: utilities for directory traversal and file handling")
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index 1792ba7c1..e232dbda9 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -79,7 +79,7 @@ int igt_dir_get_fd_path(int fd, char *path, size_t path_len)
 	if (len == -1)
 		return -1;
 
-	path[path_len] = '\0';
+	path[len] = '\0';
 
 	return 0;
 }
-- 
2.43.0

