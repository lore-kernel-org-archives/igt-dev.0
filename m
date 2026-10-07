Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65606CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BEA10F7D0;
	Wed,  7 Oct 2026 21:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2HQKGLN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2F910E50D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407195; x=1822943195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsyNIPLB3pc+JGx9ryW5/Q0hSqINf4j78zf1MQPkV/E=;
 b=Z2HQKGLNrNWhqsYf1nDKaGv2thK7bm/dplhk9290DnRaEF6Q+JnXHRW4
 vJ5tLPicLu+uy1YuCW6myENg3pDYWsludxFiTJeVxhGa7XLtuL643PAp+
 zUdIemCC7istlu5zW4PRI8UbwM497LrmxmUJ8xAqCEQzFmtqXfEAwZw6U
 ZUObf4IpgpEVNF+1r2qiozJJA4hPsKVobgE8jGK2U6fC/kJkxd7iysgPG
 pjF0e3cyukCb9IY8f+cf1nz0HzPkzVfjU5gwXl1tDiUtOo2SUS0FCZumI
 Mkxicb/3f5oW3bEukDgspzW6aKVJWl7RXTQ0/jeKM4RNooAn7RLvldmKC A==;
X-CSE-ConnectionGUID: xB5i8X6gT+qIzTk4xcQRow==
X-CSE-MsgGUID: i4KHL7y7SPqnu1SZT6BG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190298"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:06:35 -0700
X-CSE-ConnectionGUID: xDET9qQeTfC/0+e7lHSTeg==
X-CSE-MsgGUID: 2sQ/UFyVT/uzbjLpIegqNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280840193"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 14:06:34 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 3/4] tests/intel/xe_fault_injection: Avoid backslash escapes
 in dmesg ignore regex
Date: Wed,  7 Oct 2026 21:06:02 +0000
Message-Id: <20261007210603.1350158-4-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007210603.1350158-1-shuicheng.lin@intel.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..772cf29df 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -72,7 +72,7 @@ static void ignore_dmesg_errors_from_dut(const char pci_slot[])
 	 * Additionally, error-level reports are expected,
 	 * so ignore these in igt_runner.
 	 */
-	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
+	static const char *store = "probe with driver xe failed with error|[*]ERROR[*]";
 	char regex[1024];
 
 	/* Only block dmesg reports that target the pci slot of the given fd */
-- 
2.43.0

