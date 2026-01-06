Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1760FCE9D6E
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 15:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859E410E0EC;
	Tue,  6 Jan 2026 15:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2qfPzfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C4E10E0EC
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767714753; x=1799250753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yuDm0jSDIBl+4IPCVZqK/aoyFi0blcdtYvp9SZ3e34U=;
 b=m2qfPzfVPgXBuIwC25NAUKVHQY76A89gO9bW+moav1pd3u7UGyxu/9JY
 Judw9Of34iDzokIAUB4+o+Odp+ncACsirYD9N3OEoFvemD/FRPC97uPvT
 n//+Nqwv/b9Lvscq1mZS7k/WwSm5FE0ykAICxUMyuKYEn5Vq3r8qvd1ue
 3jHIt53HBO9AJhG2Rt27SVqg5nVuET97VEfbJ4Tah0yDxr1bHNRVmWYK/
 1gz16tdM+bcivxTgi39o9Gc7+8UpdPKlRjDHx2bl5+qHoprDKXblkb+Ay
 JPKQgUnlu9AO88ogoN0Pi8iWMKXQg1UIUyA7a+USDGaXSKypjegz1OJq+ g==;
X-CSE-ConnectionGUID: H9Q2TmxBQpeGlLevCGvtdg==
X-CSE-MsgGUID: v1FW9k3FRWyxaYjD7clrRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69062054"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69062054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:52:33 -0800
X-CSE-ConnectionGUID: hPEBBMIoTuOUxbNqt9NjYw==
X-CSE-MsgGUID: peDe2SP6TVSAdVXaKXjP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201902502"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 07:52:30 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
Date: Tue,  6 Jan 2026 21:21:30 +0530
Message-ID: <20260106155130.79192-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

Enable additional Chamelium tests

v2:
- Sorted the added tests alphabetically. (Kamil)
- Moved hibernate-related tests to the end of the list and
  added a clarifying comment. (Karthik, Kamil)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 99d2f2409..9adace28c 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -33,9 +33,11 @@ igt@kms_chamelium_frames@dp-crc-single
 igt@kms_chamelium_frames@dp-frame-dump
 igt@kms_chamelium_frames@hdmi-aspect-ratio
 igt@kms_chamelium_frames@hdmi-cmp-planar-formats
+igt@kms_chamelium_frames@hdmi-cmp-planes-random
 igt@kms_chamelium_frames@hdmi-crc-fast
 igt@kms_chamelium_frames@hdmi-crc-multiple
 igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
+igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
@@ -67,3 +69,9 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
 igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
+#Place hibernate tests at end
+igt@kms_chamelium_edid@dp-edid-change-during-hibernate
+igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
+igt@kms_chamelium_hpd@common-hpd-after-hibernate
+igt@kms_chamelium_hpd@dp-hpd-after-hibernate
+igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
-- 
2.48.1

