Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B282C0218D
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 22:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0552810E9EA;
	Thu, 30 Jan 2025 22:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGh/ZuYA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7010E9F1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 22:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738275311; x=1769811311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhZDUP9GyHZ89J496br6RHEtuY/w/cfUQJW3dRCDbLA=;
 b=dGh/ZuYAJ1Oc/lP2IW2eYAMpqgZX/if3QetyNteANAdbUgCxwkIaeWNz
 sTUh5JV3pJZ8oMTffTVKQdz6yozZc0mnqOofTuFDpPYSrVUAxuEPpXl2z
 QxEJ0z2T5mGxvYxIA/hGCyxqV/cfG6OXyDHSNTmIMP5jE9CbPREQatqO8
 b3HtmdBiDT3duJUHxocpaaMKTESaDUm/wMi+nm/kiBMc54cPKkCUtjrmQ
 mLhApFnD4iF2I6j+KZBummE8n5eQgySRKzEeeIHfHQLP1Svc/ik0WzvEK
 XS4vL7UYV3bCqBfOvPX1Mi/HHYmMwji7QW7DDm9zlemm13huXhOZUYHOe Q==;
X-CSE-ConnectionGUID: 27MbFMA4R0aSnNZCVbE9oQ==
X-CSE-MsgGUID: jjmyVZzFRbCcH2QvoNTSxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49502782"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49502782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:10 -0800
X-CSE-ConnectionGUID: mGI2E53rSj2r9+xT/E9+1Q==
X-CSE-MsgGUID: azRepMUiSsKu4+PKJOcBJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="140347257"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_queue_property: Update first
 invalid property value
Date: Thu, 30 Jan 2025 14:14:57 -0800
Message-ID: <20250130221457.1092670-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
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

A new property will be added to support PXP [1], so we need to update
the invalid property testing to start from the next ID to avoid it from
failing once the PXP code is merged.

No new subtests are required to test the new property as that will be
covered by the PXP tests.

[1] https://patchwork.freedesktop.org/patch/634546/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 25a7e7abb..885d5bcc9 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -183,7 +183,7 @@ static void invalid_property(int xe)
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
-	for (int i = 2; i < 16; i++ ) {
+	for (int i = 3; i < 16; i++ ) {
 		ext.property = i;
 		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
-- 
2.43.0

