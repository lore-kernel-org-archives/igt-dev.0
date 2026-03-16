Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30661F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05E010E265;
	Mon, 16 Mar 2026 07:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inCj/bQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7FE10E49E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773647956; x=1805183956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GnB4Yj+7qc3U9laIj8Vxccw7k374vqJH5p6setIs2I=;
 b=inCj/bQ5fJebQIotE+bZ0nIZkSD8XjxAZ3znAnFbEpbKmsL41JP1yEpd
 mlV9KqktwIE1Sb8MRtRBxtZCho/nZdy37XxtFbmrL/hjh7fBA1s3d1Egk
 T1415kvAoCp6LcJ2TcnahzGCgTq8Fm3eBifRwd+5QCH3aPooodZ8IN5S1
 r8QiorAscrE260uZzyz3nSJ3XzRcD9f6msRHE9HatZbU86tjWDa/jdvC5
 qaRLH/a470yB0TrLvKrciRY4nbNp2x3HQVHa+AA1ys5PssWmX4I8tEdr3
 J1S9cCEiLW3qDCE59YrD8dNU8xfTlMFomqUop7HglmCt4gJiLlDjeOSEW g==;
X-CSE-ConnectionGUID: ck0HhCT8RVij1kkgbKJplQ==
X-CSE-MsgGUID: ly+lYHqtR+6u0XxnoiF20g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74541994"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74541994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:16 -0700
X-CSE-ConnectionGUID: NopkzoPlTq+fjHoq9ILl1A==
X-CSE-MsgGUID: y+OWpSGiRvK3ZlBrm+61gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226826085"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:15 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, kamil.konieczny@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 5/5] intel-ci: Enable hdmi 4k resolution test in chamelium
 testlist
Date: Mon, 16 Mar 2026 13:26:11 +0530
Message-ID: <20260316075611.3333142-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316075611.3333142-1-mohammed.bilal@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
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

Remove inline comment and enable the test in the testlist as the
exclusion is already handled via i915 and Xe blocklists.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index adc9aea92..bbc28d7e1 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -18,10 +18,7 @@ igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
 igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@dp-mode-timings
 igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
-# TMDS config errors on v1 board
-#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@hdmi-mode-timings
 igt@kms_chamelium_edid@vga-edid-read
-- 
2.48.1

