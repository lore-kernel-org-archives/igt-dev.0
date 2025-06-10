Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52826C71131
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E6010E30A;
	Tue, 10 Jun 2025 17:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDu12qRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665CB10E2B2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577148; x=1781113148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XISU1gvRjMOl0GEI1cfwB2rcwUhvtMt4ZPM55lBFCKE=;
 b=IDu12qRjl7/jXc71pCNKpVMycX41G2JaeHuEgiYSTU+FS5tFEd2kqbiz
 NBCMHlxpOEgxMHQW3TZRuFvfYyEWbquKI8ucJcfkYgYuPI+273zvzbxVK
 PJfsFCnIWxBC4nV/skk/d/jfxi20nf6lhvo9r/MXscnbPt9ONHkeTrlfG
 49uLyglskMSXUZmNH91XtiynRNOsYAIrN9l+GFzKMXxTAPNmNjJV/BLWp
 ba0oGtKOJUtw+4EzXtcu1Xbf3QIwLL//qCtXc5pbBJC9Z/qm/8cLHabkx
 dIiIUwP1Q1Us/dGidSSg67Gcm0+Ek9B9uwjb1uzvos6Ahy61nO6XPOfap g==;
X-CSE-ConnectionGUID: 42BKQ5/2R92Zn5OOu8paNw==
X-CSE-MsgGUID: jVM8iOhiQqOmg/Fcjv5cCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505951"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:08 -0700
X-CSE-ConnectionGUID: oEl6+9FgTvS5JsBofzD6bQ==
X-CSE-MsgGUID: 0Khi85eqQu6gOWnDkf96Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854456"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:39:07 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
Date: Tue, 10 Jun 2025 23:12:44 +0530
Message-Id: <20250610174244.1292-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..3c328923e 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -179,6 +179,8 @@ IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by sending multiple"
 
 #define MAX_SCREEN_CHANGES 5
 
+#define WA_FBC_DISABLED "16023588340"
+
 enum operations {
 	PLANE_UPDATE,
 	PLANE_UPDATE_CONTINUOUS,
@@ -561,6 +563,11 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_supported(data->drm_fd, WA_FBC_DISABLED),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.34.1

