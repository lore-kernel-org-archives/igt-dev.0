Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40985C44512
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 06:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA610E2AC;
	Wed, 22 Jul 2026 06:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sm66bMhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C376210E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 06:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784701504; x=1816237504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pxw0goOqTi9h3QWvHjtb/dkNAU+F9ze7rEsTq8s0r0w=;
 b=Sm66bMhAX4/ysxp9mBmRHlzoinVUbs0O5gkUO3oHXLx+74iCwLKVACCf
 SDDKbWPWZb56re+vJrEfOyTCYmGmtnZTYx4qVyJtDtUHDn+PdOus2XaS7
 vwKkNmyC7crXs76hXGNZSB1Bp0hdXyEiBBoD6grbmIrzOKoJJ47Se3+sW
 8yFdYWp/a03l9Cx6gTWIH1uu6osqRgEz5pL2jmJ/cysdlkADK7Pp/O3Sy
 i2kuc4xPCxgGqDp3xxkqJxZuF4nq9YNoKofKDvG6FrmUV8AsGjiDqySUq
 mcfPqag/d3Y39knl2oa6bI6mEAiyc/uZ6BYFI0klMELdbGAfgkpP15sof Q==;
X-CSE-ConnectionGUID: m9JTJ+kgTVCPROHVhk/m7w==
X-CSE-MsgGUID: rAu2x3UYQyWnah9LVFijiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89147710"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="89147710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:25:03 -0700
X-CSE-ConnectionGUID: oc0Cm80IS5Wr2vjC9eNi3A==
X-CSE-MsgGUID: 72sZtZlPTnmXKqhMo0cZxA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:25:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t] lib/rendercopy_gen9: Bump up URB size
Date: Wed, 22 Jul 2026 08:24:59 +0200
Message-ID: <20260722062458.1250817-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

According to documentation bump VS number of URB entries to cover whole
Xe3P family.

BSpec: 56268
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jan Maslak <jan.maslak@intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 31913badba..2f22084426 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -833,7 +833,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 static void
 gen7_emit_urb(struct intel_bb *ibb) {
 	/* XXX: Min valid values from mesa */
-	const int vs_entries = intel_gen(ibb->devid) >= 35 ? 128 : 64;
+	const int vs_entries = intel_gen(ibb->devid) >= 35 ? 160 : 64;
 	const int vs_size = 2;
 	const int vs_start = 4;
 
-- 
2.54.0

