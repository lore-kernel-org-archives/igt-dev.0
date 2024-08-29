Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B615C83F2D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0810E6CC;
	Thu, 29 Aug 2024 14:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYydAddg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BA610E6CC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942797; x=1756478797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/DswoKMpQ51BRynkbCjub8Ge/Xu4vwtRPKDFKG54k2M=;
 b=lYydAddgtVieHRxODQKbsgtpqHxB3EVwsE5b/Jo8t5Bqa72GbAd+fbfe
 n+MmuFqvoxwiRA29sRiqPLZJyUmt+iov7xw31EXp2fbl1frkrxtj+9qRN
 S6wcPDgj6WcOQIB6AbKPIEYcLBD+ndvzuAcCzN1CeuhjvWJmS2xNtg771
 M2V91onI9PiEKlBNpOe0QS1J/mCfW/p2rGaSR1W1QZKn8vOD9Wl/k0hmW
 7v16mZRzWh1HUNwtyEQVQ6bvm78HHoEmYxxJrlYs4VYsFlIFPTFARKBu3
 13/MnLgRWrxqUZImMxjcYGWXg2uk9bh5/fA3470UjrMPC6Guu3gSNRKNE g==;
X-CSE-ConnectionGUID: 2WOk22boRzGXpJXvTXsm6A==
X-CSE-MsgGUID: c4+VwsYVRDG0IRz6zIzNBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947591"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947591"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:37 -0700
X-CSE-ConnectionGUID: kDmtqlzYQtKS4fj8f9ZkQw==
X-CSE-MsgGUID: nSeTmb7iTxW9CoykZ+fWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64304097"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:33 -0700
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
Subject: [PATCH i-g-t v5 08/17] tests/xe_exec_sip: Add sanity-after-timeout
 test
Date: Thu, 29 Aug 2024 16:45:38 +0200
Message-Id: <20240829144547.105371-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144547.105371-1-christoph.manszewski@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
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
 tests/intel/xe_exec_sip.c | 41 ++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index ea1770cd6..3b46f5618 100644
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
@@ -125,8 +141,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
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
@@ -153,7 +171,7 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
@@ -186,7 +204,16 @@ igt_main
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

