Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933B9C28B20
	for <igt-dev@archiver.kernel.org>; Sun, 30 Mar 2025 10:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459A710E105;
	Sun, 30 Mar 2025 10:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANKVXcg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7B10E105
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Mar 2025 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743330574; x=1774866574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DT7AlQgaZigR6u1ESfcxF2NZPETjJS3oNex0SEUTnqY=;
 b=ANKVXcg8vdC/npOVuMo9TG8bPo1uylbIH7rvr04aoEYHPIy2OljpvRuV
 4iosnLOJm3oUAhXfguC8tNRDUAFIp5d4Zsv5nTS48YD2BOnMQ7eKh6/5E
 UJ8o28FYTDm+RUzwcIogwbvlxPPYcnP9UBBQYbO5T/wYDT7sxnNC70F95
 iJje4kTKCKEnUnMevu8bPyxsOI+3E0wk7wpnkD6EnbJ+B7pS7rO+LWprU
 ZPfl8WDnmSFso++TAnuSJLRWRQYk46RHWz3abTs4TCJXIA06lYskRyHPC
 qWro1reJa5EV2Sx0hMLXmC7NsnkMTWKWW6gVoa89xHvXY5dZJ6rtvNRwr g==;
X-CSE-ConnectionGUID: sHl1hfPzRq+/Ujx/ZCwU9Q==
X-CSE-MsgGUID: Zpi9fVmqRw+TY3rH45LqQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48422498"
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="48422498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2025 03:29:33 -0700
X-CSE-ConnectionGUID: f0AmRgwhQZe5bC1Hvx2p+A==
X-CSE-MsgGUID: L4XP+BmKToy3rNLOb2ZesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="131070754"
Received: from linux-tiger-lake-client-platform.iind.intel.com ([10.227.88.36])
 by orviesa005.jf.intel.com with ESMTP; 30 Mar 2025 03:29:33 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_pm_dc: Remove PKGC10 dependency to
 validate DC6
Date: Sun, 30 Mar 2025 15:58:54 +0530
Message-Id: <20250330102854.35708-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217170809.175276-1-mohammed.thasleem@intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
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

DC6 counter was removed MTL onwards, so pkgc10 counter is used
to validated DC6 tests but with the new approach of kmd changes
created DC6 debugfs entry counter to validated DC6 tests and
removeing the existing PKGC10 code.

v2: Update debugfs message.
v3: Remove display version check. (Imre)
    Update commit subject and description.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 2491cd1f8..29e5758fc 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -285,7 +285,13 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 		igt_assert_f(str, "DC5 counter is not available\n");
 	} else if (dc_flag & CHECK_DC6) {
 		str = strstr(buf, "DC5 -> DC6 count");
-		igt_assert_f(str, "DC6 counter is not available\n");
+		if (!str) {
+			str = strstr(buf, "DC5 -> DC6 allowed count");
+			igt_assert_f(str, "DC5 -> DC6 allowed count "
+					  "is not available\n");
+		} else {
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 	} else if (dc_flag & CHECK_DC3CO) {
 		str = strstr(buf, "DC3CO count");
 		igt_assert_f(str, "DC3CO counter is not available\n");
@@ -376,6 +382,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 
 static void require_dc_counter(int debugfs_fd, int dc_flag)
 {
+	char *str;
 	char buf[4096];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
@@ -391,8 +398,13 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
 			      "DC5 counter is not available\n");
 		break;
 	case CHECK_DC6:
-		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
-			      "DC6 counter is not available\n");
+		str = strstr(buf, "DC5 -> DC6 count");
+		if (!str) {
+			str = strstr(buf, "DC5 -> DC6 allowed count");
+			igt_assert_f(str, "DC5 -> DC6 allowed count is not available\n");
+		} else {
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 		break;
 	default:
 		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
-- 
2.34.1

