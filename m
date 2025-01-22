Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716B3C0218C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 14:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1CC10E6F4;
	Wed, 22 Jan 2025 14:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5Xx9qxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F010E6F4
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 14:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737557082; x=1769093082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=58HX7oVSDOp029e+/RMrg1MuFtYjwgXhSWMfRg0AL4c=;
 b=M5Xx9qxhmix+HXzlo9UFAmzwnADm12YiQkXzbo/nIIjYoTJvCIX0HEm0
 IULAQgnX+q9i6s/gVx5hA5Fy+jXIILvQ9coKc6TzG/J4uDxv6E8OhCYwl
 qHF0BqtDlAqKnCAHrlYPmFUEiusDpTyfKeNt0yi4vkg5wLMZTOAgF7c0V
 jFXTgCtWE4CeGLD5r/JpvcZ2Q/sN79mezsNtSDKedKuIF36S0eGrkQ+2I
 tk+kEA74U11kjM8tdAGqpCG2pOuMkgFnZqYII/+ii+V7olDzgagsa8pqr
 nxSjmf6mRBu3lXcHl6NPFdsZei27CKSRWEfFkR2VBpk0jgO/dfAzXxS/z Q==;
X-CSE-ConnectionGUID: KCYIE3EyTd2gOLiTJKH5/A==
X-CSE-MsgGUID: 8c1mp3l4QgeibayN0Q0q0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48612191"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48612191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:42 -0800
X-CSE-ConnectionGUID: k2iQaPAERRi+SnegNNG+dg==
X-CSE-MsgGUID: 9v7DKs79QCqkvKE8O/SknA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112175421"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:39 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jordan.l.justen@intel.com, christoph.manszewski@intel.com,
 kamil.konieczny@linux.intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_eudebug_online: Fix 32b compilation
 warnings
Date: Wed, 22 Jan 2025 15:44:18 +0100
Message-Id: <20250122144419.327706-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
References: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
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

Fix all debug prints which were causing compilation warnings for 32b
archs.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index f532387af..1a146d8c4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -569,7 +569,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
 
 	igt_debug("AIPs offset table:\n");
 	for (int i = 0; i < threads; i++)
-		igt_debug("%lx\n", data->aips_offset_table[i]);
+		igt_debug("%" PRIx64 "\n", data->aips_offset_table[i]);
 }
 
 static int get_stepped_threads_count(struct online_debug_data *data, int threads)
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

