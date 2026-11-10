Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D6606A332
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ns/vm3Ln
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF40710F73F;
	Tue, 10 Nov 2026 14:30:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8E310F73B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794320966; x=1825856966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1L4QqSu/4CpUtEIROFJY0G9Zvgo4n4GAW2T7vYDy/7o=;
 b=Ns/vm3LnaxW9TErIbOvu3G2Baru41DU9UjH2ONMDDcyGo6bcjSWajgqR
 ycKivb7QBGM2BzWvFL96g24IOAd6m/qq5A81jLjhSLMUQV83Zi1rUyd0H
 VP6bt+F8wROw7BlIbXYUlRklA163I23ZIQBassVomTc/G0bvwsLFxm+WF
 +3uXhkkl68ECp1cqiOcJi15MvpJ/1vabM7wcsb52p86mUO4+LWpGfmu5u
 /xKmp3Uoxdh5UbfCDlbh7nwB2YD0ZVxgZ+MA4+7J5jvb72CFqcTgBCqPU
 DrI7FbhOxRlNzVZgUCa13aWwWBNKMp6ZDXnUfZEUWIls/RfDnwHbeC+uG Q==;
X-CSE-ConnectionGUID: qXp5urezTSim6OJv+Zb2AQ==
X-CSE-MsgGUID: IhG2e/nWTsm2J6JazbO9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3106676"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3106676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:29:26 -0800
X-CSE-ConnectionGUID: 4t9SLiiCTHezh+Un1GFzPw==
X-CSE-MsgGUID: fNdqgwDcQl6txA7RXBHbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8136767"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.7])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 06:29:24 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_mmio_regs: Fix warn about
 discarded const
Date: Tue, 10 Nov 2026 15:28:23 +0100
Message-ID: <20261110142823.52591-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix compiler warning:

../tests/intel/xe_sriov_mmio_regs.c: In function ‘skip_if_on_whitelist’:
../tests/intel/xe_sriov_mmio_regs.c:306:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  306 |         item = bsearch(&reg_addr, &allowlist[0], ARRAY_SIZE(allowlist), sizeof(allowlist[0]),

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sriov_mmio_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_mmio_regs.c b/tests/intel/xe_sriov_mmio_regs.c
index 121ebdea6..1e7c9ff61 100644
--- a/tests/intel/xe_sriov_mmio_regs.c
+++ b/tests/intel/xe_sriov_mmio_regs.c
@@ -298,7 +298,7 @@ static int addr_range_cmp(const void *addr, const void *range)
 
 static bool skip_if_on_whitelist(int pf_fd, uint32_t reg_addr)
 {
-	struct vf_regs_allowlist *item;
+	const struct vf_regs_allowlist *item;
 
 	if (reg_addr < allowlist[0].start && reg_addr > allowlist[ARRAY_SIZE(allowlist) - 1].end)
 		return false;
-- 
2.55.0

