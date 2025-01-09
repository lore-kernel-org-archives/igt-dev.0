Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10293E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 09:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FFA10E374;
	Thu,  9 Jan 2025 09:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQbUg6EF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C055B10E374
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736413432; x=1767949432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b37SSLE/9WJrV0lS+F6BU7/+RHG+gwhZOLYoetQNfA4=;
 b=FQbUg6EFlWv1kmc1Fm9c0yrzRktocyUsNxFpFnBfxH8sKnDaoLGTELzl
 lRvLjl01crZLdtk4poI1PmK+dzcW7eskaXLekk+A5q4DSgoKFlk31L3X5
 d0nsaHxj+nDFrION+o0vYgDguEO2Vmp0nrRsxzboS5MD5S/pkLXFfns1P
 8gjr3hQJzN94L0Zq5K7r5uApUOn7qdf6i2UE8y+NTK7I1qWM9GgDl8XWf
 kJMBS2+8qRSVFiWRdJERyvKmeCiIJxTK9hRokAL1vmlXuE/BYkD7iRb4n
 UTa69l8pjpywfulXiZYHRrTa70n/s+RwqBOfrMPLISFpcPQ6N49ryyCx1 A==;
X-CSE-ConnectionGUID: sO2r0bdwQ+Wbg/zYsDYxrg==
X-CSE-MsgGUID: HCaG9zrbQQm9/lY8qZGGnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36684185"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36684185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 01:03:52 -0800
X-CSE-ConnectionGUID: qfPyTVx5R2u5++JEuKGu0w==
X-CSE-MsgGUID: O+B5sxZTRfmh2cUh9dr6pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="108334287"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa004.jf.intel.com with ESMTP; 09 Jan 2025 01:03:50 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: katarzyna.piecielska@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/intel/xe_vm: Fixed documentation
Date: Thu,  9 Jan 2025 14:30:44 +0530
Message-Id: <20250109090044.913444-1-pravalika.gurram@intel.com>
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

Each test should contain only one TEST field.
Add the Functionality field in the subtest section
to fix the warnings during the addition of subtests.

Fixes: 4d630db8b8cf ("Check negative cases for vm_create/destroy ioctl")

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Reviewed-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b10269191..ad9a17cc6 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2247,19 +2247,10 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
-/**
- * TEST: Negative test for vm create/destroy ioctl
- * Category: Core
- * Mega feature: General Core features
- * Sub-category: Synchronization
- * Functionality: vm create
- * Test category: negative test
- */
-
 /**
  * SUBTEST: invalid-flag-%s
  * Description:  function %arg[1] used in vm create IOCTL to make it fail
- * Functionality: fault
+ * Functionality: ioctl_input_validation
  *
  * arg[1]:
  * @xe_vm_create_fault:  xe_vm_create_fault
@@ -2279,9 +2270,11 @@ static void invalid_flag(int fd, __u32 flags)
 /**
  * SUBTEST: invalid-extensions
  * Description: Check query with invalid extensions returns expected error code
+ * Functionality: ioctl_input_validation
  *
  * SUBTEST: vm-create-invalid-reserved
  * Description: Send query with invalid reserved value for vm_create ioctl
+ * Functionality: ioctl_input_validation
  */
 
 static void invalid_extensions(int fd)
@@ -2309,12 +2302,15 @@ static void vm_create_invalid_reserved(int fd)
 /**
  * SUBTEST: vm-destroy-invalid-reserved
  * Description: Send query with invalid reserved value for vm_destroy ioctl
+ * Functionality: ioctl_input_validation
  *
  * SUBTEST: invalid-pad
  * Description: Check query with invalid pad returns expected error code
+ * Functionality: ioctl_input_validation
  *
  * SUBTEST: invalid-vm-id
  * Description: Check query with invalid vm_id returns expected error code
+ * Functionality: ioctl_input_validation
  */
 
 static void vm_destroy_invalid_reserved(int fd)
-- 
2.34.1

