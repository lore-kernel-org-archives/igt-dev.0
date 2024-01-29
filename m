Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A7FC47DB3
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 16:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF47E10E029;
	Mon, 29 Jan 2024 16:16:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F6910E029
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706544995; x=1738080995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAKZDLvh3JgWInH9zbze+LezSDbpNIwKds1sLpdM+w0=;
 b=jiPJPLXcIbSxNIiklPnQ5xZLPK+KpYi3HdW2kWPknm6NpqxM81e47SPb
 3fKfPVM9GlPtADXdJKf2jRag8wdOK3taO/NLskMu0rQ8whx2kL0rfuYo7
 MgWKMuTNxVz21wSQoBnuFbucvu5+D1bZRWOYowdesHSGByeDhcgeSAHUM
 poE4Vf+0cUFTkqqcjcO2PWE3bM4MsS0K9WFAn/JwDArC0wXC4QfmK0WRH
 MG4A+oGe46ews5j8uACxCgoi2oePHXdQ9uZJB9gjHRC6WJgx9g77ecY3t
 2l/5DhOeWyOTn9dJw455c87O9UBcmbbjXdQOY6m38JnBs4pgkUHuVNK1k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="401862257"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401862257"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960935468"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="960935468"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:16:05 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] HAX: please do not merge
Date: Mon, 29 Jan 2024 21:55:35 +0530
Message-Id: <20240129162535.1462795-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129162535.1462795-1-kunal1.joshi@intel.com>
References: <20240129162535.1462795-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Only for testing please don't merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 662e49cc3..d0a0a9df1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,6 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_feature_discovery@display
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

