Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67612C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 15:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CFC10E19D;
	Mon, 20 Jul 2026 15:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUYPg4v7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1681510E986
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784560442; x=1816096442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=95R0wrGMICkFgSQWDrO3VjTTk/Bmmz0GS9KdsJ+eCUA=;
 b=YUYPg4v7dlr00ja5r2HvZp0S4XvvGn8w1S3fTFiNF6diluWmlpLNg0E5
 95actU4586xOkjxMyzuD2NRdsf567rqY/RfrjRoAPl4ozlANAHFY/834G
 7y+lkGoEDzWfkwY5BZq9LwoVTdG8CX+S9NWpOmGGmydFyX0AEeoYpv7tX
 xzy/lJTGG0fVoqHU988EmFKHpRZMB10Hrakaf2WCKXY+Y/fOBKx/P3/bl
 a/nd/WXI3PidbwMFNjKT9Z4Q6Ex+4gt8OmoBZKDOf/alOFY+bwQjvOgvP
 mQtTpNYBJJRTu1dTxiN86qnPs1aKtNLvD88aHwlNxiF+epLstwDqCHTUH Q==;
X-CSE-ConnectionGUID: WGrGf0QMSaagmZbOG5MTqQ==
X-CSE-MsgGUID: bZF2QU8MTFiQzwlbSGe4+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85019519"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208,223";a="85019519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 08:14:02 -0700
X-CSE-ConnectionGUID: VhM6MRK6R9eBy/e7ps8trg==
X-CSE-MsgGUID: McvedvRoQKu8XPOAD2G0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
 d="scan'208,223";a="257541953"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 08:14:00 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v2] lib/i915/fbc: xe3_lpd+ update the plane size checks
 for FBC support
Date: Mon, 20 Jul 2026 18:13:49 +0300
Message-ID: <20260720151349.130812-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
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

From xe3_lpd+ there is no specific restriction on the plane
width to enable FBC. Width can be the maximum supported width
per platform.  The restriction on the number of lines still
holds. Update the plane size check function accordingly so that
FBC tests dont get skipped for valid plane sizes.

v2: copy the values from the driver.

Bspec: 69560
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b8c714d43..9aa7b3408 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -127,7 +127,10 @@ static void intel_fbc_max_plane_size(igt_display_t *display, uint32_t *width, ui
 	const struct intel_device_info *info = intel_get_device_info(dev_id);
 	int ver = info->graphics_ver;
 
-	if (ver >= 10) {
+	if (ver >= 30) {
+		*width = 6144;
+		*height = 4096;
+	} else if (ver >= 10) {
 		*width = 5120;
 		*height = 4096;
 	} else if (ver >= 8 || IS_HASWELL(fd)) {
-- 
2.43.0

