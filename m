Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D8CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241310E1E1;
	Mon, 22 Sep 2025 16:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDLQm8mq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D132310E4A1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557414; x=1790093414;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=G2dvT4r2jBaUKWBcKwRUPbkd+JPgBmh8x8FOWWbWi7o=;
 b=hDLQm8mq9H64Y1BV+5LmeEQ9yueGW76o6B0624Hc7qN1XUuQtXS8A6Qg
 VjIkeJwYShO4T1g4wZjzC2ggz+9tgMhzmk7X9x2elJyoX3ZFrdWgF0Bu8
 Cemm0lN1Z35OgE/WFJ+f8j/XXjhRvWwY4PeWXlrBky07r6OlkGgkF3QLK
 zmREdFRgd+xPIEAjRi5XougjEFLFuhsYbcwv2Rk0V79ZiTUKcVLkSAT86
 gH7VCnqKN1LwnJ6efVkwteeWIybtOgO/6hK0DQsNpJsn85rHYb1Hauraz
 szyfC9DoYih0OdAC8P/qlKgVLYkJzfHaPzfkQvY+RIYufRShthlXxTlbY g==;
X-CSE-ConnectionGUID: DfRez2uMSXiYau4xHAsIgw==
X-CSE-MsgGUID: kQutr9suQFakiKJmLdPjBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425540"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:14 -0700
X-CSE-ConnectionGUID: 3aNRu0k0REi/HgcdPUGm/A==
X-CSE-MsgGUID: ZrRNf07JRw+Sfm/knbTyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664999"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:12 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/7] tools/intel_display_poller: Add
 --auto-scanline-offset/-O comamnd line option
Date: Mon, 22 Sep 2025 19:09:47 +0300
Message-ID: <20250922160950.27250-6-ville.syrjala@linux.intel.com>
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

Using the --scanline-offset/-o option to manually specify the scanline
offset can be a bit error prone since the appropriate offset depends
not only on the hardware generation, but sometimes also on the output
type (HDMI vs. not). Add a --auto-scanline-offset/-O option that tries
to automagically determin the correct offset by examinign the current
hardware state.

Note that DSI outputs aren't really handled properly by
hsw_ddi_is_hdmi(), or even by trans_reg() in general. So this
might give the wrong answer there.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_reg.h              |  1 +
 tools/intel_display_poller.c | 45 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 66911d015bd5..57d4420cf605 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -3531,6 +3531,7 @@ typedef enum {
 /* Those bits are ignored by pipe EDP since it can only connect to DDI A */
 #define  PIPE_DDI_PORT_MASK		(0xf<<28)
 #define  PIPE_DDI_SELECT_PORT(x)	((x)<<28)
+#define  PIPE_DDI_MODE_SELECT_MASK	(7<<24)
 #define  PIPE_DDI_MODE_SELECT_HDMI	(0<<24)
 #define  PIPE_DDI_MODE_SELECT_DVI	(1<<24)
 #define  PIPE_DDI_MODE_SELECT_DP_SST	(2<<24)
diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 24ed28ccf7da..b077390d14a1 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -207,6 +207,37 @@ static uint32_t trans_reg(uint32_t devid, int pipe, uint32_t reg)
 	return PIPE_REG(trans, reg);
 }
 
+static bool hsw_ddi_is_hdmi(uint32_t devid, int pipe)
+{
+	uint32_t tmp = read_reg(trans_reg(devid, pipe, PIPE_DDI_FUNC_CTL_A));
+
+	if (!(tmp & PIPE_DDI_FUNC_ENABLE))
+		return false;
+
+	switch (tmp & PIPE_DDI_MODE_SELECT_MASK) {
+	case PIPE_DDI_MODE_SELECT_HDMI:
+	case PIPE_DDI_MODE_SELECT_DVI:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int default_scanline_offset(uint32_t devid, int pipe)
+{
+	int display_ver = intel_display_ver(devid);
+
+	if (display_ver >= 20 || IS_BATTLEMAGE(devid))
+		return 1;
+	else if (display_ver >= 9 ||
+		 IS_BROADWELL(devid) || IS_HASWELL(devid))
+		return hsw_ddi_is_hdmi(devid, pipe) ? 2 : 1;
+	else if (display_ver >= 3)
+		return 1;
+	else
+		return -1;
+}
+
 static void enable_async_flip(uint32_t devid, int pipe, bool enable)
 {
 	int plane = pipe_to_plane(devid, pipe);
@@ -1295,7 +1326,8 @@ static void __attribute__((noreturn)) usage(const char *name)
 		" -x,--pixel\n"
 		" -a,--async\n"
 		" -v,--vrr-push <push scanline>\n"
-		" -o,--scanline-offset <offset>\n",
+		" -o,--scanline-offset <offset>\n"
+		" -O,--auto-scanline-offset\n",
 		name);
 	exit(1);
 }
@@ -1314,6 +1346,7 @@ int main(int argc, char *argv[])
 	uint32_t a, b;
 	enum test test = TEST_INVALID;
 	const int count = ARRAY_SIZE(min)/2;
+	bool auto_scanline_offset = false;
 
 	for (;;) {
 		static const struct option long_options[] = {
@@ -1326,10 +1359,11 @@ int main(int argc, char *argv[])
 			{ .name = "async", .has_arg = no_argument, .val = 'a', },
 			{ .name = "vrr-push", .has_arg = required_argument, .val = 'v', },
 			{ .name = "scanline-offset", .has_arg = required_argument, .val = 'o', },
+			{ .name = "auto-scanline-offset", .has_arg = no_argument, .val = 'O', },
 			{ },
 		};
 
-		int opt = getopt_long(argc, argv, "t:p:b:l:f:xav:o:", long_options, NULL);
+		int opt = getopt_long(argc, argv, "t:p:b:l:f:xav:o:O", long_options, NULL);
 		if (opt == -1)
 			break;
 
@@ -1406,8 +1440,12 @@ int main(int argc, char *argv[])
 				usage(argv[0]);
 			break;
 		case 'o':
+			auto_scanline_offset = false;
 			scanline_offset = atoi(optarg);
 			break;
+		case 'O':
+			auto_scanline_offset = true;
+			break;
 		}
 	}
 
@@ -1578,6 +1616,9 @@ int main(int argc, char *argv[])
 
 	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
 
+	if (auto_scanline_offset)
+		scanline_offset = default_scanline_offset(devid, pipe);
+
 	printf("%s?\n", test_name(test, pipe, bit, test_pixelcount));
 
 	signal(SIGHUP, sighandler);
-- 
2.49.1

