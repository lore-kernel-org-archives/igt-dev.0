Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8393CD4F5F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F99910E806;
	Thu,  5 Sep 2024 09:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcFr0gqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D4010E806
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528538; x=1757064538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eQbybgy/Wq4zRhv7v2VeCfEFop05VE0dtJ6TJJ6CajY=;
 b=EcFr0gqp7HCDM1CbpByaMr91HO+0gQbOtD9diP8rPZs8AewA/GwON7gW
 X30eYo7GAk8vMDa9TBJCdUmiNCCljyoVDt2iGekMzeEu1WjEAru0Slzw3
 FNzgWitc629igKUjwM40e9RPmqELv2dGZC/tf5L80xGMiXCG1VnW4+u0x
 kXYh6B/uH0J5wopHw0Z1EZp8YL1Z3M+jTK4pn6ToxhpGBnWZqBAxk81kq
 zw3Aq78+A0/bgUEQYkKgit6nFho4wSd+o0eTKUvlb2Kqw/N7TRha+Jj9p
 5/kbn4nvfc07qZVmv9KDXDhIxTqJ8mr2PtkAgYvqo8AHTlZLUuaZ02uto g==;
X-CSE-ConnectionGUID: Y9jGSnNtSfeBfSlA5z90Dg==
X-CSE-MsgGUID: IXyiulKFSv67RfQFD4Ahgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590261"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:57 -0700
X-CSE-ConnectionGUID: yoY3Cf2KTsmPvJkKJf+CPA==
X-CSE-MsgGUID: AR64ZgwuTb2yGJoc4JknBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404830"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:53 -0700
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
Subject: [PATCH i-g-t v6 08/17] tests/xe_exec_sip: Add sanity-after-timeout
 test
Date: Thu,  5 Sep 2024 11:28:03 +0200
Message-Id: <20240905092812.94553-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

