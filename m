Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47515C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 16:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66FE10E9F4;
	Mon, 31 Aug 2026 16:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aly8l30F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3B10E9F3
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788193771; x=1819729771;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tHasYbLryCRcHxsc4fBn64HVCvxN5OAoCYWpSJcg/m8=;
 b=Aly8l30FQ3uifwtLL3uxhlaIgQMTiosdJbWu55Mca/gpLTXZQ+UcdQSK
 hfTEZIIfbumxGD6B+hq58DFTx8AT/fCezfs+TZG+Qy7cnrHma3Z5NGgqg
 pipip3QcyD+xoCwIh5r0Amjdzj/zQE9sD1IlvK5cyvvbAGEANUN2ix35Z
 tt0frFV7oesjm95o1d/4BNGW+MIHeqaGxg3Pkav7d4wzmxwJeg+S2EUo6
 sUbG2Uu77DhxOw8leqb/kuiKYvF3FD8+JDvB4xWmgxfwnLGhGr3ZQTZlz
 fd4qxUTpw5fQ3bZPQa8SC2gIU/F5dWlUe8WQz3hbxAVdpA2kX5pHwAfG9 Q==;
X-CSE-ConnectionGUID: YHNjZwpPR2exqvftzYst/w==
X-CSE-MsgGUID: M0KR9e6PTyGt5r3BzeGKvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100118318"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="100118318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 09:29:30 -0700
X-CSE-ConnectionGUID: 0A+XeKZBR16ox4ReDuzylg==
X-CSE-MsgGUID: gqWRZe1wSRilz9V5/sWrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="298743749"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa002.jf.intel.com with ESMTP; 31 Aug 2026 09:29:29 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_vm: fix double munmap of first mapping
Date: Mon, 31 Aug 2026 16:29:28 +0000
Message-ID: <20260831162928.201586-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

In the cleanup path of the bind-array conflict test, when a second buffer
object mapping (map2) exists, the code called munmap() on the first
mapping (map) a second time instead of unmapping map2:

This double-unmaps the map region while leaking the map2 mapping entirely.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 1d109e783..a0a6616c3 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1278,7 +1278,7 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 
 	munmap(map, bo_size);
 	if (map2)
-		munmap(map, bo_size);
+		munmap(map2, bo_size);
 	gem_close(fd, bo);
 	if (bo2)
 		gem_close(fd, bo2);
-- 
2.43.0

