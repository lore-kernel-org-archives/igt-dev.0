Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF8D5D695
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 01:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67BF10E324;
	Fri,  8 Nov 2024 01:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMtA2gS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E1A10E32C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731028045; x=1762564045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lzAaq5kqYTyN5tD3rcyuv/yQn3KYN35tomwYBKcsbLI=;
 b=JMtA2gS4J4ezmZhqM+O5llnqyUXW1fWycfw+WnoxZTZXNGGIMP95RmOR
 FQOTMpkkkPRk7gYEp3Fxds/h7NPMPjzaqM5kgIxw3WK8kdHfp7Ea28o5M
 lky07SyWw8GV4RDDBpeBsbb4FG5EvsX9h8lJRcX/LLv2XdZNkdCy088Y6
 1Ku8i1hZBZHZXknR8JBf8aI345bFodcgEUGaO2GfbtSM6MtDW1D8Mi4Bs
 g1Lsh/JWLkNh4e6pYQ6dW/Eo3BvPWab/MQJ1zM40bGCwzc8T69VRlq80p
 3SZFi+G6irG0BCk5D1gsSsNW6M7v1sqI1VppHP1rzbQgCPknG6Dg6cQ22 Q==;
X-CSE-ConnectionGUID: Uc4wmmznQTSmGkGfC48k0A==
X-CSE-MsgGUID: 4bhz4hZhRHa8rYTh7BfLhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31009603"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31009603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:25 -0800
X-CSE-ConnectionGUID: BFu5DFkKTJe2d0cJBKmANw==
X-CSE-MsgGUID: bhXwT3JmRp2GZdPhdUjowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="116191496"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:23 -0800
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [i-g-t, v2, 2/4] tests/intel/xe_exec_threads: remove redundant wait
Date: Thu,  7 Nov 2024 17:10:39 -0800
Message-Id: <20241108011041.2257553-3-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108011041.2257553-1-fei.yang@intel.com>
References: <20241108011041.2257553-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The for-loop for REBIND case accidentally wait twice for the execs of
0x20*n interations. Copyi paste the code from INVALIDATE case which is
correct.

Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_exec_threads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 413d6626b..962957cd7 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -340,7 +340,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i && !(i & 0x1f)) {
-			for (j = i - 0x20; j <= i; ++j)
+			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], fence_timeout);
-- 
2.25.1

