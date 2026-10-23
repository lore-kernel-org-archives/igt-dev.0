Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427A606A31D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kmQ5IMnT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124F10E529;
	Fri, 23 Oct 2026 05:49:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4F1112964
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 05:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792734533; x=1824270533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DdstG4oPPXZ9JSdrhAMkB6FEfgyKS3R5ynJ4Obp5u9s=;
 b=kmQ5IMnT9DW3TJEGuF/TU9GovAo62rrIBqTjM+ek8Qs99K9QkUnXtNjj
 mklQ2PPZ5uVeWnCYVoSiNDd0be5xZ9mMIF07Sn1We6uPBFuqSvyPrM/H0
 Nk1r5uqmDzMjAKDup8OZjUdZdljxcWe9GeC5Ob+bTwkKPWbNJSyzU/HpG
 vmvou01gzXYIwXWGbmMkf6B2mqb2qHuQnAKRzdwv57KbJOUpbwPAtdZzj
 MR6D9brKdIoKxDeShwfwAPgqr281MQqHboIbg4v+IOBIxR7omHAViU09G
 w1otu25guLQCXuk4r25sWmlTXJeRpfnex/nFeYbil5AwvakBp5R3mOcGD w==;
X-CSE-ConnectionGUID: 0Lv1wuGdTZulMkxw7H7efQ==
X-CSE-MsgGUID: OrE2+FGhQRiSLERFaALUnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1378467"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1378467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:48:52 -0700
X-CSE-ConnectionGUID: 1mBsWVFBSsaQeAHWEo4GQQ==
X-CSE-MsgGUID: hMA6cmOOTbWpp1+o4t1AWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3643451"
Received: from dut1581bmgfrd.igk.intel.com ([10.211.181.22])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2026 22:48:50 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, pranay.samala@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3] lib/igt_sysfs: fix uninitialized var in vram d3cold
 threshold helper
Date: Fri, 23 Oct 2026 05:48:45 +0000
Message-ID: <20261023054845.4907-1-shivtej.eknath.patil@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

In igt_sysfs_set_vram_d3cold_threshold(), ret is assigned only
when faccessat() succeeds. If the vram_d3cold_threshold sysfs
attribute is missing or not writable, the function emits a warning
but later evaluates ret in igt_assert_lt() without initializing it.

This can result in undefined behaviour and misleading assertion
failures depending on the stack contents.

Initialize ret and handle the error path properly before using it.

Fixes: 88e8006bec72 ("lib/igt_sysfs: add vram d3cold threshold helpers")
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 lib/igt_sysfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9952c1c0d..601e898ec 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1054,11 +1054,10 @@ void igt_sysfs_set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
 
 	sprintf(path, "device/vram_d3cold_threshold");
 
-	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
-		ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
-	else
-		igt_warn("vram_d3cold_threshold is not present\n");
+	igt_require_f(!faccessat(sysfs, path, R_OK | W_OK, 0),
+		      "vram_d3cold_threshold is not present\n");
 
+	ret = igt_sysfs_printf(sysfs, path, "%" PRIu64, threshold);
 	igt_assert_lt(0, ret);
 }
 
-- 
2.43.0

