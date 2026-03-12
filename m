Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D183D106703C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830DF10EA56;
	Thu, 12 Mar 2026 15:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNHGxAyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45410EA55
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329141; x=1804865141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsU7UBA0x9F+2cs0GQ3YUf3Icfd6AHwvQ+w8fjg6s1s=;
 b=UNHGxAyLr/fX+SdNjap2u1Q1vSqVhk+rPUUneJkV3Q0J6APwfMNquaUJ
 VtZvJmuDgjiIfbiCODGl2HuHr3nrwasknpRupuLh2GMMMB/AG30GpQBWC
 40rkWl+DMafxtKmjGGI3n/bD3oMXiTaXUw+MsoE6FbiMygEap5M/WaU7U
 CgFrld9Fpw49GM35E0aP43aOopyudNZml4Kg5CxzdW2I/5uLfn5gqqmZk
 DaCp+x/wi2G15b0RoGI5t+/223xJBRuX4uRhC1+3hF60Bcn1o6vcpyvbe
 Pvo2YDyodQjf0Lq6BvFtslt+jJJaBwZU4bRxEItm7EbhDD+MhrF0Vbod4 Q==;
X-CSE-ConnectionGUID: 3Sc/e27KTDmreaenKhn7RQ==
X-CSE-MsgGUID: 6dagQrLHQQOdp/k1bbOIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902421"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902421"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:41 -0700
X-CSE-ConnectionGUID: dR5NHckyS4KXYn2WuzlTeQ==
X-CSE-MsgGUID: RSWahb7GSv+4kLdPS3zxwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297278"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:38 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 5/5] intel-ci: Enable hdmi 4k resolution test in chamelium
 testlist
Date: Thu, 12 Mar 2026 20:52:33 +0530
Message-ID: <20260312152233.3280893-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312152233.3280893-1-mohammed.bilal@intel.com>
References: <20260312152233.3280893-1-mohammed.bilal@intel.com>
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
index b66788bac..711fb8422 100644
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

