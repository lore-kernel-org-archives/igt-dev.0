Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F123E606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UyeimWyM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C84311207E;
	Thu, 19 Nov 2026 08:09:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4000112076
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 08:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795075674; x=1826611674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXPZaYFWWoPh4sR/gq/b/0BMLL8pY/TSCPNlxcGnugY=;
 b=UyeimWyMBsjBcCZdKyDhQ1bGx7j2ifZM16HXGzqr23dP6hpRl4Sx0ySZ
 dNP7Ak7cqoKK8s0nLokYmk2OvCbBbMEoMCu+UaFeBYuqdCdlMbyZw7UQU
 y0VS87Vwab1f+ijdc5mQMYvGsXKlVIG3WBMxf5JZzgUGPU5c76NPPUKgH
 uNvdtQoxuCM9MIjBE0+5zZgLEAZuyH2DPk3zMyZ1Zvyyp6pHQItiHd13e
 RxanOVVYJrmFvUacueMysUIJwMYDAw3Db9HgL5UUKshLYEGB+XqarppbU
 AhpFF3t+DP83b1qUd2JnZR7E4aiitZJkb1RsYjuUfWQOr3ShMMqIIbi01 g==;
X-CSE-ConnectionGUID: 74KX9gLQSSWYLEdRiZL2Vw==
X-CSE-MsgGUID: lb4GQOoMTauGbNJgL1yhgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3766958"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3766958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:07:54 -0800
X-CSE-ConnectionGUID: TrBqPdC7R+Go1cP30MLInA==
X-CSE-MsgGUID: EyuH4g7xSkqQiaox6ZfUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10616915"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2026 00:07:53 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_atomic: Destroy the bind exec
 queue
Date: Thu, 19 Nov 2026 00:07:10 -0800
Message-ID: <20261119080722.525281-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119080722.525281-4-shuicheng.lin@intel.com>
References: <20261119080722.525281-4-shuicheng.lin@intel.com>
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

The bind exec queue created in basic_inst() is never destroyed, leaking
one queue per dynamic subtest until the fd is closed. Destroy it before
destroying the VM.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 0aa44740b..795d7b549 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -112,6 +112,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	gem_close(fd, bo);
 
 	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_engine);
 	xe_vm_destroy(fd, vm);
 }
 
-- 
2.43.0

