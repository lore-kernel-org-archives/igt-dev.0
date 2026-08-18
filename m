Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44518C5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E493B10E9D4;
	Tue, 18 Aug 2026 04:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZGvbuoR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B27A10E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026138; x=1818562138;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HL0UUuX1sAMHdRzbu1M8CfDsVuhh2VYmx5lsPGobsbc=;
 b=aZGvbuoRdpTBJzMiyaMQ1HC/WAIskrkrTrLe0HulHMirviBL/GKeyweO
 b5MLA0HZ1tDcFXKwtq5PZ2RndR95BZdBkEvsFMROHKl34yI6fA1O+fZMO
 YtQrAffCA6Ef6DCZkil7K65vL7JkPJMeZX4Jdb84Xzd2r/HQor+a0U1av
 8ky9sMaBcV8aRJZ4Y5/j1OEK/N2XW4JfhgEuQhAb7iZE6Y7fh3bTu5ZpT
 UFLqJUGG6k8Mc4pkSmcSGUtxS+c3SAQbOctGtAbaBWbJIKJ59mHk+qdJT
 9akgH8vOnVmZ/Jtg5zKyN7xsKtO6txYjLjhqsVVUiRDPKrM3xXPj+KBnS A==;
X-CSE-ConnectionGUID: /wHUllYHSVqDh7jM1skEOg==
X-CSE-MsgGUID: sLE0jwPGSra7df+vZNPFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870384"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:58 -0700
X-CSE-ConnectionGUID: jsbiTL/CT++z9uQ8pRfr7g==
X-CSE-MsgGUID: 0mkgx2TDQ4GH3HeCNOiqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477296"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:57 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 9/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-engine-hang subtest
Date: Tue, 18 Aug 2026 04:08:45 +0000
Message-ID: <20260818040845.548727-10-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040845.548727-1-nishit.sharma@intel.com>
References: <20260818040845.548727-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add a dedicated GT reset stress subtest that triggers reset while a long
spinner workload is active.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 42c2a7efd..6eda71c32 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -887,6 +887,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions during PM transition windows
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-engine-hang
+ * Description: Test GT reset while long spinner workload is active
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1314,6 +1318,14 @@ int igt_main()
 			gt_reset(fd, 0, 8, 2, s->flags);
 	}
 
+	igt_subtest("gt-stress-reset-engine-hang")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 2, 4,
+					    GT_RESET | LONG_SPIN,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
 	igt_subtest("gt-mocs-reset")
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
-- 
2.43.0

