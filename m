Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF12606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O1mN8oZT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B0510ED59;
	Thu,  5 Nov 2026 23:27:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A238A112963
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921162; x=1825457162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QWuzN2RZeHPXA78z1m6EAyr8+gHhHD0+4M+VY4pbdLA=;
 b=O1mN8oZTAvW7HTdUcFNdJCGKgKK3w2uRk8yMp9eHuZvIQ9n9Icwag1rD
 6e9x2WC9yd54Yr61JOs0IWUX9ojMIzISNmwi1bA9VMTyqDs/oV93RCZA1
 mFYnUwE2R1969uIJUkSdVcdLIBSmSfgaLuObW3vy+IDsvPiui7VShGeKG
 putxfJaxdYz50P9tYa0wXf8jxAYzkJMe6sPj7BuQBshRYoiywjWQD0mxs
 WsohwKaKI2OXB2J6zfPl56DJ2E8XarlaRx4CWV4W6bciNeFyy4QJRmnEa
 MZqIZKplSJAijYtSe27rmsaGMs5Ure34WAYsz4+FGa5JeYHEqWsM/UqM9 Q==;
X-CSE-ConnectionGUID: KnEMODGGQEepErZUpYyYKw==
X-CSE-MsgGUID: y9pYvc+SSQ204sfJswQ9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769424"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769424"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:25:59 -0800
X-CSE-ConnectionGUID: QNj4MIuoRLCyufdXhr1o2Q==
X-CSE-MsgGUID: S2/TTcOSQC6v54v+QphcOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7185766"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:25:59 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: drop xe_wopcm_init
 subtest
Date: Thu,  5 Nov 2026 23:25:46 +0000
Message-ID: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The xe_wopcm_init function is being removed from the kernel because the
wopcm handling is being simplified [1], so drop the matching test as it
it no longer applicable.

[1] https://lore.kernel.org/intel-xe/20261105004254.262075-4-daniele.ceraolospurio@intel.com/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index e32f841a3..e0a461820 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -260,7 +260,6 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
  * @xe_tile_init_early:			xe_tile_init_early
  * @xe_uc_fw_init:			xe_uc_fw_init
  * @xe_wa_gt_init:			xe_wa_gt_init
- * @xe_wopcm_init:			xe_wopcm_init
  */
 static int
 inject_fault_probe(const char pci_slot[], const char function_name[])
@@ -585,7 +584,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ "xe_tile_init_early" },
 		{ "xe_uc_fw_init" },
 		{ "xe_wa_gt_init" },
-		{ "xe_wopcm_init", 0, true },
 		{ }
 	};
 	const struct section vm_create_fail_functions[] = {
-- 
2.53.0

