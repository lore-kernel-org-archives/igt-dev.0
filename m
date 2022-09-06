Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF60C10E655
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:31:00 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:42 +0300
Message-Id: <20220906122944.8838-16-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 15/17] tools/intel_vbt_decode: Dump the
 compression structure index as decimal
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

The compression structure index is just that, and index. So just
dump it as a decimal number (and drop the mispaced parenthesis).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9e14d5a570a7..d34f017cad73 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -960,7 +960,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
 		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
 		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
-		printf("\t\tCompression structure index: 0x%02x)\n", child->compression_structure_index);
+		printf("\t\tCompression structure index: %d\n", child->compression_structure_index);
 
 		if (context->bdb->version >= 237) {
 			printf("\t\tHDMI Max FRL rate valid: %s\n",
-- 
2.35.1
