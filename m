Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF316C02185
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F14B10E38E;
	Tue, 14 Jan 2025 15:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyr271mO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D9E10E38E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867466; x=1768403466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amskbT51pb0OXh8eVBXSUPTp8Oem46+gRT81LE6/ySc=;
 b=kyr271mOEUZiuc8/6FI4J3ZjFQe/OAwZCE4YCl6XqDR2s5Z0O479uyoq
 3QSupRMvl+K1kh1lmBw33S0YpUPUcwP4MKNQwVKBPNSm362EaDzXygaCl
 r89fqXKyKoBUILS9edVBCL0WwHMUDfK+/NEnQcvE71Yy0uaGkar8XnGoz
 VQQM94ujkGKEEsyE89VuDFW059hUYUMG28ozxSEzHesBmJ6GXwd8JBC6i
 4/GWACKOK+ivPf4l/DRdciVeY5yLBK9M7HlqMs8FEEJY+R+UrdVYK7EuL
 OfZbgQdePq82W8E7LGCIABVjiJbh6gGTK65uhfL9gOGAVQlZex4pm8OFA g==;
X-CSE-ConnectionGUID: TatVJa4STYaEiLHmB/FKoQ==
X-CSE-MsgGUID: IVsKN5geQFeOZDZ62YP2CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62540222"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="62540222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:50 -0800
X-CSE-ConnectionGUID: hSlsQFWWSA26UMkTP8hb6w==
X-CSE-MsgGUID: 7iGRVwnFTjumXUPo+OBAFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105346297"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:47 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 7/7] tests/xe_sriov_auto_provisioning: Add 'extended'
 command line option
Date: Tue, 14 Jan 2025 16:08:48 +0100
Message-Id: <20250114150848.332708-8-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

By default, a dynamic subtest is executed with a random num_vfs to limit
execution time. Add an 'extended' command line option to enable
iteration over all possible num_vfs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 40 +++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 1d2aa8624..e13eb3644 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -216,7 +216,30 @@ static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
 	igt_fail_on_f(fails, "exclusive ranges check failed\n");
 }
 
-igt_main
+static bool extended_scope;
+
+static int opts_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'e':
+		extended_scope = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "extended", .has_arg = false, .val = 'e', },
+	{}
+};
+
+static const char help_str[] =
+	"  --extended\tRun the extended test scope\n";
+
+igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
 	enum xe_sriov_shared_res res;
 	unsigned int gt;
@@ -245,6 +268,11 @@ igt_main
 
 	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
 	igt_subtest_with_dynamic("fair-allocation") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					fair_allocation(pf_fd, num_vfs);
+
 		for_random_sriov_num_vfs(pf_fd, num_vfs) {
 			igt_dynamic_f("numvfs-random") {
 				igt_debug("numvfs=%u\n", num_vfs);
@@ -255,6 +283,11 @@ igt_main
 
 	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
 	igt_subtest_with_dynamic("resources-released-on-vfs-disabling") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					resources_released_on_vfs_disabling(pf_fd, num_vfs);
+
 		for_random_sriov_num_vfs(pf_fd, num_vfs) {
 			igt_dynamic_f("numvfs-random") {
 				igt_debug("numvfs=%u\n", num_vfs);
@@ -269,6 +302,11 @@ igt_main
 
 		igt_skip_on(total_vfs < 2);
 
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					exclusive_ranges(pf_fd, num_vfs);
+
 		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
 			igt_dynamic_f("numvfs-random") {
 				igt_debug("numvfs=%u\n", num_vfs);
-- 
2.31.1

