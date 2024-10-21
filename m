Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DE2D17122
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 18:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358C510E535;
	Mon, 21 Oct 2024 18:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a77K6oCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891810E535
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729534329; x=1761070329;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mk5TGXMwC96aM9PUTxnRcJ6yL9tjokoM5eD7OE54uxI=;
 b=a77K6oCtNa3ndbLZyAf3ySMakvR6JvzQj59JVAkGImFpGEnXsVfywiQB
 oIi4BidPDegIhB/pi+NGYs68clKC6pjsIVfdIrsbU+IcFQ9MfqX3V4Wkn
 FLmpsJvoKrZbRs7rEKAL4D4s9oexwSRrjHezF4ObtDdefFxtnmBiFeiWU
 VcVcfHKCSA8h7FTfZGudPe8tahHFQDhz/E/VuzcnhefO1AMtybhXy7fSn
 X+UpJt+CD9Cp0TdxfYUsNWWufpykZVrYt/0hFcWibv/RxmS0JQTSi72/a
 8th0im25nNRoJQe5/vN0GN/ejEZKQQHgHky5399TovLVp2iL34AjhEtRF A==;
X-CSE-ConnectionGUID: q7w/iCydRh2w/pHnbLA/jw==
X-CSE-MsgGUID: NZnO0Eu8T8O8PZ6LfrJ6rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51581820"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51581820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 11:12:09 -0700
X-CSE-ConnectionGUID: qF7p/YZ+TMWqCAm7G/dW+Q==
X-CSE-MsgGUID: Hfrcn5BbQ1ucQGIA+Rh9tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79773397"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 11:12:09 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe/oa: Don't skip if freq sysfs are not present
Date: Mon, 21 Oct 2024 11:12:03 -0700
Message-ID: <20241021181203.1094596-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Freq sysfs are not created in certain environments. In most of these cases
OA IGT's will work just fine, even when GT min/max freq's are not
known. Therefore, just print a warning if freq sysfs are not present but
don't cause tests to skip.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/xe_oa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 86264230c9..189388b76b 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -571,11 +571,9 @@ xe_perf_for_fd(int drm_fd, int gt)
 	}
 
 	if (!read_sysfs(sysfs_dir_fd, path_min, &gt_min_freq) ||
-	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq)) {
+	    !read_sysfs(sysfs_dir_fd, path_max, &gt_max_freq))
 		igt_warn("Unable to read freqs from sysfs\n");
-		close(sysfs_dir_fd);
-		return NULL;
-	}
+
 	close(sysfs_dir_fd);
 
 	device_id = intel_get_drm_devid(drm_fd);
-- 
2.41.0

