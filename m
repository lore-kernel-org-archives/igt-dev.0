Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FE1C7EE31
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 19:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5C210E089;
	Thu, 26 Jun 2025 19:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfCyPwC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095DC10E089
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750964417; x=1782500417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Iy6nQV7CEfGKqDIQvKiGyj0rmrw+kdxvA18sOkO71f4=;
 b=dfCyPwC46Q9bwSBEIV71B/JjzLBZsVZ/599V4F5MEqIfzZ8hhG3rjQdE
 dNkkLKvexAYntflO8epBIDfYxmS0Iw4+vMkYTu8x0vKhLuJjZBNgJb3TN
 DZ4XthjLRbEmoQZ1MeGXDZ6Xb831IYE+uBpA+pFXFumgRBCcVGvMMZ+sV
 /8/SNHxiVrKvIzP9rWvkrMKMUtTA5Rf3aKZDOauq4i2/zJj86csnQoomv
 9JuF1tAmLFf9HUrE2hXZEvTwpl3Ck3TQ9kbmdpXYXu/nFh/Ufb797xvw7
 frj65K+ltXBDejqmfTJheKyhn8PlXNH69LmXsAJ8nVow/vMEILQR2GBJF A==;
X-CSE-ConnectionGUID: yIL1zJyETYWjrB9OSS2//w==
X-CSE-MsgGUID: +hk+n1VATG+K/T9RHGMYGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52394057"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="52394057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:00:16 -0700
X-CSE-ConnectionGUID: sHUvCYJMSI+5ppzLE/CjCg==
X-CSE-MsgGUID: WVlqSAHUSuenBZLvgw77+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="183501319"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:00:15 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 brian3.nguyen@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] [i-g-t] tests/intel/xe_dma_buf_sync.c: Ensure spinner
 completion
Date: Fri, 27 Jun 2025 03:00:02 +0800
Message-Id: <a2c1172f61589220cb2ee5a5ece02bb3f9f722d3.1750963929.git.jagmeet.randhawa@intel.com>
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

Add syncobj_wait() to verify that the spinner operation on fd[0]
has completely finished before proceeding to clean up.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_dma_buf_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 3e8d89e95..1c0e7c670 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -203,6 +203,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		xe_spin_end(&data[i]->spin);
 		igt_assert(syncobj_wait(fd[1], &sync[1].handle, 1, INT64_MAX,
 					0, NULL));
+		igt_assert(syncobj_wait(fd[0], &syncobj_signal, 1, INT64_MAX,
+					0, NULL));
 		igt_assert_eq(data[i]->data, 0xc0ffee);
 
 		/* Clean up */
-- 
2.34.1

