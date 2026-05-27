Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF35BCD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 04:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154010E72F;
	Wed, 27 May 2026 04:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThRi1iey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4C910E23C
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 04:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779857790; x=1811393790;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=imx8x16uhv7k9Wbj+aQQhEY/npPHPt+mEJM+BoCJQVU=;
 b=ThRi1ieyHop8e02NlA/DpUolXB0acQf/P/fnPLPc+G4qclNjfWRKaYbg
 rlMz9SpRF7zY3MUPI19Z6SAXQb41VdqMK01a10q0v2JuEwJBu6BzL7Ow1
 KvAkwDj+Q4+UfQBZ78bCE8/rvEUoBuG/H5PlkysgkWlMpfOrgi1qq+x3G
 sVkLHZQ+R89e2y112IMPzCZAsriqY5+Y2ihweOXjLlK+9HDeTyqvDR/Yk
 czO1g77syeaSw/Z8Hfq5g+wWp/8+O8I6rOWgOg3bKkclmDe3ATzpklOBR
 bkk7WuZuU3E7TCZ0NvOgR7eLiQ58mBooI2QjB3d9eVRiaWizzhq3XZvX1 A==;
X-CSE-ConnectionGUID: v+BSYMGCTtmZvygEMQfHtQ==
X-CSE-MsgGUID: Ks2VacLXQOqej0liflF1fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79715752"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79715752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:56:30 -0700
X-CSE-ConnectionGUID: wlM0I6vdTiGhhzfVeYfNOg==
X-CSE-MsgGUID: 4t/k03lxTDiKiTbQ/FXHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265729271"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:56:29 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2] tests/intel/xe_configfs: Fix ctx_restore BB path for post
 and mid variants
Date: Wed, 27 May 2026 10:31:29 +0530
Message-ID: <20260527050129.2147335-5-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
 <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
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

