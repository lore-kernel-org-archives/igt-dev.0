Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B872DF8D750
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 14:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5920010E228;
	Thu, 16 Apr 2026 14:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="NMVToTgp";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2A10E228
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 14:45:51 +0000 (UTC)
X-UUID: f11c773839a211f19a16598d5ca7f8ec-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yEi/QW0ZP8GvNxoSalEcGKEF0LcEs2p9YovmzZG9NCU=; 
 b=NMVToTgpdTozoOp1lmQFmcZa906fLqkrqQx6YcHGlQw3C2Ji0+53DLtkNenQLsps+nLTdvj02GE+dPdRbqH8wopTcAQIZm8DQ6c4AfsLqv2bOxhfQfYTERcDYZgn+uMlS/F1tG78F5rdQuZQ/tYh/Fd/ksaEUDdjBLLxHNUYui8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:18ff008e-3de9-467a-8cc2-1d32d538ad68, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:c3580495-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f11c773839a211f19a16598d5ca7f8ec-20260416
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 128953003; Thu, 16 Apr 2026 22:45:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 22:45:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 22:45:40 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Jani <jani.nikula@intel.com>, Jeevan
 <jeevan.b@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>, Fei
 Shao <fshao@chromium.org>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Date: Thu, 16 Apr 2026 22:45:28 +0800
Message-ID: <20260416144536.3263173-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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

The original check_timings() validation required vblank intervals to be
within 1 scanline (~15us for 1080p60) which is overly strict and causes
false failures due to userspace measurement overhead.

Changes:
- Keep original strict checks (1 scanline, 1.718 sigma) as warnings only
- Add relaxed validation with 1% relative tolerance for pass/fail
- Use 3 sigma threshold (99.7% confidence) instead of 1.718 sigma (90%)

Rationale:
Hardware specs (VESA/HDMI/DP) allow ±0.5% pixel clock tolerance, which
translates to ±0.5% frame time due to inverse relationship. However,
userspace measurement via read() syscall adds ~0.3-0.5% overhead from:
- Interrupt latency and scheduling delays (5-50 us)
- System call overhead (1-5 us)
- Variable delays depending on system load

Total tolerance: ±0.5% (hardware) + ~0.5% (software) = ±1.0%

This makes the test ~11x more tolerant while still detecting real timing
issues and aligning with industry hardware specifications.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Suggested-by: Jeevain B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 71 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 1f2849bc26cf..b452f8a9e997 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -495,6 +495,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	double mean;
 	double stddev;
 	int n;
+	bool strict_failed = false;
 
 	memset(&wait, 0, sizeof(wait));
 	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
@@ -563,10 +564,9 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 
 	/* 99.7% samples within one scanline on each side of mean */
 	if (accuracy >= line_time(kmode)) {
-		igt_info("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
-			  accuracy, 100 * accuracy / mean, line_time(kmode));
-
-		return false;
+		igt_warn("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
+			 accuracy, 100 * accuracy / mean, line_time(kmode));
+		strict_failed = true;
 	}
 
 	/* At least 90% of frame times fall within the one scanline on each
@@ -591,14 +591,61 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
 	 */
 	if (fabs(mean - expected) >= max(line_time(kmode), 1.718 * stddev)) {
-		igt_info("vblank interval differs from modeline! expected %.1fus, "
-			 "measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
-			  expected, mean, stddev,
-			  fabs(mean - expected),
-			  fabs(mean - expected) / stddev,
-			  fabs(mean - expected) / line_time(kmode));
-
-		return false;
+		igt_warn("vblank interval differs from modeline! expected %.1fus, "
+			 "measured %1.fus +- %.3fus, difference %.1fus "
+			 "(%.1f sigma, %.1f scanlines)\n",
+			 expected, mean, stddev,
+			 fabs(mean - expected),
+			 fabs(mean - expected) / stddev,
+			 fabs(mean - expected) / line_time(kmode));
+		strict_failed = true;
+	}
+
+	if (strict_failed) {
+		/* Relaxed validation: 1% relative tolerance for accuracy and deviation
+		 *
+		 * Hardware specifications (VESA/HDMI/DP) allow ±0.5% pixel clock tolerance.
+		 * Since frame_time = (htotal × vtotal) / pixel_clock, the relationship is
+		 * inverse: ±0.5% pixel clock → ±0.5% frame time (in opposite direction).
+		 *
+		 * However, userspace measurement introduces additional overhead (~0.3-0.5%):
+		 *   - Interrupt latency and scheduling delays (5-50 μs)
+		 *   - System call overhead for read() (1-5 μs)
+		 *   - Variable delays depending on system load
+		 *
+		 * Total tolerance: ±0.5% (hardware) + ~0.5% (software) ≈ ±1.0%
+		 *
+		 * For stricter validation matching hardware spec only, use 0.005 (0.5%),
+		 * but expect potential false failures due to measurement noise.
+		 */
+		double tolerance_pct = 0.01;  /* 1% tolerance */
+		double tolerance_us = expected * tolerance_pct;
+		double relative_accuracy = accuracy / expected;
+
+		/* Check 1: 99.7% samples within 1% of the mean */
+		if (accuracy >= tolerance_us) {
+			igt_info("FAIL: vblank accuracy (%.3fus, %.2f%%) exceeds 1%% tolerance "
+				 "(%.3fus)\n",
+				 accuracy, 100 * relative_accuracy, tolerance_us);
+			return false;
+		}
+
+		/* Check 2: Mean within 1% of expected, or within 3 sigma (99.7% confidence) */
+		if (fabs(mean - expected) >= max(tolerance_us, 3.0 * stddev)) {
+			igt_info("FAIL: vblank interval differs from expected! expected %.1fus, "
+				 "measured %.1fus +- %.3fus, difference %.1fus "
+				 "(%.1f sigma, %.2f%%), "
+				 "exceeds 1%% tolerance or 3-sigma threshold\n",
+				 expected, mean, stddev,
+				 fabs(mean - expected),
+				 fabs(mean - expected) / stddev,
+				 100 * fabs(mean - expected) / expected);
+			return false;
+		}
+
+		igt_info("Passed relaxed validation (strict failed)\n");
+	} else {
+		igt_info("Passed strict validation\n");
 	}
 
 	return true;
-- 
2.43.0

