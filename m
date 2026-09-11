Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB6EC88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 11:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877DC10F568;
	Fri, 11 Sep 2026 11:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJzjEA1k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF1A10F568
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789127155; x=1820663155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ2hh2TAqORiTZUIanpcGlT5o0KOooOFHotS4lhyGAg=;
 b=PJzjEA1kO6Zy696Myf+gAuete4FaOsjqeEAW//bpXkP9dVjZlfVK+NME
 EB3LSsBoFwI5OiaMyIrrHpSLP1MGnQETsHGoJ95pVy36o7BK7xpkqz3Tj
 c4/WZ+vhB5IOb3dvWGhjuLlwnTZ/SYYZV6OW78YMVOUvcpEAC00b5sQdj
 BnuQfIy07gxfRA1ujDHtp9BrLAFUqv86cLp6HmbPNzPpsBPMNi1Dz0bia
 vmNUtURinqy9g8wqoIom/nwvs2Hn9G+KWM2BmkC6gVMVex4ZilG3JwIYs
 RXMEO1FoCYzpOBzKC8nGkRvuKqtIQOO3Kxqgw9+wy3SLyGjGN3x8E9zF/ Q==;
X-CSE-ConnectionGUID: xx1k4iHqRGC9+Gw1j521FQ==
X-CSE-MsgGUID: h7cn5v57S2uqZixdOl/6Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89521106"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89521106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:54 -0700
X-CSE-ConnectionGUID: O3n1qdCWRlGg+MQG8CxGLw==
X-CSE-MsgGUID: pDSyJmfyTmmxQvIm9fMsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272403873"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:51 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 2/2] HAX intel-ci: Add xe_survivability to xe-fast-feedback
Date: Fri, 11 Sep 2026 17:04:51 +0530
Message-ID: <20260911113448.1300864-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911113448.1300864-4-sk.anirban@intel.com>
References: <20260911113448.1300864-4-sk.anirban@intel.com>
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

Add runtime-survivability test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 64587cce1..746a10e57 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -216,6 +216,7 @@ igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
+igt@xe_survivability@runtime-survivability
 igt@xe_sysfs_defaults@engine-defaults
 igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
 igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
-- 
2.43.0

