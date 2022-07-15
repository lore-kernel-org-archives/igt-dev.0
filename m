Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B410E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:15 +0300
Message-Id: <20220715202520.23677-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/14] tools/intel_vbt_decode: Decode the
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
index e05fed69b242..7b7930086693 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -967,6 +967,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
 		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
 		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
+		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
 		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
 		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
 		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
-- 
2.35.1
