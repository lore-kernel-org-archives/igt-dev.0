Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6ADCA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A876110E50D;
	Wed,  7 Oct 2026 21:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRh0+bv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD04B10E50D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407192; x=1822943192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DalWyfccwkfqp/YM+50sN+4ghXfOqrRefIrPXQY9kw=;
 b=gRh0+bv7cC7I6A4KVuLM7kZu6IDYoovCdQsRch+roJB3mEBT98jSLeNX
 FvYv8csdynC+E0m2GRyoVqbJjEjDpHZhcFSqtHQCPlN5cm0aZaVIoJ4vP
 PB9S3h6laEVP1WFRxEecG3aEy4CAgTsAWbDmvUFJDs4BuEN0pVE5ffYT2
 WMEyDKU4mJj5BRxcjiwqlrI1auKdsp5G686GE3C8SZNQBrhdo45PjhSya
 8fyr2dzOCbw2+TSSoF80VnAQWHdFP0Axt9DKY+nzhsObqzAr5RA0aY8pT
 3tgg7qpDC70GO3J0AjYzkRUGR9rld6UmZPhyiC2YBlBb+05+alWBmw6J+ Q==;
X-CSE-ConnectionGUID: L/i//IfxQgiXE+8XF9jxRA==
X-CSE-MsgGUID: NpgBvKdgSUyDcH7rF/uHnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190292"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:06:32 -0700
X-CSE-ConnectionGUID: y9aWfWTrTpmtlI/ZN29T6w==
X-CSE-MsgGUID: QsrcZ3AyRi2rwJ+b6TcnPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280840171"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 14:06:31 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore regex
Date: Wed,  7 Oct 2026 21:06:01 +0000
Message-Id: <20261007210603.1350158-3-shuicheng.lin@intel.com>
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

The kernel now reports the failed GT reset and the device wedge through
SIGID-based logging:

  SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
  SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!

which the existing "reset failed .-ECANCELED" and "declared device ...
as wedged" patterns no longer match, so these expected errors are
reported as dmesg-warn. Add patterns for the new messages.

Also fix the CAT error pattern. igt_emit_ignore_dmesg_regex() passes the
regex to igt_runner through /dev/kmsg, which escapes '\' as "\x5c", so
"\[" no longer matches a literal '['. The pattern also lacked the space
before "class=". Use bracket expressions and add the missing space.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_wedged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 8c3c8bd36..0cd884450 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -41,6 +41,10 @@ static void ignore_wedged_in_dmesg(void)
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
 				    "|__pfx___drm_"
+				    /* SIGID-based logging (newer kernels) */
+				    "|[(]-ECANCELED[)] .* GT: reset failed"
+				    "|[(]-EIO[)] WEDGED: Device declared wedged"
+				    "|IOCTLs and executions are now blocked"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
 				    "|ASID: [0-9]+"
 				    "|Faulted Address: 0x[0-9A-Fa-f]+"
@@ -50,7 +54,7 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineClass: [0-9]+ [a-z]+"
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
-				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error [[][0-9]+[]]: "
 				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
 }
 
-- 
2.43.0

