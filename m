Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44FDFD45E2
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 19:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CCE10E814;
	Wed, 25 Feb 2026 19:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1GZA7q3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44C310E814
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772048681; x=1803584681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SdPlVedvsgmwsY/BjgQvWXZa4bBINies2UJbVVRjniM=;
 b=i1GZA7q39S/AXxDCy1H3qtQvm7VN1AvfbvWkkQIVEEq9tujwF41xlh5q
 w+JE7qHrqDna7V33lggylXlfatJLq3GJUcOTEWgTV/f9bOn6vOkDkG67v
 m/GNjcUwa6Zdk1u8gpdHjN+0UPT7ACu7cecv3qSur0fl2LNcW3yTDHDbv
 g7vJv7ROrAcAm1ByRDcBlILulNBMrFyyVSG8GcQTl8c4c4rz5/Z7HC28K
 ZrqKmnp6vbD111nJguuMyffcMbzXs/qsvr65xc8r43MDzJ3uu0YxbOKW/
 qg9O1c54+5JiVbeXGToyhouuMXgvle49dNDUC9gDPYDpvRecB/Mfie1yc A==;
X-CSE-ConnectionGUID: hpZ8YQx8RmqQZgWlR8jTuQ==
X-CSE-MsgGUID: 7SbiamlKTJ+kUUKB7eeMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95713118"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="95713118"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:41 -0800
X-CSE-ConnectionGUID: yxUzhMrSRYOL/0tnAy0lpw==
X-CSE-MsgGUID: X11bFjxBQemGzVoWNwaEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="215564437"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 11:44:40 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 4/4] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Wed, 25 Feb 2026 20:44:26 +0100
Message-ID: <20260225194421.2544088-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
References: <20260225194421.2544088-6-zbigniew.kempczynski@intel.com>
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
---
 tests/intel/xe_compute.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index d7e3c59084..45c9c1b536 100644
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

