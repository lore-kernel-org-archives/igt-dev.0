Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1FEC83033
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860B10E4A3;
	Mon, 30 Jun 2025 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2p9mgpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647C610E050
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301348; x=1782837348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79KgmYy7vvE7DVFA67sTCJPW9xXz8Wa3SI5xTzp/6fs=;
 b=P2p9mgpGL6tv1nl7fhuEbIHLuW7hrAJ/ut7yI1HpZ2kAozidnv+o/Agu
 GRuCCI0KLuknQdTElFiUaqcIW01zwAW16HHNeR6h43SHQ/qrsgksa+e/2
 9woYxhrKivUBOXGSNGbxnuoMFQZ7tGYKrxsLMVewUz6TdzFMLub6VS/wU
 CsA6MZonLfW3GRDWC4E0WwYF943qFp+N4CIerUXRQSBaaUOG/B3OApXdc
 zTlxCMuz8IP93Yump04MkiXu/W6I/MzZlQtytVk61vKwRRI6V3g3qHQNM
 6fKCOpo/m9Sks8URaa7TMPa2yGqy580CLh2KHlziWeKUad8f3iB0Nc9aD A==;
X-CSE-ConnectionGUID: GVGVfPP6QdiMqrqwiwM0Ew==
X-CSE-MsgGUID: MKdxsQcTQZyZ9CDz2eoNww==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101953"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: PFad+rNpTkyTaRhxJJ1+JQ==
X-CSE-MsgGUID: B53doBehQRys9OJlwL8BSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226416"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 5/7] tests/intel/xe_query: Look up GT reference clock
 correctly
Date: Mon, 30 Jun 2025 09:35:35 -0700
Message-ID: <20250630163529.2096664-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
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

The open-coded GT loop should be replaced by a direct GT ID lookup to
obtain the reference clock in order to ensure this continues to work on
future platforms where GT ID != index in the GT query list.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
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

