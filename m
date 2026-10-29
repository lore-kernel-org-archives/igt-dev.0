Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B04606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iErcFlVU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9410FFA8;
	Thu, 29 Oct 2026 07:05:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD0F10E792
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 07:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793257454; x=1824793454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=apDNWwAoWY1fd5ojc0RgRhPsE70gQ18rLXnhko4Gmf0=;
 b=iErcFlVUdxeB/97uG51rkRJ4QIJuPnHcATpLVqs+Kzan0+0l4dLq5ws5
 jYp9dMEgDNAmaWaftL7bv79MWO6MLKuW74NjBmcK1LGFSQ+Oilbjj1c2P
 pkffdj/QEZce8yMVI1Ls6X90MNOSjn8KlQ0KAIxMQRrFZabBWlPzMnWit
 aRaE4f+itiz8VQ8lt2F/Vbnjfdqp8SsvxSh9yEodLIiztoA/lwhB9bvnD
 3o94uo1TPAsjc97qyMvQaCugfYaa3nYKy5UDVZUpTEVu1UTOGW5iFv4cE
 E2zRlaHXD/bYwrVJOTw5UT9bEoNL85zw4dhxhMryME0BoIyZvlG9eS4Dz A==;
X-CSE-ConnectionGUID: WAOT9lIsSTGAFOSfcVYxrA==
X-CSE-MsgGUID: eZtvHjI7RFqSvVGfpZkYVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1875965"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1875965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 00:04:13 -0700
X-CSE-ConnectionGUID: 6TM+96eYQN2y7DqWo9L4hQ==
X-CSE-MsgGUID: 5IJXHNGCQwKytDEeDglIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5391392"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2026 00:04:11 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	jia.yao@intel.com
Cc: himanshu.girotra@intel.com, kamil.konieczny@linux.intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH] tests/intel/xe_exec_threads: handle reset rejection in
 multi-queue hang test
Date: Thu, 29 Oct 2026 07:04:10 +0000
Message-ID: <20261029070410.1549615-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

The multi-queue hang subtests intentionally hang one queue of a
multi-queue group. All queues in the group share the same reset domain,
so when the hang queue triggers a GPU reset the sibling queues are reset
as well and the kernel rejects further execs on them with -ECANCELED.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_threads.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2974fc312..f03f20142 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -766,6 +766,20 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			do {
 				err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
 			} while (err && errno == ENOMEM);
+		} else if (flags & HANG && flags & MULTI_QUEUE) {
+			int err;
+
+			/*
+			 * In multi-queue mode all queues share a single reset
+			 * domain. When the hang queue triggers a GPU reset the
+			 * sibling (non-hang) queues are reset as well and the
+			 * exec ioctl is rejected with -ECANCELED. This is
+			 * expected and should be handled gracefully.
+			 */
+			do {
+				err = __xe_exec(fd, &exec);
+			} while (err == -ENOMEM);
+			igt_assert(err == 0 || err == -ECANCELED);
 		} else {
 			xe_exec(fd, &exec);
 		}
-- 
2.43.0

