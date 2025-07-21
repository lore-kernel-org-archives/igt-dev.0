Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB63FC83F27
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 04:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836110E24B;
	Mon, 21 Jul 2025 04:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6K+itif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF9B10E24B
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753073890; x=1784609890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5oLqBtPz8YZhWTpzT/A7/UPb/bGNL16dz5GY0wMtgFw=;
 b=c6K+itif5rIzDy5607gQVVmQ5kosKahf2POH19ZaVaOBohWH9yO2aCZA
 aej9S1MIi8adRmJXwITs+uzZgZaEZj61UOrkHbwrHRNWcUWGKqzhgMxBa
 GZdjZB8CQeNy0EadCB4oWnrdyP3PWoyOGvPEy8RUBWySvwoMKBD8OHVov
 uVgbJ3e4x8gp+/SbmmSEVuSXz+PK8Ao5BTxgGs9CegOPrYOFbPxaB6Sd1
 dVjM4Sx305z5JubH7Mph3236B/zmYByr8aWPfb3VpL0hZ8JHv4OpxIfgS
 gvnn0nkW8FkciNQyTLVJqQbxpDQcnoZ4rhf8TOJeVNuLGt98GRq1m8sBa g==;
X-CSE-ConnectionGUID: r7cAd9PvSCKSOTRG8QAL4g==
X-CSE-MsgGUID: 73wA80rKQ3WDlgS0OFAZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="65845684"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="65845684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 21:58:10 -0700
X-CSE-ConnectionGUID: ut7TCOTrRwmLu5TMU0G/fQ==
X-CSE-MsgGUID: fVLtSYGiT+2bxVJS8y8Gmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="164380577"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 21:58:08 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe.blocklist: block unsupported test
Date: Mon, 21 Jul 2025 10:43:53 +0530
Message-Id: <20250721051353.934493-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Chamelium V1 HDMI reciever can support max 4k@30
Test forces EDID with 4k@60 which isn't supported
Blocklist test untill we have newer V3 boards

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index a21c8a3d3..050c89970 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -115,3 +115,8 @@ igt@xe_evict@.*-multi-vm-cm.*
 igt@xe_evict@.*-threads-.*
 # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
 ##################################################################
+# Chamelium V1 HDMI reciever can support max 4k@30
+# Test forces EDID with 4k@60 which isn't supported
+# Blocklist test untill we have newer V3 boards
+##################################################################
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
-- 
2.25.1

