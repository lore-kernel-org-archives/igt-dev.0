Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2D6C28B30
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 20:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CE010E2B9;
	Mon, 10 Mar 2025 20:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpO6gAmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7DD10E2B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741636977; x=1773172977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJWdyQWtWjSdTAiBHJESXSHeDYi4oQviloL2hvGRZgU=;
 b=lpO6gAmuOVi/6gBrL1ickFHwaWiZq4pTuNFqj4JQjLNqKiOl2P5gR7XM
 DXjakCX6iQqmFbUCcm5oBn8WP3WScVB0Svjqx+EkcMtI81t++JTzQL3MD
 X9szH6G1g3KDP7blw2hdpuDKEEqgQ+QfUvBVFjIf5oODzTjvELORxSkvA
 Wbd7HFfLP6VO/ntK3zSonYWQyNayoXOkGPNSvByeaMnzS0leD8jVut4QT
 fksRlLuy0SW6G2PDI5DNgNYvlJEZfkc2+RTLtNVGfDZIWMxGnvCJueUJV
 mUzP79N/H/vpBTIWopB3b84cISG4FtvgmtNrC4Wq7meYlSrId+fbgi+yz A==;
X-CSE-ConnectionGUID: Bh3ya+GRRmax3DkqK3AzZg==
X-CSE-MsgGUID: Y7YudfmGRi+V2K0z52Xwlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54027576"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="54027576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 13:02:57 -0700
X-CSE-ConnectionGUID: rVDG9MljRDyFRZaFzNwwSg==
X-CSE-MsgGUID: 3GWig1ZlQ96qx/+QWiOB0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120301461"
Received: from unknown (HELO friendship7-home.clients.intel.com)
 ([10.245.253.236])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 13:02:52 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t] runner/kmemleak: Remove unnecessary lseek() calls
Date: Mon, 10 Mar 2025 21:02:20 +0100
Message-Id: <20250310200220.233045-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Earlier versions of the code performed multiple read operations on the
kmemleak file without closing and reopening the file descriptor. To
handle this, lseek() was used to reset the read position.

However, the current implementation no longer requires these lseek()
calls, as the redundant read operations have been removed. This commit
eliminates the leftover lseek() calls that are now unnecessary.

Cc: vitaly.prosyak@amd.com
Cc: christian.koenig@amd.com
Cc: alexander.deucher@amd.com
Cc: jesse.zhang@amd.com
Cc: harry.wentland@amd.com
Cc: zbigniew.kempczynski@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: ryszard.knop@intel.com
Cc: lucas.demarchi@intel.com
Cc: katarzyna.piecielska@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/kmemleak.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/runner/kmemleak.c b/runner/kmemleak.c
index e1bfb65ba..e52bc12d5 100644
--- a/runner/kmemleak.c
+++ b/runner/kmemleak.c
@@ -116,9 +116,6 @@ static bool runner_kmemleak_found_leaks(void)
 
 	rlen = read(fd, buf, 1);
 
-	if (rlen == 1)
-		lseek(fd, 0, SEEK_SET);
-
 	close(fd);
 
 	return rlen == 1;
@@ -169,12 +166,6 @@ static bool runner_kmemleak_append_to(const char *last_test, int resdirfd,
 	if (kmemleakfd < 0)
 		return false;
 
-	/* Seek back to first byte */
-	if (lseek(kmemleakfd, 0, SEEK_SET) == (off_t)-1) {
-		close(kmemleakfd);
-		return false;
-	}
-
 	/* Open text file to append */
 	resfilefd = openat(resdirfd, KMEMLEAK_RESFILENAME,
 			   O_RDWR | O_CREAT | O_APPEND, 0666);
-- 
2.34.1

