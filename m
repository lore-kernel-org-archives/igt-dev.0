Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AF6C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 18:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E010E155;
	Fri, 23 Aug 2024 18:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enD8St6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF5310E820
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724437396; x=1755973396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42P58ya9UBxNppWbiwLdAspWG2Jsw5mqpGUIQmMs6og=;
 b=enD8St6IHeuwKGVfnpJK79fsLla8rmKfMUcgaDkn7axvr/908TXKasHj
 lUO2j2b1ospxz6duNOavpe1E9tNHch6ozNgjt1dJ7aZsMzAW3HlC/G/2I
 y4gujOrMOeqh9iZ5CKOr3H4GAomcADdcam79I5wSo9D5lstwFuNTIgkJq
 RY2OkQFeJ8VW6BXVOydseiveWQnbv4JVSAaN/B0/6UBxhRv9XT70IcPKu
 jTarwLRxYZYOCopgEyi/jLswGqbtZ76TvVTWsRQXLu2ZEotbVVnlyKKB3
 13J5mxQTr+gVDeLd5mmLnqhybycYApcgVNlWua4xnwrXWMznfeSGrF8cI Q==;
X-CSE-ConnectionGUID: aiF1bjA1Tm2ml24IwYaB2w==
X-CSE-MsgGUID: PU7BCBA4Rxy2ryqqE5qWtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34079289"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34079289"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:16 -0700
X-CSE-ConnectionGUID: 1bOSL9l7Q3aK93HVhY+irQ==
X-CSE-MsgGUID: Bwidobl0SmWDTOj9GDvJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92606110"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:12 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 09/17] tests/xe_exec_sip: Add sanity-after-timeout
 test
Date: Fri, 23 Aug 2024 20:22:14 +0200
Message-Id: <20240823182222.305965-10-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823182222.305965-1-christoph.manszewski@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
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

Add a subtest that checks if we are able to submit workloads after gpu
was reset due to hung job.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_exec_sip.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index ea1770cd6..5d57d2c78 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -31,6 +31,9 @@
 
 #define SHADER_CANARY 0x01010101
 
+#define SHADER_HANG 0
+#define SHADER_WRITE 1
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -50,21 +53,32 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 	return buf;
 }
 
-static struct gpgpu_shader *get_shader(int fd)
+static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 {
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+
+	switch (shadertype) {
+	case SHADER_HANG:
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__jump(shader, 0);
+		break;
+	case SHADER_WRITE:
+		break;
+	}
+
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
-static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
-			     unsigned int width, unsigned int height)
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
+			     unsigned int threads, unsigned int width, unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
-	struct gpgpu_shader *shader = get_shader(fd);
+	struct gpgpu_shader *shader = get_shader(fd, shadertype);
 
 	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
 	gpgpu_shader_destroy(shader);
@@ -125,8 +139,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: sanity
  * Description: check basic shader with write operation
  *
+ * SUBTEST: sanity-after-timeout
+ * Description: check basic shader execution after job timeout
  */
-static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
+static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
@@ -153,7 +169,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
@@ -186,7 +202,16 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
-		test_sip(eci, 0);
+		test_sip(SHADER_WRITE, eci, 0);
+
+	test_render_and_compute("sanity-after-timeout", fd, eci) {
+		test_sip(SHADER_HANG, eci, 0);
+
+		xe_for_each_engine(fd, eci)
+			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				test_sip(SHADER_WRITE, eci, 0);
+	}
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1

