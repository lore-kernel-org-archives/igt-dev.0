Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CB606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R36l1y+0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999DF10E2F6;
	Tue,  3 Nov 2026 04:53:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C0010E2F6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793681566; x=1825217566;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bcHNiO+Axxv1HGi/wVYjgU+fI9KtRsBqLRQ2I5UbieQ=;
 b=R36l1y+0x0+iApXd14DJ/GqzQZ5St9FMbtqw3nAoB2Xi7MkJoDFafflF
 5H2huU4E9YxVuWuIo5hJ4YQqXsmZHqgnhNk8d+rp/5Egj5I+3tK9Ye5iS
 bD03CDLj6r/YnVM5e2P56FwXDnQdt/gd9JD9ZX85lFylL+ZJbG6meefz5
 ZeVKgjPzr9/Y7uOp0Mrn3qXIOlq3UM5/liTx0xlKs4KoeP0I0mLLzI/YJ
 H/ohavwhooHgrL0kM47NlUiZ/l9BujiWzEwa/7m124x7/YutQN5MPbDi5
 v3SuQw2DDQf3FuSc348oIJ8xstm0EFh5/fL3qnIC51BtomNZbnFdEMpC5 w==;
X-CSE-ConnectionGUID: 0hD2U9XtSeGlzCGYRWAUPg==
X-CSE-MsgGUID: VHo2CL1DTwypZyiKqespNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2291377"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2291377"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 20:52:44 -0800
X-CSE-ConnectionGUID: R0dDVO2bSmO33L6cHrXGtQ==
X-CSE-MsgGUID: qz7rWlOeQJqZo2sSftg5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6222834"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa004.jf.intel.com with ESMTP; 02 Nov 2026 20:52:43 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/3] fix missing resource cleanup in several tests
Date: Tue,  3 Nov 2026 10:22:42 +0530
Message-ID: <20261103045241.3367590-5-priyanka.dandamudi@intel.com>
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
Also update commit descriptions.

v4: Corrected patch one with two related to render_copy.

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

