Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8788CA1002
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 09:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F58E10E9CA;
	Thu,  4 Sep 2025 09:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiDq/jDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020D10E9D2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756977024; x=1788513024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/w1PmvH9gdODVzmpUYjdasfrVzKYMFlLG9p0AUFrwn0=;
 b=eiDq/jDNEy+e8emouGjMpnC8XgkwxlSb4b9NfbuECxo25BN4b7RLeg6S
 zc2SggHddldRkEnNrYdUjCJ4JIgtFpUnrJbh8EYGAlGjekXHmVDh2a8sl
 Txeq8wKDX/t5RW938c70KPcXXas0cKdUTLiEZesC4mvWdpiS4dZADB9N7
 4Q0NjCd2QOnOmXVz7BwL+LgbuXb5EOXFF5BmDKqf7l/xCkqMT9pA+xK/a
 63HbNxBWzGbYaxXXkaDWgvbZlaZcels+uufLBav2I8RjIoXq1Jl92Xsha
 qdvf8zmnrdNVJWtJCl5g9GmTiKV63WNsCDSf1PoX245WzRbc+jw8EEdH/ A==;
X-CSE-ConnectionGUID: pax+05yLSDqkG72YgMKLXQ==
X-CSE-MsgGUID: 4Pm0llVVRr+/T5X8bTNgpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58343141"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="58343141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:10:23 -0700
X-CSE-ConnectionGUID: uOfTMPHuRue54AyM4FDPCA==
X-CSE-MsgGUID: cNl0X8pmToucUNUMJRsQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="209024003"
Received: from unknown (HELO localhost) ([172.28.180.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 02:10:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] =?UTF-8?q?tests/intel/xe=5Fpm:=20Don=E2=80=99t=20fa?=
 =?UTF-8?q?il=20when=20runtime=20PM=20is=20disabled?=
Date: Thu,  4 Sep 2025 11:10:09 +0200
Message-Id: <20250904091009.1584332-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Runtime PM may be disabled (e.g. virtual functions in VMs). So far
xe_pm aborted at fixture time, preventing non-RPM subtests from running.

Introduce has_runtime_pm and require it only in RPM-dependent subtests.
Non-RPM suspend/resume tests still run, while RPM tests are skipped when
unavailable.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_pm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a3a26f62a..1db28a899 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -876,6 +876,7 @@ igt_main
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
+	bool has_runtime_pm;
 
 	const struct s_state {
 		const char *name;
@@ -915,7 +916,7 @@ igt_main
 		test_exec(device, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
-		igt_assert(igt_setup_runtime_pm(device.fd_xe));
+		has_runtime_pm = igt_setup_runtime_pm(device.fd_xe);
 		sysfs_fd = igt_sysfs_open(device.fd_xe);
 		device.res = drmModeGetResources(device.fd_xe);
 
@@ -954,6 +955,7 @@ igt_main
 
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
+				igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 				igt_assert(setup_d3(device, d->state));
 				test_exec(device, 1, 2, s->state, NO_RPM, 0);
 				cleanup_d3(device);
@@ -970,18 +972,21 @@ igt_main
 
 	for (const struct d_state *d = d_states; d->name; d++) {
 		igt_subtest_f("%s-basic", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			igt_assert(in_d3(device, d->state));
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-basic-exec", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 1, 1, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
 		igt_subtest_f("%s-i2c", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			i2c_test(device, sysfs_fd, d->state);
 			igt_assert(in_d3(device, d->state));
@@ -989,6 +994,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			test_exec(device, 16, 32, NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
@@ -997,6 +1003,7 @@ igt_main
 		igt_describe_f("Validate mmap memory mappings with system region,"
 			       "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			test_mmap(device, system_memory(device.fd_xe), 0,
 				  READ, d->state);
@@ -1008,7 +1015,10 @@ igt_main
 		igt_describe_f("Validate mmap memory mappings with vram region,"
 			     "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-vram", d->name) {
-			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+			int delay_ms;
+
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
+			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
 
 			/* Give some auto suspend delay to validate rpm active during page fault */
 			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
@@ -1026,6 +1036,7 @@ igt_main
 
 		igt_describe_f("Validate the contents of mocs registers over %s state", d->name);
 		igt_subtest_f("%s-mocs", d->name) {
+			igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 			igt_assert(setup_d3(device, d->state));
 			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
 			cleanup_d3(device);
@@ -1035,6 +1046,7 @@ igt_main
 	igt_describe("Validate whether card is limited to d3hot,"
 		     "if vram used > vram threshold");
 	igt_subtest("vram-d3cold-threshold") {
+		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
 		igt_install_exit_handler(vram_d3cold_threshold_restore);
 		test_vram_d3cold_threshold(device, sysfs_fd);
@@ -1043,7 +1055,8 @@ igt_main
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-		igt_restore_runtime_pm();
+		if (has_runtime_pm)
+			igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
 		drm_close_driver(device.fd_xe);
 	}
-- 
2.31.1

