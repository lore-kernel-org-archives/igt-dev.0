Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1233E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 16:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0A110E747;
	Thu,  2 Jan 2025 16:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CruK408D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6236610E747
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 16:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735835141; x=1767371141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Hu5WAtugicYm3rLblnmgFc/dE896ePF56Mdih/YP8Y=;
 b=CruK408DonQrLIuhJUkhS026yjqb1+s/8bbCR30wdkLQSJA5bRulvgkI
 Oo6ZWt1mdiDNKXSCLuC8ntYku7TnySV22ly8ShzHCbx07egHHXkrZOpAj
 J9PoIt78ec7RhzT6usakjwrh5P9oy+PnJyzmRKHrxtRuiprnht1Pivs4C
 8yy27kY8rASldQKz3H/yR/rjfaCPeekK8+PEhKA0KAlIl5MfLtDxWmvI+
 8PtdAdcUId5i/mp3og7DaCC0d8Xz7jTV5GaASyhytmibyJ8kJlYGu7t6n
 di9GWDSMEj7y/zsngHF5FIkK5M1f/U7T/JBi7lciFT2zdcB0BPv9te7Vq w==;
X-CSE-ConnectionGUID: dNUJOVF2Q8iwrgUavaehzw==
X-CSE-MsgGUID: 87HVCQITReuvqB8Lj0jAtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36233472"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36233472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 08:25:41 -0800
X-CSE-ConnectionGUID: LeN1ED+wSvGd7AENpyxzSw==
X-CSE-MsgGUID: KA7iVz1cR6+wmNqSqI+tQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101633717"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 08:25:41 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 zbigniew.kempczynski@intel.com, pravalika.gurram@intel.com,
 daniel.stenka@intel.com
Subject: [PATCH] tests/intel/xe_drm_fdinfo: Do not end NULL xe_cork
Date: Thu,  2 Jan 2025 16:25:40 +0000
Message-ID: <20250102162540.81162-1-jonathan.cavitt@intel.com>
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

An earlier commit prevented the execution of the xe_cork_destroy
function when the xe_cork is not initialized via xe_cork_create in
xe_drm_fdinfo.  This must also be done with the xe_cork_sync_end
function in some places.

Fixes: 2feb1d67 ("lib/xe/xe_spin: move the spinner related functions to lib")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
CC: Pravalika Gurram <pravalika.gurram@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Daniel Stenka <daniel.stenka@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index e83c55c646..0d1cbfe59e 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -532,8 +532,11 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_for_each_engine_class(class)
-		xe_cork_sync_end(fd, ctx[class]);
+	xe_for_each_engine_class(class) {
+		if (ctx[class])
+			xe_cork_sync_end(fd, ctx[class]);
+	}
+
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -573,8 +576,11 @@ utilization_all_full_load(int fd)
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_for_each_engine_class(class)
-		xe_cork_sync_end(fd, ctx[class]);
+	xe_for_each_engine_class(class) {
+		if (ctx[class])
+			xe_cork_sync_end(fd, ctx[class]);
+	}
+
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-- 
2.43.0

