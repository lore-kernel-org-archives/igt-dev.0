Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CCCF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 08:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FA10E2BB;
	Tue, 24 Sep 2024 08:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6BXt5zG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892A110E2BB
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727167798; x=1758703798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xMP2TXEwZP6GEdybyH/r/QhZjL2sTZ+MEHhDO0rRhyU=;
 b=c6BXt5zGjICPWRebejXRv/nSFnyYSTEAYS5jG84C47g5Z1AQPlxHwwfE
 /0eXRAT7sJP5KON7pPLr5aYH5tOAo8KEl+DN9eRYyIvEFB2d93D7PmI2X
 Zad4cnP44YdAfl0w1imDvsU6nQ5J2lcDcj0028cf8FxOv1L3i4mgPOKku
 s5fzQ0o/KyEpow/2x0aa4AnDOUN7/TXyM/nwZE38s+huseY+W3eeNcZ9E
 Dn33h97BwYn8XcePS5e6Yw1KTgYbP4/nDlHLE/scDHOEbq1g0GO6TBj0X
 rhWi0Cb5KVMKue0PtCV5UyyUYnAeK9EfBjHk7l+EbZHompNLPH/cpWN+C Q==;
X-CSE-ConnectionGUID: zapRzZlpSqiTkB8ASgoNiQ==
X-CSE-MsgGUID: /at/2EMtSxyp7Pby6+YGbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26243654"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26243654"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:49:49 -0700
X-CSE-ConnectionGUID: zqHIXm0DQf+nJHFzeGODQg==
X-CSE-MsgGUID: 0DWN/6h5RMODPikSvBYdoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="75870283"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:49:47 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v1] tests/xe_eudebug: use proper address when waiting
 for fence
Date: Tue, 24 Sep 2024 08:49:37 +0000
Message-Id: <20240924084937.95759-1-jan.sokolowski@intel.com>
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

An incorrect address was used as an argument passed to xe_wait_ufence,
which caused pagefaults as they referenced unmapped addresses.

Use proper address in xe_wait_ufence.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 40e07ddf6..e28c9ab67 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2121,7 +2121,6 @@ static void *vm_bind_clear_thread(void *data)
 	fence_data = aligned_alloc(xe_get_default_alignment(fd), sizeof(*fence_data));
 	igt_assert(fence_data);
 	uf_sync.timeline_value = 1337;
-	uf_sync.addr = to_user_pointer(fence_data);
 
 	igt_debug("Run on: %s%u\n", xe_engine_class_string(priv->hwe->engine_class),
 		  priv->hwe->engine_instance);
@@ -2157,6 +2156,7 @@ static void *vm_bind_clear_thread(void *data)
 
 		delta = (random() % bo_size) & -4;
 
+		uf_sync.addr = to_user_pointer(fence_data);
 		/* prepare clean bo */
 		clean_bo = xe_bo_create(fd, vm, bo_size, priv->region,
 					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -2197,9 +2197,9 @@ static void *vm_bind_clear_thread(void *data)
 		eq_create.extensions = to_user_pointer(&eq_ext);
 		exec_queue = xe_eudebug_client_exec_queue_create(priv->c, fd, &eq_create);
 
-		memset(fence_data, 0, sizeof(*fence_data));
+		uf_sync.addr = (cs - map) * 4 + batch_offset;
 		xe_exec_sync(fd, exec_queue, batch_offset, &uf_sync, 1);
-		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
+		xe_wait_ufence(fd, (uint64_t *)cs, uf_sync.timeline_value, exec_queue,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
 		igt_assert_eq(*map, 0);
-- 
2.34.1

