Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9F4C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D184610E05D;
	Fri, 26 Jul 2024 10:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTY2vEfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94810E05D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721990221; x=1753526221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MFIdjjVfUvs8aid+dYORPymNbBIw6xuK26XNwCgWFcU=;
 b=HTY2vEfiSRdU1f/drBiwbnFKOdY5xtnZYb2mvWuOeK5kVBq+QIrZKCiT
 BeKkPkU9I7pky3C7zFzNV5yYndHMl97MawE5ajYbvf5HYuG0o70f0/ntO
 G8YKf6KMpBWLvAH46k2bJLhTiYnxKrHupQleXFc3ZleQPpZNUdJoxM+QQ
 KyUFyMXtKA8FgaMauG/aUzx7Zglz06Sp5sV/Dp3oLMDvBH4qQw1IXUcaO
 YSoF5dsVkhNTHaeoMLCxMzlP1zd6Fu4tRsRtxqTN+S8KEvkpiVx2/bMLc
 29uHGwZvFUvirsk510MbROKOz4KB6gvjvG2JLwz2nqYmSXaqUpD2eqyDS Q==;
X-CSE-ConnectionGUID: bc0Y1eX3QNGopaeFGc5cvg==
X-CSE-MsgGUID: +k70z1bEScOKsR1XQoK3+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23632258"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23632258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 03:37:01 -0700
X-CSE-ConnectionGUID: NZH9iuQaTJWJPyl2cTaMFw==
X-CSE-MsgGUID: 5ptjUKrFQYeMAdXYRk7/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57812274"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa004.fm.intel.com with ESMTP; 26 Jul 2024 03:37:00 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 i-g-t v2] tests/core_setmaster: Change break to continue in
 tweak_perm function
Date: Fri, 26 Jul 2024 15:56:18 +0530
Message-Id: <20240726102618.22111-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Existing userspace assumes there's no gaps card’s, but I see cards
are not continues, after running “gta@core_hotunplug I am not seeing card0,
hence test is failing.

Failure sequence:

card0  renderD128  version

Subtest master-drop-set-user: SUCCESS (0.061s)

card0  renderD128  version

Subtest hotrebind-lateclose: SUCCESS (2.791s)

ls /sys/class/drm/
card1  renderD129  version

root@DUT4419LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user
Subtest master-drop-set-user: FAIL (0.017s)

Failure on XE

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/core_setmaster.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..60ae06331 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -116,9 +116,8 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 	for (i = 0; i < max_perm; i++) {
 		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
 
-		/* Existing userspace assumes there's no gaps, do the same. */
 		if (stat(path, &st) != 0)
-			break;
+			continue;
 
 		if (save) {
 			/* Save and toggle */
-- 
2.25.1

