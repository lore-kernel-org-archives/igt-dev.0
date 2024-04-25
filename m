Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D701C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 14:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32EA11A4A0;
	Thu, 25 Apr 2024 14:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P31VE0F8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D7A11A4A1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055070; x=1745591070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yue5Ee3kj7m+317W20HHZh2tReEIaNvZlvda5CjjyRY=;
 b=P31VE0F8NBk0umNOoLwxh3niedQLbPYHp7aJsdqOUYBpmrJ0fEvXWaUL
 8VWsvDWmC4Pxb14a4SQlWCjz62Fckx9RJaUGItKzSWq7/gsJafz/b1b8b
 76Z4LMcXsAzMeNU8UJxH1fy5GgMkXmKWodRPDkz6sim6NLMY7dSYcS5iC
 uqW0MaeJ+BTdwt/hJvZ+clq1FQIymEp+BusBJO7Sq4mDEnUEp8YpxNrRK
 J8gV7QXBAG3TMP3NGSB3tVduxUpzZj7MPiTk7PQNCGHmSOSGOJc71lXi5
 mWa+yhZXimU/X/awC18/g9PV6lOYkMS0tp4cReccTUg5MJoe1SYNqvn6g A==;
X-CSE-ConnectionGUID: jf/PVjTTSk6HQlTWT6CNWw==
X-CSE-MsgGUID: ZVWb1G3STOmjkAMTx/Iw5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13577920"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="13577920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:24:29 -0700
X-CSE-ConnectionGUID: YcPpwjeITe2RYEAXGJJPjw==
X-CSE-MsgGUID: fb9XS/cKSH+rUQnph4W+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25114751"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:24:28 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel: Put multiGPU tests in MultiGPU
 subcategory
Date: Thu, 25 Apr 2024 14:24:12 +0000
Message-Id: <20240425142412.3751980-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425142412.3751980-1-katarzyna.piecielska@intel.com>
References: <20240425142412.3751980-1-katarzyna.piecielska@intel.com>
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

Some of multiGPU tests were having CMD submission subcategory. Let's fix
that and have all multiGPU tests in one subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_create.c     | 1 +
 tests/intel/xe_exec_basic.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 6ea5ad38b..8d1db9896 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -250,6 +250,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
  *              buffer sizes.
  *
  * SUBTEST: multigpu-create-massive-size
+ * Sub-category: MultiGPU
  * Functionality: ioctl
  * Test category: functionality test
  * Feature: multigpu
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5210e6730..cc2d2b8b6 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -57,14 +57,17 @@
  *
  * SUBTEST: multigpu-once-%s
  * Description: Run %arg[1] test only once on multiGPU
+ * Sub-category: MultiGPU
  * Test category: functionality test
  *
  * SUBTEST: multigpu-many-execqueues-many-vm-%s
  * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
+ * Sub-category: MultiGPU
  * Test category: stress test
  *
  * SUBTEST: multigpu-no-exec-%s
  * Description: Run no-exec %arg[1] test on multiGPU
+ * Sub-category: MultiGPU
  * Test category: functionality test
  *
  * arg[1]:
-- 
2.34.1

