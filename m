Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7CA606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJoh3cf6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4C10E050;
	Thu, 22 Oct 2026 05:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289DE112324
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792647881; x=1824183881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4pf2+lfeJTJvIfaTvs7C03nqmm47t6vXl80263Q3Uo=;
 b=eJoh3cf6BaIVy7RmT7ptXs93RXRIM3Y7TU5vWNEwz+DGDCVxE5dtBZJk
 nmamoNcB4H7pJc4VWZgC1xCAvBUuKkGRaoAoa2++6jhZJztPUZYHdFidM
 nEQmy28zpRYUR28e8UUHPFQvdvly6Dqts8k8QsC4NSXi7AuAO4OeMzrF1
 i69BJujaOyed7S+4IkXTwxPyKIJIwgu68QfT2FHh6i+pvFqGs4BMydvMV
 HfRbl9ZLZlnKVwG1TKHdET9m9XY2BV1XkSOWX5BTbVa6lCXMRFH3KsP96
 Vju/08h7ObKo/HuFKuHXLbrvv0IZJPoPatc+CEMVKSwxWAKEI/qfAlKf4 w==;
X-CSE-ConnectionGUID: DFp+TT1UTL+8i7sz2hJCvQ==
X-CSE-MsgGUID: +g8R/8shQ9SCu/qr0v6kyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1285854"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1285854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:44:31 -0700
X-CSE-ConnectionGUID: gJajsIOMTQW04+nOt74Elw==
X-CSE-MsgGUID: aa+qw6rnSBajmC5scHUgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3680089"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 22:44:31 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com
Cc: daniele.ceraolospurio@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2 2/2] intel-ci: add xe_pxp coverage subtest
Date: Thu, 22 Oct 2026 05:44:20 +0000
Message-ID: <20261022054420.180035-3-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
References: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add the newly introduced xe_pxp coverage subtest
to xe.fast-feedback.testlist so it is executed by CI.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 59d1cff2e..1f168cba6 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -204,6 +204,7 @@ igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
 igt@xe_pxp@pxp-bo-alloc
+igt@xe_pxp@pxp-debugfs-info
 igt@xe_pxp@pxp-queue-alloc
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
-- 
2.43.0

