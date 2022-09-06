Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A85810E660
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:30:20 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:38 +0300
Message-Id: <20220906122944.8838-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/17] tools/intel_vbt_decode: Decode
 eDP/DP max lane count
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

We have a new field for eDP/DP max lane count. Decode it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d01d89f9aa27..f82be17b17f5 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -969,6 +969,8 @@ static void dump_child_device(struct context *context,
 		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
 		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
 		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
+		if (context->bdb->version >= 244)
+			printf("\t\teDP/DP max lane count: X%d\n", child->dp_max_lane_count + 1);
 		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
 		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
 		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
-- 
2.35.1
