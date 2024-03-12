Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F2C54E68
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 20:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7239910F104;
	Tue, 12 Mar 2024 20:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2UgtMLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AE010F0F8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 20:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710276878; x=1741812878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xcl1/w+wjUKzVkMLFQBdYutp2X1myWSYlo6z3kUZokw=;
 b=L2UgtMLq9cE2kpkd5CEQ6u4uZL3Q8OiAwxPTtJUH/c9DdGCFElVIKDGm
 7Ar+cwfAgn1LPrblz5MlcX4C+DKPt9s0Km7yYJ9UxyihWFDBBRr2S00bM
 ag5Ij+iAiGjS2xq4tVru1VoqY/3mv6/us18nUgfj43nL+UcjrKTKONlDL
 NN2lPc6nVLenuoQ4Ca5n0mWoFmKV4VpEe6NB5EKd84l+2KA0eTxV9wZu1
 DzEJlh35f7kla6pktIYIyuEf7Ah/S/KbgS29GroHVld9aLgH/fCbtroBv
 +787Sz6ccExkGteWQTKI6wMxmb6QG4s/HKpJX49c9aHSBTlxksVdDOraW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4871522"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4871522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="42668545"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:54:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/xe_query: Print and sanity-check GT ip
 versions
Date: Tue, 12 Mar 2024 13:54:31 -0700
Message-ID: <20240312205431.2869411-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240312205431.2869411-1-matthew.d.roper@intel.com>
References: <20240312205431.2869411-1-matthew.d.roper@intel.com>
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

Update the query test to include the GT's IP version in the output and
to also perform some simple sanity checks on the version received.  We
don't want to try to match any specific version numbers (since we expect
new versions to show up in the future), but we do know that the uapi
should never return version numbers older than 12.70 for the primary GT
or 13.00 for the media GT since those were the first IP versions to
include GMD_ID support.  We also know that MTL/ARL are the only pre-Xe2
platforms to support GMD_ID, so if we're not running on MTL/ARL, the
version numbers must always be 20.00 or greater.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_query.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9ebc7e806..a5a2dd7d4 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -277,6 +277,7 @@ test_query_mem_regions(int fd)
 static void
 test_query_gt_list(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
@@ -296,13 +297,40 @@ test_query_gt_list(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
 	for (i = 0; i < gt_list->num_gt; i++) {
+		int verx100 = 100 * gt_list->gt_list[i].ip_ver_major +
+			gt_list->gt_list[i].ip_ver_minor;
+
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
+		igt_info("IP version: %d.%02d, stepping %d\n",
+			 gt_list->gt_list[i].ip_ver_major,
+			 gt_list->gt_list[i].ip_ver_minor,
+			 gt_list->gt_list[i].ip_ver_rev);
 		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
 		igt_info("near_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].near_mem_regions);
 		igt_info("far_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].far_mem_regions);
+
+		/* Sanity check IP version. */
+		if (verx100) {
+			/*
+			 * First GMD_ID platforms had graphics 12.70 and media
+			 * 13.00 so we should never see non-zero values lower
+			 * than those.
+			 */
+			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
+				igt_assert_lte(1300, verx100);
+			else
+				igt_assert_lte(1270, verx100);
+
+			/*
+			 * Aside from MTL/ARL, all version numbers should be
+			 * 20.00 or higher.
+			 */
+			if (!IS_METEORLAKE(dev_id))
+				igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
+		}
 	}
 }
 
-- 
2.43.0

