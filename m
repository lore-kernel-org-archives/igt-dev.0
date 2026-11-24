Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A587E606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 05:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G1xSUCi1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287910E0DE;
	Tue, 24 Nov 2026 05:33:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA610E0DE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795498364; x=1827034364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5AoqGzWVrUixO3Ix4y6N7P2kGDhA6vISIvVPPGmuMO8=;
 b=G1xSUCi1+H43A5JCghN6f8HIWpnYL9aWj+5h5pEGi4mdjiTD5hUVtdBr
 38JMQh0P62Xft0h6RBq17YTeu69D4Du6rQPUUVweCrrfUjtzcygHOMaMP
 49o2fSmyE1lLDVKelUVfQX5Qk+lQC2MMXxMr7dcTccL3UKVBn+v8MPcB9
 3Dme57OZU0hqEjzd7gkktwCPl9uAJpQ6ZORFfaX8BH9yPuo2oeNyGKBky
 o8S69eIZVU7n8vhMLixSadRbu2l68g/cpyVAst63Wp1tcOgVE8/Qp48yM
 wI5D9qaIBzD7Gx0MS3pWgq8V6MxNKo4VJT1114Dc+0gIkJviZdESqJbir Q==;
X-CSE-ConnectionGUID: 4aVqTyZFQFO+u1l5zOHqZw==
X-CSE-MsgGUID: D9lubUm1Si+Yh+zYaZyQlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4205303"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4205303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 21:32:43 -0800
X-CSE-ConnectionGUID: 4+YHwMJ5TBmDGBke1DDZ5g==
X-CSE-MsgGUID: rW84Gb2rQAGfIJhHcxEq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11808436"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa006.fm.intel.com with ESMTP; 23 Nov 2026 21:32:42 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] tests/intel/xe_err_injection: Readback and validate
 threshold
Date: Tue, 24 Nov 2026 11:02:18 +0530
Message-ID: <20261124053219.2129054-1-raag.jadav@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With error injection test, we're setting threshold for given component
before injecting the error. Also validate that we're able to readback the
threshold that we're setting.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_err_injection.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 74ae9b243..dad65842f 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -459,6 +459,12 @@ static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
 			cleanup_on_error(&ctx, fw_handle);
 			igt_assert_f(false, "Failed to set Core Compute correctable error threshold before injection\n");
 		}
+		ret = igt_drm_ras_nl_get_error_threshold(&ctx);
+		if (ret < 0 || ctx.error_threshold != threshold) {
+			cleanup_on_error(&ctx, fw_handle);
+			igt_assert_f(false,
+				     "Failed to validate Core Compute correctable error threshold before injection\n");
+		}
 	}
 
 	if (check_event) {
@@ -505,6 +511,10 @@ static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
 		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
 		if (ret < 0)
 			igt_warn("Failed to restore Core Compute Correctable threshold to original value\n");
+
+		ret = igt_drm_ras_nl_get_error_threshold(&ctx);
+		if (ret < 0 || ctx.error_threshold != current_threshold)
+			igt_warn("Failed to validate Core Compute Correctable threshold to original value\n");
 	}
 
 	ret = igt_drm_ras_nl_get_error_counter(&ctx);
-- 
2.43.0

