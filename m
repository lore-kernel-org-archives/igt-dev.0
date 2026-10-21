Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E5606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gaMc+0MK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECFC10E303;
	Wed, 21 Oct 2026 05:04:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311D610E0BF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 05:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792558998; x=1824094998;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bTFw9KgShvLClWZajVqwEa5SSwv2eLPEgycvDAmP83k=;
 b=gaMc+0MKnki9bWAWpcxXkgBQbbHyfpyfOkQ8Pf+pUumDdincZVdIdK1u
 EuQJQxlASibfW9fiEbukQ165PQyfj/PHfyHKqA4CqAzWPlbHlveD5xdN2
 pqMzZ3QFpdod/1W/O0btwMyOewzKWH+cXDdCFtsdt30gEhpeAU3suuOsO
 feZDKHyXpxXVbh4jyhjZaLtD7ib46rlsOKptKlDzFZpJgTnYqs5DYmuMC
 ZpJh9lV9k6x3GcYp8XgnDKqU1DLljxGMTtXXT15btHPO4xw+DM0ddm3dR
 wrWsbQtATAnqeO7KRCd41ZEGEJ9kW+1iET0Q2n9D3G39tzk69gQIou72X A==;
X-CSE-ConnectionGUID: C/oDdVrORFWnHR2I14oAMg==
X-CSE-MsgGUID: AQvu+r+fT8G57GcD4laIzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1173063"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1173063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:03:18 -0700
X-CSE-ConnectionGUID: JKAkfkVvQPWogvaILQUxBg==
X-CSE-MsgGUID: hGofLUsyRXa23xTEY70fXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3355338"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2026 22:03:16 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe: fix missing vm cleanups in several
 tests
Date: Wed, 21 Oct 2026 10:33:10 +0530
Message-ID: <20261021050307.3268228-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
References: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy()
calls:

xe_waitfence.c: waitfence(), invalid_flag(), invalid_ops() leaked
vm/bo(s)/exec_queue entirely; exec_queue_reset_wait() leaked vm.
xe_dma_buf_sync.c: test_export_dma_buf() never destroyed its two
vm/exec_queue pairs.

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

