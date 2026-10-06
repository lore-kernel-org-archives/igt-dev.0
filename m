Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDF2CA5FFD
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 03:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0CF10E08B;
	Tue,  6 Oct 2026 03:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3K17gmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA0F10E08B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 03:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791256242; x=1822792242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4pf2+lfeJTJvIfaTvs7C03nqmm47t6vXl80263Q3Uo=;
 b=d3K17gmzFPGNTiB2wnNZC22bi/7OWzHAhwh04cm6eXl2+5xkq7gssO2b
 c3f3nXU+G56bNojXBBsFoM34vFsyrZ0dVxJt6JeZUvuDNAFJMpOYAbsOl
 fnAIjzcZCNM25qLH0ac2O0HdasR/nj7CX34ybisO7hKhvPFF8qGXBpwNO
 qxEHwpVhL43NAYsIQVlj13bSXLUz5NchiCXDEWlDcf5FZOX9DPSZefFJi
 ud+coZchSmrrQ0BK3yNACKEq1PuN81bPc2S6ebHsSuw838xukw34SwiEa
 FJe2/EEqRza6fsrvmWaPCIQOTXzu8IOsXwd1Vpj9gpa+bvN8Nqq4TkVzT w==;
X-CSE-ConnectionGUID: vcFzK0UrTO6FFmqPv96qUg==
X-CSE-MsgGUID: EaStw8WORBCwt7Qtv8C48w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91147991"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="91147991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 20:10:41 -0700
X-CSE-ConnectionGUID: nbsXU+IzRGSFANkpHlS+6g==
X-CSE-MsgGUID: Ffqe0CLPRaOdpjOAZC+CPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="306504904"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by orviesa002.jf.intel.com with ESMTP; 05 Oct 2026 20:10:40 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1 2/2] intel-ci: add xe_pxp coverage subtest
Date: Tue,  6 Oct 2026 03:10:31 +0000
Message-ID: <20261006031031.30938-3-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
References: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

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

