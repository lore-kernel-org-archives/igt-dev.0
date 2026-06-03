Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31092CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 15:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7611362D;
	Wed,  3 Jun 2026 15:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPl5Ucyo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06411362D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780498889; x=1812034889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+X5BnyhRWiQFVubvTApxAfYOhDbaUlq+8byQCuxVmxY=;
 b=bPl5UcyordnIP+slL2fInkzVtORN53SMbWZLg9fLCuQgOy+5lTqmoqi6
 q5j/D6ceyJx7VFIu2gXUlhLmSlNsxeqHKF9sq/S8JkKeXwpPw+/buVWU6
 DHoPD23kVAXvT5MhHKJPsN3rCm2wJllCDZlgNarcOkmlOM/He6ANSlgBw
 lXxk66SkfPCbzT5BHqFAWeD3OMaWb8qFRKyo6GCwc25O2K/Hc5IGo3hGE
 RUWD2n1jF5XZh7ap2se9AmcA0xTBD+dzdW5vxrCECjBMi3AyS55r16NYH
 +/MMZaluw1OYpGsMTDV1mb9CjZNFjztCZNxG9FLOnVK9j6oANkr8PvaSl Q==;
X-CSE-ConnectionGUID: nMffwwliQh+1OXS6F9uKlQ==
X-CSE-MsgGUID: VPjlkB15RqCXVHArAXhJfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="83889339"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="83889339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:27 -0700
X-CSE-ConnectionGUID: vUgKgOB8SBKWo2maTvXgQQ==
X-CSE-MsgGUID: k0mHOojARKG9GAGftal9JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="243200280"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 08:01:26 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.mrozek@intel.com
Subject: [PATCH i-g-t] include/drm-uapi/xe_drm: Add srcid to drm_xe_fault
 struct
Date: Wed,  3 Jun 2026 23:01:22 +0800
Message-ID: <20260603150122.3750541-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Add srcid to drm_xe_fault struct, aligning with a KMD change.
Additionally, add logging for the new information to the associated
xe_vm test.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
---
 include/drm-uapi/xe_drm.h | 4 ++--
 tests/intel/xe_vm.c       | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 5a96a7910b..273bac9e1f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1290,8 +1290,8 @@ struct xe_vm_fault {
 #define FAULT_LEVEL_PML4	3
 #define FAULT_LEVEL_PML5	4
 	__u8 fault_level;
-	/** @pad: MBZ */
-	__u8 pad;
+	/** @srcid: ID of the faulting hardware unit */
+	__u8 srcid;
 	/** @reserved: MBZ */
 	__u64 reserved[4];
 };
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 408bfdb718..260dae9cae 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -3023,6 +3023,7 @@ static void print_pf(struct xe_vm_fault *fault)
 	igt_debug("access type = %u\n", fault->access_type);
 	igt_debug("fault type = %u\n", fault->fault_type);
 	igt_debug("fault level = %u\n", fault->fault_level);
+	igt_debug("srcid = 0x%08x\n", fault->srcid);
 	igt_debug("\n");
 }
 
-- 
2.53.0

