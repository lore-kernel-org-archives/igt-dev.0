Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24453C369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 11:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157A10E0B0;
	Wed, 23 Apr 2025 11:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2TE/2wl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E6210E0B0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745407872; x=1776943872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MwhF8HBVknkl312m8w1bL5pf8dve5vwiDUXg7175m7U=;
 b=Y2TE/2wlWBzavgo/FVrsi/aFglr89Uwvu7CSD+iZgMYNmznYX79bWSNS
 kCf4gUSqPG5tAflGBBe/B6X8bzE0ctQtzmnMDplt0yHBcPXTFaPNQVANw
 1c6ESKyOIq7jXnDOVG7yi6qx4X0Q8w/BrsDDpg16y6yvl9s9ImwnSuDnz
 ukIgqTcBQmhvlMSZTlU+sp2uR/8qnfzTxDt1SiSsD28YBrxoOCDmH7zBx
 S4F86e6tru3Dj4pm/SuFb+oyD4tIIRwMi+fxhYS5902Bohku/Oc46s17y
 Tf8umU2vjFfKJnsD3QM/AzRyiD2QkNYmrf2wJ+uwkIti2pvd5l0gfFDcG A==;
X-CSE-ConnectionGUID: g4bjf6xASDOSQui+azjY4Q==
X-CSE-MsgGUID: /avVnwyjTzuzRoAWnTmO/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64522989"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64522989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:31:10 -0700
X-CSE-ConnectionGUID: PXNTdkuaSm6MimrAzU/RYA==
X-CSE-MsgGUID: ZmCF1F0eQhKENIitaDab7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137074311"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:31:10 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/1] /tests/intel/xe_eudebug_online: Remove
 create_metadata_trigger on debugger reattachment.
Date: Wed, 23 Apr 2025 11:31:38 +0000
Message-Id: <20250423113138.88260-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

On debugger detach-and-reattach, discovery worker will replay events
that have occurred, which leads to a metadata event being sent and
create_metadata_trigger being rerun, which would then lead us
to try to open a removed metadata.

On debugger reattach trigger, remove create metadata trigger
from list of triggers.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 1f72e3e44..03b85e1ac 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2079,10 +2079,13 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	d->target_pid = c_pid;
 
 	/* Discovery worker will replay events that have occurred, which leads to
-	 * a vm event being sent and vm_open_trigger being re-run, which would lead
-	 * to us trying to open a removed vm. Thus, remove this trigger from list.
+	 * some events being sent and vm_open_trigger being re-run, which would lead
+	 * to us trying to open a removed vm. Similarly with metadata creation.
+	 * Thus, remove these triggers from list.
 	 */
 	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_METADATA,
+					   create_metadata_trigger);
 
 	/* Let the discovery worker discover resources */
 	sleep(2);
-- 
2.34.1

