Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7A9C27C52
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 17:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878B510E3F9;
	Wed,  5 Jun 2024 17:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEVqCS8A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28CD10E3F9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717608372; x=1749144372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RPgDTLQKDP4YaT+f7OQUTrX+Qb3DPwHUAS6ubl2el70=;
 b=GEVqCS8AgtV0UkIm5N044kUZDq6PnIJl1PYJ7zasYVyCMirS1jPaiGYD
 UJunGp0+G4Zs6DhJY83Rw8KaDmcUqRpTeBHZpHJ11TLMvv7Z7uLqT3bra
 WYO8V2h9XocSeeQFwo221FMCoBaiOAx/PvijpF1qAW7eo5V5wxBMGQSSP
 hNdl8MjmriaB9n5R8WV6PxFUMvI3R+E7PGC9F9TT6GWAlDOUL7df1FD+K
 TvSeRZDUOm9IZ9lmGnnf7+akbdvIa2I9/nVellb0KKjacVkf42Nb3hsD8
 p5ONCFDBm819/DJflkEPG0kVkMieazf21+2va3eODVjP2jag8Y+2QfMHi g==;
X-CSE-ConnectionGUID: ytPmHX54RmO8NipAdeD81Q==
X-CSE-MsgGUID: pKrOHRxUR3SQh0wPtnpUsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14118280"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14118280"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:26:10 -0700
X-CSE-ConnectionGUID: uj3Jou0kTBivRxfPUBMelQ==
X-CSE-MsgGUID: hbsmXAkQT8mwTdpSy2MDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42242624"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:26:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v3 2/2] test/intel/xe_exec_reset: Synchronize
 cm-gt-reset gt resets
Date: Wed,  5 Jun 2024 10:10:55 -0700
Message-Id: <20240605171055.2772175-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605171055.2772175-1-jonathan.cavitt@intel.com>
References: <20240605171055.2772175-1-jonathan.cavitt@intel.com>
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

The cm-gt-reset test has the potential to race with itself on the gt
reset, so force the gt reset to be synchronous here.  The race condition
occurs because the test does not have a fencing mechanism (I.E.
dma-fence) to protect against this race, unlike in the gt-reset test
case, for example.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 05d63c0ba5..817b82cdef 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset_async(fd, eci->gt_id);
+		xe_force_gt_reset_sync(fd, eci->gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
-- 
2.25.1

