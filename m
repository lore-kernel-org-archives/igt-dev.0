Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54460C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20410E77E;
	Wed,  2 Jul 2025 19:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJtq+dph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AACB10E779
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484784; x=1783020784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fih2esebys8tFa9fI4SlB2uglRLFBq9fjieqw2lplfw=;
 b=kJtq+dph/x/rItk09eS+sSHdC2RI/dvZIul3sAbn33OAyX9WmGBlWM6k
 pKBeiH61JlHVy3D9iSojLnhia1lXLCFNvM3KfQui69ap/1Fxnzv2UZ3Hd
 9uWJfg0ya/EzgnQmtdNDaltHZpim/DPuL91lC+ApF46ypg39pwihYmR4O
 8HN/gAtIG3i8emoCd+y2MwWp1PkwbMacCcmQMvQWhTWNzRmobEk7+pcW0
 X3lXqH/cJmomXnwO8NXrHLvl1L7x0BHC6KZDkxYCfs7HRc6sRV95RRh3O
 +TujNctnOKJR8nsYl5DOHmsLZS8SZtaArP+7UD+JtaPggG080JOhfHU4d A==;
X-CSE-ConnectionGUID: 6qRwlDFCQ0y0XaDvGkyTzg==
X-CSE-MsgGUID: mz3oMJeVTiCacRSTnhoX2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53028475"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53028475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:04 -0700
X-CSE-ConnectionGUID: fyiGb10ERNGadJ70jZHbGA==
X-CSE-MsgGUID: sTDu5oJnQxaGhWcrbrKRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154241559"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 5/7] tests/intel/xe_query: Look up GT reference clock
 correctly
Date: Wed,  2 Jul 2025 12:33:00 -0700
Message-ID: <20250702193254.2613121-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193254.2613121-9-matthew.d.roper@intel.com>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
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

The open-coded GT loop should be replaced by a direct GT ID lookup to
obtain the reference clock in order to ensure this continues to work on
future platforms where GT ID != index in the GT query list.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_query.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9c7bf1d6f..96352da2c 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -675,18 +675,13 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
 static uint32_t
 __engine_reference_clock(int fd, int gt_id)
 {
-	uint32_t reference_clock = 0;
 	struct xe_device *xe_dev = xe_device_get(fd);
+	const struct drm_xe_gt *gt = drm_xe_get_gt(xe_dev, gt_id);
 
-	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
-		if (gt == gt_id) {
-			reference_clock = xe_dev->gt_list->gt_list[gt].reference_clock;
-			break;
-		}
-	}
-	igt_assert(reference_clock);
+	igt_assert(gt);
+	igt_assert(gt->reference_clock);
 
-	return reference_clock;
+	return gt->reference_clock;
 }
 
 static void
-- 
2.49.0

