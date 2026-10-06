Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F6ECA5FFD
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 03:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9110E08B;
	Tue,  6 Oct 2026 03:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoO8x7Ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54610E08B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 03:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791256240; x=1822792240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQWWCi5YWdXjyYfGKYKZ9G25LPlNgVfDxuHSuNMy/LM=;
 b=aoO8x7Ll/H5UCx84IaWVtmgHGg+l4cgLZj+2hVZ517ulqNNQIHabrgXN
 Vf09oPaevJcqFZYPLfdGk9aAaRNvQu3SiW+CwUwdobFXowZTzHBHL8d/9
 CNRUSQ+ZpkhkF86rQKrKsbXf4RzK5YBhxd8QiYZ29hc/WpTCFbAxAbLpO
 yZyBS1kyzeY9T0IhwQynq8+kuiEB4Emg1DAZkq8/UEAJnhA4+R3kyXlxF
 g0b2SDFrFcnHijdi7qlG1hbHVjxqfk/q5vmaYulaO8pUI7klD6vE0ed1R
 UrNzY97g4gdPR2eec12ciU0q+8U86yiNWptGlmxdH6uXScikjCtpOBMpq w==;
X-CSE-ConnectionGUID: +nNI8emaRuassCBHRSG7jQ==
X-CSE-MsgGUID: w9/e4iVhSqeSbVv+ZE5RaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91147990"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="91147990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:10:40 -0700
X-CSE-ConnectionGUID: rIuuKeS0QoSxChb7sVokAg==
X-CSE-MsgGUID: wfNUm5SRSrKTZtRqpfPPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="306504898"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 20:10:39 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Date: Tue,  6 Oct 2026 03:10:30 +0000
Message-ID: <20261006031031.30938-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
References: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add a new test to exercise the following functions in
xe_pxp_debugfs.c:

- pxp_status_to_str()
- pxp_info()

The subtest verifies the expected debugfs output and
improves code coverage.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pxp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 5460bf6db..4c3c9ac97 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -506,6 +506,19 @@ static void trigger_pxp_debugfs_forced_teardown(int xe_fd)
 	sleep(1);
 }
 
+static void read_pxp_debugfs_info(int xe_fd)
+{
+	char str[256];
+	int ret;
+	int fd;
+
+	fd = igt_debugfs_dir(xe_fd);
+	igt_assert(fd >= 0);
+
+	ret = igt_debugfs_simple_read(fd, "pxp/info", str, sizeof(str));
+	igt_assert_f(ret >= 0, "Can't read pxp info debugfs\n");
+}
+
 enum termination_type {
 	PXP_TERMINATION_IRQ,
 	PXP_TERMINATION_RPM,
@@ -762,6 +775,11 @@ static void test_pxp_stale_queue_execution(int fd, enum termination_type type)
  * Description: verify that submssions with stale objects/queues are not blocked
  *              if the user does not opt-in to the PXP checks.
  */
+
+/**
+ * SUBTEST: pxp-debugfs-info
+ * Description: Verify reading of the PXP debugfs info entry.
+ */
 static void test_pxp_optout(int fd)
 {
 	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false);
@@ -1157,6 +1175,11 @@ int igt_main()
 			require_pxp(pxp_supported);
 			test_pxp_optout(xe_fd);
 		}
+
+		igt_subtest("pxp-debugfs-info") {
+			require_pxp(pxp_supported);
+			read_pxp_debugfs_info(xe_fd);
+		}
 	}
 
 	igt_subtest_group() {
-- 
2.43.0

