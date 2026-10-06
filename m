Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9BECA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 20:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314F910E060;
	Tue,  6 Oct 2026 20:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCoJ7uKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71B710E060
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791319471; x=1822855471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/yyObAsJUmS0/xJi/T9lJo8snc7vDGpXIIHrvcMOBAw=;
 b=DCoJ7uKAUl/fB2AzQcW6MRRjXo/vn6msuMLQ6kPS85dg8No3BbpdqHHU
 qJHckYmgGrz2OYtgE0EuRWiBEUgnGpzMxwgfDQ5Ai6KmpQVQQTurFtXxS
 WntJ06qThTHn+dofHU9bLVvzpXDhR2Gy0+f9tZNRilS7QEytTeNJx4OKr
 lh/P7iDpVHMjDieoaBaPVDxQWRkwiQ5aR2rzfoAT9Ge65iiXK2m9u2tUe
 3TSlO1pnW0Vyb1v50nJn0i2ju0bFKjrtDDQIgGumFamXs/NCBYw4+0D1n
 c4zJ+GGzWC1bRZF3mjrOF6Eln0l78Fxfotco7M4vcWb8/GK4WcfKuzMuH g==;
X-CSE-ConnectionGUID: eHlky8CPRDa2hOKdNaUQIw==
X-CSE-MsgGUID: pcmWTC11ReS5hEpO1dPheg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="175768"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="175768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 13:44:30 -0700
X-CSE-ConnectionGUID: 2MMmQwrcRrW+1RTYeUJ9cw==
X-CSE-MsgGUID: USaMbbb+R8qyFQFHLnNnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="277382705"
Received: from rabbit.fm.intel.com ([10.36.54.170])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 13:44:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] lib/igt_os: Fix igt_require_memory error messages
Date: Wed,  7 Oct 2026 04:44:29 +0800
Message-ID: <20261006204430.100929-1-jonathan.cavitt@intel.com>
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

Info grabbed via igt_sysfs_get does not have a newline attached to the
end, meaning portions of the igt_warn messages produced in
igt_require_memory are printed to the same line as each other.  Clean
that up.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/igt_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_os.c b/lib/igt_os.c
index 0fa10ee750..bbc432d721 100644
--- a/lib/igt_os.c
+++ b/lib/igt_os.c
@@ -434,14 +434,14 @@ void igt_require_memory(uint64_t count, uint64_t size, unsigned mode)
 
 		info = igt_sysfs_get(dir, "meminfo");
 		if (info) {
-			igt_warn("Insufficient free memory; /proc/meminfo:\n%s",
+			igt_warn("Insufficient free memory; /proc/meminfo:\n%s\n",
 				 info);
 			free(info);
 		}
 
 		info = igt_sysfs_get(dir, "slabinfo");
 		if (info) {
-			igt_warn("Insufficient free memory; /proc/slabinfo:\n%s",
+			igt_warn("Insufficient free memory; /proc/slabinfo:\n%s\n",
 				 info);
 			free(info);
 		}
-- 
2.43.0

