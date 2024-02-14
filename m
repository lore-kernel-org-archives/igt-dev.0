Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA74C48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 20:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E110310E144;
	Wed, 14 Feb 2024 20:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPQWUolH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688810E144
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707943497; x=1739479497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/8GIima2+qjkgPhZ4VrFwyCHnrVA6bPEPgvITrYr64=;
 b=QPQWUolHIWXM1yT/vraHHVSYRMKZEGFtH3PZpVSjKD5vLa3Lqt/kP12u
 ZH9rYcp+c7rfIRk+lqMyAsDZGEH2ItTxsN7Wlp0N3rEncK6LtcTp0VsFF
 GhEZE8N/UySzV+SbNLng3pvmmUJSgaQ7BKP50AlNcf9UerpB5eCEzdEi/
 68eRWggt36U6Q9T8RXoWOEeFpGbFQIbCyMlG8dyBiHeCmz0hni2vNn/5q
 q6DqeaYpltDMwBj0W8qwYUC76Ik1f7SvzLZpDAY6r8j0AlTJigYrNcC9+
 dkk0YD9aiTJZNBPos9da7HYNtBIwdQzjGvZLaRussyFNWL9YvikHod1sX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="13409499"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="13409499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 12:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="34372232"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 12:44:55 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Test DRM_XE_VM_BIND_OP_UNMAP_ALL
Date: Wed, 14 Feb 2024 12:44:50 -0800
Message-ID: <20240214204450.185531-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There was no test making use of DRM_XE_VM_BIND_OP_UNMAP_ALL, so
here adding a simple one just binding and unbinding bo.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/xe_vm.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fe667e64d..1f7ab0f63 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -220,13 +220,41 @@ test_bind_once(int fd)
 			   1, &addr);
 }
 
+/**
+ * SUBTEST: unbind-all
+ * Description: bind and unbind with DRM_XE_VM_BIND_OP_UNMAP_ALL
+ * Functionality: unbind BO
+ * Test category: functionality test
+ */
+static void
+test_unbind_all(int fd)
+{
+	uint32_t bo_size = xe_get_default_alignment(fd);
+	uint32_t va_bits = xe_va_bits(fd);
+	uint64_t *addrs = (va_bits == 57) ? addrs_57b : addrs_48b;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	uint32_t vm, bo;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	xe_vm_bind_sync(fd, vm, bo, 0, addrs[0], bo_size);
+
+	xe_vm_unbind_all_async(fd, vm, 0, bo, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
 /**
  * SUBTEST: bind-one-bo-many-times
  * Description: bind many times on one BO
  * Functionality: bind BO
  * Test category: functionality test
  */
-
 static void
 test_bind_one_bo_many_times(int fd)
 {
@@ -2090,6 +2118,9 @@ igt_main
 		}
 	}
 
+	igt_subtest("unbind-all")
+		test_unbind_all(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.1

