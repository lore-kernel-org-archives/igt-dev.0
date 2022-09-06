Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B3910E661
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:30:19 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:37 +0300
Message-Id: <20220906122944.8838-11-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/17] tools/intel_vbt_decode: Decode the
 "use VBT vswing tables" flag
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

Decode the "Use VBT swging tables" bit. Note that we don't decode
the actual tables so far.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index dc8d0c4fc57a..d01d89f9aa27 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -968,6 +968,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
 		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
 		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
+		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
 		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
 		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
 		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
-- 
2.35.1
