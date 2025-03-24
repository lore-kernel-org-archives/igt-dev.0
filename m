Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975A1C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 15:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F4410E495;
	Mon, 24 Mar 2025 15:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxLTJdU4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4010E494
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742830240; x=1774366240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/soXVkJjFC4v/Vt24N+CmuwG6h5Fug9s93D1sLzK6Ic=;
 b=VxLTJdU4vJgCyaAdaMzzd67dqssFcy/2fc10KOYvhJrhoo4P7xvfw3Am
 IowYsuY9pYgCO2l6ERXNEH90lxiAJZLYtCHY6SV85WBSJGi9yFETlsaIn
 zylzaE8nuz1RfkgLdcEY2fdXtUncJkkxdrz+E89NDDES46xzVnqyYto7G
 gKxu8L/bRRpkwiL5+nfzJ4C/g9o2x4xYSKH0h8yHAySgfjDAz0EZ0YaLJ
 WCpvytnU+w6rTJhoA0XiEbQ31pyKZWwlOQx1yBGYDJwQWJnJPOBZTFogP
 d6yu7V5sIB31ozyil7WcudUbHTZ1VmAbJ6SiNy0JG9FenaXcDTyc1JkY8 w==;
X-CSE-ConnectionGUID: VLGtdz7HSLO18Aih+4y5ag==
X-CSE-MsgGUID: XGbB8FiyRrSVbVokwo2o8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47825172"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47825172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:39 -0700
X-CSE-ConnectionGUID: j85tH9T+RgKNJBlT3XL1iw==
X-CSE-MsgGUID: WlF54nltSfSpde9W/sJ4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129143299"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND
Date: Mon, 24 Mar 2025 16:27:54 +0100
Message-ID: <20250324153023.2493741-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324153023.2493741-1-francois.dugast@intel.com>
References: <20250324153023.2493741-1-francois.dugast@intel.com>
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

xe_sysfs_driver_do() will be removed. The XE_SYSFS_DRIVER_UNBIND can
already be removed because a proper alternative is already in place,
so use it.

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c                  | 4 ----
 lib/igt_sysfs.h                  | 1 -
 tests/intel/xe_fault_injection.c | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..a76af54eb 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1505,10 +1505,6 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		igt_sysfs_set(sysfs, "bind", pci_slot);
 		close(sysfs);
 		break;
-	case XE_SYSFS_DRIVER_UNBIND:
-		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
-		close(sysfs);
-		break;
 	case XE_SYSFS_DRIVER_REBIND:
 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
 
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..5bc733168 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -186,7 +186,6 @@ int xe_sysfs_engine_open(int xe_device, int gt, int class);
 enum xe_sysfs_driver_action {
 	XE_SYSFS_DRIVER_BIND,
 	XE_SYSFS_DRIVER_TRY_BIND,
-	XE_SYSFS_DRIVER_UNBIND,
 	XE_SYSFS_DRIVER_REBIND,
 };
 
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1bd0f51a3..4708c5d99 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -401,7 +401,7 @@ igt_main
 					exec_queue_create_fail(fd, hwe, s->name, s->flags);
 
 	igt_fixture {
-		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
+		igt_kmod_unbind("xe", pci_slot);
 	}
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
-- 
2.43.0

