Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D761C3065C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81AD10E6F9;
	Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzmQtyG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BDC10E70A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966339; x=1751502339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uqIPgDF9s/EpTGa9baHYIA3DE6a2ALKeZFrfXMh0iz4=;
 b=SzmQtyG+co50O0crzRBUN86Hxh9VoHMaQM1I9p/0ePv36L4KWjH35a/y
 /QYPkX1NTYakPsHGpFtJwFDVEsvIwnEZIsKRoNGJMPoTq1S815Kk50UHZ
 DYDqjiE9OTjYI+Qu0MBcIfJZayZKmFo3k144bZ9gRvR4FidB312gpISWt
 I6Y7nxc37Psoxkoi3O1WDzxXl/2W1urQNUTAMrNL9Yyr/a5lpDkEFf9R+
 KPhXbj2z5+gUcjpONxxMqVszF//WRunoFj6NHig67ueRBXbEV+FvR5k0P
 ctwL2NJ0XEBNaMJUS360/I/T/SsOX6TeBdFaik4pr6EnezyLV2+fqF8Rz g==;
X-CSE-ConnectionGUID: FYbAFnyORzKLjuWk/D/iVA==
X-CSE-MsgGUID: 49PnmhMdRb20gsywteozkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074289"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: EJr0PEEMTkC3Wtgu+hytoQ==
X-CSE-MsgGUID: tRIKhAyLS+25US67C7aFRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072892"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 10/10] tests/intel/xe_drm_fdinfo: Ensure queue
 destroy records load correctly
Date: Tue,  2 Jul 2024 17:25:32 -0700
Message-Id: <20240703002532.3156277-11-umesh.nerlige.ramappa@intel.com>
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

If the exec queue is destroyed before recording the utilization, make
sure the load is correctly captured.

v2:
- s/measured_usleep/usleep
- remove xe_ prefix from helpers/structures

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f1e06991c..b3c865757 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -70,6 +70,9 @@
  * SUBTEST: drm-parallel-busy-idle-isolation
  * Description: Check that parallel engine load does not spill over to other drm clients
  *
+ * SUBTEST: drm-busy-exec-queue-destroy-idle
+ * Description: Destroy exec queue before idle and ensure load is accurate
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -567,6 +570,32 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 		igt_assert(!percent);
 }
 
+static void
+single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
+	spin_sync_start(fd, ctx);
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+
+	/* destroy queue before sampling again */
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+
+	read_engine_cycles(fd, pceu2);
+
+	xe_vm_destroy(fd, vm);
+
+	check_results(pceu1, pceu2, hwe->engine_class, 1, TEST_BUSY);
+}
+
 static void
 single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
        unsigned int flags)
@@ -837,6 +866,10 @@ igt_main
 		xe_for_each_multi_engine(xe, hwe, count)
 			single(xe, hwe, count, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
 
+	igt_subtest("drm-busy-exec-queue-destroy-idle")
+		xe_for_each_engine(xe, hwe)
+			single_destroy_queue(xe, hwe);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.38.1

