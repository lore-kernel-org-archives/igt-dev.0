Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD65F55810
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B641B10E50E;
	Mon, 20 Apr 2026 11:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLZQWQq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554D10E50E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685030; x=1808221030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbT7/3+UN0zR/t8kOYbl3Vib4NnZ2OhqP8q7gi8I8S8=;
 b=LLZQWQq8so/TtnCoxt1hG8GnV/Dw09ivuP2oUIlX7d71+N6kubO5/POR
 QhFy1MH51GD3SoDcm3c2Lx0bg27w5SMKvvSJjJ/YGaaAZRwOjuF0n70lJ
 UJRHOQLRPNp9PcRiH7XWqKseAS99NaTvVxzmblX0PfCWNL9QRaWLRn40H
 GSJN+TR1tlhbBY7LVcv4BlUEMGSxoVyxICJUySFtPPYTZUep8LpmIkP0y
 4UcHnQrIISHU1ed7itYKReJDcemmDBunkPh73TDIynD/osfMPgR/Gpj/M
 1hsUibhJ7bbd0i+P1o3xpvXs/ZYxaN3AnNCwLI0CZXZQGzMUXBvyB2jfT A==;
X-CSE-ConnectionGUID: YMiNNR3JRXeN694+y2Xtwg==
X-CSE-MsgGUID: ohh3ZdukTC6/DQek2GdJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064540"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:10 -0700
X-CSE-ConnectionGUID: dN8soTzKS+OLS130V03qew==
X-CSE-MsgGUID: 42Wmgq+oQIWYXi4qCiQkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228551028"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:07 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 5/6] Revert "tests/intel/kms_pm_dc: Add time unit macros
 and update delay calculation"
Date: Mon, 20 Apr 2026 16:58:25 +0530
Message-ID: <20260420112826.35220-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420112826.35220-1-mohammed.thasleem@intel.com>
References: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

This reverts commit 846b646da18d8d997cbbfabb7fde809e401d6ac0.

v3: Fix compilation issues. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 51b3b1c9b..5fce41874 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -84,8 +84,7 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
-#define SEC 1
-#define MSEC (SEC * 1000)
+#define MSECS (1000000ul)
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -572,7 +571,7 @@ static void test_deep_pkgc_state(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-	delay = (MSEC / (data->mode->vrefresh - 10));
+	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

