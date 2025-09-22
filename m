Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD7CCAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DB810E470;
	Mon, 22 Sep 2025 16:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1Yb3Zp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5989D10E470
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557406; x=1790093406;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=r9HHO38I9CBHgg5TFUhSDrxo8OkjwISAPKSQxWhNYsg=;
 b=O1Yb3Zp2r2Tm30JIIL1dDTw27nczbTu2RmJA5uaviiogBseAElGxUeIY
 tf8nMAyfOQaFPTvYX4f1sYSNjRaju52knbluYliymZayao3xDT+7UDP0j
 b8l4Q+bQidqtnqWlqX0qxq3MLBmskvLuATsEjx13h29u1d+09MUfFUV/l
 TGkvFAXm2CycOqtcgOhbCqRdmTz5MXMv3GN9uFJBgmJTvMRi91hNkhuF0
 PLAHvO5gv9NsXlVH6TAeHffO/h+5gHfgMYt16eBZCd2kcLJC0ckfvFA4E
 8PjXhJJ+8AWR+66WBP+i40a6In6yofS0DoMNXOj/nYSGXq9MZ62gjLSPW g==;
X-CSE-ConnectionGUID: q6VMMkw5RvGUWwShHRbZBg==
X-CSE-MsgGUID: x+zs26cDRkK6BjK2nPo54g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425530"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:06 -0700
X-CSE-ConnectionGUID: lq2nNqakRmirpHD//L4oww==
X-CSE-MsgGUID: GvePgExmR/2sDIMbhY7ZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664939"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:05 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/7] tools/intel_display_poller: Use intel_display_ver()
 instead of intel_gen()
Date: Mon, 22 Sep 2025 19:09:45 +0300
Message-ID: <20250922160950.27250-4-ville.syrjala@linux.intel.com>
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

Use intel_display_ver() instead of intel_gen() for the display
hardware version checks. These two can return different numbers
on the more modern platforms, and using the wrong number could
lead us down invalid paths.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_display_poller.c | 42 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 69906d557a37..e02506128e04 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -102,7 +102,7 @@ static char pipe_name(int pipe)
 
 static int pipe_to_plane(uint32_t devid, int pipe)
 {
-	if (intel_gen(devid) >= 4)
+	if (intel_display_ver(devid) >= 4)
 		return pipe;
 
 	switch (pipe) {
@@ -134,9 +134,9 @@ static uint32_t dspoffset_reg(uint32_t devid, int pipe)
 	bool use_tileoff;
 	int plane = pipe_to_plane(devid, pipe);
 
-	if (intel_gen(devid) < 4)
+	if (intel_display_ver(devid) < 4)
 		use_tileoff = false;
-	else if (IS_HASWELL(devid) || IS_BROADWELL(devid) || intel_gen(devid) >= 9)
+	else if (IS_HASWELL(devid) || IS_BROADWELL(devid) || intel_display_ver(devid) >= 9)
 		use_tileoff = true;
 	else
 		use_tileoff = read_reg(PIPE_REG(plane, DSPACNTR)) & DISPLAY_PLANE_TILED;
@@ -154,7 +154,7 @@ static uint32_t dspsurf_reg(uint32_t devid, int pipe, bool async)
 	if (async && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)))
 		return PIPE_REG(plane, DSPAADDR_VLV);
 
-	if (intel_gen(devid) < 4)
+	if (intel_display_ver(devid) < 4)
 		return PIPE_REG(plane, DSPABASE);
 	else
 		return PIPE_REG(plane, DSPASURF);
@@ -162,10 +162,10 @@ static uint32_t dspsurf_reg(uint32_t devid, int pipe, bool async)
 
 static int pipe_to_transcoder(uint32_t devid, int pipe)
 {
-	int gen = intel_gen(devid);
+	int display_ver = intel_display_ver(devid);
 
 	if (IS_HASWELL(devid) || IS_BROADWELL(devid) ||
-	    gen == 9 || gen == 10 || gen == 11) {
+	    display_ver == 9 || display_ver == 10 || display_ver == 11) {
 		/* FIXME not 100% robust */
 		if (read_reg(PIPE_REG(pipe, PIPEACONF)) & PIPEACONF_ENABLE)
 			return pipe;
@@ -600,7 +600,7 @@ static void poll_dsl_deiir(uint32_t devid, int pipe, int bit,
 	bit = 1 << bit;
 	dsl = PIPE_REG(pipe, PIPEA_DSL);
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_display_ver(devid) >= 8) {
 		iir = GEN8_DE_PIPE_IIR(pipe);
 		ier = GEN8_DE_PIPE_IER(pipe);
 		imr = GEN8_DE_PIPE_IMR(pipe);
@@ -832,9 +832,9 @@ static void poll_dsl_frametimestamp(uint32_t devid, int pipe,
 
 static uint32_t timestamp_reg(uint32_t devid)
 {
-	if (intel_gen(devid) >= 7)
+	if (intel_display_ver(devid) >= 7)
 		return IVB_TIMESTAMP_CTR;
-	else if (intel_gen(devid) >= 5)
+	else if (intel_display_ver(devid) >= 5)
 		return ILK_TIMESTAMP_HI;
 	else
 		return TIMESTAMP_QW + 4;
@@ -1020,19 +1020,19 @@ static void poll_dsl_flipdone_deiir(uint32_t devid, int pipe, int target_scanlin
 	dsl = PIPE_REG(pipe, PIPEA_DSL);
 	surf = dspsurf_reg(devid, pipe, async);
 
-	if (intel_gen(devid) >= 9)
+	if (intel_display_ver(devid) >= 9)
 		bit = 3;
-	else if (intel_gen(devid) >= 8)
+	else if (intel_display_ver(devid) >= 8)
 		bit = 4;
-	else if (intel_gen(devid) >= 7)
+	else if (intel_display_ver(devid) >= 7)
 		bit = 3 + 5 * pipe;
-	else if (intel_gen(devid) >= 5)
+	else if (intel_display_ver(devid) >= 5)
 		bit = 26 + pipe;
 	else
 		abort();
 	bit = 1 << bit;
 
-	if (intel_gen(devid) >= 8) {
+	if (intel_display_ver(devid) >= 8) {
 		iir = GEN8_DE_PIPE_IIR(pipe);
 		ier = GEN8_DE_PIPE_IER(pipe);
 		imr = GEN8_DE_PIPE_IMR(pipe);
@@ -1448,7 +1448,7 @@ int main(int argc, char *argv[])
 	 * check if the requires registers are
 	 * avilable on the current platform.
 	 */
-	if (intel_gen(devid) == 2) {
+	if (intel_display_ver(devid) == 2) {
 		if (pipe > 1)
 			usage(argv[0]);
 
@@ -1474,7 +1474,7 @@ int main(int argc, char *argv[])
 		default:
 			usage(argv[0]);
 		}
-	} else if (intel_gen(devid) < 5 && !IS_G4X(devid)) {
+	} else if (intel_display_ver(devid) < 5 && !IS_G4X(devid)) {
 		if (pipe > 1)
 			usage(argv[0]);
 
@@ -1497,7 +1497,7 @@ int main(int argc, char *argv[])
 		case TEST_FIELD:
 			break;
 		case TEST_FLIP:
-			if (intel_gen(devid) == 3)
+			if (intel_display_ver(devid) == 3)
 				test = TEST_PAN;
 			break;
 		default:
@@ -1554,9 +1554,9 @@ int main(int argc, char *argv[])
 			usage(argv[0]);
 		}
 	} else {
-		if (pipe > 1 && intel_gen(devid) < 7)
+		if (pipe > 1 && intel_display_ver(devid) < 7)
 			usage(argv[0]);
-		if (pipe > 2 && intel_gen(devid) < 12)
+		if (pipe > 2 && intel_display_ver(devid) < 12)
 			usage(argv[0]);
 		if (pipe > 3)
 			usage(argv[0]);
@@ -1564,7 +1564,7 @@ int main(int argc, char *argv[])
 		if (test_pixelcount)
 			usage(argv[0]);
 
-		if (vrr_push_scanline >= 0 && intel_gen(devid) < 11)
+		if (vrr_push_scanline >= 0 && intel_display_ver(devid) < 11)
 			usage(argv[0]);
 
 		switch (test) {
@@ -1580,7 +1580,7 @@ int main(int argc, char *argv[])
 		case TEST_VRR_PUSH:
 			if (vrr_push_scanline < 0)
 				usage(argv[0]);
-			if (intel_gen(devid) < 11)
+			if (intel_display_ver(devid) < 11)
 				usage(argv[0]);
 			break;
 		case TEST_FLIPCOUNT:
-- 
2.49.1

