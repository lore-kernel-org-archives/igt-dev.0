Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB846C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 09:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362F10E99E;
	Fri, 14 Mar 2025 09:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dewKRy3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3874510E99E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741946252; x=1773482252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDX0hycF7fcQ35IuY55u9NnbStOa9HV6dSjmY7HOj9E=;
 b=dewKRy3uiGm9Qz62dXXZkwltvNQ4KT7dbI9hf2NTwAqtgIaxbVPg5KiT
 HfnsP0lexGfvJ6rK9rGDckO3riFLO+5wGciGFNFnb0o39TDg1p5mnGwxw
 ocOfb/CTEEGNLc011SRTPjb7E9Td8okaEsm1tRESHboXqEi7A23p/9pmP
 TYNmuEYBqjZtKWjXmuBnqTxg+AyRrSSXVuWKyu2z7syGuweJqTEuZ9tXN
 9HAOHVzf6HCRAHIRMR40YJE4JBCh14W+2kIPm/NFsD2YIOatEbD+fQviZ
 zsEivsSq8/ccE/4aOv2rqHOqCjYcujK53KX+GgI9SyD5PjAUverVKcDTo g==;
X-CSE-ConnectionGUID: WVPf5ss9QCqKL2KIRle2HA==
X-CSE-MsgGUID: MNiVuSVjTIy//ZbbK9ne+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53745152"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53745152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:32 -0700
X-CSE-ConnectionGUID: YnJkabErT2uUIwks9bBOIg==
X-CSE-MsgGUID: RzBr3YdDQoug7Y7rxDy73w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="144404704"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.175])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND
Date: Fri, 14 Mar 2025 10:55:05 +0100
Message-ID: <20250314095701.581686-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314095701.581686-1-francois.dugast@intel.com>
References: <20250314095701.581686-1-francois.dugast@intel.com>
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
index 5409d19a6..6307e0277 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -394,7 +394,7 @@ igt_main
 					exec_queue_create_fail(fd, hwe, s->name, s->flags);
 
 	igt_fixture {
-		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
+		igt_kmod_unbind("xe", pci_slot);
 	}
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
-- 
2.43.0

