Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A7606A325
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYocdoPg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC4810E321;
	Mon, 26 Oct 2026 16:13:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79BD10E31E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793031137; x=1824567137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kFe+LKVMhfMpVMqw6n5zeJWb6uH8RP144Ao0Yzhzgko=;
 b=bYocdoPgHBEue7PQrvzzO6nqYjjE9u6bKmTh1K0R3gmS6mkDkPrbbHDj
 seZyEo7+E/S9s1lAW2d3wgjAQ7dtiX7INB+Ss8NUnRZC2HUBRIQQrgU0E
 AL1u2qTr2sN/F7qnWIDq6Dgmiy61wghnI6H+4pKlH49pSaWEskjZOZ5na
 caWT+dMuhZtisIHfQuz90KjJjYdOm8hqf2VQyS1Z3VYY/xrGEDgYHrh3a
 ksE9uSU1QdnBNAF8zwp0VrbBzfZ8F7CIGxNyscB/qe6puSI45ZM9sQs4x
 1CD1667p7sJPFEk9wx3o1gONCqsCj00GLesdHRhfjpHir7sEOu637ADQq Q==;
X-CSE-ConnectionGUID: vLRDe5gAShepipvQWTlJFg==
X-CSE-MsgGUID: hC6WEfi0QW+eUHkSu5emUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1599248"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1599248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:12:16 -0700
X-CSE-ConnectionGUID: KdXF+3BUS26XO0Yafh4wvw==
X-CSE-MsgGUID: /RClVfmNSKWJ6+E5MePlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4666058"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 09:12:15 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/kms_cursor_legacy: reduce CI debug output
Date: Mon, 26 Oct 2026 21:42:27 +0530
Message-ID: <20261026161227.1418581-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use DRM_UT_CORE instead of DRM_UT_KMS in CI to reduce log volume while
retaining diagnostics. This applies to all subtests, including the
reported cursorA-vs-flipA-atomic-transitions case.

Log the actual debug mask instead of the hard-coded 0x4.
Intel CI output-limit validation is still pending.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16961
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_sysfs.c           | 3 ++-
 tests/kms_cursor_legacy.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9952c1c0d..873015bdc 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -537,7 +537,8 @@ void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
 	const char *ci_run = getenv("IGT_CI_RUN");
 
 	if (ci_run && ci_run[0] == '1') {
-		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x%x\n",
+			  debug_mask_if_ci);
 		igt_drm_debug_mask_update(debug_mask_if_ci);
 	}
 }
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 62339855e..5d8bcae9e 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1888,7 +1888,8 @@ int igt_main()
 	};
 
 	igt_fixture() {
-		unsigned int debug_mask_if_ci = DRM_UT_KMS;
+		/* Keep CORE diagnostics without the high-volume KMS debug logs. */
+		unsigned int debug_mask_if_ci = DRM_UT_CORE;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
-- 
2.43.0

