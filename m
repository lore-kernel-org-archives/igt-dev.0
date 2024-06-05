Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B17C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A3510E3B9;
	Wed,  5 Jun 2024 18:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2u5njXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D04B10E314
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611250; x=1749147250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RPgDTLQKDP4YaT+f7OQUTrX+Qb3DPwHUAS6ubl2el70=;
 b=O2u5njXZxL/zvZau1GTUzOqBp0hXLo/EYm8335aCZfqJCe+y0RtBqto5
 5VjcR7LYULwQ6IZ0/S+tCyiI7jvHV0okQSyih+n2fD/hZUkJsYwdfH1oc
 kmE4ejnc7mavd6bAp3Jr1IB6e7wO2m5gljZaUT+ZqyfMRfdr68Z+4C9JH
 MjbSDFNBNFrvRM1C1RQxe+8WKci+TWcYpxU6GJ6RdBCfqO2NDdXuGaiK6
 MEM74u2r8V7Dvp8mfcC2R38eBIP+rL2GWpjSfNEKxZjxtY9mL4LyXzNeT
 ZLspZvjcpAK4y4GJyd8Ro7iKTbEsVF5oVrtXEqbUOOQbYQ/bTb7VsWDDR A==;
X-CSE-ConnectionGUID: rq4sTGWpQqKhI5BtpbNKSg==
X-CSE-MsgGUID: m5Bo26lCSU+xR9aFi84mnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14084384"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14084384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:14:00 -0700
X-CSE-ConnectionGUID: 2QWn130UQgesXf+Dzhgg4w==
X-CSE-MsgGUID: Y1Mk7M6bT/e7eVE1NE/2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37659538"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:59 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v4 2/2] test/intel/xe_exec_reset: Synchronize
 cm-gt-reset gt resets
Date: Wed,  5 Jun 2024 10:58:43 -0700
Message-Id: <20240605175843.2789838-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
References: <20240605175843.2789838-1-jonathan.cavitt@intel.com>
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

