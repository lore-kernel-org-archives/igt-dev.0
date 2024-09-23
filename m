Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C589CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 16:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB45E10E42F;
	Mon, 23 Sep 2024 16:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4CknMVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82E510E286
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727109164; x=1758645164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z26V3bI91+zGdT4rN+NIm7yvzC3CKP3nF3uHgCTKsp4=;
 b=i4CknMVBx7g4T9msTDJqTuRCFYozZHMKKySM+srmSCnjhEY5y+52JMnK
 unArE6kd7pKSumh9kjfkOanOfwCUCw1/wQLg8/DHCYTyGq6RoAcuN+KRe
 ZPcAx6bhsTPDiU1nFc7HDlRTII7Ounk9UbWNvgLf30AoGPhd969R8v0lc
 PBdlxKwGGX34AnQd0bTB6z0hOv0vIJCpgLgdE0lv//vEGyLmp3l1H/tAs
 1SSB5LRhGN5q814bpafSSb2L8GeQ9EXhuEQP+bBAlh15WchwhjtIU1Hwd
 hz2qji7V84aU3GWxcdzQUihWeacJBZE/Mpbk3uUkr6dddkdnVFS0grRYZ A==;
X-CSE-ConnectionGUID: Ljde6lKQTZq/OPwR2B1zjg==
X-CSE-MsgGUID: kbYBJ+ZvS7OZZKERmg1ITQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="36637862"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="36637862"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:32:44 -0700
X-CSE-ConnectionGUID: 0Wi/IZtPTFmuL+TukTi7dg==
X-CSE-MsgGUID: zt2x5aLOScKUIdkcpVdR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71159777"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 09:32:41 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: Add an assertion on
 MI_STORE execution time
Date: Mon, 23 Sep 2024 22:17:03 +0530
Message-Id: <20240923164703.1923050-1-karthik.poosa@intel.com>
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

MI_STORE_DWORD generally completes within couple of ms.
Assert if it takes more than 1.2 seconds, as it will cause
IGT test to timeout due to sleep of 120 seconds which is
the current per task timeout.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b..29c35f617 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -144,6 +144,15 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 			  1e-3 * submit,
 			  1e-3 * (elapsed - submit));
 
+		/*
+		 * MI_STORE_DWORD generally completes within couple of ms.
+		 * Assert if it takes more than 1.2 seconds, as it will cause
+		 * IGT test to timeout due to sleep of 120 seconds which is
+		 * the current per task timeout. Current there is no way to
+		 * read this timeout from IGT test.
+		 */
+		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 * NSEC_PER_SEC));
+
 		syncobj_reset(fd, &syncobj, 1);
 
 		/*
-- 
2.25.1

