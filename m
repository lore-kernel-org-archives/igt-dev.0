Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0063E6E196
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 18:02:33 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 11 Aug 2021 11:02:16 -0700
Message-Id: <20210811180217.91142-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_edid: fix edid field name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, Simon Ser <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

Byte 26 in a edid struct is supposed to be "Blue and white
least-significant 2 bits", not "black and white". Rename the field
accordingly.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_edid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index 7c2ce123..aac2f4a2 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -350,7 +350,7 @@ struct edid {
 	uint8_t features;
 	/* Color characteristics */
 	uint8_t red_green_lo;
-	uint8_t black_white_lo;
+	uint8_t blue_white_lo;
 	uint8_t red_x;
 	uint8_t red_y;
 	uint8_t green_x;
-- 
2.31.1
