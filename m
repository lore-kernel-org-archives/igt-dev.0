Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72470CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601810E499;
	Mon, 22 Sep 2025 16:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzTd0qnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1610E499
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557417; x=1790093417;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VYSY1DfZb/CeI1wsTFw1Z1KdWht33VQU6wcKiQ5nA5o=;
 b=DzTd0qnMRR8vuEU0YMy8yldW/zAJXilLhN86P6eIObSq0JQ27/3a2aId
 TN0Pm8FrIeFJb7Ql5rgbZhgZmo5FXqIj9bttyWmiiFtNdAbhURUtITHFT
 dRJ4x7fNckd671Ij+mHPjYWqZjJdLQXAP1z1e9FIw584oV8kxobi8Stpz
 PynyoI/l5YOXU7jUEPGicUVagFq7CNMAENR1ZYLH70y8kR5zQ9SZedTEW
 dO+8MgMmKAqnUWtJBcNMFOIAvXiHEPOfky8ixkMbdHRAga+dbBT5WK7C1
 QAknAPYwbKm/xLIh8mIYyDoK3KyHQv0/0w4YJkVe+5kIl3nefEcI26fqZ g==;
X-CSE-ConnectionGUID: Leoum/FoRXaY8LEIkf3X7Q==
X-CSE-MsgGUID: WKO0JenhTXq0Lm0V/HIvVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425543"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:17 -0700
X-CSE-ConnectionGUID: z7kaBVBAT7S8madDM48pBw==
X-CSE-MsgGUID: eGn11ADBQeClTQ4jKZSdGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181665018"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:10:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/7] tools/intel_display_poller: Add dsb-status-live test
Date: Mon, 22 Sep 2025 19:09:48 +0300
Message-ID: <20250922160950.27250-7-ville.syrjala@linux.intel.com>
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

Add a dsb-status-live test that can be used to poll for live
status bits in the DSB_STATUS register.

Eg.
intel_display_poller --pipe a --test dsb-status-live --bit 26
will look for the DSB safe window rising edge.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_reg.h              |  4 +++
 tools/intel_display_poller.c | 57 +++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 57d4420cf605..fd35e4bb366a 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2275,6 +2275,10 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define FW_BLC2		0x020dc
 #define FW_BLC_SELF	0x020e0 /* 915+ only */
 
+#define DSB_STATUS_0_A			0x70B24
+#define   DSB_SAFE_WINDOW_LIVE		(1 << 26)
+#define   DSB_SAFE_WINDOW_STICKY	(1 << 19)
+
 #define DSPARB			0x70030
 #define   DSPARB_CSTART_SHIFT	7
 #define   DSPARB_BSTART_SHIFT	0
diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index b077390d14a1..21e4e847a6b6 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -61,6 +61,7 @@ enum test {
 	TEST_WRAP,
 	TEST_FIELD,
 	TEST_VRR_PUSH,
+	TEST_DSB_STATUS_LIVE,
 };
 
 static uint32_t vlv_offset;
@@ -1253,6 +1254,46 @@ static void poll_dsl_vrr_push(uint32_t devid, int pipe,
 	}
 }
 
+static void poll_dsl_dsb_status_live(uint32_t devid, int pipe, int bit,
+				     uint32_t *min, uint32_t *max, const int count,
+				     int vrr_push_scanline)
+{
+	uint32_t dsl, dsl1, dsl2;
+	uint32_t dsb, dsb1, dsb2;
+	bool field1, field2;
+	int i[2] = {};
+
+	bit = 1 << bit;
+	dsl = PIPE_REG(pipe, PIPEA_DSL);
+	dsb = PIPE_REG(pipe, DSB_STATUS_0_A);
+
+	while (!quit) {
+		push_vrr(devid, pipe, vrr_push_scanline);
+
+		while (!quit) {
+			dsl1 = read_scanline(dsl, &field1);
+			dsb1 = read_reg(dsb);
+			dsb2 = read_reg(dsb);
+			dsl2 = read_scanline(dsl, &field2);
+
+			if (dsb2 & bit)
+				break;
+		}
+
+		if (dsb1 & bit)
+			continue;
+
+		if (field1 != field2)
+			printf("fields are different (%u:%u -> %u:%u)\n",
+			       field1, dsl1, field2, dsl2);
+
+		min[field1*count+i[field1]] = dsl1;
+		max[field1*count+i[field1]] = dsl2;
+		if (++i[field1] >= count)
+			break;
+	}
+}
+
 static const char *test_name(enum test test, int pipe, int bit, bool test_pixel_count)
 {
 	static char str[64];
@@ -1310,6 +1351,9 @@ static const char *test_name(enum test test, int pipe, int bit, bool test_pixel_
 	case TEST_VRR_PUSH:
 		snprintf(str, sizeof str, "%s / pipe %c / VRR push", type, pipe_name(pipe));
 		return str;
+	case TEST_DSB_STATUS_LIVE:
+		snprintf(str, sizeof str, "%s / pipe %c / DSB_STATUS[%d]", type, pipe_name(pipe), bit);
+		return str;
 	default:
 		return "";
 	}
@@ -1318,8 +1362,9 @@ static const char *test_name(enum test test, int pipe, int bit, bool test_pixel_
 static void __attribute__((noreturn)) usage(const char *name)
 {
 	fprintf(stderr, "Usage: %s [options]\n"
-		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestamp|pan|flip|flipdone|surflive|wrap|field|vrr-push>\n"
+		" -t,--test <pipestat|iir|framecount|flipcount|frametimestamp|timestamp|pan|flip|flipdone|surflive|wrap|field|vrr-push|dsb-status>\n"
 		" -p,--pipe <pipe>\n"
+		" -d,--dsb-id <dsb id>\n"
 		" -b,--bit <bit>\n"
 		" -l,--line <target scanline/pixel>\n"
 		" -f,--fuzz <target fuzz>\n"
@@ -1352,6 +1397,7 @@ int main(int argc, char *argv[])
 		static const struct option long_options[] = {
 			{ .name = "test", .has_arg = required_argument, .val = 't', },
 			{ .name = "pipe", .has_arg = required_argument, .val = 'b', },
+			{ .name = "dsb-id", .has_arg = required_argument, .val = 'd', },
 			{ .name = "bit", .has_arg = required_argument, .val = 'b', },
 			{ .name = "line", .has_arg = required_argument, .val = 'l', },
 			{ .name = "fuzz", .has_arg = required_argument, .val = 'f', },
@@ -1395,6 +1441,8 @@ int main(int argc, char *argv[])
 				test = TEST_FIELD;
 			else if (!strcmp(optarg, "vrr-push"))
 				test = TEST_VRR_PUSH;
+			else if (!strcmp(optarg, "dsb-status-live"))
+				test = TEST_DSB_STATUS_LIVE;
 			else
 				usage(argv[0]);
 			break;
@@ -1590,6 +1638,10 @@ int main(int argc, char *argv[])
 			if (intel_display_ver(devid) < 11)
 				usage(argv[0]);
 			break;
+		case TEST_DSB_STATUS_LIVE:
+			if (intel_display_ver(devid) < 12)
+				usage(argv[0]);
+			break;
 		case TEST_FLIPCOUNT:
 		case TEST_PAN:
 		case TEST_FLIP:
@@ -1707,6 +1759,9 @@ int main(int argc, char *argv[])
 	case TEST_VRR_PUSH:
 		poll_dsl_vrr_push(devid, pipe, min, max, count, vrr_push_scanline);
 		break;
+	case TEST_DSB_STATUS_LIVE:
+		poll_dsl_dsb_status_live(devid, pipe, bit, min, max, count, vrr_push_scanline);
+		break;
 	default:
 		assert(0);
 	}
-- 
2.49.1

