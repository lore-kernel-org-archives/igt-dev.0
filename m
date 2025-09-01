Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1B8CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 09:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5B10E3A4;
	Mon,  1 Sep 2025 09:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYDybwcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F110E3A4
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756718237; x=1788254237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tJk9uZ93Cu/r8IJ8L7nagfI04xnAQo7Ghx/nmIzOlwo=;
 b=dYDybwcYOVvoBualoCiDt74c3rvAnsW48PQVXAgfrqwtj/92LH42QdPT
 AflsN5EVL75lNfO/csvNohHx0OOuUl2awLebwxJ4cP0LOlyHLDCLRxOfy
 cwJkAp2nCex2aZqq4HNLZ4GbdlBjU/3ocZPPyPMQy9qxrw05hWSCXTgc1
 fxUDsPHLUWIirxYIyMu9Ch5pYsoFMlcdG9V7NeKa850hDVjU3g7R3QG93
 G7kTj2UUEXQxrPJ5YgUnbY8pYC5c760aACEUBQm8GrqNd/WsQ4EiLVj0f
 aKYm33PMp6FA2sQXYTmbc3DmBTj4/1kUscxbFh0RY1ybE4x8OOSkEAIvF g==;
X-CSE-ConnectionGUID: i9ValSVZQxiW8OYVMlN+rg==
X-CSE-MsgGUID: bp+CZFHiRfetKEXuRZgZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="46551313"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="46551313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 02:17:16 -0700
X-CSE-ConnectionGUID: FMIXsynfTaOGt6P2/FIK7g==
X-CSE-MsgGUID: hBkPjF31Rquof00Q5lD+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="175339214"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 02:17:14 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t] lib/xe_util: use valid pat_index during vm-bind/unbind
Date: Mon,  1 Sep 2025 11:17:09 +0200
Message-ID: <20250901091708.125589-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For single operation instead of object pat_index default index was used.
Change bind/unbind call to one which supports passing it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/xe/xe_util.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 794f2b6390..96287423ff 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -218,13 +218,17 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 
 	if (num_binds == 1) {
 		if ((bind_ops[0].op & 0xffff) == DRM_XE_VM_BIND_OP_MAP)
-			xe_vm_bind_async(xe, vm, bind_engine, bind_ops[0].obj, 0,
-					 bind_ops[0].addr, bind_ops[0].range,
-					 syncs, num_syncs);
+			igt_assert_eq(__xe_vm_bind(xe, vm, bind_engine, bind_ops[0].obj,
+						   0, bind_ops[0].addr, bind_ops[0].range,
+						   DRM_XE_VM_BIND_OP_MAP, 0,
+						   syncs, num_syncs, 0,
+						   bind_ops[0].pat_index, 0), 0);
 		else
-			xe_vm_unbind_async(xe, vm, bind_engine, 0,
-					   bind_ops[0].addr, bind_ops[0].range,
-					   syncs, num_syncs);
+			igt_assert_eq(__xe_vm_bind(xe, vm, bind_engine, 0,
+						   0, bind_ops[0].addr, bind_ops[0].range,
+						   DRM_XE_VM_BIND_OP_UNMAP, 0,
+						   syncs, num_syncs, 0,
+						   bind_ops[0].pat_index, 0), 0);
 	} else {
 		xe_vm_bind_array(xe, vm, bind_engine, bind_ops,
 				 num_binds, syncs, num_syncs);
-- 
2.43.0

