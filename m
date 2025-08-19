Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEECA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 19:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D7D10E123;
	Tue, 19 Aug 2025 19:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QiA75thr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B1910E123
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 19:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755633317; x=1787169317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wxj722o1LaYV4xBu/UYFMTnThqKvTnl+Lzcdoe5QQec=;
 b=QiA75thraRlYpJOfC2AxGSNyp1+EhxTEMOhPUu4Cln7yzOHUg4TDoKVg
 UA2+5y58hrcxqdI/MGVFevmGlhekza9VOna+FU9zUjXkT8sFXg2+ZiGTX
 qlQoUCFtoP0JEDeH8dvI0lwRX9vAftBirLiJkSvad4/GxE33edNitoeq2
 Qpg5jFgjD3Z/JudvlbVFW3r4Y5f2Xdxg+E/vvi67AuDh87XEbm01D418M
 ktFDN4mthwdjWPZyMKFw8YthOLIYkzNFPNfo7cC0TarvQE1496V/rusKf
 t+tCgoEIaRLqKrrduJ35vcgjbBx4iyvs8nfAoRcJdjC3QX7TSz3caI+P1 g==;
X-CSE-ConnectionGUID: RdCdWnyvSzCqmnCBP7vNig==
X-CSE-MsgGUID: 7meTIGrOSFWIkogsG+Ca0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57844088"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57844088"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 12:55:16 -0700
X-CSE-ConnectionGUID: PxCdh8GzS/+33PAMyHMmgw==
X-CSE-MsgGUID: RHz1ndWxSp+JWFmDiROqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167164849"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 12:55:17 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe-oa: Fix OA format name typo
Date: Tue, 19 Aug 2025 12:55:09 -0700
Message-ID: <20250819195509.2705178-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Fix XE_OA_FORMAT_PEC32u32_G2 format name typo.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 68c6ccf5b5..63b59028fc 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -285,7 +285,7 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
 		.counter_size = 1,
 		.bc_report = 0 },
 	[XE_OA_FORMAT_PEC32u32_G2] = {
-		"PEC32u64_G2", .size = 192,
+		"PEC32u32_G2", .size = 192,
 		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
 		.report_hdr_64bit = true,
 		.counter_select = 6,
-- 
2.48.1

