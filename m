Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D65C88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98E210E1F5;
	Fri, 11 Sep 2026 21:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5h4ktzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B0410E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160291; x=1820696291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZJQ5atJg8SIFzeCzMGc75UVRZm9Wavr6vsoTHEW68EI=;
 b=R5h4ktztudw+Pabr3sOV68SAXdOsIlpsN2+6FA4BWrLktnh/emTD97Yy
 en8yoEK15vHTz6ji6GeE7UOAPdrArXeY8OKb1GVjZz50bqfF/hJnCuFew
 8wmJ5fIct1Dm/T54OnOYm+T/wqd4NLNfQkruhh1fWxTg5eTYRCbvx/DNH
 DVTuWS6Ph+SCt2a+9Z5Bqi47+knfln/7RyyUmCzDtfB7Bxn5g62tm8DA2
 Qlc/ZPlERYPm1nfM3J7Iip8y8AGY6iZfv4bDzb/q2/g7x2NuT0ELsMi3c
 nFPQsGPP+iTmk7POQwhpy44MDClLDhJD4vasVmzmSZ1e+4hz47tAg2pvF Q==;
X-CSE-ConnectionGUID: lu00txO4RYGd/LiIjlZRzQ==
X-CSE-MsgGUID: J7vnczGAT7GSBKMTJ9x2OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138959"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:10 -0700
X-CSE-ConnectionGUID: 6FXNnp4pT4O1rPkXo43xVw==
X-CSE-MsgGUID: 7ay6q7RRSeu0pdhVBdw7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293678"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 2/9] tests/intel/kms_dsc_helper: Add helper to force compressed BPP
Date: Sat, 12 Sep 2026 02:37:02 +0530
Message-Id: <20260911210709.943683-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

