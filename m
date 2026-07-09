Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7FDC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4F10F373;
	Thu,  9 Jul 2026 05:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftyaZ9tQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3518610F373
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783576676; x=1815112676;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VdQNjfP9535HAOZXg8EA4vTRwxoO+FuJs9wD8wqiEvc=;
 b=ftyaZ9tQRmBMSJJ56xXld/ZVhkmTczIBzCyBuCahxt2PUJDLPOFRplD0
 +HS2vOOvUPIIl0HO8uvGb/arU1y1QkJ/1oDOnx4tmBejg9mYxaSanauH0
 Kx1BipCf2ucXxA1VGcfOV2GYAFzjCYis94UBDmLT10r0yY4t5DYmvOVMW
 TDO/JGsUHMTAdKAvO/yjy9mmYYoW/rKjRB5AIpLtiaV+b2heogcegSP6X
 tstxgE7KNZjlWj0bqLH6wnC9yJlcLp11vY5S13/YIKz6neGB98+qLAPLr
 dxx1QMEN+2jkMIsRqgZuJbM8kTGfLvSmuBX7ZD2krij0JAqhjRN0B17TD g==;
X-CSE-ConnectionGUID: Upsf1zh8R2OaHPyXg1aqlQ==
X-CSE-MsgGUID: dvYbn5e4R9C/6MkslNcUnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84301942"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84301942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:57:56 -0700
X-CSE-ConnectionGUID: Oh68m5xBR1K7LtHbYizWkQ==
X-CSE-MsgGUID: PxRzYOPvQoS8u2coN0Kr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250502844"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2026 22:57:55 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix igt_assert_f condition in
 test_oom
Date: Thu,  9 Jul 2026 11:27:54 +0530
Message-ID: <20260709055753.2081956-2-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

igt_assert_f(err, ...) is reached only when err is non-zero, so the
assertion always passes and unexpected vm_bind errors are silently
ignored. Negate the condition to igt_assert_f(!err, ...) so the test
fails on any error other than ENOMEM/ENOSPC.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 386a0981aa..1d109e783b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2799,7 +2799,7 @@ static void test_oom(int fd)
 				oom = true;
 				break;
 			}
-			igt_assert_f(err, "Unexpected error %d for vm bind\n",
+			igt_assert_f(!err, "Unexpected error %d for vm bind\n",
 				     err);
 		} else {
 			bind_vm = bind_vm + 1;
-- 
2.43.0

