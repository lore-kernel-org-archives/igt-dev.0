Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A4C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 18:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405C10E622;
	Tue,  9 Jul 2024 18:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsPYO//L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3510E622
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720548407; x=1752084407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bYY1q8mqkkllqMJjoBvjS2qLD5+hQn+/YoScdEM8+Fw=;
 b=XsPYO//LdkE7dH7qSyzmpoweRw8k89HYrIgqP7S7O0+QHgNKmj8tYF/D
 iPwZD7IYfiNGyCAobwSf4XvA0nY/F7ilJOMZ/ttrz1fn0NR4mo1cv5UFv
 SjNzTILXtNrxDzdAnf0sNSgGujRRfjWygijSiga8KDV6PgZ+N7F7UfX8b
 lORmlF6LfSErqFQybQHwEgNi8WXNTu5+0PBI7w9//qMY+9kzCL+MxkXj3
 orLL/M5rFTfoAIYoUV+RVvCDdZUpJoycM00wg6QTWtSZXdLrwVDZVU1nZ
 dprH9E+psbnC7SHUI5qVxJ6G9llatdSEvgYN/QbwqzjQL6LR0hvWc0xMW A==;
X-CSE-ConnectionGUID: CLnlo9PBRm2E4BcBn76O5A==
X-CSE-MsgGUID: RXWOgWCeRWudkkKnVaZBOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21639013"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="21639013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:06:46 -0700
X-CSE-ConnectionGUID: nCj249moS96De0KYxAYNoA==
X-CSE-MsgGUID: ORg4oHrYQ4OZncgHsyyyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52546704"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:06:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: fei.yang@intel.com
Subject: [PATCH] xe_exec_reset: Wait for spin batches to start
Date: Tue,  9 Jul 2024 11:07:26 -0700
Message-Id: <20240709180726.1033327-1-matthew.brost@intel.com>
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

Ensure spin batches are running on hardware before triggering any type
of reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 817b82cdef..dcb22f275f 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -236,6 +236,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		if (e != i)
 			 syncobj_reset(fd, &syncobjs[e], 1);
 		xe_exec(fd, &exec);
+
+		if (i < bad_batches && !(flags & CAT_ERROR))
+			xe_spin_wait_started(&data[i].spin);
+
 	}
 
 	if (flags & GT_RESET)
@@ -380,6 +384,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		if (e != i)
 			 syncobj_reset(fd, &syncobjs[e], 1);
 		xe_exec(fd, &exec);
+
+		if (!i && !(flags & CAT_ERROR))
+			xe_spin_wait_started(&data[i].spin);
 	}
 
 	if (flags & GT_RESET)
-- 
2.34.1

