Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A65C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1310E2CB;
	Thu, 10 Sep 2026 16:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFfTeH9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8810E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789057649; x=1820593649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESSHHtH6tkgl7R40zEL3daRjBn8deWnHTBfbHQE3Tjo=;
 b=KFfTeH9mels8ocQb89kNmi8jMYFkgVBiFDEYyOg/9GWjXdo1I6/09aIo
 JawpJPOn1SuBZLfTTNqzCkDVhI8ZLWRCb67cgsIkA5ZCEz3JZo2BikgZX
 SeJqUs+X1gfBaNZdJ4WF0chMKQzk/nOyETdLIynDd110jnb8AS34vzAUi
 9U62FkVh3679rZjDD5NP4gIPWuPkAVkBV3KSIUVI2icD7h2qJUMmIxaG4
 pwfZJKIW99w6c/AcCDIZmTzEoBRZc79t1qPa2RKO1KyRaHbHIBZLaAx+t
 t/+JG4CRM3or0BGpFGqM5PIHaML/kCxw5pU92b57skKVkzoHPpJ+SzI31 g==;
X-CSE-ConnectionGUID: NXWd+v9DROifI6w+NHr6JA==
X-CSE-MsgGUID: SqnjcqydQxeBm1zY3BJ2uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115058361"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="115058361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:27:29 -0700
X-CSE-ConnectionGUID: WRaRAk0pQyeoO9f2C/9o2g==
X-CSE-MsgGUID: /j+eEnq8TA2tnAj6NuJl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269921956"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:27:28 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Date: Thu, 10 Sep 2026 18:27:18 +0200
Message-ID: <20260910162718.4189583-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910162718.4189583-1-jan.maslak@intel.com>
References: <20260910162718.4189583-1-jan.maslak@intel.com>
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

Xe2+ platforms also support Tile4, but require the eight-dword GFX20
packet rather than the ten-dword GFX125 packet. Retain the HAS_4TILE
capability check only for pre-Xe2 platforms.

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

