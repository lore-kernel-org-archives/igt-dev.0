Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C487A606A327
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VL6mAQkI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606BD10E1DE;
	Mon,  2 Nov 2026 05:29:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885EC10EB40
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793597141; x=1825133141;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ROBOFFQB6l1dQinf5ujZN/H1OUwHyqgCMv4CiACC+bo=;
 b=VL6mAQkIE2YhhyLz8Yejb7Y4O7XpElOKJRJBGuVlq+Z8GHND5FIWUl+T
 6IZnZnfD3krsfa+aODQ2kfkM1QDW+n1I6G+HEH9Uyb1Y0xM3tmaUTTRIt
 MQYQKaMn2Un8tA09L8rjI0Tm8r5CJZdw5pCXdLuCKUh8Ke9iZ6hZBTFyp
 wg7S/223d1uhGNMkZ5HT8pFmlnFsnR92Fy0yqt5Id4M9eFoWCqJQFA6SL
 MuA0kInjishj+jFeZGuIcNOqd47r+svbxXC+fYlSWgI1V7m1uW57WnXSU
 IXdiVhcpd7BFmavZqFZLRGp5aoxRT5ln6cB9GG/n+7hEhEbGK/1VxkyDY Q==;
X-CSE-ConnectionGUID: NtdKxdUVTOior6+sUrZ+yg==
X-CSE-MsgGUID: vt9OF6jPTiaiC2rmTSJmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2370329"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2370329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2026 21:25:40 -0800
X-CSE-ConnectionGUID: iOSdnWEvSl25+l3wO4YuVQ==
X-CSE-MsgGUID: FoIpAhOtQ9agJxYF7Peikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6118040"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2026 21:25:39 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe: fix missing bufops cleanups in test
Date: Mon,  2 Nov 2026 10:55:37 +0530
Message-ID: <20261102052534.3358553-7-priyanka.dandamudi@intel.com>
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

Xe rendercopy test functions created buf_ops context without releasing them.
Add buf_ops_destroy() calls.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_render_copy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 4291db1ccc..a2a0f652d4 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -639,8 +639,10 @@ static void render_stress_copy(int fd, struct igt_collection *set,
 	/* End all mem copy threads */
 	for (int i = 0; i < thread_copy_count; i++)
 		xe_spin_end(data_mem_copy[i].spin);
-	for (int i = 0; i < thread_copy_count; i++)
+	for (int i = 0; i < thread_copy_count; i++) {
 		pthread_join(thread_mem_copy[i], NULL);
+		pthread_mutex_destroy(&data_mem_copy[i].lock_init_spin);
+	}
 
 	put_ahnd(ahnd);
 	xe_vm_destroy(fd, vm);
-- 
2.43.0

