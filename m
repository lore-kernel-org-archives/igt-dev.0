Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D0E9B36A
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 12:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D4610E4B0;
	Mon,  2 Mar 2026 12:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2yrSgMA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CBC10E4B0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772454343; x=1803990343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctKUdeqRhiAN1u+K7jTTMxaW9go2THxi6et6TEFtvx8=;
 b=e2yrSgMAUjzaahiOyBi2SpkJcyLojz3eBKCNQ7XdoCgbjj56C4iFIGd+
 RS5rIcI6WiBgXrWtIIJsTSO5FvoaVlvz67SOCkRve2/JlNAzkgPUOFXsc
 4He6mXhybrLeJ8fihRebHerZDQMKhNC/dyqzpSwwrClRWOOdDERlDzKQL
 p/anYuapIhYwCBTdbVbmc+io1gY0/G9X7ePRx/ky/SY2YeLHQ1JSVM/TL
 nlGXRhrZ4DfSzH/pHZVSCVP4eEh++5lcoTHc9+p5Irp2TMzttZCWR0LZN
 kZhXXYUssxa8lWX7cAe1yztsYGTV4M6m9kNWeXJ2CD+36cM3fi2+LG85Q g==;
X-CSE-ConnectionGUID: 3EWbp0ePR6W6QXIIEfofuA==
X-CSE-MsgGUID: QDgWudR3Q8u0JkWCv6UahQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84098054"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84098054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:42 -0800
X-CSE-ConnectionGUID: oFvJD0dNRwKL2OLOKZPOmw==
X-CSE-MsgGUID: ToN8ijC/QxWE27/3vLVztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="217663016"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 04:25:42 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 5/5] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Mon,  2 Mar 2026 13:25:23 +0100
Message-ID: <20260302122517.4126472-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
References: <20260302122517.4126472-7-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Test is doing compute-square calculation so pick 'Compute' instead
of 'WMTP' is better choice.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_compute.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index ed652ffedf..a36d3e8cd2 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -495,8 +495,8 @@ test_eu_busy(uint64_t duration_sec)
 
 /**
  * SUBTEST: compute-square
- * Mega feature: WMTP
- * Sub-category: wmtp tests
+ * Mega feature: Compute
+ * Sub-category: compute tests
  * Functionality: OpenCL kernel
  * GPU requirement: TGL, PVC, LNL, PTL
  * Description:
-- 
2.43.0

