Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D7C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3990410E42F;
	Mon, 29 Jul 2024 16:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8hxh3kW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A310E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269067; x=1753805067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+2sM4NWPX2uU2yUw0y99a8w+PgaJvWWYiUFp1O5E7VI=;
 b=A8hxh3kWOyXAc532kvl1fCF95sbFtAGlxLuTwG7lJk8sCjShYgCE1zEv
 LtJlELXBEUM55tSOy8/RHb3XOeN+lXqXaCQ+EHoGKqoMKQF0k8tHwMf9Q
 ZovPkezJGWxHHkuUDh1McK6t0MfhWyQR96FV92gnNDMYe3rW05lmcdbu5
 TT7CmnjzSAtvBRxydjPzcnWcgCCRG8YSQ12QvKKAyVKkwS15kSSqI1nd2
 81IFJia2cWSO6SgJcbJ4OS8J2zF5ivAM/MGHDF6+wu02O8oVMCO3HJKgO
 DD0gH5j5QQVk4LAxcmhXem4rl4jophw0S/qDFDk1+I9K64TLrmeHDnV+2 w==;
X-CSE-ConnectionGUID: JwpPq9b+Tlu0fY9GwvTBkA==
X-CSE-MsgGUID: WqjFm61nQbi1K1ftWxUv5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427250"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:25 -0700
X-CSE-ConnectionGUID: hSH20k3KQl+0X5QWuqY97g==
X-CSE-MsgGUID: INJPGSTrQA2b9SE3LnigNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738763"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:22 -0700
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
Subject: [PATCH 39/66] tests/xe_exec_sip: Check if we reset due to unhandled
 attention
Date: Mon, 29 Jul 2024 18:01:32 +0200
Message-Id: <20240729160159.37036-40-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Add breakpoint-waitsip test which checks whether we reset upon
unhandled attention.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_exec_sip.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index e52889818..1b0accb3b 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -40,6 +40,7 @@
 #define SHADER_WAIT 2
 #define SIP_WRITE 3
 #define SIP_NULL 4
+#define SIP_WAIT 5
 
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
@@ -97,7 +98,9 @@ static struct gpgpu_shader *get_sip(int fd, const int siptype,
 	switch (siptype) {
 	case SIP_WRITE:
 		break;
-	/* TODO: Add alternative SIP instructions here */
+	case SIP_WAIT:
+		gpgpu_shader__wait(sip);
+		break;
 	}
 
 	gpgpu_shader__end_system_routine(sip, shadertype == SHADER_BREAKPOINT);
@@ -211,12 +214,20 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: breakpoint-writesip
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
+ * SUBTEST: breakpoint-waitsip
+ * Description: Test that we reset after seeing the attention without the debugger.
+ *
  */
 static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
 	unsigned int width = WIDTH;
+	struct drm_xe_ext_set_property ext = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
+		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
+	};
 	struct timespec ts = { };
 	uint32_t exec_queue_id, handle, vm_id;
 	struct intel_bb *ibb;
@@ -228,6 +239,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	fd = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd);
 
+
 	vm_id = xe_vm_create(fd, 0, 0);
 
 	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
@@ -235,7 +247,9 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	timeout *= NSEC_PER_MSEC;
 	timeout *= igt_run_in_simulation() ? 10 : 1;
 
-	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci, 0);
+	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
+					     has_debugger(fd) ?
+					     to_user_pointer(&ext) : 0);
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
@@ -292,6 +306,9 @@ igt_main
 
 		test_render_and_compute("breakpoint-writesip", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci);
+
+		test_render_and_compute("breakpoint-waitsip", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci);
 	}
 
 	igt_fixture
-- 
2.34.1

