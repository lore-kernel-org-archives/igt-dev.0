Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488CEE57D5
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 05:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289010E979;
	Wed, 31 Dec 2025 05:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b09dgnL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3710E83B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767160530; x=1798696530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6zMBYTw3vLpI6X+xWWDCKFdiYJZA1S0pw1U9BM/zQvM=;
 b=b09dgnL7WZZblR5IPpXq96hOpCKYutn+77TkKNXvH2nvEMPxTCzZo7kb
 9moElqTMeWEPWYtM6Dy/eOvt00XZMCZT6MQpykPrchB1PTjwqsXblXRaB
 BhZeuPdCA67iSOCg27iX7za12m2ZHRNXUd1Pui87CL1PI7ph8dy5HKIK8
 3EtSzg+CdB2AZPU1JPbYzS9jdbzHh4Nd50HCK+tfYrJNPb9PI/EuzeAW4
 NqD0oM/nIm5FSVqRI4hLRvRcI3rwWq3WbkbxHVlwgMTEc2jHp4EhfswkC
 /YeP3gFCmBQ+CEtseRhYVmsLPPJA0QGYrjquZoMLuNxQG0aF4QOmzbY1i Q==;
X-CSE-ConnectionGUID: aqq68uBATZyFZbmlVGrFog==
X-CSE-MsgGUID: OziUOX7lSeqogUA6GAwsFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72590000"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="72590000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 21:55:29 -0800
X-CSE-ConnectionGUID: rgvKiJI2RTehjXLuRKjZ8Q==
X-CSE-MsgGUID: MUe3ShrWSeqPtQ5DmsozHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201119706"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 21:55:29 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 2/5] include/linux_scaffold: add FIELD_GET() bitfield helper
Date: Wed, 31 Dec 2025 05:55:22 +0000
Message-ID: <20251231055525.51524-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231055525.51524-1-x.wang@intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
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

Add __bf_shf() and FIELD_GET() so code can extract bitfields from
registers using a mask, matching the common Linux FIELD_GET()
semantics without pulling in kernel headers.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 include/linux_scaffold.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index f6620ad0a..bd69c1ed2 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -51,4 +51,9 @@ static inline s64 sign_extend64(u64 value, int index)
 #define BITS_PER_LONG BITS_PER_TYPE(long)
 #define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
 
+#define __bf_shf(x) (__builtin_ffsll(x) - 1)
+
+#define FIELD_GET(mask, reg) \
+	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
+
 #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
-- 
2.43.0

