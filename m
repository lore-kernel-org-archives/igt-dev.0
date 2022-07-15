Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ED410E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:08 +0300
Message-Id: <20220715202520.23677-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/14] tools/intel_vbt_decode: Extract
 dp_vswing()/dp_preemph()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A bunch of places need to decode the DP vswing/preemph values.
Fortunately all of them use the the same format so we can
extract this stuff into a few helpers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 110 ++++++++++++---------------------------
 1 file changed, 34 insertions(+), 76 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1ed03745bd05..13e927edd17f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -855,6 +855,28 @@ static void dump_dp_max_link_rate(uint16_t version, uint8_t dp_max_link_rate)
 		       link_rate / 100.0f, dp_max_link_rate);
 }
 
+static const char *dp_vswing(u8 vswing)
+{
+	switch (vswing) {
+	case 0: return "0.4V";
+	case 1: return "0.6V";
+	case 2: return "0.8V";
+	case 3: return "1.2V";
+	default: return "<unknown>";
+	}
+}
+
+static const char *dp_preemph(u8 preemph)
+{
+	switch (preemph) {
+	case 0: return "0dB";
+	case 1: return "3.5dB";
+	case 2: return "6dB";
+	case 3: return "9.5dB";
+	default: return "<unknown>";
+	}
+}
+
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
@@ -1422,44 +1444,12 @@ static void dump_edp(struct context *context,
 		}
 		printf("\t\t\tlanes: X%d",
 		       edp->fast_link_params[i].lanes + 1);
-		printf("\t\t\tpre-emphasis: ");
-		switch (edp->fast_link_params[i].preemphasis) {
-		case EDP_PREEMPHASIS_NONE:
-			printf("none\n");
-			break;
-		case EDP_PREEMPHASIS_3_5dB:
-			printf("3.5dB\n");
-			break;
-		case EDP_PREEMPHASIS_6dB:
-			printf("6dB\n");
-			break;
-		case EDP_PREEMPHASIS_9_5dB:
-			printf("9.5dB\n");
-			break;
-		default:
-			printf("(unknown value %d)\n",
-			       edp->fast_link_params[i].preemphasis);
-			break;
-		}
-		printf("\t\t\tvswing: ");
-		switch (edp->fast_link_params[i].vswing) {
-		case EDP_VSWING_0_4V:
-			printf("0.4V\n");
-			break;
-		case EDP_VSWING_0_6V:
-			printf("0.6V\n");
-			break;
-		case EDP_VSWING_0_8V:
-			printf("0.8V\n");
-			break;
-		case EDP_VSWING_1_2V:
-			printf("1.2V\n");
-			break;
-		default:
-			printf("(unknown value %d)\n",
-			       edp->fast_link_params[i].vswing);
-			break;
-		}
+		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+		       dp_preemph(edp->fast_link_params[i].preemphasis),
+		       edp->fast_link_params[i].preemphasis);
+		printf("\t\t\tvswing: %s (0x%x)\n",
+		       dp_preemph(edp->fast_link_params[i].vswing),
+		       edp->fast_link_params[i].vswing);
 
 		if (context->bdb->version >= 162) {
 			bool val = (edp->edp_s3d_feature >> i) & 1;
@@ -1511,44 +1501,12 @@ static void dump_edp(struct context *context,
 
 			printf("\t\tFull link params provided: %s\n", YESNO(val));
 			printf("\t\tFull link params:\n");
-			printf("\t\t\tpre-emphasis: ");
-			switch (edp->full_link_params[i].preemphasis) {
-			case EDP_PREEMPHASIS_NONE:
-				printf("none\n");
-				break;
-			case EDP_PREEMPHASIS_3_5dB:
-				printf("3.5dB\n");
-				break;
-			case EDP_PREEMPHASIS_6dB:
-				printf("6dB\n");
-				break;
-			case EDP_PREEMPHASIS_9_5dB:
-				printf("9.5dB\n");
-				break;
-			default:
-				printf("(unknown value %d)\n",
-				       edp->full_link_params[i].preemphasis);
-				break;
-			}
-			printf("\t\t\tvswing: ");
-			switch (edp->full_link_params[i].vswing) {
-			case EDP_VSWING_0_4V:
-				printf("0.4V\n");
-				break;
-			case EDP_VSWING_0_6V:
-				printf("0.6V\n");
-				break;
-			case EDP_VSWING_0_8V:
-				printf("0.8V\n");
-				break;
-			case EDP_VSWING_1_2V:
-				printf("1.2V\n");
-				break;
-			default:
-				printf("(unknown value %d)\n",
-				       edp->full_link_params[i].vswing);
-				break;
-			}
+			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+			       dp_preemph(edp->full_link_params[i].preemphasis),
+			       edp->full_link_params[i].preemphasis);
+			printf("\t\t\tvswing: %s (0x%x)\n",
+			       dp_vswing(edp->full_link_params[i].vswing),
+			       edp->full_link_params[i].vswing);
 		}
 
 		if (context->bdb->version >= 224) {
-- 
2.35.1
