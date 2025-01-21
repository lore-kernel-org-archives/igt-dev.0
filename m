Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB03C02187
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 06:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687DD10E4D2;
	Tue, 21 Jan 2025 06:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjX67UHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2571110E1CE
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 06:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737440546; x=1768976546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G50Yj6yDBh2qK9OI9ymMkk/S7eWRLlPdEP5QuCv5zi4=;
 b=GjX67UHYhXgi0WltI9d+D528Yaxfh4M4Ovzh88hPZw6l/kW5d1JskK6Z
 nJnW0JfrnA+9ADoy9iHUYCzx7hQueUIWsE5gLuPRjVJ8s2+jq55ILcwsN
 UxCtxeMFVyekErIHYh9whzDnD0K4DPVAu8LmriyQBr0l7c2xVNXXpzexG
 yaxNwCQBnveOdYdt902HqT/D87fduQe8S/vS4E5cPOpiGJaN9FR6GRtfe
 BayUMsf7B1586lzjc039OLaYuVUOF//u1ChWtQUvjJiC/kC+kOXHKvfOb
 lUL7rBp7tDX4+t8xq7S0qZeGIpE6akc/7nBR9O4C9DSp2n4kWPHVhXfBD g==;
X-CSE-ConnectionGUID: pio2vJiJQqu0g4V0P5nVyw==
X-CSE-MsgGUID: CR22uNe3R6qciIWT/GyHQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37999073"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="37999073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 22:22:25 -0800
X-CSE-ConnectionGUID: U2q7QfhzTueUr81MZc0iSg==
X-CSE-MsgGUID: u8b7iCN1TzqkCRSUHYNHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111684930"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 22:22:24 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 peter.senna@linux.intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
Date: Tue, 21 Jan 2025 12:02:06 +0530
Message-Id: <20250121063207.71737-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121063207.71737-1-pravalika.gurram@intel.com>
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
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

noreturn attribute is used to improve the optimization by informing to
the compiler that function does not return .

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/igt_facts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_facts.c b/lib/igt_facts.c
index 2e04a7c86..bd6742065 100644
--- a/lib/igt_facts.c
+++ b/lib/igt_facts.c
@@ -748,7 +748,7 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
  *
  * Returns: bool indicating if the tests passed
  */
-void igt_facts_test(void)
+__noreturn void igt_facts_test(void)
 {
 	const char *last_test = "Unit Testing";
 
@@ -776,4 +776,6 @@ void igt_facts_test(void)
 	/* Clean up the list and call igt_facts(). This should not crash */
 	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
 	igt_facts(last_test);
+
+	igt_exit();
 }
-- 
2.34.1

