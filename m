Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F8F606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dzStRXra
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13ED10EB1D;
	Mon,  2 Nov 2026 05:30:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6894B10EB4D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793597143; x=1825133143;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XQJ9t2t7PDS8GQo9EF3Q6SczjRVghMvhFEfxoz1h4nM=;
 b=dzStRXrazsh/8+slYNmc/wmWTjZqAdb7z0iuLMhjK/SrUNMfF9ZdwgIT
 xZ+jlxBHFcDif3qhg1xwXyrL2jRLrCN0rXQPzUuO7CjvVGqiTm/eZ4eP3
 vxFj+Pb5WKgtMH5n3+gETlXPak6NwOYPrEDivKqrWKdzmFU0Yqb73LVd2
 l5DczuwPcxCBjsSGPEzG5T1T3cOwrsQRH0zO+KCgYLsjt8Wxw1bGfNYMN
 lqbdXjuu2UoPKf6+eWfIfIHZdmZ13RXGcg00x+ANFDZByfr5lR+2+/ycY
 PCOpzdJUyghHgyT2aw/rn73q0hjXDd0zC29r14QTMbNKviwoSOz9TggpC A==;
X-CSE-ConnectionGUID: VCFMogOpSn2MFSV9V5MQhw==
X-CSE-MsgGUID: KCvOWIRySEidOYbt/8Thkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2370331"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2370331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:25:41 -0800
X-CSE-ConnectionGUID: yCc2m6g0RqC+pYP6gtMdRQ==
X-CSE-MsgGUID: CnAxpAZQSwaFn6buSt0pPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6118044"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2026 21:25:40 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe: fix missing vm cleanups in tests
Date: Mon,  2 Nov 2026 10:55:38 +0530
Message-ID: <20261102052534.3358553-8-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
References: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
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

