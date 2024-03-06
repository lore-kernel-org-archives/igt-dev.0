Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080ACC5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1CA11327B;
	Wed,  6 Mar 2024 15:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wveenzce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDB310F090
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737562; x=1741273562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s/l7b9Lf6zgVceDaCN81gZsBeGQJ2GMlancRjk1Ez8M=;
 b=WveenzceNHpDaCoQM4yJJtAzbU3QR1dUfTFOTkEMn095XhWooU8uv3dH
 LPSfiaMuZ6J4johCpBwAKNSNbCEID+jfvJchqAqd9SylLag515ypg9LGk
 P6aaF746WgjIyPt5t5N7eqZtUm4nGKxiVDzpRIVxZsScrkMXQI3gN4GEK
 iyWaZxeFt9DIBiaZglFBtd/QonIYOZx41k7ZMXCxKJIfGMdi/uTnJeWLD
 75wZumUYw4qe8pi8PS03L5pxJ6t+/V5gHQ8dsDLYbF3b/HQ6yoz/DRcj8
 fEvpkGIxHyuLCIFyPve5wUxdNFbrI0K3aDI6BAR7UfEm8bNrhj2w7dwkb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4240915"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4240915"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="47296593"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 1/6] lib/rendercopy_gen9: use MOCS index helper
Date: Wed,  6 Mar 2024 15:04:47 +0000
Message-ID: <20240306150453.254144-1-matthew.auld@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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

