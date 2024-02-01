Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2B8C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D57310ED90;
	Thu,  1 Feb 2024 13:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVWppBYl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B16A10ED90
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706792950; x=1738328950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2XJRQzGwV/18vyT467MdfMNg/mUmktZalDYhcTM9h4o=;
 b=JVWppBYlHyBbAg79Q9Lr8rgIgJ7cpmK0to7vkgH3K842Yx8Y9D4h18Mt
 G//FCbPyZCJMJOQN7v4Um7OuhAl2AFzP6qGufYXu0AKaySpNYL/XxZ2Y5
 8KbuJ5KHpNY6bBNv0IBtMxEff3+vYgTT+swRGtnVm2v8Hg4RzxX+G4ncU
 pQxV2VnV+S5skaRMaVsbg24N8VobF7+NEwVgjpwOiqxNHROE9OCVrf0PE
 XlSdMhyMwnuFARpy8cP+9CfhZWz/knidYaOleN73LQqaPtc7AcO4349xV
 eD71zSBPLTyDq5OtPFaUNRfU9uBtqwwraByEScvgNzU4TjQHDs1Wx/VX4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468122957"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468122957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932172624"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="932172624"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:09:08 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Date: Thu,  1 Feb 2024 14:09:04 +0100
Message-Id: <20240201130904.388276-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Missing setting Kernel0Enable bit results in lack of rasterization
of right and bottom part of the surface. Fix this as kms tests depends
on that.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index bdfd9be087..a63d5320b3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -863,7 +863,7 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	intel_bb_out(ibb, kernel);
+	intel_bb_out(ibb, kernel | 1);
 	intel_bb_out(ibb, 0); /* kernel hi */
 
 	if (fast_clear)
-- 
2.34.1

