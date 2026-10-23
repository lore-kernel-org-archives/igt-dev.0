Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77839606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 05:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/mYH3i+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF7A112991;
	Fri, 23 Oct 2026 05:28:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1131112991
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 05:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733213; x=1824269213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CW84JcdHvMzsXSw8RnIWPDTcKfEC+SixQyyUcnzWZ1g=;
 b=I/mYH3i+qChkjdUODBqaS6eYd1iYb/+SiHdaOmpZXqsNrV9AOgFk1jNd
 gI5bdjV555mhZrNmhhfQcJXDBJyxOfvLE7XOHn3SdpbWbTla+SEVecMTv
 CTWWkZrhn9utzTwlFRjqpGq9rEheTuH47C1ewuAoBgbSMBkX33+u+2YlS
 jtpeu08e02NKQsV7gwLOnS7cPqOpkjEnUFXSniaQB++gvXwdb2cf0Odf5
 SM4Vl0S9IeAJPahXkQpZY/E8cxdrMb12WshXQw3Vw1YdRIPp/KVecXjrs
 R9vyk9BSvQgHKkaxA935teutlVEcsqAA5L7hPlnD/Ph60WRVsxj4LBgYB w==;
X-CSE-ConnectionGUID: HuMqgsibQGeeRx914h00vQ==
X-CSE-MsgGUID: KQ5DGbvvTsWF9QS5e1ev4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1379677"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1379677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:26:52 -0700
X-CSE-ConnectionGUID: NRi1/RDNS52yCALK3jt5lQ==
X-CSE-MsgGUID: m7unNhJaT0atI+gYjqFGjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3453977"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 22:26:51 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com
Cc: daniele.ceraolospurio@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v3 1/1] tests/intel/xe_pxp: add coverage for xe_pxp_debugfs
Date: Fri, 23 Oct 2026 05:26:44 +0000
Message-ID: <20261023052644.192314-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
References: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add a new xe_pxp subtest that reads the pxp/info debugfs entry
and verifies that the output can be read successfully.

Coverage analysis shows that pxp_info() and pxp_status_to_str()
are not exercised by core_debugfs@read-all-entries. This subtest
adds coverage for those code paths and logs the reported PXP
information.

Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pxp.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 5460bf6db..7c2edca47 100644
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
@@ -1157,6 +1179,11 @@ int igt_main()
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

