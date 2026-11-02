Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F8606A324
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kvvv5eCL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8750B10E1DE;
	Mon,  2 Nov 2026 05:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20D10E1DE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793597138; x=1825133138;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VN80Pxpmw+JjqgDK+cO0iJasBgLOYQnufhFY8bFzJI4=;
 b=Kvvv5eCL81UeRfOCT8VhYWv9mFTOgQ3DcUXNJipjayh1KOUFnjry+uBi
 qEZcPSXqHSRHt0Bd/DrVzSa/ltFjs/YTQqz6hTcdTnC/FBR+Boinb/VT0
 USUk/H8TLzvdTpci3do1tBJX/NIpr0/crKlguNLXDimcxPvBCR92tHgWW
 h2BlbLTVKvSB3rgkVlpnAN1saJ5MiNOWrJP1kFtu033uzLqJW0XbrCSAu
 B7rP3pCPqAE1gM7Flm1gENF74tDJbLYI6hy4IIN8/nr9ydiZwIX1Yb8WC
 ZKxbkQcrE4s9narJcVic4uACDHT0KlmJOsl7eDWUOLunew1+eBYImI6ef w==;
X-CSE-ConnectionGUID: FkUDRDU5TYKtSf0DIdjYMg==
X-CSE-MsgGUID: eTI2WNmWSbuucGo6yNY7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2370308"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2370308"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:25:37 -0800
X-CSE-ConnectionGUID: hamkU8zsRRqYe/ZmO4F37Q==
X-CSE-MsgGUID: xuKqs2QjQgGb31MoeHsJEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6118034"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2026 21:25:36 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/3] fix missing resource cleanup in several tests
Date: Mon,  2 Nov 2026 10:55:35 +0530
Message-ID: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Several Xe test functions created VMs, BOs, exec_queues, pthread
mutexes/conds/barriers, a thread array, and a buf_ops context without
releasing them.
Add the missing gem_close()/xe_vm_destroy()/xe_exec_queue_destroy(),
pthread_mutex_destroy()/pthread_cond_destroy(), free(), and
buf_ops_destroy() calls

v2: Split cleanup in two patches each of different type.

v3: Split patch one into 2 second having buf_ops related calls.
Also update commit descriptions

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  tests/intel/xe: fix missing thread cleanups in several tests
  tests/intel/xe: fix missing bufops cleanups in test
  tests/intel/xe: fix missing vm cleanups in tests

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

