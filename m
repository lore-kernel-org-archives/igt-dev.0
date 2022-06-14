Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6474B11360E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:36 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:48 +0300
Message-Id: <20220614233100.13834-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/23] tools/intel_vbt_decode: Parse the old
 fast link training rate correctly
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

We're failing to parse the 5.4 Gbps value of the old
fast link training rate. Remedy it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 367e22caedfa..deaae9130b65 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -949,10 +949,21 @@ static void dump_edp(struct context *context,
 
 		printf("\t\tFast link params:\n");
 		printf("\t\t\trate: ");
-		if (edp->fast_link_params[i].rate == EDP_RATE_1_62)
-			printf("1.62G\n");
-		else if (edp->fast_link_params[i].rate == EDP_RATE_2_7)
-			printf("2.7G\n");
+		switch (edp->fast_link_params[i].rate) {
+		case EDP_RATE_1_62:
+			printf("1.62Gbps\n");
+			break;
+		case EDP_RATE_2_7:
+			printf("2.7Gbpc\n");
+			break;
+		case EDP_RATE_5_4:
+			printf("5.4Gbps\n");
+			break;
+		default:
+			printf("(unknonn value %d)\n",
+			       edp->fast_link_params[i].rate);
+			break;
+		}
 		printf("\t\t\tlanes: ");
 		switch (edp->fast_link_params[i].lanes) {
 		case EDP_LANE_1:
-- 
2.35.1
