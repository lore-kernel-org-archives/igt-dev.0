Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CC6CA0FE8
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF98910E4FB;
	Mon, 25 Aug 2025 16:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENdZ79IX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C830310E4F8
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137605; x=1787673605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpzBau2aYiOERfFT28GpdOuLYeoN+arrbRirZSmOlrU=;
 b=ENdZ79IXl32gDCO/Hqj0EdKgZclubY+WlVcJdohnNFTQ0O7740ryqw50
 uiKo0GFOSXNapcFoBLhHKHQ5o3sh3Q1BYIBpzQ/yH9aLwOQkZ/IkvGOb9
 WbxrF81E6NILZiCHc4Pezz808FTn5ssv35rA6wwbuV8ziKEERlol7WOYZ
 rs7ivWSJQeR3H6xfr+1Ta8Pd07EfzBgHU7TGDl8AMpeatJEM77sQPUibV
 TWzd9cZowI3D1eWbnKlyztnhW23zRdXJY4hIfO00z3nHr+5CM/ykAmm22
 +5gaidKVXCY8Nk9xTAkzryws9RRjI0TfiQDrMb4PTYJZDRT3lPUJMpR9V A==;
X-CSE-ConnectionGUID: ONbEjyKqRZGJMY4fAI/Xaw==
X-CSE-MsgGUID: jrbYhLL1RcW5waWeZPKjQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68948332"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68948332"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:04 -0700
X-CSE-ConnectionGUID: s5V+S1iATRulhwi8xqq2Dw==
X-CSE-MsgGUID: skW42Z4rQESAJx21fn2Ouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168578246"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:00:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/intel/xe_configfs: Install exit handler
 once
Date: Mon, 25 Aug 2025 08:59:45 -0700
Message-ID: <20250825-configfs-unbind-v2-3-62e7508d3ed7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
References: <20250825-configfs-unbind-v2-0-62e7508d3ed7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

All the subtests need to restore the device to a working condition.
Call igt_install_exit_handler() only once, after creating the custom
settings.

Also remove the leftover comment in restore() since that function is
used by other tests too.

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index bed92714f..4f8b873d2 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,7 +26,6 @@ static char bus_addr[NAME_MAX];
 
 static void restore(int sig)
 {
-	/* Restore after survivability mode */
 	igt_kmod_unbind("xe", bus_addr);
 	igt_kmod_bind("xe", bus_addr);
 }
@@ -147,26 +146,22 @@ igt_main
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		igt_install_exit_handler(restore);
 	}
 
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(devid));
-		igt_install_exit_handler(restore);
 		test_survivability_mode(configfs_device_fd);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
-	igt_subtest("engines-allowed-invalid") {
-		igt_install_exit_handler(restore);
+	igt_subtest("engines-allowed-invalid")
 		test_engines_allowed_invalid(configfs_device_fd);
-	}
 
 	igt_describe("Validate engines_allowed");
-	igt_subtest("engines-allowed") {
-		igt_install_exit_handler(restore);
+	igt_subtest("engines-allowed")
 		test_engines_allowed(configfs_device_fd);
-	}
 
 	igt_fixture {
 		igt_fs_remove_dir(configfs_fd, bus_addr);

-- 
2.50.1

