Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E718C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 16:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD6210E7F6;
	Wed, 30 Apr 2025 16:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToEZ1gR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990FB10E7F6
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746030851; x=1777566851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LdHupkZREc+31K1ffLB4OK7YOc5Djt18lMJWPbsPa5U=;
 b=ToEZ1gR8NhTBN3+7uHheGRi+7nQS2eO/gao9vmkfiiZbKGJ81V5ZRfSf
 x/J6/VtBVgkxD+zNMNZK4h8EJIKxJ4NmzhWqGuE4L/sCdCJpp3HMKRYtU
 Tl+k6/Vj5v961cg9PZp+9faYX82Qwmsbl305OEDtfm+OQF6vnedLtPEGC
 XbPWMfT1K2qh14BW2qq/6Pjn/O1M4YMU4TmKX24b6wAbJyXux1AD1VFgK
 UExQ0qm+glKs4VuTYuFqeW9IvwbzlnOwPZcsu8xgJPXi3SiGFljo4GaA4
 Nq7Q+012ltJ/meSd/1+x0DsKSCU5YsO8aEfdpuJZbu3KqABtAr884cl2m A==;
X-CSE-ConnectionGUID: 6Mlc2DUzQ5SWnEinynV2CA==
X-CSE-MsgGUID: 5ZIENOAVQ7qN3c2DuBstIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46814642"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="46814642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:11 -0700
X-CSE-ConnectionGUID: 63NI1JB5Qr6dGk48DumC8Q==
X-CSE-MsgGUID: +rT0t5t1QzqhFnkeXk9Hvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134471454"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add explanation how to run CI
 locally
Date: Wed, 30 Apr 2025 18:33:54 +0200
Message-ID: <20250430163354.178254-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
References: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Currently, the CI runs only after a merge happens. To avoid reverts
because of error in some configurations, add an explanation how to
run it locally with a new file .gitlab-ci-local.yml

This is basing on a project available here:
https://github.com/firecow/gitlab-ci-local

v2: fixed description, dropped .gitlab-ci-local (Kamil)

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 CONTRIBUTING.md | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 05bb64bf4..6b305aef6 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -135,6 +135,23 @@ Sending Patches
   can help our bug-filing team. When replying, you can cut a message after
   'Known bugs' to keep it in reasonable size.
 
+- When pushing a new series, your series will be build-tested by the CI. It is
+  useful to avoid merging broken stuff. You can run this CI locally by using the
+  project https://github.com/firecow/gitlab-ci-local
+  To install it, please refer to its README (on debian, the package
+  gitlab-ci-local can be used).
+
+  To run it locally, you need to build docker images:
+
+    docker build . -f Dockerfile.build-fedora -t igt-build-fedora:latest
+
+  Now you should be able to run it:
+
+    gitlab-ci-local --file .gitlab-ci-local.yml
+
+  If you want to run a specific stage, you can add it to the command line:
+
+    gitlab-ci-local --file .gitlab-ci-local.yml <stage>
 
 Commit Rights
 -------------
-- 
2.49.0

