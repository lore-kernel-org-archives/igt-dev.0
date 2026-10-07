Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2FDCA6004
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC810E6CC;
	Wed,  7 Oct 2026 21:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYrFzz1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE410E50D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407191; x=1822943191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=reKU851Iv/KJuHB00MU7iaCbzU/JP0w47nuIgM2t3+Y=;
 b=LYrFzz1Fh9rX4ssI/NlekX4VcP4RKoYfXYzM/4JXNP1rmz5kzqY/XnvQ
 KcTJ2VS3pkwGQy2LRDY2Z8jwMVf9dAUkD/jbm9SErz7B+cECPTF9X8s0T
 oajvBniR2HqoDmu2n8YqGni4OM5+kBzS2ICyNQuyeSrEbYIowctkc98G3
 3x7815h6AECLePlFVeFzshcz+7hEChl31fQetG4tnzAcwyfhjaDnHEV36
 L6gbWSJTKsWZCi2UlXvjuxyF5u6b9FskCbP630lrGDJoqxxbMHAsWPKIy
 bIFNN9ZoKrl06zZazXUqQzuUPIcMFZw1F3+iQkvTaJTBnnULqSc3PLgnc A==;
X-CSE-ConnectionGUID: m+atK0knT+SwIaQ+2SdE5g==
X-CSE-MsgGUID: A/irut9BQmuf9vWEtWn1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190273"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:06:28 -0700
X-CSE-ConnectionGUID: 3tHkgBUCSbew7It4jFpHzA==
X-CSE-MsgGUID: ngJWuuxBSH+g9A9ySm+7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280840140"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 14:06:26 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 1/4] tests/intel/xe_exec_reset: Fix gt reset fault dmesg
 ignore regex
Date: Wed,  7 Oct 2026 21:06:00 +0000
Message-Id: <20261007210603.1350158-2-shuicheng.lin@intel.com>
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
/dev/kmsg, and the kernel escapes '\' as "\x5c" in kmsg records.
igt_runner compiles the ignore regex from the escaped record, so
"\(-ECANCELED\)" turns into "\x5c(-ECANCELED\x5c)", which requires a
literal backslash and never matches. As a result the expected
"(-ECANCELED) ... GT: reset failed" and "(-EIO) WEDGED" errors are
reported as dmesg-warn/dmesg-fail in gt-reset-fault-injection.

Use bracket expressions for the literal parentheses so the regex
survives kmsg escaping.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_reset.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 50771af53..901ce2f3f 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -928,12 +928,17 @@ static int try_vm_create(int fd)
 
 static void ignore_gt_reset_fault_dmesg(void)
 {
-	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
-				    "|\\(-EIO\\) WEDGED: Device declared wedged"
+	/*
+	 * The regex is passed to igt_runner through /dev/kmsg, which escapes
+	 * '\\' as "\\x5c", so use bracket expressions instead of backslash
+	 * escapes for literal parentheses.
+	 */
+	igt_emit_ignore_dmesg_regex("[(]-ECANCELED[)] .* GT: reset failed"
+				    "|[(]-EIO[)] WEDGED: Device declared wedged"
 				    "|IOCTLs and executions are now blocked"
 				    "|For recovery procedure, refer to"
 				    "|Please file a _new_ bug report at"
-				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
+				    "|Failed to invalidate GGTT [(]-ENOTRECOVERABLE[)]"
 				    "|GPU HANG"
 				    "|Failed to reset");
 }
-- 
2.43.0

