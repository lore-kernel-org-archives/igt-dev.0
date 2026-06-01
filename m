Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E81ACD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F4D10E986;
	Mon,  1 Jun 2026 20:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAUdw8fQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA714899C7
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346678; x=1811882678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugWxp6afM72D2+sj6XoycsDa0ir0fQxC8Kmd53L1R4Y=;
 b=MAUdw8fQ9FQrYYTCmiYFr163DT6POEkGbBsIIE3gwF1JOwiYC9J6q2XS
 q6GOLQqS19+htrATNFfn7zcYC2jxphf2vJwpPLbu2UiREhRVQ5JiCxlFI
 MMoaTbo3CuDKaZ04nxzf1VsPP4ljjkAfBYA5ZjUyezlJxzhZFwVxItWC6
 TIzY+rjGJEpqDmQQHBVk/3KytFNumJZYxNTRy7i9QDmSlwy1T8uy5IMkS
 7oUormOFDYofsiMtzJoySzKTn2rfylD+Wowh03Gw3lBMEG0UuACzI6bYG
 vFg1tRYG2J/2f1+Yux5XDjPcphVLB361BamzXiUKJJVla/HsZouFR9YXg Q==;
X-CSE-ConnectionGUID: 1hUwxj/2TdaJxZmE5Qohwg==
X-CSE-MsgGUID: ejJnDzYBTdOvs7MN820ynw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652870"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:38 -0700
X-CSE-ConnectionGUID: +6+gYimcQZOF/cAxYJHNsw==
X-CSE-MsgGUID: EAlXMq3xTMSYCUdRhICFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331499"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:36 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 07/12] tests/intel/kms_fbcon_fbt: update the outdated
 fbc skip reasons
Date: Mon,  1 Jun 2026 23:44:02 +0300
Message-ID: <20260601204407.39934-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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

