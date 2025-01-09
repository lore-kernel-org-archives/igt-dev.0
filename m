Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913D5E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 07:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418C210ECFD;
	Thu,  9 Jan 2025 07:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpJIt4K0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0110ECFD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736408557; x=1767944557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g90CWRD5jIp4l+0ywNcVZy+BPybUDG8Bg9zCaVidgO8=;
 b=PpJIt4K0SGiMpwJRuc4zIo9+B0zE5FfUBk5uawoK+1ksQWDqaWdZyx+p
 eSEOPRe/BSfRma+aXDMzfpvo5kYM6oqQslkfR6wmW0n7hqN0jS+eHZx6b
 po8+5Ja1mqbxP5SDEFNNgmCIJFf6vyBjg2UrAQC4UsWOoT20kJDoK4hcc
 NDMML4iOAPqC9G5tQ6n+zYRcMijkXiF7W006/JEtLNGhv+6UgkEhnO1FB
 QOCfoQNBEVllWk7xR7D6SYy9Ieh9H0O56b84jnmLlHu7r1GkcGw7k7vaE
 ViiPv6l/6GlsyBCzl9MLMnHMAhpN4j0vtBMmrUXEJnehNBEA1q2d4IJCR Q==;
X-CSE-ConnectionGUID: BnvqsNxfSjWXQ9nZBZVcGg==
X-CSE-MsgGUID: 37nOkXqpQWG6xu11ox8SPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36541846"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36541846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 23:42:37 -0800
X-CSE-ConnectionGUID: ELdGCVPqSpmqKB6PiaX+zQ==
X-CSE-MsgGUID: Gd/F5s6+St6xEGQTnuG2Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103401889"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa006.jf.intel.com with ESMTP; 08 Jan 2025 23:42:35 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: katarzyna.piecielska@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/intel/xe_vm: Fixed documentation
Date: Thu,  9 Jan 2025 13:09:29 +0530
Message-Id: <20250109073929.913205-1-pravalika.gurram@intel.com>
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
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b10269191..42a47ceac 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2247,18 +2247,10 @@ static void bind_flag_invalid(int fd)
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
+ * Functionality: ioctl_input_validation
  * Functionality: fault
  *
  * arg[1]:
@@ -2279,9 +2271,11 @@ static void invalid_flag(int fd, __u32 flags)
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
@@ -2309,12 +2303,15 @@ static void vm_create_invalid_reserved(int fd)
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

