Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7AEE57C5
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E4E10E073;
	Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ry00pfqx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB5F10E073
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767212413; x=1798748413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ieDungzEOjzBjiiZwmQaBdfBWwZEp4n8DPqWXN5sb4=;
 b=Ry00pfqxxQPqv58AZMcdifsVdfaRHyaihkChTakP6HLti7FEZm8o5Cj0
 4HXU0WU3++80bZuFmrzh92jMtf4ctFeG+4G12UHxNAoXx/F7tqZlOHyiV
 RpnGLuhtLCoB/0xKKajlgCY369KzKaIkhXI7LMzxIdldYwGGmU7nvZY6q
 CwhyG5sojr0GGDjZ3Ek5AWQk9GcFjAvX4DJBI3W60hZIEGmULONCoAn2T
 CwFJbdvBJNweDd5CJbjwT8W7ZzeoflhMwXXYgz3oDbTyRK/+49DZmyY6K
 B+fddzRckOfLt7HufvMiBg/BTj3AClVsA6hfW4R+hQmL4rh9sM+LnGnbj w==;
X-CSE-ConnectionGUID: hxUe2jzQSp+JRxampQXHrw==
X-CSE-MsgGUID: G2mznvu9Swi2Vl/1ql7nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844910"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68844910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 12:20:13 -0800
X-CSE-ConnectionGUID: o1VK2PaGRjW7wU8mFLbTIQ==
X-CSE-MsgGUID: QYPWHqlzRzWndKMaWkoSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="224998656"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 12:20:12 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v10 2/5] include/linux_scaffold: add FIELD_GET() bitfield
 helper
Date: Wed, 31 Dec 2025 20:20:07 +0000
Message-ID: <20251231202010.115619-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231202010.115619-1-x.wang@intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
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

V2: (Matt Roper)
 - use the libc ffsll() helper instead of __builtin_ffsll()

CC: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 include/linux_scaffold.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index f6620ad0a..281aa5e73 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -4,6 +4,7 @@
 #define _INTEL_GPU_COMMANDS_SCAFFOLD_H_
 
 #include <stdint.h>
+#include <strings.h>
 
 typedef uint8_t  u8;
 typedef uint16_t u16;
@@ -51,4 +52,9 @@ static inline s64 sign_extend64(u64 value, int index)
 #define BITS_PER_LONG BITS_PER_TYPE(long)
 #define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
 
+#define __bf_shf(x) (ffsll(x) - 1)
+
+#define FIELD_GET(mask, reg) \
+	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
+
 #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
-- 
2.43.0

