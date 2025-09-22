Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66024CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB2110E04D;
	Mon, 22 Sep 2025 16:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/SYH7WK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC6D10E04D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557410; x=1790093410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8ElaSYIWCP0r0lprptV7+XATAbBADu6wRk19A/mcr50=;
 b=L/SYH7WKywyRCj5RDMGJmmQSn22yGAe0F8tLrds8fmWkJw21X1rlxjyy
 hBTZUqZmSiHzgsJFQ9I4Vt91qIdZ0dY/ETrR3SVbHxXVLuG0qIGWTB7D4
 KigpXZuAXJJB008vpx1Uba3Mg64yP6M6ApiG2PrUv66UlReFmd67QcD4y
 jsnX4/ujgYKzLewf7T/nFuL+1oqHpj96M54zwoSotUQBLoU0u+SGikPUS
 3RUqCAfR6GVH8Hxl2i4aTijNbYVPBQlTk1r93UblCba9iaTGFQGFvcEq+
 uPO51A+XoisCwClsMG2ukNgVRDY4CVWbccu/W7bJ+RPE2SRjsHQ3MpjC2 Q==;
X-CSE-ConnectionGUID: GRpRItPmRnejE1roqP3dzg==
X-CSE-MsgGUID: FWtPdQwkQVaO3DKIquD8Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425536"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:10 -0700
X-CSE-ConnectionGUID: Mxrk9g3YQZKrdcRrhfBlxw==
X-CSE-MsgGUID: /HlT2K/jRlaeCy2oz8bsag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:08 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/7] tools/intel_display_poller: Add
 --scanline-offset/-o command line option
Date: Mon, 22 Sep 2025 19:09:46 +0300
Message-ID: <20250922160950.27250-5-ville.syrjala@linux.intel.com>
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

Our hardware has a slightly warped view of scanline numbers.
Eg. on most platforms it reports DSL=vblank_start-1 when the
start of vblank actaully occurs.

On the kernel side we have helpers to convert between the hardware
and software scanline numbers. Add the same for intel_display_poller
in the form of a new --scanline-offset/-o command line option. With
this one doesn't constantly have to waste brarin power to convert the
hardware numbers into something more sensible.

Caveat: unlike the kernel side we don't do the appropriate %vtotal
on the adjusted values (since figuring out the actual vtotal would take
quite a bit of work due to VRR/etc.). So when using --scanline-offset
one has to keep in mind that we might see slightly funky scanline
numbers. Eg. scanline >= vtotal when the scanline offset of positive,
and negative value (due to a negative scanline offset) we just
saturate to 0. Howver for most interesting hardware events the
scanline tends to be in a range where this issue doesn't matter.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_display_poller.c | 155 ++++++++++++++---------------------
 1 file changed, 62 insertions(+), 93 deletions(-)

diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index e02506128e04..24ed28ccf7da 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -65,6 +65,7 @@ enum test {
 
 static uint32_t vlv_offset;
 static uint16_t pipe_offset[4] = { 0, 0x1000, 0x2000, 0x3000, };
+static int scanline_offset = 0;
 
 #define PIPE_REG(pipe, reg_a) (pipe_offset[(pipe)] + (reg_a))
 
@@ -85,6 +86,29 @@ static uint32_t read_reg(uint32_t reg)
 	return INREG(vlv_offset + reg);
 }
 
+static uint32_t read_scanline(uint32_t reg, bool *field)
+{
+	uint32_t dsl;
+	int scanline;
+
+	dsl = INREG(vlv_offset + reg);
+
+	*field = dsl & 0x80000000;
+	scanline = dsl & ~0x80000000;
+
+	/*
+	 * FIXME would need to know vtotal to make
+	 * this wrap around properly. For now just
+	 * avoid reporting negative numbers and just
+	 * potentially report sligtly incorrect numbers
+	 * near the wraparound point.
+	 *
+	 * scanline_offset==0 by default to avoid people
+	 * shooting themselves in the foot with this.
+	 */
+	return max(scanline + scanline_offset, 0);
+}
+
 static void write_reg_16(uint32_t reg, uint16_t val)
 {
 	OUTREG16(vlv_offset + reg, val);
@@ -203,6 +227,7 @@ static void push_vrr(uint32_t devid, int pipe, int vrr_push_scanline)
 {
 	uint32_t dsl = PIPE_REG(pipe, PIPEA_DSL);
 	uint32_t push = trans_reg(devid, pipe, TRANS_PUSH_A);
+	bool field;
 
 	if (vrr_push_scanline < 0)
 		return;
@@ -211,7 +236,7 @@ static void push_vrr(uint32_t devid, int pipe, int vrr_push_scanline)
 		return;
 
 	while (!quit) {
-		uint32_t dsl1 = read_reg(dsl) & ~0x80000000;
+		uint32_t dsl1 = read_scanline(dsl, &field);
 		if (dsl1 == vrr_push_scanline)
 			break;
 	}
@@ -224,8 +249,7 @@ static int wait_scanline(int pipe, int target_scanline, bool *field)
 	uint32_t dsl_reg = PIPE_REG(pipe, PIPEA_DSL);
 
 	while (!quit) {
-		uint32_t dsl = read_reg(dsl_reg);
-		*field = dsl & 0x80000000;
+		uint32_t dsl = read_scanline(dsl_reg, field);
 		dsl &= ~0x80000000;
 		if (dsl == target_scanline)
 			return dsl;
@@ -457,15 +481,10 @@ static void poll_dsl_pipestat(int pipe, int bit,
 	write_reg(iir, iir_mask | iir_bit);
 
 	while (!quit) {
-		dsl1 = read_reg(dsl);
+		dsl1 = read_scanline(dsl, &field1);
 		iir1 = read_reg(iir);
 		iir2 = read_reg(iir);
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (!(iir2 & iir_bit))
 			continue;
@@ -505,15 +524,10 @@ static void poll_dsl_iir_gen2(int pipe, int bit,
 	write_reg_16(IIR, bit);
 
 	while (!quit) {
-		dsl1 = read_reg(dsl);
+		dsl1 = read_scanline(dsl, &field1);
 		iir1 = read_reg_16(IIR);
 		iir2 = read_reg_16(IIR);
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (!(iir2 & bit))
 			continue;
@@ -556,15 +570,10 @@ static void poll_dsl_iir_gen3(int pipe, int bit,
 	write_reg(IIR, bit);
 
 	while (!quit) {
-		dsl1 = read_reg(dsl);
+		dsl1 = read_scanline(dsl, &field1);
 		iir1 = read_reg(IIR);
 		iir2 = read_reg(IIR);
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (!(iir2 & bit))
 			continue;
@@ -622,15 +631,10 @@ static void poll_dsl_deiir(uint32_t devid, int pipe, int bit,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
-			dsl1 = read_reg(dsl);
+			dsl1 = read_scanline(dsl, &field1);
 			iir1 = read_reg(iir);
 			iir2 = read_reg(iir);
-			dsl2 = read_reg(dsl);
-
-			field1 = dsl1 & 0x80000000;
-			field2 = dsl2 & 0x80000000;
-			dsl1 &= ~0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (iir2 & bit)
 				break;
@@ -670,15 +674,10 @@ static void poll_dsl_framecount_g4x(uint32_t devid, int pipe,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
-			dsl1 = read_reg(dsl);
+			dsl1 = read_scanline(dsl, &field1);
 			frm1 = read_reg(frm);
 			frm2 = read_reg(frm);
-			dsl2 = read_reg(dsl);
-
-			field1 = dsl1 & 0x80000000;
-			field2 = dsl2 & 0x80000000;
-			dsl1 &= ~0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (frm1 + 1 == frm2)
 				break;
@@ -709,14 +708,9 @@ static void poll_dsl_flipcount_g4x(uint32_t devid, int pipe,
 
 	while (!quit) {
 		usleep(10);
-		dsl1 = read_reg(dsl);
+		dsl1 = read_scanline(dsl, &field1);
 		flp1 = read_reg(flp);
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (field1 != field2)
 			printf("fields are different (%u:%u -> %u:%u)\n",
@@ -765,15 +759,10 @@ static void poll_dsl_framecount_gen3(int pipe, uint32_t *min, uint32_t *max, con
 	dsl = PIPE_REG(pipe, PIPEA_DSL);
 
 	while (!quit) {
-		dsl1 = read_reg(dsl);
+		dsl1 = read_scanline(dsl, &field1);
 		frm1 = read_reg(frm) >> 24;
 		frm2 = read_reg(frm) >> 24;
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (frm1 + 1 != frm2)
 			continue;
@@ -805,15 +794,10 @@ static void poll_dsl_frametimestamp(uint32_t devid, int pipe,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
-			dsl1 = read_reg(dsl);
+			dsl1 = read_scanline(dsl, &field1);
 			frm1 = read_reg(frm);
 			frm2 = read_reg(frm);
-			dsl2 = read_reg(dsl);
-
-			field1 = dsl1 & 0x80000000;
-			field2 = dsl2 & 0x80000000;
-			dsl1 &= ~0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (frm1 != frm2)
 				break;
@@ -859,9 +843,6 @@ static void poll_dsl_timestamp(uint32_t devid, int pipe, int target_scanline,
 		frm1 = read_reg(frm);
 		ts1 = read_reg(ts);
 
-		field1 = dsl1 & 0x80000000;
-		dsl1 &= ~0x80000000;
-
 		min[field1*count+i[field1]] = dsl1;
 		max[field1*count+i[field1]] = ts1 - frm1;
 		if (++i[field1] >= count)
@@ -980,10 +961,7 @@ static void poll_dsl_flipdone_pipestat(uint32_t devid, int pipe, int target_scan
 
 		while (!quit) {
 			pipestat2 = read_reg(pipestat);
-			dsl2 = read_reg(dsl);
-
-			field2 = dsl2 & 0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (pipestat2 & bit)
 				break;
@@ -1065,10 +1043,7 @@ static void poll_dsl_flipdone_deiir(uint32_t devid, int pipe, int target_scanlin
 
 		while (!quit) {
 			iir2 = read_reg(iir);
-			dsl2 = read_reg(dsl);
-
-			field2 = dsl2 & 0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (iir2 & bit)
 				break;
@@ -1116,15 +1091,10 @@ static void poll_dsl_surflive(uint32_t devid, int pipe,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
-			dsl1 = read_reg(dsl);
+			dsl1 = read_scanline(dsl, &field1);
 			surfl1 = read_reg(surflive) & ~0xfff;
 			surfl2 = read_reg(surflive) & ~0xfff;
-			dsl2 = read_reg(dsl);
-
-			field1 = dsl1 & 0x80000000;
-			field2 = dsl2 & 0x80000000;
-			dsl1 &= ~0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (surfl2 == surf2)
 				break;
@@ -1164,6 +1134,10 @@ static void poll_dsl_wrap(uint32_t devid, int pipe,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
+			/*
+			 * raw read_reg() instead of read_scanline()
+			 * to avoid scanline_offset screwing this up.
+			 */
 			dsl1 = read_reg(dsl);
 			dsl2 = read_reg(dsl);
 
@@ -1196,13 +1170,8 @@ static void poll_dsl_field(int pipe, uint32_t *min, uint32_t *max, const int cou
 	dsl = PIPE_REG(pipe, PIPEA_DSL);
 
 	while (!quit) {
-		dsl1 = read_reg(dsl);
-		dsl2 = read_reg(dsl);
-
-		field1 = dsl1 & 0x80000000;
-		field2 = dsl2 & 0x80000000;
-		dsl1 &= ~0x80000000;
-		dsl2 &= ~0x80000000;
+		dsl1 = read_scanline(dsl, &field1);
+		dsl2 = read_scanline(dsl, &field2);
 
 		if (field1 == field2)
 			continue;
@@ -1230,15 +1199,10 @@ static void poll_dsl_vrr_push(uint32_t devid, int pipe,
 		push_vrr(devid, pipe, vrr_push_scanline);
 
 		while (!quit) {
-			dsl1 = read_reg(dsl);
+			dsl1 = read_scanline(dsl, &field1);
 			vrr1 = read_reg(vrr);
 			vrr2 = read_reg(vrr);
-			dsl2 = read_reg(dsl);
-
-			field1 = dsl1 & 0x80000000;
-			field2 = dsl2 & 0x80000000;
-			dsl1 &= ~0x80000000;
-			dsl2 &= ~0x80000000;
+			dsl2 = read_scanline(dsl, &field2);
 
 			if (!(vrr2 & 0x40000000))
 				break;
@@ -1330,7 +1294,8 @@ static void __attribute__((noreturn)) usage(const char *name)
 		" -f,--fuzz <target fuzz>\n"
 		" -x,--pixel\n"
 		" -a,--async\n"
-		" -v,--vrr-push <push scanline>\n",
+		" -v,--vrr-push <push scanline>\n"
+		" -o,--scanline-offset <offset>\n",
 		name);
 	exit(1);
 }
@@ -1360,10 +1325,11 @@ int main(int argc, char *argv[])
 			{ .name = "pixel", .has_arg = no_argument, .val = 'x', },
 			{ .name = "async", .has_arg = no_argument, .val = 'a', },
 			{ .name = "vrr-push", .has_arg = required_argument, .val = 'v', },
+			{ .name = "scanline-offset", .has_arg = required_argument, .val = 'o', },
 			{ },
 		};
 
-		int opt = getopt_long(argc, argv, "t:p:b:l:f:xav:", long_options, NULL);
+		int opt = getopt_long(argc, argv, "t:p:b:l:f:xav:o:", long_options, NULL);
 		if (opt == -1)
 			break;
 
@@ -1439,6 +1405,9 @@ int main(int argc, char *argv[])
 			if (vrr_push_scanline < 0)
 				usage(argv[0]);
 			break;
+		case 'o':
+			scanline_offset = atoi(optarg);
+			break;
 		}
 	}
 
-- 
2.49.1

