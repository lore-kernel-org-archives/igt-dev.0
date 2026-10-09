Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63663CA6015
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 00:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92CB10E98F;
	Fri,  9 Oct 2026 00:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAn7Rpwj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995BC10E188
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791505783; x=1823041783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GRhZkEWXb03sFE41KFjxa68289MrYWcnU0Oi8Bm2Gzg=;
 b=fAn7RpwjXAznyPulCU0FVW2ST2+qX7U88UNIKx1hY67FWRP1qM5HfQeQ
 bNI5p5tH+CL6hgWQdM9EP2xp5T8OvGkhh/0I87M9LzJzVkIBKdqNYQcuh
 vqCcPxtQ9yWoopHiwGl5okKCyGF4SKFr+4qMcdCRpG0l+fHel1v6TiibT
 wVP1x+Mr+dkKVCSp0vER6T7aCw5KjTHGoLsozGeXqvbWPNE4+rywWxbAU
 s+dSVITQ1HgUV1VQhWx51l6Bbocq7T0DcBIvhU3MAXCtvZiRZMI1s1jT+
 Ngxz1uoqPAg7QNUgM4a87tfveuDk0g/gUiGguCjNcXUSYMSDTn6zHdezy g==;
X-CSE-ConnectionGUID: +jxZRg/7Sh2CislRoBk2oQ==
X-CSE-MsgGUID: Pn58Np3LRpiQa6W+yhAghw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="306345"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="306345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 17:29:43 -0700
X-CSE-ConnectionGUID: mavv5PvWT1yK7MQx4oZDBQ==
X-CSE-MsgGUID: oAuKtGmtT1KYsX+B6Io1CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="263949"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 17:29:41 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 3/4] tests/intel/xe_fault_injection: Avoid backslash
 escapes in dmesg ignore regex
Date: Fri,  9 Oct 2026 00:29:11 +0000
Message-Id: <20261009002912.1391610-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009002912.1391610-1-shuicheng.lin@intel.com>
References: <20261009002912.1391610-1-shuicheng.lin@intel.com>
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

igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
/dev/kmsg, which escapes '\' as "\x5c". "\*ERROR\*" therefore turns into
"\x5c*ERROR\x5c*", i.e. "ERROR" surrounded by optional backslashes,
which only works by accident and also matches any line containing
"ERROR". Use "[*]ERROR[*]" so the regex matches what it says.

v2: Add example dmesg lines to the comment (Kamil)

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_fault_injection.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..e32f841a3 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -70,9 +70,12 @@ static void ignore_dmesg_errors_from_dut(const char pci_slot[])
 	/*
 	 * Driver probe is expected to fail in all cases.
 	 * Additionally, error-level reports are expected,
-	 * so ignore these in igt_runner.
+	 * so ignore these in igt_runner, e.g.:
+	 *
+	 *   xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: GuC init failed with -ENOMEM
+	 *   xe 0000:03:00.0: probe with driver xe failed with error -12
 	 */
-	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
+	static const char *store = "probe with driver xe failed with error|[*]ERROR[*]";
 	char regex[1024];
 
 	/* Only block dmesg reports that target the pci slot of the given fd */
-- 
2.43.0

