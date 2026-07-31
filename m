Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DACC5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 12:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0DF10F23D;
	Fri, 31 Jul 2026 12:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmZoME9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1536E10F250
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499969; x=1817035969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJQ5atJg8SIFzeCzMGc75UVRZm9Wavr6vsoTHEW68EI=;
 b=CmZoME9oaH3fZmz3wQBLa0RWdRAQSLI+WelrNjMi/5BnJOyeQWAwur7A
 Z4cXVLMTWNimyS0ZtvaaM6/Z+LZteUmbX1M8hLs0Ko1da0mdv09JG9YaK
 Nlr768XT83eaXO+In/OhNlZrBDs6eIftcjMRcXOuiySCQthctv8NPlamH
 0T1Vz5CrTzFqd0GTTbU1wqx60XvpPj3zPCcOhtUKRosaVg1QxNuZj5h3z
 NUGJb2KYBSlWWo9G0Gy+R1P0Pu8f7VyzDEWnlfbReDoLfG511KWGGVyUy
 2KBkTumECYSW2yx72WDZzsKUTm4RVQQobLTGa73Rf6asPf9DlnfLk0Sfk A==;
X-CSE-ConnectionGUID: bfTL8/qVSiG+TzRB7aIBNw==
X-CSE-MsgGUID: 88NT7ROVQ1CsnV/LN2LcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85891505"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85891505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:12:48 -0700
X-CSE-ConnectionGUID: yS+mqupqQhqYeD4QqZgHjw==
X-CSE-MsgGUID: 2MOoWGeUTYmNiu5bg3ZvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="265630652"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 05:12:47 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_dsc_helper: Add helper to force
 compressed BPP
Date: Fri, 31 Jul 2026 17:51:43 +0530
Message-Id: <20260731122145.4099468-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260731122145.4099468-1-swati2.sharma@intel.com>
References: <20260731122145.4099468-1-swati2.sharma@intel.com>
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

v2: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 10 ++++++++++
 tests/intel/kms_dsc_helper.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 9f581758f..50de12fe1 100644
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
index 542fe46de..ba616468e 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -24,6 +24,7 @@
 
 void force_dsc_enable(int drmfd, igt_output_t *output);
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
+void force_dsc_enable_compressed_bpp(int drmfd, igt_output_t *output, float compressed_bpp);
 void save_force_dsc_en(int drmfd, igt_output_t *output);
 void restore_force_dsc_en(void);
 void kms_dsc_exit_handler(int sig);
-- 
2.25.1

