Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA99C88E77
	for <igt-dev@archiver.kernel.org>; Mon, 14 Sep 2026 22:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1362810F445;
	Mon, 14 Sep 2026 22:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/G0nOw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752410F445
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Sep 2026 22:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789423945; x=1820959945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wglh6wMD/7n19DwtruIsFnQVbYGRmGofRxi7ZaxvPX8=;
 b=S/G0nOw2qJkPQ6WBnpNSteOj6kFsEQxMx3tWqHozhOz3XdqkVAtwEcuH
 A5wN8KcQQkukpLQhPvBidxDi+t5o1r11gwDCdaoGXOI76vrKpcR7ksLY2
 b+QROcFdb8r2UtAqBttJUxEQfDM9nsMwYkRrt1cvkEV8MqLy7CeHdP+Qy
 cT9itUw8OLV+sNJPbUTZgQlEClr4EoBBTGITU2PzG1p18IkUticwI7Te/
 0zBjxjShKOgxZBL9LJ+iq7POqK2NeV1Jy+2xa4wa54c2bteNjieJDoXVG
 Z7/0Lfc+up6KpKRi5LNbrMLuT7mzRHFgKZXWhOQwF0wuyUhcOf/zw+9eR w==;
X-CSE-ConnectionGUID: EmsELhWmQ3Wf3zyUA0ot9g==
X-CSE-MsgGUID: O70Z2AfSQ9WyGvts5OpVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77342768"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77342768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 15:12:24 -0700
X-CSE-ConnectionGUID: W/SPWS2FT6SvOddb1XW6xQ==
X-CSE-MsgGUID: 7Og5vKBwQ6+DUVzjt/vGeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297777679"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 15:12:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, nishit.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_exec_reset: Update gt reset dmesg
 ignore regex
Date: Tue, 15 Sep 2026 06:12:20 +0800
Message-ID: <20260914221220.437212-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

The error logging function in gt_reset_worker was recently updated from
xe_gt_err to xe_log_err_fatal, resulting in several of the error
messages being changed or updated.  These new error messages are still
expected, so update the igt_emit_ignore_dmesg_regex list in the reset
fault case to reflect the updated messaging protocol.

There's also occassional reports of GGTT tlb invalidation failures
caused by some race condition on the wedged GT.  These are safe and can
also be ignored.

v2: Update regex to remove unneeded symbols (Kamil)

Fixes: aafc4bcf3361 ("tests/intel/xe_exec_reset: add GT reset fault injection stress coverage")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_reset.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e12279d23d..50771af535 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -928,8 +928,12 @@ static int try_vm_create(int fd)
 
 static void ignore_gt_reset_fault_dmesg(void)
 {
-	igt_emit_ignore_dmesg_regex("reset failed \\(-ECANCELED\\)"
-				    "|declared device .* as wedged"
+	igt_emit_ignore_dmesg_regex("\\(-ECANCELED\\) .* GT: reset failed"
+				    "|\\(-EIO\\) WEDGED: Device declared wedged"
+				    "|IOCTLs and executions are now blocked"
+				    "|For recovery procedure, refer to"
+				    "|Please file a _new_ bug report at"
+				    "|Failed to invalidate GGTT \\(-ENOTRECOVERABLE\\)"
 				    "|GPU HANG"
 				    "|Failed to reset");
 }
-- 
2.53.0

