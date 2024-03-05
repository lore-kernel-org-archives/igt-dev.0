Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C863C54E41
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A6112A85;
	Tue,  5 Mar 2024 12:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhwmtVWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8483D112A85
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709641098; x=1741177098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s/l7b9Lf6zgVceDaCN81gZsBeGQJ2GMlancRjk1Ez8M=;
 b=jhwmtVWDuO8+ajt2//EaudWM2g9XBtXf5DjkdP30SS/ROMyrfgFlaMs/
 MvsA/x8iUDqziQ+oMqYfr+tKCkMyeDIOYchKojFJKvK4GXBT3BGYYynKg
 SP8wii1qQqxo8vsao1ZdTBEWB51D7dexeQk8Wr1XFxsV4YtwgqAwTOsG4
 7I7BQthIEVC2BWMFzD0i+fjmUFDRP+stdg8Y8tqriEfDm22udbkI40aGP
 XNJaNh+KK4i9hvY4KLJwHdkPCZbc4In26SQI0wnjvLOOwsMIJkRQFztdS
 6oyMRLM/QH8/irP/BkhLkWEPKpOuPUAA8S7xUju6eRqgcUXhSPDOaD5PB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15616287"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15616287"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9779407"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v2 1/6] lib/rendercopy_gen9: use MOCS index helper
Date: Tue,  5 Mar 2024 12:17:49 +0000
Message-ID: <20240305121754.182425-1-matthew.auld@intel.com>
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

