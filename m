Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB3410E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:16 +0300
Message-Id: <20220715202520.23677-11-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/14] tools/intel_vbt_decode: Decode eDP/DP
 max lane count
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
index 7b7930086693..37b195ab8c16 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -968,6 +968,8 @@ static void dump_child_device(struct context *context,
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
