Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA6ACA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561210E509;
	Thu,  8 Oct 2026 05:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA9CQdQH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8555910E509
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 05:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791437098; x=1822973098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T7zeVudB+Cagdp7HE/cZX/sH4I5C9WEw+4W57tQOxi8=;
 b=CA9CQdQHnA4LzRpE300/w3CAXq+TQBvD6k+cOm1Y57DQqssxOY9n11+2
 n66otkyPgXWGs5Nxgau2owKIy09PU9GzfqWMlrXW/weFzn+sy+eHzwL/m
 HVJo6Is6Snu2xJQeXLvHOS1Fako/Lnw8yqovo9g4WKS7iu6a+2wk0jDXL
 6D+9SmCfdJ4jgYj0m4HgUiBsHoZPoUWUpqpqNZQSAcFmPCdC+fE8z5+am
 KzKf/3Jbt1aZbmfSYE1Oi1xv6MeFfVUeCQW1eVyWpW/PG6gEwRn6gyPfy
 AuZWYq0BMF6YbwD6kTtrNzsFZ0qhBTbbUFZKwegJJ8bsJYd/kpI7axYgg Q==;
X-CSE-ConnectionGUID: /2FmJ1ygTj6A9obOlKp+XQ==
X-CSE-MsgGUID: w3t8TLsnQgCZiXm5GPSe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="214859"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="214859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 22:24:58 -0700
X-CSE-ConnectionGUID: wtKVzHgeQ5yEH/SG5MoQQg==
X-CSE-MsgGUID: A8ke8RA0R6y3lN63/tt40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="22527"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 22:24:57 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: daniele.ceraolospurio@intel.com, priyanka.dandamudi@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Date: Thu,  8 Oct 2026 05:24:50 +0000
Message-ID: <20261008052450.42805-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
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

The subtest verifies that the pxp/info debugfs entry can be
read successfully and improves code coverage.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pxp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 5460bf6db..76a3939c0 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -506,6 +506,28 @@ static void trigger_pxp_debugfs_forced_teardown(int xe_fd)
 	sleep(1);
 }
 
+/**
+ * SUBTEST: pxp-debugfs-info
+ * Description: Verify reading of the PXP debugfs info entry.
+ */
+
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
+	igt_assert_f(ret > 0, "Can't read pxp info debugfs\n");
+
+	igt_info("pxp info:\n%s\n", str);
+
+	close(fd);
+}
+
 enum termination_type {
 	PXP_TERMINATION_IRQ,
 	PXP_TERMINATION_RPM,
@@ -762,6 +784,7 @@ static void test_pxp_stale_queue_execution(int fd, enum termination_type type)
  * Description: verify that submssions with stale objects/queues are not blocked
  *              if the user does not opt-in to the PXP checks.
  */
+
 static void test_pxp_optout(int fd)
 {
 	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false);
@@ -1157,6 +1180,11 @@ int igt_main()
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

