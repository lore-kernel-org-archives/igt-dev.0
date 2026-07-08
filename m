Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086DDC43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 22:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011210F31C;
	Wed,  8 Jul 2026 22:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k900Vb11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B48A10F31C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 22:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783551080; x=1815087080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T4SutVgTvuAIsa7mMMZaiBqwc2qaWLYWK4P04rm3/k8=;
 b=k900Vb11I2NncI+pst+uMFx5wSwFytOwIofobS2rrBQt0lji+p7rU8sZ
 mIHeXn8ayQnvLuFxzzcUNiYmynO5DOF2CZc1CDNQ8+3mnam0oxf5U9WsU
 gOVwhw+C0mGfTaEq5l1Fftj1pONq43/WhqJrH0M70Btf0e+4TxFsa8tcJ
 2dtPg0qvE/5P50GhVknCp7BXssQJDldVRO8q8s0ftyanaMGU8TAsI+CvK
 mRWL9qSpPv8N4eS+oJT7+MUCLH416YgTYKuUE27Hk9ErmlkCLPrcNEdjA
 a+EV8YShLJy1rzSV/yiqICc91KRp5cC81j+0WpBJncUG9MB4MazKj0pc3 w==;
X-CSE-ConnectionGUID: LOMGba2hSrmcHhooRteamQ==
X-CSE-MsgGUID: ErMkxDTMRfuH4D3Uo9gahg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84007754"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84007754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 15:51:19 -0700
X-CSE-ConnectionGUID: HhAPEZBwQQibxiwTC1dagw==
X-CSE-MsgGUID: neS4UhXHQLyUT52fN7NXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254517972"
Received: from nkwan-gpu-0.jf.intel.com ([10.88.27.158])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 15:51:19 -0700
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: gustavo.sousa@intel.com,
	igt-dev@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
Date: Wed,  8 Jul 2026 15:52:12 -0700
Message-ID: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
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

When igt_debugfs_path() fails under igt_debugfs_dir(), add "errno" to the
debug print for additional context of the failure.

Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
---
 lib/igt_debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index ed0a20773..a8c45945c 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -187,8 +187,12 @@ int igt_debugfs_dir(int device)
 	int debugfs_dir_fd;
 	char path[200];
 
-	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path))))
+	errno = 0;
+	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path)))) {
+		igt_debug("Last errno: %i, %s\n", errno, strerror(errno));
+
 		return -1;
+	}
 
 	debugfs_dir_fd = open(path, O_RDONLY);
 	igt_debug_on_f(debugfs_dir_fd < 0, "path: %s\n", path);
-- 
2.43.0

