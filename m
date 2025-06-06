Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6DBC5B559
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248EA10EA3D;
	Fri,  6 Jun 2025 09:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myiPRWaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58610EA3D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749203178; x=1780739178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NLz+bCXYxmUMGBBNPUM33RQDq3SN+DbdpgzqhlaPuC0=;
 b=myiPRWaQIfrApf77c+5+fvgC3BzCjZT8IEqZBuda1IGFkjHO9DIeJGvx
 ouO88ETJxNka45aad80kLC8KdZLmP0CQPrq4jKerNL75c4Kj7l/svEQRy
 UTxS1sohvLFw7djgtb5aPpff81SN1jlG70JSHp6Mf1bVeHrOb066P1NvZ
 PTB3T7sTlXdNElJ9Sv2dD5BhSL3H2Dg47Rbv670mKjpKySOxw2hGsyIPK
 gg2VWnXF5RQ/ECdTeju6xb2XI+Z5ij8ZCgylqOCgk2gJj208ibA7ulz90
 C0qb7XvNOhfM/xKN3UgM+jTMgHBSpnpbzXfAtyKSrrmq/GC4td0Wf+yu3 A==;
X-CSE-ConnectionGUID: t76vLAY4RqGIi+BtbfqZig==
X-CSE-MsgGUID: WYZkDTvPTbmtd+m7H/H14Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62745045"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="62745045"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:18 -0700
X-CSE-ConnectionGUID: TYokp0YPQv6H/40naR7Gwg==
X-CSE-MsgGUID: XNSTPXPCRIGJDvLJSSFI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182974825"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 5/5] tests/intel/xe_pmu: Add multi client engine
 activity test
Date: Fri,  6 Jun 2025 15:40:08 +0530
Message-ID: <20250606101008.1949955-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250606101008.1949955-1-riana.tauro@intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by opening multiple
PMU clients and check that they do not interfere with
each other

v2: use macro and use struct (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 512e43fcc..aa57108a2 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -49,6 +49,10 @@
  * SUBTEST: engine-activity-suspend
  * Description: Test to validate engine activity on all engines before and after s2idle
  *
+ * SUBTEST: engine-activity-multi-client
+ * Description: Test to validate engine activity with multiple PMU clients and check that
+ *		they do not interfere with each other
+ *
  * SUBTEST: engine-activity-after-load-start
  * Description: Validates engine activity when PMU is opened after load started
  *
@@ -632,6 +636,62 @@ static void engine_activity_load_start(int fd, struct drm_xe_engine_class_instan
 	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
 }
 
+static void engine_activity_multi_client(int fd, struct drm_xe_engine_class_instance *eci)
+{
+#define NUM_CLIENTS 2
+	struct pmu_client {
+		uint64_t before[2];
+		uint64_t after[2];
+		int pmu_fd[2];
+	} client[NUM_CLIENTS];
+	uint64_t ahnd, config, engine_active_ticks, engine_total_ticks;
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int i = 0;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	for (i = 0; i < NUM_CLIENTS; i++) {
+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+		client[i].pmu_fd[0] = open_group(fd, config, -1);
+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+		client[i].pmu_fd[1] = open_group(fd, config, client[i].pmu_fd[0]);
+	}
+
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+	xe_cork_sync_start(fd, cork);
+
+	for (i = 0; i < NUM_CLIENTS; i++)
+		pmu_read_multi(client[i].pmu_fd[0], 2, client[i].before);
+
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+
+	for (i = 0; i < NUM_CLIENTS; i++)
+		pmu_read_multi(client[i].pmu_fd[0], 2, client[i].after);
+
+	end_cork(fd, cork);
+	xe_cork_destroy(fd, cork);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	for (i = 0; i < NUM_CLIENTS; i++) {
+		engine_active_ticks = client[i].after[0] - client[i].before[0];
+		engine_total_ticks = client[i].after[1] - client[i].before[1];
+
+		igt_debug("Client %d: Engine active ticks:  after %ld, before %ld delta %ld\n",
+			  i + 1, client[i].after[0], client[i].before[0], engine_active_ticks);
+
+		igt_debug("Client %d Engine total ticks: after %ld, before %ld delta %ld\n",
+			  i + 1, client[i].after[1], client[i].before[1], engine_total_ticks);
+
+		close(client[i].pmu_fd[0]);
+		close(client[i].pmu_fd[1]);
+
+		assert_within_epsilon(engine_active_ticks, engine_active_ticks, tolerance);
+	}
+}
+
 static void test_gt_c6_idle(int xe, unsigned int gt)
 {
 	int pmu_fd;
@@ -913,6 +973,10 @@ igt_main
 	test_each_engine("engine-activity-after-load-start", fd, eci)
 		engine_activity_load_start(fd, eci);
 
+	igt_describe("Validate multiple PMU clients do not interfere with each other");
+	test_each_engine("engine-activity-multi-client", fd, eci)
+		engine_activity_multi_client(fd, eci);
+
 	igt_subtest_group {
 		int render_fd;
 
-- 
2.47.1

