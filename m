Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C2C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 19:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAE910E160;
	Fri, 28 Mar 2025 19:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XisWAcw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84F10E160
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 19:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743191243; x=1774727243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3zRRtZBXQIKrmh/ogrKdEFi8lsbyjax6RQZ5zamcmh0=;
 b=XisWAcw4EmEf3NBqigqa1rigHSK4RwVpzun0xCfupNbAjqhyP7MoToYa
 963EcR6mPcXJbQCkSThUvYmTs8TyYh9v/PB5lk0jL3tPcOhGuXNr9Ked/
 Tgz4OIJV/bYsmBbozozmSPjavvzBzJg+dOj2iIoCaREfRXs6qB4ooMKHl
 nIz/eJwL9sr38MpHk4lxfIBZ4LyBabrYRZVGFgmLp69Ph2zhrgqUiuMoD
 n5PfsBnHzQnUJ/xy87flpYGQjqhA2khV30IBRAyG+OvvsYj24KA2E+mRK
 y/bcU/u3mG4Bxmzy+MiuFVMB98OgfACLt36qMd94PY6yT6nf3hM0rVH6S g==;
X-CSE-ConnectionGUID: oOXf9zG/SYS6ulyTqbE2XQ==
X-CSE-MsgGUID: B239No1sQU6oO1nIRuUbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44476438"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="44476438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 12:47:23 -0700
X-CSE-ConnectionGUID: D61OzVf1R+yfffg5yIwPLA==
X-CSE-MsgGUID: 1FkeZcIwRpmocx6Snq/XKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130383803"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 12:47:22 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 alex.zuo@intel.com, "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_vm: Fix typos and clarify ENOBUFS error
Date: Sat, 29 Mar 2025 03:47:03 +0800
Message-Id: <20250328194703.2763203-1-jagmeet.randhawa@intel.com>
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

From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>

Correct typos and enhance clarity by specifying that the test
uses oversized bind arrays to intentionally trigger the
-ENOBUFs error

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c114..3aa07a1a6 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -880,7 +880,7 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
  *
  * SUBTEST: bind-array-enobufs
  * Functionality: bind exec_queues
- * Description: Test bind array which too large are trigger -ENOBUFs error
+ * Description: Test bind array that is deliberately oversized to intentionally trigger an -ENOBUFs error
  * Test category: functionality test
  *
  * SUBTEST: bind-array-exec_queue-twice
-- 
2.34.1

