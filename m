Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7E8C25B5F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 19:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AB210F5DA;
	Tue,  7 May 2024 19:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBj8N+o6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5C510F60B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715109799; x=1746645799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HSENwtik0cC857w4ONQ5g60jbGKVqXgkJaFROq6T01U=;
 b=TBj8N+o6EnwJ+75EdyekmxIbtHIUrJqn+5Hi3IamBHQG9l9hAwx0RPE2
 bRfnLU9kiAA81TGsKguxlLghY+2W+fgY3S2cBnLPSzIBn3WfGdfJTRUap
 yyDeky2ht/vG91Fr4VnLLdRn9ASXKwodt6MY6c27z1E30esQS8ytqayWP
 VI+rv6DyKH3cFsOjJV/buousMWkQSEEAQ7PcSMAHWIK3clJoHcHLlXejG
 5NZR/c66AudP0g17TNDjfzNegBkLMUzALlbICtciELCjdNpH72HbBX1Lv
 nLeI2DJdZ1nqzf2u7uaXhFIbndIdgFNAvfERXOgiJA9YV9yUH6HbdPu7F A==;
X-CSE-ConnectionGUID: Y3CzP3GuS0OWubATElyQpg==
X-CSE-MsgGUID: OOyk3SJ/Th+s4ddB6W1NhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22342837"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="22342837"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 12:23:18 -0700
X-CSE-ConnectionGUID: DhI8Ubn3TKWhdQG5O+kW7w==
X-CSE-MsgGUID: 8pyq8I9cT3eSrr1mEGoNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="33433328"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 12:23:18 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_spin.c: Fix typo
Date: Tue,  7 May 2024 12:23:12 -0700
Message-Id: <509c80865fe3460ba32ac25b49bb6ed1c40a6b33.1715109028.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix typos to follow proper format.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 lib/xe/xe_spin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 381e5e950..2dbd51199 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -162,7 +162,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
  * xe_spin_started:
  * @spin: pointer to spinner mapped bo
  *
- * Returns: true if spinner is running, othwerwise false.
+ * Returns: true if spinner is running, otherwise false.
  */
 bool xe_spin_started(struct xe_spin *spin)
 {
@@ -262,8 +262,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
  * xe_spin_free:
  * @spin: spin state from igt_spin_new()
  *
- * Wrapper to free spinner whhich is triggered by xe_spin_create.
- * which distroys vm, exec_queue and unbinds the vm which is binded to
+ * Wrapper to free spinner which is triggered by xe_spin_create.
+ * which destroys vm, exec_queue and unbinds the vm which is binded to
  * the exec_queue and bo.
  *
  */
-- 
2.25.1

