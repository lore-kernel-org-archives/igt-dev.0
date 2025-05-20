Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36879C54E92
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA5E10E5C5;
	Tue, 20 May 2025 23:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1fTBiKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA6910E588
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783263; x=1779319263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q7+85eFfMnZOqCjfjqprR2f9ItSljENp8/G2hC4pUWc=;
 b=R1fTBiKLtGvAxyZhUCjbyvRJeJYr5JvSa1j9dIQ7TJhnMi95DSqZGfLX
 7t7hNk0bcN9G0mgKFT1VnPHZbH0YmX2qcAjB4IscpVl3rSteTkw5XW/zr
 aIWINDERxaPYNt1rVcJTvFHWSnIGbViSKtbHA44YLD2FAdVduKslhfif1
 agw0+Vy0NcA4G99xvkn9v5zp5iIq4h9UOFPikSEjue+QLnxD0mmUgtP+Q
 O/AjpJHhD5u+OdGDGla2X21BEv0rjcyKuZRu1opJdlzHb1N+uxdJRuyUF
 Ck+JulPNtYphYL1G+4Parys6et5dtuEhbvHerVhPVTnFzoE/kEFPPNOM0 w==;
X-CSE-ConnectionGUID: oN9x6brDRLSOTn5toPeKTQ==
X-CSE-MsgGUID: v4Uf5EW0RbOgxeQepA/MXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875550"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:01 -0700
X-CSE-ConnectionGUID: tEyJhIy2RFaIZJ3/7hRoxQ==
X-CSE-MsgGUID: pXLLGgDfRDuOk4SAvofoKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145095712"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH i-g-t 4/4] tests/intel/xe_drm_fdinfo: Test utilization while
 load is active
Date: Tue, 20 May 2025 16:20:32 -0700
Message-ID: <20250520232027.351497-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
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

Add a test to check if fdinfo returns the correct ticks when querying
utilization for a context that is currently active on the engine.

v2: Use a specific flag for this test (Lucas)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index ec439ce7a6d2..ad7b45b1789c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -48,6 +48,9 @@
  * SUBTEST: utilization-single-full-load
  * Description: Check that each engine shows full load
  *
+ * SUBTEST: utilization-single-full-load-while-active
+ * Description: Check that each engine shows full load whle active
+ *
  * SUBTEST: utilization-single-full-load-isolation
  * Description: Check that each engine load does not spill over to other drm clients
  *
@@ -70,6 +73,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 /* flag masks */
 #define TEST_WITH_LOAD		(1 << 0)
+#define TEST_WHILE_ACTIVE	(1 << 0)
 #define TEST_ISOLATION		(1 << 2)
 #define TEST_VIRTUAL		(1 << 3)
 #define TEST_PARALLEL		(1 << 4)
@@ -454,12 +458,15 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		read_engine_cycles(new_fd, pceu1[1]);
 
 	usleep(batch_duration_usec);
-	end_cork(fd, cork);
+	if (!(flags & TEST_WHILE_ACTIVE))
+		end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu2[1]);
 
+	end_cork(fd, cork);
+
 	expected_load = flags & TEST_WITH_LOAD ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
 
@@ -691,7 +698,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		read_engine_cycles(fd_spill, pceu_spill[0]);
 
 	usleep(batch_duration_usec);
-	end_cork(fd, cork);
+	if (!(flags & TEST_WHILE_ACTIVE))
+		end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
@@ -768,6 +776,13 @@ igt_main
 			utilization_single(xe, hwe, 0);
 	}
 
+	igt_subtest("utilization-single-full-load-while-active") {
+		require_engine_utilization_data(xe);
+		xe_for_each_engine(xe, hwe)
+			utilization_single(xe, hwe,
+					   TEST_WITH_LOAD | TEST_WHILE_ACTIVE);
+	}
+
 	igt_subtest("utilization-single-full-load") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-- 
2.43.0

