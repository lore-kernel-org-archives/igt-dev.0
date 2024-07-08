Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE96C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 14:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9DB10E1B8;
	Mon,  8 Jul 2024 14:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWCPeiY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898AD10E1B8
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720449513; x=1751985513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=euT5AllqIDIj6z4XyPO69FWO6Vb/N4Ea7znFNka3VLE=;
 b=WWCPeiY5Em07vcaVxEn4z987OLjBaKjaR6hvVcqEk3mMRuELEhWA+0Ea
 l/ceC4eiXH0XypCyv7wJqup8Ut/rLbXaqdZO1Sm9lXfUHtKpugEToYXs3
 5/qpjbRIGAN+hrTae/Y1fG97vZbb9/jHlkZgn96qyXWmjZKgFefGP7514
 cRse1gjPK5n4RtE9nde7Q/TQOEn+1sBRzdkxHVzhOVJbe9Pw6/m/ocffn
 OjBV5vxpj319z7h2EdatXD5zl5IeiGtZird+LUQMF76h8WsUBN3dm/KGV
 cpeVXJwhZ9H9g5v9AqRM3sma7GOdLSyWqOElAjzoMyWeJlI9s9l/iRErh w==;
X-CSE-ConnectionGUID: +nABjAKXSNSn584D02T3Lg==
X-CSE-MsgGUID: ASQDBdsyQ5CBMeYZa9NVRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21465601"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="21465601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:33 -0700
X-CSE-ConnectionGUID: VRj1S3zwQYi1aMauQlcUZQ==
X-CSE-MsgGUID: KNZ+96bsQl6qplpfgfCL4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47491438"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:30 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t v2 1/3] tests/intel/xe_pm: Install fw close exit handler
 before rpm tests
Date: Mon,  8 Jul 2024 20:26:05 +0530
Message-Id: <20240708145607.272869-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708145607.272869-1-badal.nilawar@intel.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
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

Move code to install fw close exit handler before rpm tests
as some of the tests uses fw.

Fixes: a3c590fbb5eb ("tests/intel/xe_pm: Convert mmap tests to use existing d3 helpers")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_pm.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 5a9e4858a..b30e94a2a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -769,6 +769,10 @@ igt_main
 			test_mocs_suspend_resume(device, s->state);
 	}
 
+	igt_fixture {
+		igt_install_exit_handler(close_fw_handle);
+	}
+
 	for (const struct d_state *d = d_states; d->name; d++) {
 		igt_subtest_f("%s-basic", d->name) {
 			igt_assert(setup_d3(device, d->state));
@@ -823,24 +827,18 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_install_exit_handler(close_fw_handle);
-		}
-
-		igt_describe("Validate whether card is limited to d3hot,"
-			     "if vram used > vram threshold");
-		igt_subtest("vram-d3cold-threshold") {
-			orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
-			igt_install_exit_handler(vram_d3cold_threshold_restore);
-			test_vram_d3cold_threshold(device, sysfs_fd);
-		}
+	igt_describe("Validate whether card is limited to d3hot,"
+		     "if vram used > vram threshold");
+	igt_subtest("vram-d3cold-threshold") {
+		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+		igt_install_exit_handler(vram_d3cold_threshold_restore);
+		test_vram_d3cold_threshold(device, sysfs_fd);
+	}
 
-		igt_subtest("mocs-rpm") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mocs_suspend_resume(device, NO_SUSPEND);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
+	igt_subtest("mocs-rpm") {
+		dpms_on_off(device, DRM_MODE_DPMS_OFF);
+		test_mocs_suspend_resume(device, NO_SUSPEND);
+		dpms_on_off(device, DRM_MODE_DPMS_ON);
 	}
 
 	igt_fixture {
-- 
2.34.1

