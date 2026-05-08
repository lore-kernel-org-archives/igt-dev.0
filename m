Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125FCD343F
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 02:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5780910E2D6;
	Fri,  8 May 2026 02:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9pj0QD8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE72510E2D6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 02:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778206419; x=1809742419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vt9HuuWKARQvScekjZFjo0tx6ynczntIw0dUNmIPCt4=;
 b=n9pj0QD8Via6p1uFMIhW8gm3tnLcw9DCfsebmJNhFKhWC2GCN9yE48x3
 EXv92uPJkWCs/pE57JXF/RBw/xoJl0tcWNjYSEvAS0ZV7QVabkeDUJkOz
 Vtidld18kXfPxKJrq61O278Fj5oeeamx2YgcCf/GI7DV5VGG0StYRhb1r
 zkN+Tm8RdsSbFfgg0dlSNa1Es6aeW7bebccyRYuJuYMNZBOPLgdSJs2v6
 QVQQkZMaJP38bhXQZ9B4mj1pmY0wcDUdahmQetccoN/235pMZsfAF2UgR
 Ktnr0JmxPiOhNMqhgS6+vPrOVQdNUIpRogJumZzrUbfJbjlxt7+245aVf w==;
X-CSE-ConnectionGUID: g1Hdf8dKSUeehZxA/FI1IQ==
X-CSE-MsgGUID: 7fhyVATmTv6iVnXHRP3Phg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90633030"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="90633030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:13:39 -0700
X-CSE-ConnectionGUID: figkJ7+OQtSUJG9lm0dy6w==
X-CSE-MsgGUID: lTRdaLjORxq18LB7vym3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="241615621"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:13:38 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v7 2/2] tests/intel/xe_oa: Wa_14026633728
Date: Fri,  8 May 2026 07:43:29 +0530
Message-ID: <20260508021329.876072-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508021329.876072-1-shekhar.chauhan@intel.com>
References: <20260508021329.876072-1-shekhar.chauhan@intel.com>
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

For MERTOA in CRI, oa buffer can be in device memory. Because of slower
device mem access, OA exponent values lower than 8 can result in buffer
overflows. Bump the OA exponent value.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..2f73b5210 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,6 +24,7 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_wa.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
@@ -2671,6 +2672,18 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	int len, check_idx;
 	u32 oa_status;
 
+	/*
+	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
+	 * Because of slower device mem access, OA exponent values lower than 8
+	 * can result in buffer overflows. Also, update the value of oa_exponent
+	 * in properties[].
+	 */
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
+		igt_has_intel_wa(drm_fd, "14026633728")) {
+		oa_exponent = max(oa_exponent, 8);
+		properties[9] = oa_exponent;
+	}
+
 	igt_assert(buf);
 
 	igt_debug("Ready to read about %u bytes\n", buf_size);
-- 
2.53.0

