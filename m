Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDDA606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jhi8oYLL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343510E74E;
	Tue,  3 Nov 2026 04:56:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8A10F355
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 04:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793681571; x=1825217571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XQJ9t2t7PDS8GQo9EF3Q6SczjRVghMvhFEfxoz1h4nM=;
 b=jhi8oYLLMm4Ont1hvpVuAFFulJuvjKrM8IrpHnY5UDJ/OObzXHV8r81p
 zyD1OW+VuCFs2ssEqRR9aXxxxjELYm9z+L4uib00df3YPDwSprFMk7jNR
 fV6fFn5/+x/VbN3L0z9zPnipR3pjGcbm8rtWnM1OAai9yB0NXmxI/JzDr
 mUD9qVoDYepL55TJnpIWqsyJkqeFzMgFCJJ8IKQpIp+CxXMUqLIpYISRy
 UNW10P2KJL5UxVBSmUzr3wqqdVHXS3icdJGxZO59QbZ51qU2f3gdGI9Zj
 JykS9sd5YVLTaE2+U8gqQKlNSlK47wg3UMCyvM+ZhDiLnPEwDGDirdc6O g==;
X-CSE-ConnectionGUID: 8ikBGHupT++PamDPZwxdeg==
X-CSE-MsgGUID: d4qIA0kdQfWWz9Y8r/r58w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2291380"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2291380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:52:48 -0800
X-CSE-ConnectionGUID: HoGDxrO+T5+Zru5LqdiMrQ==
X-CSE-MsgGUID: E7gHLigiQ7+F2EAu/kIxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6222856"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa004.jf.intel.com with ESMTP; 02 Nov 2026 20:52:47 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe: fix missing vm cleanups in tests
Date: Tue,  3 Nov 2026 10:22:45 +0530
Message-ID: <20261103045241.3367590-8-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
References: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy()
calls.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_dma_buf_sync.c |  6 +++++-
 tests/intel/xe_waitfence.c    | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index f214866a17..7291f17674 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -219,11 +219,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	for (i = 0; i < n_bo; ++i) {
 		munmap(data[i], bo_size);
 		gem_close(fd[0], bo[i]);
+		gem_close(fd[1], import_bo[i]);
 		close(dma_buf_fd[i]);
 	}
 
-	for (i = 0; i < N_FD; ++i)
+	for (i = 0; i < N_FD; ++i) {
+		xe_exec_queue_destroy(fd[i], exec_queue[i]);
+		xe_vm_destroy(fd[i], vm[i]);
 		drm_close_driver(fd[i]);
+	}
 }
 
 int igt_main()
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index ecdce9f93b..91172eea7c 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -136,6 +136,18 @@ waitfence(int fd, enum waittype wt)
 			  ", elapsed: %" PRId64 "\n",
 			  timeout, signalled, signalled - current);
 	}
+
+	if (wt == ENGINE)
+		xe_exec_queue_destroy(fd, exec_queue);
+
+	gem_close(fd, bo_1);
+	gem_close(fd, bo_2);
+	gem_close(fd, bo_3);
+	gem_close(fd, bo_4);
+	gem_close(fd, bo_5);
+	gem_close(fd, bo_6);
+	gem_close(fd, bo_7);
+	xe_vm_destroy(fd, vm);
 }
 
 /**
@@ -208,6 +220,9 @@ invalid_flag(int fd)
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
 	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
 }
 
 static void
@@ -232,6 +247,9 @@ invalid_ops(int fd)
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
 	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
 }
 
 static void
@@ -304,6 +322,8 @@ exec_queue_reset_wait(int fd)
 		munmap(data, bb_size);
 		gem_close(fd, bo);
 	}
+
+	xe_vm_destroy(fd, vm);
 }
 
 int igt_main()
-- 
2.43.0

