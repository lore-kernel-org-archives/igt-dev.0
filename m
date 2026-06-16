Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725CDCD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 02:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF510E7B0;
	Tue, 16 Jun 2026 02:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbz/yu5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5B10E7B0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 02:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781575291; x=1813111291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vO8w44jvis/6sIJ4UMa16WZntpLpyaVRwUKKostc0Ds=;
 b=nbz/yu5A9OuDmkuFcQyIu+QSvJYE0769icMvm0cOAgXt6zJkYPykKL6m
 tbGC7oFbDwl7Ytv465Xyffc/k5sq5y6dB6tdC82D0+VRC4g2mB8MHNL8f
 F/XJ9e5sXTsAS7W+ZDwrLKaDID2k51C31b8urtQjX78xQK1aROfgSSLU/
 zQPJm9e6L65RbRh7eGIR9WK1TrkBWZdGFSRdMTdd9CdQ3xAiS2iMcNLgq
 oukIMZJoioF7W1mW4EgurbHA8CTG8RXKMpjiHj8rNp8Jq74hlXyJAA95E
 nFgDrvxegoR9VsHcT9YBXfZOzmE0WuQJM92QEYAXiOmtvRCSjIKgrnYOR A==;
X-CSE-ConnectionGUID: /NaCO26IRQm+nHHyDu3jzQ==
X-CSE-MsgGUID: hDu56FcNQ8SpfBRghZqHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69875317"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="69875317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 19:01:31 -0700
X-CSE-ConnectionGUID: HjMjnA7wTB26zoDIkO5vaw==
X-CSE-MsgGUID: 3j5JzTDjQQ+7FYyDK1Y57g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="251926847"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 19:01:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Fix checks for whitlisted oa
 registers
Date: Mon, 15 Jun 2026 19:01:20 -0700
Message-ID: <20260616020120.46894-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

OASTATUS register is not used by UMD's and the plan is to discontinue
whitelisting that in the kernel. Also, OAHEADPTR is written to nonpriv
slots. So check that OAG_MMIOTRIGGER and OAG_OAHEADPTR are whitelisted for
OAG and remove the check for OASTATUS.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e59fe953b0..68c7537d38 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3833,12 +3833,12 @@ test_whitelisted_registers_userspace_config(void)
 	xe_oa_remove_config(drm_fd, config_id);
 }
 
-#define OAG_OASTATUS (0xdafc)
+#define OAG_OAHEADPTR (0xdb00)
 #define OAG_MMIOTRIGGER (0xdb1c)
 
 static const uint32_t oa_wl[] = {
 	OAG_MMIOTRIGGER,
-	OAG_OASTATUS,
+	OAG_OAHEADPTR,
 };
 
 static const uint32_t nonpriv_slot_offsets[] = {
-- 
2.54.0

