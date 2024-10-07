Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CECCFB44D
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 17:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6B710E1DE;
	Mon,  7 Oct 2024 17:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJgliBPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EABE10E1DE
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728320722; x=1759856722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lTVxn66m8iV4c+xhFcBuv5FMf648Ubu/8eh2BgKilBA=;
 b=ZJgliBPhBamD8x1/Jzk6GRzYo+FGAPDh4U+fnnXXxlsiiZySoyCthEHj
 IgosKMMfUUdnBwv4WMNzCaBIFIrOl+7HC/YMDehyghLbYILqtMOMV7lq+
 REVNZSO8cX1RdpXI51Kwb2pkqJ0hOhy5ujjv4x/gYlYXzU6XQFqI9S23p
 kNdCAgAdgIWIwTNmdfo0j8HPC9qnWnBOafwC9/Gz7tnNFPe8Hzkk+b28f
 9CzhcYXZX1NjeuKkYNgAw3EZVvkXwya0LxltqsB/FqaOPhyC4tufJ2cta
 01BAugxmKu1F9O40R1gvxal1sYAyHGENAwZ63luvK1/4Ux68PaAC8s3wn w==;
X-CSE-ConnectionGUID: CLoH2UUiTT69d0InR0Kwqw==
X-CSE-MsgGUID: b/HmCIODRjC6t0Jfgu4fLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50016036"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="50016036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 10:05:22 -0700
X-CSE-ConnectionGUID: 4Yk54c27TwGjRPdgp2Nf8w==
X-CSE-MsgGUID: fFv/Y7wnS5aSIGipn0cjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75495228"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2024 10:05:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Date: Mon,  7 Oct 2024 22:53:55 +0530
Message-Id: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
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

The reported time does not reflect the completion time of
MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
Therefore, it represents the time taken between xe_exec and
syncobj_wait.

This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_pm_residency.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b57..f4d05889c 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -144,15 +144,6 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 			  1e-3 * submit,
 			  1e-3 * (elapsed - submit));
 
-		/*
-		 * MI_STORE_DWORD generally completes within couple of ms.
-		 * Assert if it takes more than 1.2 seconds, as it will cause
-		 * IGT test to timeout due to sleep of 120 seconds which is
-		 * the current per test timeout. Currently there is no way to
-		 * read this timeout from IGT test.
-		 */
-		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 * NSEC_PER_SEC));
-
 		syncobj_reset(fd, &syncobj, 1);
 
 		/*
-- 
2.34.1

