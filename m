Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A68C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D281D10E700;
	Thu, 29 May 2025 06:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfnyFoj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B7F10E700
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748500214; x=1780036214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IUlLEw1Vtd1JAPZ6XYisyhXg3qMTnzDnTRLzy7dws80=;
 b=NfnyFoj1AoA/Te6VgMeDSwG1jg5X3I6wUd2RI68hIcGygcUxQob01GU4
 2DQtzW1R2ghQB8AvfbGRkg+53XCPq2hmEH/E2Z/syoJcuYfY9v4KIHaSt
 41pnjO+5B4QnLyDMgEUf3EtqoNb1qwgeY/kguNMJ+KD31+YeRqv8aBndG
 uM75YCpHwgtKHVYPCK5aqqAK/7V5ePdhOsY1cXPcEc6vkss0wtMGOHykN
 sYMD5vsULIGmEWIct4pPZUwtzEocOopklWiul7/6/+UqALZb/N2tXihoD
 5wUIUkG/uavbfEU95sxjrAMKBHz51iXeuEHSzaaB8jSDobozxXx6D3xV+ A==;
X-CSE-ConnectionGUID: OKcy6ht/RF2VxkQf5R33kg==
X-CSE-MsgGUID: OSAJX3VtTSmak2wb4xbJEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54210933"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54210933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:14 -0700
X-CSE-ConnectionGUID: 5bKKifqHSfOY3ZAka4OizQ==
X-CSE-MsgGUID: MDWtUgcTTzqqmu/60/WI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174347353"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v2 4/4] tests/intel/xe_pmu: Add multi client engine
 activity test
Date: Thu, 29 May 2025 12:23:59 +0530
Message-ID: <20250529065359.915117-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529065359.915117-1-riana.tauro@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 21b294167..225b3b42e 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -46,6 +46,10 @@
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
@@ -612,6 +616,58 @@ static void engine_activity_load_start(int fd, struct drm_xe_engine_class_instan
 	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
 }
 
+static void engine_activity_multi_client(int fd, struct drm_xe_engine_class_instance *eci,
+					 int num_clients)
+{
+	uint64_t before[num_clients][2], after[num_clients][2], pmu_fd[num_clients][2];
+	uint64_t ahnd, config, engine_active_ticks, engine_total_ticks;
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int i = 0;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	for (i = 0; i < num_clients; i++) {
+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+		pmu_fd[i][0] = open_group(fd, config, -1);
+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+		pmu_fd[i][1] = open_group(fd, config, pmu_fd[i][0]);
+	}
+
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+	xe_cork_sync_start(fd, cork);
+
+	for (i = 0; i < num_clients; i++)
+		pmu_read_multi(pmu_fd[i][0], 2, before[i]);
+
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+
+	for (i = 0; i < num_clients; i++)
+		pmu_read_multi(pmu_fd[i][0], 2, after[i]);
+
+	end_cork(fd, cork);
+	xe_cork_destroy(fd, cork);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	for (i = 0; i < num_clients; i++) {
+		engine_active_ticks = after[i][0] - before[i][0];
+		engine_total_ticks = after[i][1] - before[i][1];
+
+		igt_debug("Client %d: Engine active ticks:  after %ld, before %ld delta %ld\n",
+			  i + 1, after[i][0], before[i][0], engine_active_ticks);
+
+		igt_debug("Client %d Engine total ticks: after %ld, before %ld delta %ld\n",
+			  i + 1, after[i][1], before[i][1], engine_total_ticks);
+
+		close(pmu_fd[i][0]);
+		close(pmu_fd[i][1]);
+
+		assert_within_epsilon(engine_active_ticks, engine_active_ticks, tolerance);
+	}
+}
+
 static void test_gt_c6_idle(int xe, unsigned int gt)
 {
 	int pmu_fd;
@@ -889,6 +945,10 @@ igt_main
 	test_each_engine("engine-activity-after-load-start", fd, eci)
 		engine_activity_load_start(fd, eci);
 
+	igt_describe("Validate multiple PMU clients do not interfere with each other");
+	test_each_engine("engine-activity-multi-client", fd, eci)
+		engine_activity_multi_client(fd, eci, 2);
+
 	igt_subtest_group {
 		int render_fd;
 
-- 
2.47.1

