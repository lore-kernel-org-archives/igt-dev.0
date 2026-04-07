Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40621EDB7DF
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 10:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D687E10E3CD;
	Tue,  7 Apr 2026 10:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFW7co9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B710E3BA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555983; x=1807091983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugWxp6afM72D2+sj6XoycsDa0ir0fQxC8Kmd53L1R4Y=;
 b=SFW7co9M13rIIFey1rC2g3HdLgBmDN+yPIpXiJhS9sTV5PHK7nMU1r27
 I57n420d6AiskrZp+BgS/E67DMYuEtShSBO5NNkxyqFJ92+5dqRI5VwgZ
 fFs9EMD7zG+h3qXm+c3fuHN/3pv8Tb4IOEl1/ZPqEJh3BI6HL3T0U7naG
 9cdbAvnqtXQl0yhfiRzKKM5VChFJuCzvylgMaNrjcgloQ9jHRBC0Ce0dm
 8KJc7VWmB9Tr+V9kDoDInE0TFqRBRimDAMGdMy7HAnpSWHe2pEVMD9bhr
 8gvyMP1nNKz3UjCVdRLcQNuBzYyFMRVL6/awtjB29CbQ3t5xR2SaNOWYS A==;
X-CSE-ConnectionGUID: m0RTvYyrSRy+XwM7QlJ5ZA==
X-CSE-MsgGUID: 4OQejYqMQ1u5X7OOiwV+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589091"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589091"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:43 -0700
X-CSE-ConnectionGUID: RybBNfcqS0+4LUCjp3nqCg==
X-CSE-MsgGUID: wFhi2i2ITQqQOA2Hl3O4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400123"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:41 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 7/8] tests/intel/kms_fbcon_fbt: update the outdated
 fbc skip reasons
Date: Tue,  7 Apr 2026 12:58:42 +0300
Message-ID: <20260407095843.43679-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407095843.43679-1-vinod.govindapillai@intel.com>
References: <20260407095843.43679-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

No fbc reasons have been updated in the driver. Use the same
"no fbc reason" being set in the debugfs by the driver.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index b36582011..78c6cc4b2 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -297,18 +297,16 @@ static inline void psr_debugfs_enable(int device, int debugfs_fd)
 static void fbc_skips_on_fbcon(int debugfs_fd)
 {
 	const char *reasons[] = {
-		"incompatible mode",
-		"mode too large for compression",
-		"framebuffer not tiled or fenced",
-		"pixel format is invalid",
-		"rotation unsupported",
-		"tiling unsupported",
-		"framebuffer stride not supported",
-		"per-pixel alpha blending is incompatible with FBC",
-		"pixel rate is too big",
-		"CFB requirements changed",
-		"plane Y offset is misaligned",
-		"plane height + offset is non-modulo of 4"
+		"pixel format not supported",
+		"tiling not supported",
+		"rotation not supported",
+		"stride not supported",
+		"per-pixel alpha not supported",
+		"plane size too big",
+		"surface size too big",
+		"plane start Y offset misaligned",
+		"plane end Y offset misaligned",
+		"pixel rate too high"
 	};
 	bool skip = false;
 	char buf[FBC_STATUS_BUF_LEN];
-- 
2.43.0

