Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2864BC369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 16:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ADB10E070;
	Wed, 16 Apr 2025 16:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye8PKjIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E26B10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744819823; x=1776355823;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XC1Pf0runyKvY9ZIyrwn063WAHlxyRV1LqIXS0Je5XI=;
 b=Ye8PKjIiVnAwD1cJjXwwIcQRCAwlwod7weAgm86YLH1SJyw5Ev3Gw2ar
 7MOVgM45RMFWXhOHQfxvxtNrBtnl+4WJkx4If6xJ/kfkWHYf+CgE1p6u6
 sw3590bEfW9QEuPbn7gN7iyKUeEkOy7dlT6G7T0si7vCOvW1LZkZ6E96F
 2iZJFI5ka9oZED/9+0iJ8xrYiGH6oMXY1Vi/6Kefj61v7K8JZ/8Db5bR8
 I+VBlqMLNYIC7kGse1mCayYznE388R3oOOb3TpPG5RTmbHwdk+pcBZ5Nj
 +hKIrW2b+RMjikZdKb9M86qaSt00vNNf/K4hAMaDLFHGpknWYiiequApC w==;
X-CSE-ConnectionGUID: z1bAJ51XROKNagvaa01guw==
X-CSE-MsgGUID: LQGFPyVUR4y9xgII3KLM4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46260107"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46260107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:09:09 -0700
X-CSE-ConnectionGUID: HQ//WScWRpOaEkwPOsK4kw==
X-CSE-MsgGUID: 9UZGCTMeT3my8K7X5RXAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131432581"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 09:09:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] lib/xe/spin: Use READ_ONCE,
 WRITE_ONCE macros in Xe spin library
Date: Wed, 16 Apr 2025 09:10:25 -0700
Message-Id: <20250416161025.361516-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Without the READ_ONCE macro is xe_spin_started(), a compiler may choose
to read the value of spin->start exactly once rather than every call of
xe_spin_started(). If the initial read is before the GPU batch execution
flips spin->start to a non-zero value, the test will hang forever. This
was shown on Chrome.

For uniformity, update xe_spin_end to use WRITE_ONCE too.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_spin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 0de0b1f2e9..65c29284aa 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -145,7 +145,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
  */
 bool xe_spin_started(struct xe_spin *spin)
 {
-	return spin->start != 0;
+	return READ_ONCE(spin->start) != 0;
 }
 
 /**
@@ -162,7 +162,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
 
 void xe_spin_end(struct xe_spin *spin)
 {
-	spin->end = 0;
+	WRITE_ONCE(spin->end, 0);
 }
 
 /**
-- 
2.34.1

