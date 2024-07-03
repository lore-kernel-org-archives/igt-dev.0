Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF73C3DA41
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B4610E71B;
	Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpghlFIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A119310E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966339; x=1751502339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qJoHu+U8PoAl+UNRVnMztRKjGNzSQhKUxZo5oASjikc=;
 b=NpghlFIwREG3nOIO5J7021cQaWIKaQmun3PpadgwNOa+aKM2NT/TdtRa
 +++BM1DGkZkR6BgJ9Q8+YKVFEfv2Wf2fGTaoDUA9xA/jD0aVDHuwuaacr
 pQaGoQJJZegaWDoyPUj8ZgWxX9Fn2bFCNigXvrQVGJGF15xILPaFQ9ePg
 cGnj6SsM/oJy83ZMgGlntSnBIEZQurTsUx4ncVQ/dELDRnOIg2cz4Gb67
 tQgFE38g41wReJP5na6HdSPryGdJCpG38zSBZhL79Cseoo+jnRus7ouJT
 eCQiQQEYeGOJ6byRQgs3JXuTtRqYXNCkCAaL5zyYgmBNvDXxaVnknTUVk Q==;
X-CSE-ConnectionGUID: DyZLqRP/Tey24OZnToE6Ew==
X-CSE-MsgGUID: 0ayJf12uRu+yPWt7bf/oSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074287"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: mgGNvkU/STCGVWgc7q1KyA==
X-CSE-MsgGUID: 2VvWTQonQGCNZWHprDVehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072885"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 08/10] tests/intel/xe_drm_fdinfo: Add tests for
 virtual engines
Date: Tue,  2 Jul 2024 17:25:30 -0700
Message-Id: <20240703002532.3156277-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Add tests to verify utilization on virtual engines.

v2:
- s/measured_usleep/usleep
- Remove xe_ prefix from helpers/structures
- Remove ISOLATION case for multi_all_busy_check_all

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 71 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9d3d1b285..5a3cd776c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -46,6 +46,18 @@
  * SUBTEST: drm-all-busy-idle-check-all
  * Description: Check that all engines show busy when all are loaded
  *
+ * SUBTEST: drm-virtual-idle
+ * Description: Check that virtual engines show no load when idle
+ *
+ * SUBTEST: drm-virtual-busy-idle
+ * Description: Check that virtual engines show load when idle after busy
+ *
+ * SUBTEST: drm-virtual-all-busy-idle-check-all
+ * Description: Check that all virtual engines show busy when loaded
+ *
+ * SUBTEST: drm-virtual-busy-idle-isolation
+ * Description: Check that virtual engine load does not spill over to other drm clients
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -695,10 +707,52 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 	xe_vm_destroy(fd, vm);
 }
+
+static void
+multi_all_busy_check_all(int fd, unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *hwe;
+	int count, class;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		xe_for_each_multi_engine(fd, hwe, count) {
+			class = hwe->engine_class;
+			ctx[class] = spin_ctx_init(fd, hwe, vm,
+						      1,
+						      count);
+			spin_sync_start(fd, ctx[class]);
+		}
+	}
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE) {
+		xe_for_each_multi_engine(fd, hwe, count) {
+			spin_sync_end(fd, ctx[hwe->engine_class]);
+		}
+	}
+	read_engine_cycles(fd, pceu2);
+
+	xe_for_each_multi_engine(fd, hwe, count) {
+		class = hwe->engine_class;
+		check_results(pceu1, pceu2, class,
+			      1,
+			      flags);
+		spin_sync_end(fd, ctx[class]);
+		spin_ctx_destroy(fd, ctx[class]);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
-	int xe;
+	int xe, count;
 
 	igt_fixture {
 		struct drm_client_fdinfo info = { };
@@ -740,6 +794,21 @@ igt_main
 	igt_subtest("drm-all-busy-idle-check-all")
 		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
 
+	igt_subtest("drm-virtual-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, 0);
+
+	igt_subtest("drm-virtual-busy-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-virtual-all-busy-idle-check-all")
+		multi_all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-virtual-busy-idle-isolation")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.38.1

