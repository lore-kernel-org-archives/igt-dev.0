Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0185C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 22:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A80211284C;
	Fri, 22 Mar 2024 22:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdQ63pzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9811283E
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711145951; x=1742681951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nL2KSO1i2WrooDVWUFr3NozkEQhrhQwwC9fX1If026A=;
 b=ZdQ63pzNsGLgiLuUdROa01T/MYZytbESZydlH6iaoc/OjsptUe6CohlL
 1JmKZFX62zf1y58qRFd97RgQK1pOEZWyXriTONlINj2+11z7DU1natbwW
 4ANYdYhc8IpeDNT/FVfpEUm6EcQpo0Ji86mQRsBYeBM5TZHJR9AHo52Pv
 Oj6VeN5d+q5F6+YAGWzhJxZQszDF3IGsMtG657QIUwTHnGRpSpO3KU51d
 acRD1wp0Y0+4oYR55lIo/DfklZ54VjfQvOesoRjDfFY5/JgTCe134eBNm
 rjnzLJ39kfrYe1zad7SPgFttn9dEPuOJUv+T8LzeAjl1UN8cSaPwkhE1y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10016751"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="10016751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 15:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="38170412"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 15:19:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH i-g-t] tests/xe_compute: Don't require ccs_mode on every GT
Date: Fri, 22 Mar 2024 15:19:08 -0700
Message-ID: <20240322221908.857024-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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

On platforms with standalone media, we expect some GTs to have CCS
engines (meaning ccs_mode can be tested if there's more than one CCS),
but the media GT will never have any CCS engines and will never expose
ccs_mode.  Move the igt_require() out of the loop so that we don't
declare the whole test a skip upon encountering the media GT when the
test already executed successfully on the primary GT.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_compute.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 42f42ca0c..fffcfa08e 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -51,13 +51,15 @@ test_ccs_mode(int num_gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, ccs_mode, vm, q, num_slices;
-	int fd, gt_fd;
+	int fd, gt_fd, num_gt_with_ccs_mode = 0;
 
 	for (gt = 0; gt < num_gt; gt++) {
-		igt_require(get_num_cslices(gt, &num_slices));
+		if (get_num_cslices(gt, &num_slices) == 0)
+			continue;
 
 		gt_fd = gt_sysfs_open(gt);
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
+		num_gt_with_ccs_mode++;
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
 			if (num_slices % m) {
@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
 
 		close(gt_fd);
 	}
+
+	igt_require(num_gt_with_ccs_mode > 0);
 }
 
 /**
-- 
2.43.0

