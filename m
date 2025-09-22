Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C81CAC5A8
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 14:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115ED10E4BE;
	Mon, 22 Sep 2025 14:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhN7xWpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FF010E4BF
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758551795; x=1790087795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jRUY2kcR4blUviN20SYES4dqqKdesHyuWuoQs1QAuZ4=;
 b=HhN7xWpXEBEmgZx76Bcj4atmRk+egI20Gor7fBrZLfkhbZsjmprw5vww
 JfMetMT1A7aeV4B7XDHneJThF0K6QT/E9pp49H5x78Yt2nRMAhs06r/Ox
 texrHLQB0J1vyRzaEf5kcA41wm72wVm/te6jVerqd7cIIWtJaQFwBKg/R
 qYfR0CNpHKR93A5Yl5S9OjAEpR9Qvty7umzE4lHW5KTHNdxUnzq9W9Ki4
 ckjCJ5P08aoE5WL5R1N1inPh79fhUnFESYCamLS0GpEF2UpGzZjAKuQCK
 6KGobPeAqy69G/WNdKw2DIlWWvYFrUTJVm12G4s4Oyt8EH0wPMW2LBfso g==;
X-CSE-ConnectionGUID: 76Hhyq6NQjCP1/WFWBp5aQ==
X-CSE-MsgGUID: b+iIDkmdSli6fBNTuiB+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60868908"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60868908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 07:36:30 -0700
X-CSE-ConnectionGUID: jhT6eLWPTbWHbGy18bP4aw==
X-CSE-MsgGUID: /hgUIf0uTsaFUH6ZvgJSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176104831"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.64])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 07:36:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Nakshtra Goyal <nakshtra.goyal@intel.com>
Subject: [PATCH i-g-t] tests/xe_pat: Check source surface is intact
Date: Mon, 22 Sep 2025 16:36:22 +0200
Message-ID: <20250922143621.209312-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Theoretically nothing should influence on source surface during
render-copy operation. But I observe there's some interfence
between different pat-index surfaces.

Add source surface check which should never asserts.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5507
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_pat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 8bb0ac167d..8201720777 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -430,6 +430,10 @@ static void pat_index_render(struct xe_pat_param *p)
 		    0, 0);
 	intel_bb_sync(ibb);
 
+	/* Ensure nothing corrupted source */
+	for (i = 0; i < size / sizeof(uint32_t); i++)
+		igt_assert_eq(p->r1_map[i], i);
+
 	if (do_slow_check) {
 		for (i = 0; i < size / 4; i++)
 			igt_assert_eq(p->r2_map[i], i);
-- 
2.43.0

