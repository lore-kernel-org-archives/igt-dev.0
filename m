Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B45CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BABF10E4A1;
	Mon, 22 Sep 2025 16:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPQtGRWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697BD10E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557421; x=1790093421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dWC2FR3E+vood8u5V0fo6c3Efw+Vh9NID+0b5KlgzqQ=;
 b=mPQtGRWJ5qZznrfXrG0mr1jdq2f52zYJJTtgfYcwj/oDFbaUQ4+x1swa
 C/CpP4T5TuivP6d+WGrp3oqzt4l1g96V6llAdEF5e+xvt3qbVTf7S39XX
 qbKqmQnbckQXkBib0KrDzFYx+JCaLxv7+YNQkTE9GUS06vZ1qPBOyAs5B
 7hDsxPb1BPqQO2fN2UzCqS/gj9vGld12oOSZUGy6lgX3FEEHzoOOOYIjU
 Q2h5t6QUkyZW07ANUaD2NVprJfR59S/MyH3D0xHtHmPdFPVsmPKW6Poiy
 m+t/rp+NmbINrRFiwOI30xL3iH1vSvquTM7VB9lrkLBBdcAHsyN+3tY9Z w==;
X-CSE-ConnectionGUID: avmlw19xQ+6Hk3lnQJ2tZQ==
X-CSE-MsgGUID: vShYN3qhTkOxrP5yQ3qt7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425560"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:21 -0700
X-CSE-ConnectionGUID: Ej4H55hvQRiFpU0ALfmjBg==
X-CSE-MsgGUID: XbBfKh4IRmKHvlceVtCtJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181665033"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/7] tools/intel_display_poller: Add --dsb-id/-d command
 line option
Date: Mon, 22 Sep 2025 19:09:49 +0300
Message-ID: <20250922160950.27250-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a new command line option (--dsb-id/-d) to select the
DSB engine (0-2) for DSB related tests.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_display_poller.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 21e4e847a6b6..ecdef21609cb 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -208,6 +208,11 @@ static uint32_t trans_reg(uint32_t devid, int pipe, uint32_t reg)
 	return PIPE_REG(trans, reg);
 }
 
+static uint32_t dsb_reg(int pipe, int dsb_id, uint32_t reg)
+{
+	return PIPE_REG(pipe, reg + dsb_id * 0x100);
+}
+
 static bool hsw_ddi_is_hdmi(uint32_t devid, int pipe)
 {
 	uint32_t tmp = read_reg(trans_reg(devid, pipe, PIPE_DDI_FUNC_CTL_A));
@@ -1254,7 +1259,7 @@ static void poll_dsl_vrr_push(uint32_t devid, int pipe,
 	}
 }
 
-static void poll_dsl_dsb_status_live(uint32_t devid, int pipe, int bit,
+static void poll_dsl_dsb_status_live(uint32_t devid, int pipe, int dsb_id, int bit,
 				     uint32_t *min, uint32_t *max, const int count,
 				     int vrr_push_scanline)
 {
@@ -1265,7 +1270,7 @@ static void poll_dsl_dsb_status_live(uint32_t devid, int pipe, int bit,
 
 	bit = 1 << bit;
 	dsl = PIPE_REG(pipe, PIPEA_DSL);
-	dsb = PIPE_REG(pipe, DSB_STATUS_0_A);
+	dsb = dsb_reg(pipe, dsb_id, DSB_STATUS_0_A);
 
 	while (!quit) {
 		push_vrr(devid, pipe, vrr_push_scanline);
@@ -1294,7 +1299,7 @@ static void poll_dsl_dsb_status_live(uint32_t devid, int pipe, int bit,
 	}
 }
 
-static const char *test_name(enum test test, int pipe, int bit, bool test_pixel_count)
+static const char *test_name(enum test test, int pipe, int dsb_id, int bit, bool test_pixel_count)
 {
 	static char str[64];
 	const char *type = test_pixel_count ? "pixel" : "dsl";
@@ -1352,7 +1357,7 @@ static const char *test_name(enum test test, int pipe, int bit, bool test_pixel_
 		snprintf(str, sizeof str, "%s / pipe %c / VRR push", type, pipe_name(pipe));
 		return str;
 	case TEST_DSB_STATUS_LIVE:
-		snprintf(str, sizeof str, "%s / pipe %c / DSB_STATUS[%d]", type, pipe_name(pipe), bit);
+		snprintf(str, sizeof str, "%s / pipe %c / DSB%d / DSB_STATUS[%d]", type, pipe_name(pipe), dsb_id, bit);
 		return str;
 	default:
 		return "";
@@ -1381,7 +1386,8 @@ int main(int argc, char *argv[])
 {
 	struct intel_mmio_data mmio_data;
 	int i;
-	int pipe = 0, bit = 0, target_scanline = 0, target_fuzz = 1;
+	int pipe = 0, dsb_id = 0, bit = 0;
+	int target_scanline = 0, target_fuzz = 1;
 	bool test_pixelcount = false;
 	bool test_async_flip = false;
 	int vrr_push_scanline = -1;
@@ -1409,7 +1415,7 @@ int main(int argc, char *argv[])
 			{ },
 		};
 
-		int opt = getopt_long(argc, argv, "t:p:b:l:f:xav:o:O", long_options, NULL);
+		int opt = getopt_long(argc, argv, "t:p:d:b:l:f:xav:o:O", long_options, NULL);
 		if (opt == -1)
 			break;
 
@@ -1461,6 +1467,11 @@ int main(int argc, char *argv[])
 			if (pipe < 0 || pipe > 3)
 				usage(argv[0]);
 			break;
+		case 'd':
+			dsb_id = atoi(optarg);
+			if (dsb_id < 0 || dsb_id > 2)
+				usage(argv[0]);
+			break;
 		case 'b':
 			bit = atoi(optarg);
 			if (bit < 0 || bit > 31)
@@ -1671,7 +1682,7 @@ int main(int argc, char *argv[])
 	if (auto_scanline_offset)
 		scanline_offset = default_scanline_offset(devid, pipe);
 
-	printf("%s?\n", test_name(test, pipe, bit, test_pixelcount));
+	printf("%s?\n", test_name(test, pipe, dsb_id, bit, test_pixelcount));
 
 	signal(SIGHUP, sighandler);
 	signal(SIGINT, sighandler);
@@ -1760,7 +1771,7 @@ int main(int argc, char *argv[])
 		poll_dsl_vrr_push(devid, pipe, min, max, count, vrr_push_scanline);
 		break;
 	case TEST_DSB_STATUS_LIVE:
-		poll_dsl_dsb_status_live(devid, pipe, bit, min, max, count, vrr_push_scanline);
+		poll_dsl_dsb_status_live(devid, pipe, dsb_id, bit, min, max, count, vrr_push_scanline);
 		break;
 	default:
 		assert(0);
@@ -1793,7 +1804,7 @@ int main(int argc, char *argv[])
 		b = min(b, max[0*count+i]);
 	}
 
-	printf("%s: [%u] %6u - %6u\n", test_name(test, pipe, bit, test_pixelcount), 0, a, b);
+	printf("%s: [%u] %6u - %6u\n", test_name(test, pipe, dsb_id, bit, test_pixelcount), 0, a, b);
 
 	a = 0;
 	b = 0xffffffff;
@@ -1804,7 +1815,7 @@ int main(int argc, char *argv[])
 		b = min(b, max[1*count+i]);
 	}
 
-	printf("%s: [%u] %6u - %6u\n", test_name(test, pipe, bit, test_pixelcount), 1, a, b);
+	printf("%s: [%u] %6u - %6u\n", test_name(test, pipe, dsb_id, bit, test_pixelcount), 1, a, b);
 
 	return 0;
 }
-- 
2.49.1

