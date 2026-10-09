Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE10CA6017
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 00:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51810EA58;
	Fri,  9 Oct 2026 00:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/QiVnBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73DB10E188
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 00:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791505779; x=1823041779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mGNVBltn3CU2Mh5bjWA7lY1KC/CYwBc4dSLcfEHc0Vc=;
 b=A/QiVnBvtez2lqWJ8k245eQlB7jlsIF6wrru3Oe5xHbWiI1+bG8SMYeg
 +VOTjpn0roo1mjCDe9SHTwZYLcTQ/Bz4uE/XX8j0pUpqS9APHC9AHz1Um
 jUdQ8ogXjTKxtgjqU4BcEjr2+FLt8fktCD4dFunuDZV2M7MzwwmOq5Zds
 Dq76j/sUeU4BGJdPJ2/ryzS21rwiCNIWcpnke5z7tBfabbjPRXb4iEGjc
 J73jZWbbY+F7KGwhvCDHkosiguYJlCuMHqU1Vlr1gjucwXE+/9JImmtvg
 aiXvUU3LtkQ7cy8WhhfpamZOaGAj+uWaV/V+0lZBbF5KZV4ZF4qTHpv/5 Q==;
X-CSE-ConnectionGUID: aVEnnuBUQ/a7/m9AmSldGg==
X-CSE-MsgGUID: TC8u2sGwTSyV+bLi7qkNHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="306341"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="306341"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 17:29:38 -0700
X-CSE-ConnectionGUID: khU8ieUqSK+OrlViMnxGqA==
X-CSE-MsgGUID: gr/t+CsjSB2IEedjf52awQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="263942"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 17:29:36 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH v2 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore regex
Date: Fri,  9 Oct 2026 00:29:10 +0000
Message-Id: <20261009002912.1391610-3-shuicheng.lin@intel.com>
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

The kernel now reports the failed GT reset and the device wedge through
SIGID-based logging:

  SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
  SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!

which the existing "reset failed .-ECANCELED" and "declared device ...
as wedged" patterns no longer match, so these expected errors are
reported as dmesg-warn. Add patterns for the new messages.

Also fix the CAT error pattern, which never matched. The kernel reports
it as either of:

  Tile0: GT0: Engine memory CAT error [3]: class=rcs, logical_mask: 0x1, guc_id=2
  Tile0: GT0: Engine memory CAT error: class=ccs, logical_mask: 0x1, guc_id=5

The pattern only covered the first form, lacked the space before
"class=", and used "\[", which igt_emit_ignore_dmesg_regex() passes to
igt_runner through /dev/kmsg as "\x5c[" so it no longer matches a
literal '['. Match only up to "Engine memory CAT error", which covers
both forms. These lines are logged at info level, so this does not
change the test result today.

v2: Simplify the SIGID patterns, match only the start of the CAT error
    and add example lines (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_wedged.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 8c3c8bd36..4f5197e2a 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -41,6 +41,10 @@ static void ignore_wedged_in_dmesg(void)
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
 				    "|__pfx___drm_"
+				    /* SIGID-based logging (newer kernels) */
+				    "|-ECANCELED.* GT: reset failed"
+				    "|-EIO. WEDGED: Device declared wedged"
+				    "|IOCTLs and executions are now blocked"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
 				    "|ASID: [0-9]+"
 				    "|Faulted Address: 0x[0-9A-Fa-f]+"
@@ -50,8 +54,7 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineClass: [0-9]+ [a-z]+"
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
-				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
-				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
 }
 
 static void force_wedged(int fd)
-- 
2.43.0

