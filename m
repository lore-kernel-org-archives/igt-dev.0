Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A797606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XnebWD/l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F83710E0BF;
	Wed, 21 Oct 2026 05:04:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCE610E303
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 05:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792558995; x=1824094995;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f/lsiHKxgTHuj8pbGBGbJeAdQgkwLkyQYAySSDdZz+A=;
 b=XnebWD/lrflM2GuE8pGtaR+DqsxQzYsMHdeYNgtmrSutvGtWGHodNYPR
 n5w6rewkIU5PHqPr+ew6BSDXQEnH63kIyQnczuTrvip3vQediiRo0py5t
 cDAs0lHxFDlMXoyAPH490PcWE1Ru8enJhQT69liF08t8JpjU/9wi2sE1V
 9YNjyQbIuke8rkx74zAxg8Oe79eYjzx1x25FoJr4+hNoy9XBA6y3j4N+M
 YhxfnwGjDl0vCN909qQAZPBwJo4g8imS9NlvPJ/nONIhCGbUMJRGvYpW6
 tg5ckQ5iZRzvOiErObeAwX/WAt8+ZoXynbhrTcpcoJZJQdIkUoBYg+6Lt A==;
X-CSE-ConnectionGUID: N7XgBiifSSqe02CceI22YQ==
X-CSE-MsgGUID: iQnZldZpRpO+QDvUXGtZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1173060"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1173060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:03:15 -0700
X-CSE-ConnectionGUID: q+FbhISURPCQna0lnBCJaw==
X-CSE-MsgGUID: VbVkfetST2m2ibOfrYTjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3355329"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2026 22:03:14 -0700
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] fix missing resource cleanup in several tests
Date: Wed, 21 Oct 2026 10:33:08 +0530
Message-ID: <20261021050307.3268228-4-priyanka.dandamudi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Several Xe test functions created VMs, BOs, exec_queues, pthread
mutexes/conds/barriers, a thread array, and a buf_ops context without
releasing them.
Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy(),
pthread_mutex_destroy()/pthread_cond_destroy(), free(), and
buf_ops_destroy() calls

v2: Split cleanup in two patches each of different type.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  tests/intel/xe: fix missing thread cleanups in several tests
  tests/intel/xe: fix missing vm cleanups in several tests

 tests/intel/xe_compute.c               |  2 ++
 tests/intel/xe_dma_buf_sync.c          |  6 +++++-
 tests/intel/xe_evict.c                 |  5 +++++
 tests/intel/xe_exec_reset.c            |  4 ++++
 tests/intel/xe_exec_system_allocator.c |  6 ++++++
 tests/intel/xe_exec_threads.c          |  2 ++
 tests/intel/xe_prime_self_import.c     |  1 +
 tests/intel/xe_render_copy.c           |  6 +++++-
 tests/intel/xe_waitfence.c             | 20 ++++++++++++++++++++
 9 files changed, 50 insertions(+), 2 deletions(-)

-- 
2.43.0

