Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E8BC28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 17:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FF310E64D;
	Tue, 11 Mar 2025 17:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+0AQGuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF9010E64D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741713137; x=1773249137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KLY60c8d/1SMU7oW37u068VYzKj5IEx/+JOpzGoa33Y=;
 b=Z+0AQGufte71yZCFtqd0Zc/LsHIYBk7xsFCtuKv3EcPnU7bJPQ3AOHbV
 ToDAh8KY3umaJGqeMVKU2eaXWUGoAE4CxgkMwmXBhKLDxmDBGLwBQbeBB
 Vl1veTKXy1NqrffUW5s3Cag5sIYMcg3l3uFYInss4VkOGmW6sQOfaEE8V
 7slQz0tiiX4oTuxRcGVqkKWbDkNIonfJp443oJv6CpkBIJs1tBrDReJOl
 KnHKCUy9PLMz1AVVT4pjKdQVmHFvwMo7+SZEaKNuJWn7t+GLLk0V68GDF
 /5xvrwGQt6gzIKHtqEcoFPg9TQU/TgfL87Y1pc5oqrY1AaJl99E/p4oPc Q==;
X-CSE-ConnectionGUID: g3seRALDTq+Umjgosp3syg==
X-CSE-MsgGUID: Ma9IHLwrSrSIs21cOuFC3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60312224"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="60312224"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:12:17 -0700
X-CSE-ConnectionGUID: qYzyLE92TdObiS6OApSnuA==
X-CSE-MsgGUID: 9k7EUkbtS5GJd9ZtnBp7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120325728"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:12:14 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add a check for power management
 capability
Date: Tue, 11 Mar 2025 17:01:44 +0000
Message-Id: <20250311170144.602535-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
References: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
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

Add a check for power management capability of device tested in tests
related to D-states. Currently if test is started on configuration
that does not support the PM capability it doesn't skip, instead
depending on test it may fail, abort or timeout.
With this change test will skip with a clear message why it did.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_pm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..25fc7bc9f 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -854,6 +854,8 @@ igt_main
 
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
+				igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 				igt_assert(setup_d3(device, d->state));
 				test_exec(device, 1, 2, s->state, NO_RPM, 0);
 				cleanup_d3(device);
@@ -870,18 +872,24 @@ igt_main
 
 	for (const struct d_state *d = d_states; d->name; d++) {
 		igt_subtest_f("%s-basic", d->name) {
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			igt_assert(setup_d3(device, d->state));
 			igt_assert(in_d3(device, d->state));
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-basic-exec", d->name) {
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
@@ -890,6 +898,8 @@ igt_main
 		igt_describe_f("Validate mmap memory mappings with system region,"
 			       "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			igt_assert(setup_d3(device, d->state));
 			test_mmap(device, system_memory(device.fd_xe), 0,
 				  READ, d->state);
@@ -903,6 +913,8 @@ igt_main
 		igt_subtest_f("%s-mmap-vram", d->name) {
 			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
 
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
 			igt_assert(setup_d3(device, d->state));
@@ -919,6 +931,8 @@ igt_main
 
 		igt_describe_f("Validate the contents of mocs registers over %s state", d->name);
 		igt_subtest_f("%s-mocs", d->name) {
+			igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 			igt_assert(setup_d3(device, d->state));
 			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
 			cleanup_d3(device);
@@ -928,6 +942,8 @@ igt_main
 	igt_describe("Validate whether card is limited to d3hot,"
 		     "if vram used > vram threshold");
 	igt_subtest("vram-d3cold-threshold") {
+		igt_require_f(igt_is_pm_supported(device.pci_root),
+								"PCI power management capability not found\n");
 		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
 		igt_install_exit_handler(vram_d3cold_threshold_restore);
 		test_vram_d3cold_threshold(device, sysfs_fd);
-- 
2.34.1

