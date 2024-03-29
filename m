Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2184C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 21:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376E81128A8;
	Fri, 29 Mar 2024 21:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEbA/5cE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E81128A8
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 21:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711746730; x=1743282730;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y6FggpcemnQS/3nZ8V8fMC76LvnXEptARlfK8FCrYT8=;
 b=BEbA/5cEl+nHkKFmyZ0W9pViQkEsv/BGtlrBGsQ+1067kHrAUgADo8kg
 z0Y+C/y8vK7HENvGxbLFdTIikjusYaT3ohyqwfJEkLne+QJwiP7ehM6Pt
 zCD336VPvM2WauTKHUwe07J8ztpD/eCBG34ld9pFd0sUmBPLuRFDmnme3
 ptLfEqTWIzMXZ208AL/D593ZdsQRNyk31a6cy2YI2Evhcy9CKThO1Yusr
 MHi9i7CmK4dEHEJGS2xcKvk6vs5F0yeUN6qBmnOQ/ZnwL3G9vMCEPxvBB
 dBu91YnZXYOiRcfPegSGBGhRNG3KM2nJxClodztj35I8s9kA2tIA+1m82 w==;
X-CSE-ConnectionGUID: UbKFyMi4SbW5WDHLuE8hKA==
X-CSE-MsgGUID: gu3Fp1j3Rdq3/Bazmvrpsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="18321484"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="18321484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 14:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="16974655"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 14:12:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/xe_spin: Fix doc whitespaces and typo
Date: Fri, 29 Mar 2024 14:12:43 -0700
Message-ID: <20240329211243.924363-1-lucas.demarchi@intel.com>
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

Fix documentation to follow proper format.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index d142f2cac..381e5e950 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -188,12 +188,12 @@ void xe_spin_end(struct xe_spin *spin)
 
 /**
  * xe_spin_create:
- *@opt: controlling options such as allocator handle, exec_queue, vm etc
+ * @opt: controlling options such as allocator handle, exec_queue, vm etc
  *
  * igt_spin_new for xe, xe_spin_create submits a batch using xe_spin_init
  * which wraps around vm bind and unbinding the object associated to it.
- * This returs a spinner after submitting a dummy load.
  *
+ * This returns a spinner after submitting a dummy load.
  */
 igt_spin_t *
 xe_spin_create(int fd, const struct igt_spin_factory *opt)
@@ -260,7 +260,7 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 
 /*
  * xe_spin_free:
- *@spin: spin state from igt_spin_new()
+ * @spin: spin state from igt_spin_new()
  *
  * Wrapper to free spinner whhich is triggered by xe_spin_create.
  * which distroys vm, exec_queue and unbinds the vm which is binded to
-- 
2.43.0

