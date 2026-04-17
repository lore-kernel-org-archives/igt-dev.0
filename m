Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A7F8DFE9
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BC810E992;
	Fri, 17 Apr 2026 08:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxBtJU/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFED10E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415433; x=1807951433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqk8sUBNaEYztjnAtNtC+rW7IzlH3gUuUpT63EpDgq4=;
 b=fxBtJU/hhc62JgZFaKXSQdFj0EQYwbszsqkVYOdunRpk+MIYZKXqeU2E
 6k7b6BL391uqYMr63Z8IU/6KJMO7FHV7Axn7IN9Lnw36hozf2jf1b238d
 Z5R7/guySuEYLe515E4kGdZaJ+WBo5iAxE7tdolKVTnGoklhCIxJSeJlB
 7jd0mR2MXKFhXJY4PWOYqKCYXm55p3rQa4VJ++BWR/J4TtCScUFGEHgf1
 y8xNeZCQqdBfAS/eeggobCrXqj9tY64OY7yA29RtiP3NY9QO9aQSe9EVl
 RtHMoWHK1JPZ0DNsuOuOGk5r8J+9KN0cigszbqYBDxZtGraqQx9Ycp87T w==;
X-CSE-ConnectionGUID: mXL53n13QPS57h/sYayCNQ==
X-CSE-MsgGUID: NrDPc3pPRQ+kfrVWa7WAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308444"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308444"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:53 -0700
X-CSE-ConnectionGUID: 3pVLh6eRRxqLjhEKh9YIoA==
X-CSE-MsgGUID: WdTMOWekTWmeh6fZb5xVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361744"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:52 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 5/7] Revert "tests/intel/kms_pm_dc: Add time unit macros
 and update delay calculation"
Date: Fri, 17 Apr 2026 14:05:04 +0530
Message-ID: <20260417083506.33404-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 91c9cebf2..d32e1cf1f 100644
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
 
@@ -571,7 +570,7 @@ static void test_deep_pkgc_state(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = (MSEC / (data->mode->vrefresh - 10));
+	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
 
 	igt_plane_set_fb(primary, &data->fb_rgb);
 	igt_display_commit(&data->display);
-- 
2.43.0

