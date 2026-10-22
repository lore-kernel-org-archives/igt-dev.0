Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AF606A31B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HlZ6DjFq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44643112324;
	Thu, 22 Oct 2026 05:46:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464AC112325
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792647870; x=1824183870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7zeVudB+Cagdp7HE/cZX/sH4I5C9WEw+4W57tQOxi8=;
 b=HlZ6DjFqFQHBLJ+iRmxUcD102gQDMsvtk6xrKBMCYl3I0QsfzSoKILhP
 oWwvdW0nX/C+/RjdApURxVPhyW0MBb0+uWJax+cMx1i6lhqIPAkgy5z+Z
 brXRs1UnEsUl23hLAdiSrsBR2uQ5GGATihxXQcHFlwz6EuMAUGHozEPN8
 U0TEiB2VcYZ84WTXh0ryPogGpG1dTL/sY8eJMC8oARjtzK7UJa47vemUE
 hlbv9MJSbezBdLUl3Qcy8LjMROffGn+wjcIStScKllDA766Hz78+T57HY
 egz8svJ1TH8dikadwQ03cBeYpqZ7lSq9LrBKBPtU0q7l819eX44OEXLww g==;
X-CSE-ConnectionGUID: CpBrkSPESvyhR5p9IynZxA==
X-CSE-MsgGUID: K1lrl7OOSFCD27TNFGwxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1285848"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1285848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:44:30 -0700
X-CSE-ConnectionGUID: UIZxck0/Q4CEtMoi5fU6ww==
X-CSE-MsgGUID: X7Nq6Pn0SSqd4mCYGNreNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3680080"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 22:44:29 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com
Cc: daniele.ceraolospurio@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Date: Thu, 22 Oct 2026 05:44:19 +0000
Message-ID: <20261022054420.180035-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

