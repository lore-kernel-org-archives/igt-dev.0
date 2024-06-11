Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D526FC27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340B310E38E;
	Tue, 11 Jun 2024 05:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DouBS5jj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E84E10E38E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082094; x=1749618094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3t7PFEDK0/NB9FcgBXCI658rK/HBkG4iQiQEyrc3go=;
 b=DouBS5jjZDq8DxThblpQ58hr/4G1dc+ka4M/bhDALcj02+Ea7F8V5A8B
 v19OXk3eEG4leoHV59eJExzCP9vIwnaCkyu+ywIVNpCKTBp6enTlWDBB1
 2WbFNruQB4QHarKhu6aLwzsmaBU9SRYaW5Lraj7IwJpXEfd7FnrWql3bP
 JrOtXOvGfhnldKyCkBDTRsiD8kCDxz61Zv0V7mTZ0j0Wr4WTbFJV5bDsm
 iXv8K0iQ55FcIWYzArRRX1GVk+5tZbrDS4pCwxpyE6bZ9ehO3MXY9zOIK
 pdekiO/tIMHu6Y3nU+QQ0FHyq3PJ7S2H9Wo97g9/E+DJoj3gIJ8muTInq Q==;
X-CSE-ConnectionGUID: Zl6Wz0hiTYWyDolqkATfiQ==
X-CSE-MsgGUID: O+SMskcpSlaD8jVtY7P0ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997478"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997478"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:34 -0700
X-CSE-ConnectionGUID: TbwSJLRVSxumR792v/jIxQ==
X-CSE-MsgGUID: Lt/rOu8aSju1EbHze3UOkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981162"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:33 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/8] tests/intel/kms_fence_pin_leak: Test cleanup
Date: Tue, 11 Jun 2024 10:23:41 +0530
Message-ID: <20240611045348.3727239-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_fence_pin_leak.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 5d25d9ee3..8ccd73a93 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -199,7 +199,7 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	}
 
 	igt_plane_set_fb(primary, NULL);
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &fb[1]);
@@ -234,18 +234,17 @@ igt_simple_main
 	data_t data = {};
 
 	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+	kmstest_set_vt_graphics_mode();
+	igt_display_require(&data.display, data.drm_fd);
+	igt_display_require_output(&data.display);
+
 	igt_require_gem(data.drm_fd);
 	igt_require(gem_available_fences(data.drm_fd) > 0);
 	igt_require(gem_has_contexts(data.drm_fd));
 
 	data.devid = intel_get_drm_devid(data.drm_fd);
-
-	kmstest_set_vt_graphics_mode();
-
 	data.bops = buf_ops_create(data.drm_fd);
 
-	igt_display_require(&data.display, data.drm_fd);
-
 	alloc_fence_objs(&data);
 
 	run_test(&data);
-- 
2.43.2

