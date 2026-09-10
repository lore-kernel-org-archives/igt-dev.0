Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85FCC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 12:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3684010E2B3;
	Thu, 10 Sep 2026 12:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krKMfJbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD5410E287
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789044410; x=1820580410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wvAIqYhyN9wNctz/YaQBr5xNrbQQbacHVvvJLmqx04c=;
 b=krKMfJbz7bL5ayVzpBLxIABQjSaiOCjdtgQ9Wr0IJ3VeqsfYcNHUvbSr
 7ukE7SiYthayP7ikfD6vk8EWGBhH2WpHE2GzmbxtfHd2dkPnBkKfp50NI
 NwC197tp++qrAuqilub7rnpZ/8HHkx3hc2fiCMAUAHghZpBNjJLVABgy6
 0t9CB5p5yQ+0bfYv9zkUsG/ILudqTXDjzYpnVEZId1igglWtZaijHrlGU
 3Yq5zkgVJwt45BhlJXkXYPJTkclSRjZ3WmdM4D7RdG3yVg3lw4Z6kDp3h
 ZngToXDulCiX9JwmyC6cDi7IijWyjZVqrIbT4Lv6w60J+woJliNpNegop Q==;
X-CSE-ConnectionGUID: 9MPoEZQBQjyewH6SiJF+Ug==
X-CSE-MsgGUID: wgwYQAAVTfiKtglTmXWvZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="13793"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="13793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:39:46 -0700
X-CSE-ConnectionGUID: VPamxWCqTMK9vKkFQ2Gybg==
X-CSE-MsgGUID: CCadeyA2Q2eMNx+hDXjyRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="265413974"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:39:44 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Date: Thu, 10 Sep 2026 14:39:34 +0200
Message-ID: <20260910123935.4183522-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910123935.4183522-1-jan.maslak@intel.com>
References: <20260910123935.4183522-1-jan.maslak@intel.com>
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

Genxml provides a dedicated 3DSTATE_DEPTH_BUFFER definition for Xe2 and
newer platforms. Use GFX20_3DSTATE_DEPTH_BUFFER on those platforms,
keeping the existing GFX125 and GFX9 selections for older hardware.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 31913badba..d3f793fcc3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1043,7 +1043,11 @@ gen9_emit_depth(struct intel_bb *ibb)
 
 	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
 
-	if (HAS_4TILE(ibb->devid)) {
+	if (intel_gen(ibb->devid) >= 20) {
+		igt_genxml_emit(ibb, GFX20_3DSTATE_DEPTH_BUFFER, db) {
+			db.MOCS = mocs;
+		}
+	} else if (HAS_4TILE(ibb->devid)) {
 		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
 			db.MOCS = mocs;
 		}
-- 
2.43.0

