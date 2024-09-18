Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C653CCD1A2
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F4A10E584;
	Wed, 18 Sep 2024 11:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys/k7glq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48410E584
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659067; x=1758195067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQbybgy/Wq4zRhv7v2VeCfEFop05VE0dtJ6TJJ6CajY=;
 b=Ys/k7glqHewm14fFcF65cy+BppXqgH5mJrXj7mBdFhI52nQUmQr7Xsc8
 54MdvQDawYAQeWFYkIXc0zc5Y5j8sZszDCgXcOBWWy7Zcoj5D0VkjE3W7
 ZqdnjD0cgszXmhzqNIZhQME9lhnqz6o02x2DlpWGxPJTgoQx07d3CYVI2
 yy4Byr4QEdzTxJmoOkZAqlTWzsxGB9lewm/H8fMbB9TKMAOoY/dIalDUV
 r0oqjGI0hB1bpP0R8o56lzNyn6Wp2S3XnaecbiLzqXdJZP3srSzrFh+SG
 zW+oHHcFdkCevxHSl8F2mOfm8x5cqCZfd3LlE6upjPkiYsUrhVWJj/QsD A==;
X-CSE-ConnectionGUID: ZEndDxoWTWKG43ZNWJtgiQ==
X-CSE-MsgGUID: BVaL+yb8QqOofq9Re3d7qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470088"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:03 -0700
X-CSE-ConnectionGUID: H59R0ol8Q26xpsV/JKGmsQ==
X-CSE-MsgGUID: a8h+JTiXR1WoYsBWltlOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972613"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:30:59 -0700
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
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 07/16] tests/xe_exec_sip: Add sanity-after-timeout
 test
Date: Wed, 18 Sep 2024 13:30:08 +0200
Message-Id: <20240918113017.144687-8-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_sip.c | 42 ++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index ea1770cd6..564c899f8 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -31,6 +31,11 @@
 
 #define SHADER_CANARY 0x01010101
 
+enum shader_type {
+	SHADER_HANG,
+	SHADER_WRITE,
+};
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -50,21 +55,32 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 	return buf;
 }
 
-static struct gpgpu_shader *get_shader(int fd)
+static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
 {
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+
+	switch (shader_type) {
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
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shader_type,
+			     unsigned int threads, unsigned int width, unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
-	struct gpgpu_shader *shader = get_shader(fd);
+	struct gpgpu_shader *shader = get_shader(fd, shader_type);
 
 	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
 	gpgpu_shader_destroy(shader);
@@ -125,8 +141,11 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: sanity
  * Description: check basic shader with write operation
  *
+ * SUBTEST: sanity-after-timeout
+ * Description: check basic shader execution after job timeout
  */
-static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
+static void test_sip(enum shader_type shader_type, struct drm_xe_engine_class_instance *eci,
+		     uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
@@ -153,7 +172,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader_type, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
@@ -186,7 +205,16 @@ igt_main
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

