Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2512ACD1297
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 06:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9F710F20A;
	Thu, 30 Apr 2026 06:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k63hdtTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3810F206
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 06:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777529653; x=1809065653;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=imx8x16uhv7k9Wbj+aQQhEY/npPHPt+mEJM+BoCJQVU=;
 b=k63hdtTY2+dts6VJQOskuMMMSOkE6wVzJ2irIRW9iHXuPfBCyb4oqVx4
 O7w81D2nOpUL8MS46/9WRs2KT26OQLOwJfrHFkgog/fqZPQFOOb7Xqhyh
 Bu9JJpsq/rIVJpRG3DYKQ90KnU6gdOIStJ9vSNYdyrwi+AnZF8+lvpeYA
 NNzYtAeIwxtVH/nKpXB59q15dJ4kn3OeW9oyyQdERZpINX8bOy9sRQN92
 a3FkK6pp6gP6bMgjmfN4o4vrii9pTsWw56pIMVhK8WCQjh0FYwWzOxk4H
 Etru/KI21LSj+8TihmRp2FbOxeptzhICFHg3MFRVMjegdvCxplFa+kWnE A==;
X-CSE-ConnectionGUID: Jut1jH5vS2SQbCWE97SvBg==
X-CSE-MsgGUID: S5bzrMuQQkC1sqWLGyPl9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78496315"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78496315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 23:14:13 -0700
X-CSE-ConnectionGUID: 0KLTCquSSjKXIjdS/2H9DQ==
X-CSE-MsgGUID: MHlf524CSKG8q/NQTYMhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="230132182"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2026 23:14:12 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2] tests/intel/xe_configfs: Fix ctx_restore BB path for post
 and mid variants
Date: Thu, 30 Apr 2026 11:47:45 +0530
Message-ID: <20260430061745.1157778-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
References: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
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

Fixed the hardcoded "ctx_restore_post_bb" write with the computed
file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
invalid-case tests work for both "post" and "mid" variants.

Changes since v1:
- Fix commit message wording

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index f024235f2..39762e030 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -234,7 +234,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
-- 
2.43.0

