Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4588BC54E90
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0293A10E698;
	Wed, 21 May 2025 07:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBpEtRhc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A272610E691
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812193; x=1779348193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQdRlnKSE143wPJwl901NFvQNYjF7Hd3YYoBrvUTH1g=;
 b=jBpEtRhcqAxgPv+pQmq0vmqcILerv/OgEGs809lsP4xLF6DL6mKx413a
 icO6Bc+Gcc8X7Kj1P1r8PigT0eh42tXe7DPNcAafT0qEw+9YPL9Rq2vPL
 s/tUSwSaLDyzwgbhZ5Q8JdCC6JvBO0/dqXBGxLO50bCW0YrYk5TbFM7Ch
 Nh1WrcdkhkgW+StgX0mUM8Wa14njbPPM1Qrd2k82SCYdrpbIiiNXhG08/
 1CinfTECyWe8TZGhxqsMAgTHSHkVaP9m33ScBADbzNcXEcS4vLM4+2uaS
 Punooqo1TpR5deMJPKXQAsjjgibfkg5A44u/cRP8XKrEZmu2FoPJGrMgW Q==;
X-CSE-ConnectionGUID: SRfxcdNZTuG5sg/xTUsAGQ==
X-CSE-MsgGUID: JDp0WZrTT1ubWrSrre/wvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571297"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571297"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:13 -0700
X-CSE-ConnectionGUID: VM7/P8pjTUiNKdNO1ptI5A==
X-CSE-MsgGUID: 7BX1tV6DQPWjYweZnQKYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943795"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/kms_dsc_helper: Add helper to force
 compressed BPP
Date: Wed, 21 May 2025 12:58:34 +0530
Message-Id: <20250521072836.1400749-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521072836.1400749-1-swati2.sharma@intel.com>
References: <20250521072836.1400749-1-swati2.sharma@intel.com>
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

Helper function is added to force compressed BPP.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 10 ++++++++++
 tests/intel/kms_dsc_helper.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index cea4304e4..5bf1c6faa 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -29,6 +29,16 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
 	igt_assert_f(ret == 0, "forcing input dsc bpc debugfs_write failed\n");
 }
 
+void force_dsc_enable_compressed_bpp(int drmfd, igt_output_t *output, float compressed_bpp)
+{
+	int ret;
+
+	igt_debug("Forcing compressed DSC BPP to %.2f on %s\n",
+		  compressed_bpp, output->name);
+	ret = igt_force_dsc_enable_compressed_bpp(drmfd, output->name, compressed_bpp);
+	igt_assert_f(ret == 0, "forcing compressed dsc bpp debugfs_write failed\n");
+}
+
 void save_force_dsc_en(int drmfd, igt_output_t *output)
 {
 	force_dsc_en_orig =
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 4dbd88fe7..9479deb5f 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -23,6 +23,7 @@
 
 void force_dsc_enable(int drmfd, igt_output_t *output);
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
+void force_dsc_enable_compressed_bpp(int drmfd, igt_output_t *output, float compressed_bpp);
 void save_force_dsc_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_en(void);
 void kms_dsc_exit_handler(int sig);
-- 
2.25.1

