Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B7C54E49
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 17:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D3310E0E1;
	Fri,  1 Mar 2024 17:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRvxtdgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1053510E0C3
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709313398; x=1740849398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QgU+vXpkXWxQ4MWBZXYd2WBgiS2YP14DsUxo/MBUnRQ=;
 b=ZRvxtdgPDeBdtLEBqzgM1rPrewyP8mzu1qi0vYUkF1y6AberXmJwZLuG
 u0+7pnfusWONwcwK4LtY6UF8baxz/uF8Fbs4Y1UsaiOzmZ36wanzNVBHJ
 L8hJeTItJ+psMlt1XvCQo8gEy/FhmhGKhCVOaWFNZ/1phorTP1qhcLhxG
 BniOMf5EwCQta7GHWgqGv2aYlgXBKr86XI54vTHDGZ4wpcOV1A4QnM0hL
 QucXmGvYK5Np0KYzHKIPQNRpscc/2jcluZsz/R5Ror3t1f5MZvaylTXHf
 s1lyy3I7Zgj8T3nFRAiNpYqV100Yez52fifNpH81uq5uDimm+nya32Ud6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="26323415"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="26323415"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8681286"
Received: from knomani-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.163])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/5] lib/rendercopy_gen9: use MOCS index helper
Date: Fri,  1 Mar 2024 17:16:14 +0000
Message-ID: <20240301171618.395851-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
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

UC looks to be the sensible default here, since it will work with
display engine if rendering onto scanout surface. Use the matching
helper.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/rendercopy_gen9.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index efd7cb37c..404406e5f 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -180,10 +180,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
 
 	if (HAS_4TILE(ibb->devid)) {
-		/*
-		 * mocs table version 1 index 3 groub wb use l3
-		 */
-		ss->ss1.mocs_index = 3;
+		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
 		ss->ss5.mip_tail_start_lod = 0;
 	} else {
 		ss->ss0.render_cache_read_write = 1;
-- 
2.43.2

