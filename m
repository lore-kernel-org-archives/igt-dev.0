Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1357ECCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 11:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC18610E0F2;
	Fri,  3 Oct 2025 11:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNtDarfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D56110E0F2
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759489546; x=1791025546;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gZ5EINBPnTG+sE6ZnE8XVfHW4UsYeY+/dNa1Z58lLe4=;
 b=PNtDarfz1NrJ8cgXctqGdHocAVjM+Or9XjZbChARden+H0fAgL33OHfb
 ucPCxmWos8aM8Ptjh7/qnk9Yg5u7LIMPXI0Ip7k3hs/qtE0yg9q1eWxMJ
 9EKeyer3BCUc+O1UhNeWQ0O1lJ9ns3SXKtCvnx1fvkEJ8YvxncRbU2A5y
 WCP5UJ4HtNh+TBWevAWHQV7Pyl2HNLT6uw8QOf9dnp+/pddO7lWvjpXSO
 UueesTrvVNr2v3zSGeFxiowVCZPCSj+FHiL2XFXXASIzU6NwDFa3fwYLB
 XcvDdCRqIdfYmME16ZneKGvbsOjNx2zqFpcFokJTlLMun/FImGbRARsQQ Q==;
X-CSE-ConnectionGUID: nTHKtdagQ7Wacuh3LbUFMQ==
X-CSE-MsgGUID: e0adpB6aSHiNMFxjTXJDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72448589"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="72448589"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:05:45 -0700
X-CSE-ConnectionGUID: Hoss/SlFQvaJu/wuORfjIw==
X-CSE-MsgGUID: OimUsvMnRJ6UHZP6yAfzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179683644"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2025 04:05:44 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix memory leak
Date: Fri,  3 Oct 2025 11:05:43 +0000
Message-ID: <20251003110543.4129362-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

Subtest failed with error double free detected. free() was called
in end of loop which was causing memory leak. As a fix free() has been
called after each condition to avoid pointer overwritten and can lead
to memory leak during first call.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 9ab8b43de..b17ece9d7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1304,6 +1304,7 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 			return;
 		}
 
+		free(mem_attrs);
 	} else if (flags & PREFETCH_SAME_ATTR) {
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_GLOBAL);
@@ -1319,6 +1320,7 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
 					  DRM_XE_ATOMIC_GLOBAL);
+		free(mem_attrs);
 	} else if (flags & PREFETCH_CHANGE_ATTR) {
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_GLOBAL);
@@ -1334,8 +1336,8 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_DEVICE);
 		}
+		free(mem_attrs);
 	}
-	free(mem_attrs);
 }
 
 static void
-- 
2.43.0

