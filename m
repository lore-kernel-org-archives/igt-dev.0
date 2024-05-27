Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC8C25B7D
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 13:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0410E2A4;
	Mon, 27 May 2024 13:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izPoazh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B435810E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 13:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716815927; x=1748351927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mr0yKw7aiHPC+lHzTmhuXo7OKEzMvrMr+DotbqAACi4=;
 b=izPoazh/MkEIiSfpPt1044LksKh5NEjw3V2qsHsFkgW3XMk/lfS72ftr
 GCpAygn4hkRKvnONOsyMevodPFWwChXObmhJj/J2tuOgOH1t1zp6/18Vp
 XQHDc93tERyf2z59ga7xgHVx24Eb4VRtb9qgRi6Nu7bmI6gNEDVBbwjpt
 /EqcSBKWyDB68NgdKmrhkSt+TY/Zqf70AJR/ndgopV7EE1gMiQzpyub8d
 WYi48tZotBPGEjSJbfDA6Fk7wJAURq+ZkhG6hpZFlWXF6iiit4ID4eHk3
 V4ycYMjOWKCzbWCxN+lBjVnOoY90UVvLvvi3F1u6XMKogqTM/tmshZQ1G w==;
X-CSE-ConnectionGUID: y90SNI8UQk6SaMVGLlYtkQ==
X-CSE-MsgGUID: GGAvwXnLR720Ldm8gka0lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13359285"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13359285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:18:46 -0700
X-CSE-ConnectionGUID: 9PSbp+7LTlmEvT+udQ/C1w==
X-CSE-MsgGUID: SBFLFU2qTjGcg9rfxNMaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39556738"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:18:45 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_module_load: Unload module if loaded
 with modparams
Date: Mon, 27 May 2024 18:41:27 +0530
Message-ID: <20240527131127.2860097-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Subtests should unload the module themselves if they use modparams,
otherwise consequent subtests amy misbehave.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/xe_module_load.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 83f7df341..0856a57c8 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -140,11 +140,13 @@ igt_main
 		}
 
 		load_and_check_xe("force_probe=*");
+		igt_xe_driver_unload();
 	}
 
 	igt_subtest("reload-no-display") {
 		igt_xe_driver_unload();
 		load_and_check_xe("enable_display=0");
+		igt_xe_driver_unload();
 	}
 
 	igt_subtest("many-reload") {
-- 
2.43.2

