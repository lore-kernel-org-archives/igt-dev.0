Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D69C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 13:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D43910E3FC;
	Mon, 20 Jan 2025 13:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jo8A8xzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3B10E3ED
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737378838; x=1768914838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ir/Nsbh0FOn3MropykLuluaILEr6oZBJ7NfjcoX0T2A=;
 b=jo8A8xzjfkWLeyHWMvo6Ob2s3QPfa6k2BZm81e0FoYxR4AuYrjnAJhOb
 CnmE5Lx2nD4QoC7IM9Mhgkjo5g3cNNU2RT7iZxk6yzU8bgOpUaGZ+DJF7
 Sb26TRzR5qF8rbM8pcJyFGtl0MpRfdPQVkyW24wQRhVsL/Iw6VZb7N2C6
 3+jOdfueRC2RDCXyJaGk27zWZx+/yY7nbhaVFSiuAha4ClhXLsZl56I4A
 TkCpmsCTAqH3+B/Ns6rej5H0fOkLZCyDYbcxGe0ay8ZeTxdAi5QA5Nf6b
 ncybATNRjgiApascVjs0ePbSwXBNZeufPbMn16ZHPu0XNCVbqBxADY7BP Q==;
X-CSE-ConnectionGUID: J7MBQMWwTRSKV4fXWp9+ug==
X-CSE-MsgGUID: WZEXDMW2TM2JKN+kzSZ49w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37045739"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="37045739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:13:58 -0800
X-CSE-ConnectionGUID: 3UoA7movTiWHlJ/4eXwg6Q==
X-CSE-MsgGUID: aKPWS/QsSSGksvgqJmgsAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="107122144"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.4])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:13:56 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jordan.l.justen@intel.com, christoph.manszewski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_eudebug_online: Fix 32b compilation
 warnings/errors
Date: Mon, 20 Jan 2025 14:13:38 +0100
Message-Id: <20250120131338.131713-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
References: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
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

Fix metadata allocation so it is properly sized on 32b and
correct all debug prints which were causing compilation warnings.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index f532387af..41a01c02f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -569,7 +569,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
 
 	igt_debug("AIPs offset table:\n");
 	for (int i = 0; i < threads; i++)
-		igt_debug("%lx\n", data->aips_offset_table[i]);
+		igt_debug("%" PRIx64 "\n", data->aips_offset_table[i]);
 }
 
 static int get_stepped_threads_count(struct online_debug_data *data, int threads)
@@ -1063,8 +1063,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	uint32_t *ptr;
 	int fd, vm_flags;
 
-	metadata[0] = calloc(2, sizeof(*metadata));
-	metadata[1] = calloc(2, sizeof(*metadata));
+	metadata[0] = calloc(2, sizeof(**metadata));
+	metadata[1] = calloc(2, sizeof(**metadata));
 	igt_assert(metadata[0]);
 	igt_assert(metadata[1]);
 
@@ -2328,11 +2328,11 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 
 		if (multi_tile)
 			igt_assert_f(diff < WORKLOAD_DELAY_US,
-				     "Expected to execute workloads concurrently. Actual delay: %lu ms\n",
+				     "Expected to execute workloads concurrently. Actual delay: %" PRIu64 " ms\n",
 				     diff);
 		else
 			igt_assert_f(diff >= WORKLOAD_DELAY_US,
-				     "Expected a serialization of workloads. Actual delay: %lu ms\n",
+				     "Expected a serialization of workloads. Actual delay: %" PRIu64 " ms\n",
 				     diff);
 	}
 
-- 
2.34.1

