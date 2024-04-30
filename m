Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3E5C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 22:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5C8112F71;
	Tue, 30 Apr 2024 22:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpfwuqAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1C4112F71
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714515377; x=1746051377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SJCcra55jGOik3FScQMBzlj6dQKMPZYteYfBCrqTt+M=;
 b=WpfwuqAKINHgoNzpVUwh+0it5bZ8kcoe39YJImabO/OTi4MZLg0nnj54
 dBBg7RWZ1MJ0DJV3Q3PVc2GxTAmwdIZUYHz4fEA+7u8xND2zaf91y+pNE
 e/ZJG9U8sXpTBcWRoZOiABxatWTTorHRMRKiL5aq+J0+bZX5t/GuRfOCz
 Hz7TIk3d6a2lrUqJ44WlJh1QzjSj6eC+lYpAfjRIAVfschLHu3BdPAsY0
 keh0YKNMarsx62gDAvz2bsyWzhTUTTK02fQFIRdyH6Awrtd8fFUg1bUBP
 g7X0B+jkkBD8pgOUmUHzMvJdD43TntzY+gyYpoXJaqRJpMjnHvx+Xb+MV w==;
X-CSE-ConnectionGUID: HQ7ZIYB3TMSw+v4OOkXzmg==
X-CSE-MsgGUID: YGLWmJ9sT1qMarXv3VsMGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10409910"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="10409910"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 15:16:16 -0700
X-CSE-ConnectionGUID: HgBOq9vzRAyTNIoSFDgWaw==
X-CSE-MsgGUID: CrrYVNrbRWq6Nih+m/UjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="31216989"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 15:16:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] tests/intel/xe_vm: Update mmap hammer sections to prefetch
 next page
Date: Tue, 30 Apr 2024 15:16:44 -0700
Message-Id: <20240430221644.2370891-1-matthew.brost@intel.com>
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

Adjust mmap hammer sections to prefetch next page by moving BB to within
PAGE_SIZE /8 of page boundary. This is prefetch next page on all
platforms, even ones with a smaller prefetch size.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index de2b1a8136..77cf1f7e67 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1623,10 +1623,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		t.fd = fd;
 		t.vm = vm;
 #define PAGE_SIZE	4096
-		t.addr = addr + PAGE_SIZE / 2;
+#define HAMMER_OFFSET	(PAGE_SIZE - (PAGE_SIZE / 32))
+		t.addr = addr + HAMMER_OFFSET;
 		t.eci = eci;
 		t.exit = &exit;
-		t.map = map0 + PAGE_SIZE / 2;
+		t.map = map0 + HAMMER_OFFSET;
 		t.barrier = &barrier;
 		pthread_barrier_init(&barrier, NULL, 2);
 		pthread_create(&t.thread, 0, hammer_thread, &t);
@@ -1685,7 +1686,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert_eq(data->data, 0xc0ffee);
 	}
 	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
-		memset(map0, 0, PAGE_SIZE / 2);
+		memset(map0, 0, HAMMER_OFFSET);
 		memset(map0 + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
 	} else {
 		memset(map0, 0, bo_size);
-- 
2.34.1

